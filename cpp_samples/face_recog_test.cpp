#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <dlib/opencv.h>
#include <dlib/image_processing.h>
#include <dlib/image_processing/frontal_face_detector.h>
#include <dlib/dnn.h>
#include <dlib/data_io.h>
#include <map>

using namespace cv;
using namespace std;
using namespace dlib;

// Definição da rede neural
template <typename SUBNET> using my_fc = fc<128, SUBNET>;
template <typename SUBNET> using my_max_pool = max_pool<3, 3, 2, 2, SUBNET>;
template <typename SUBNET> using my_relu = relu<affine<my_fc<SUBNET>>>;
template <typename SUBNET> using my_con = con<32, 5, 5, 1, 1, SUBNET>;

using my_net_type = loss_metric<my_fc<avg_pool_everything<
    my_con<my_max_pool<my_relu<my_con<my_max_pool<my_relu<my_con<input_rgb_image_sized<150>>>>>>>>>>>>;

// Carrega um modelo treinado e retorna um vetor de 128D para uma imagem de face.
matrix<float, 0, 1> generate_embedding(my_net_type &net, const matrix<rgb_pixel> &face_chip)
{
    std::vector<matrix<rgb_pixel>> faces;
    faces.push_back(face_chip);
    std::vector<matrix<float, 0, 1>> face_descriptors = net(faces);
    return face_descriptors[0];
}

void draw_recognized_face(Mat &frame, rectangle &face)
{
    int x = face.left();
    int y = face.top();
    int w = face.width();
    int h = face.height();
    cv::rectangle(frame, cv::Rect(x, y, w, h), cv::Scalar(0, 255, 0), 2);
    cv::putText(frame, "Recognized Person", Point(x, y - 5), FONT_HERSHEY_SIMPLEX, 0.7, Scalar(0, 255, 0), 2);
}

bool is_same_person(matrix<float, 0, 1> &ref_embedding, matrix<float, 0, 1> &cur_embedding, double threshold)
{
    double dist = length(ref_embedding - cur_embedding);
    return dist < threshold;
}

int main(int argc, char **argv)
{
    if (argc != 3)
    {
        cerr << "Usage: " << argv[0] << " <path_to_pretrained_model> <path_to_face_image>" << endl;
        return 1;
    }

    frontal_face_detector detector = get_frontal_face_detector();
    shape_predictor sp;
    deserialize("shape_predictor_5_face_landmarks.dat") >> sp;
    my_net_type net;
    deserialize(argv[1]) >> net;

    // Carregando a imagem de referência para a face conhecida
    matrix<rgb_pixel> reference_img;
    load_image(reference_img, argv[2]);
    std::vector<rectangle> ref_faces = detector(reference_img);
    if (ref_faces.size() == 0)
    {
        cerr << "No face detected in reference image" << endl;
        return 1;
    }

    full_object_detection shape = sp(reference_img, ref_faces[0]);
    matrix<rgb_pixel> reference_face_chip;
    extract_image_chip(reference_img, get_face_chip_details(shape, 150, 0.25), reference_face_chip);

    // Gerando um vetor de 128D (embedding) para a face conhecida
    matrix<float, 0, 1> reference_embedding = generate_embedding(net, reference_face_chip);

    VideoCapture cap(0);
    if (!cap.isOpened())
    {
        cerr << "ERROR: Unable to open the camera" << endl;
        return 0;
    }

    cout << "Start Pi Camera, press a key on Live window to terminate" << endl;
    while (1)
    {
        Mat frame;
        cap >> frame;
        if (frame.empty())
        {
            cerr << "ERROR: Unable to grab from the camera" << endl;
            break;
        }

        cv_image<bgr_pixel> cimg(frame);
        std::vector<rectangle> faces = detector(cimg);

        for (const auto &face : faces)
        {
            full_object_detection shape = sp(cimg, face);
            matrix<rgb_pixel> face_chip;
            extract_image_chip(cimg, get_face_chip_details(shape, 150, 0.25), face_chip);

            matrix<float, 0, 1> current_embedding = generate_embedding(net, face_chip);

            // Comparando a distância entre os embeddings para identificar a pessoa
            double threshold = 0.6;
            if (is_same_person(reference_embedding, current_embedding, threshold))
            {
                draw_recognized_face(frame, face);
            }
        }

        imshow("Live", frame);
        int key = cv::waitKey(20);
        key = (key == 255) ? -1 : key;
        if (key >= 0)
            break;
    }

    cout << "Closing the camera" << endl;
    cap.release();
    destroyAllWindows();
    cout << "bye!" << endl;
    return 0;
}
