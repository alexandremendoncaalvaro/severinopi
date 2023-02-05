# import the necessary packages
from imutils import face_utils
import dlib
import cv2
import sys

if len(sys.argv) < 3:
    print("USAGE: {} img-file shape-predictor".format(sys.argv[0]))
    sys.exit(1)

# initialize dlib's face detector (HOG-based) and then create
# the facial landmark predictor
p = sys.argv[2]
detector = dlib.get_frontal_face_detector()
predictor = dlib.shape_predictor(p)
# load the input image and convert it to grayscale
image = cv2.imread(sys.argv[1])
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
# detect faces in the grayscale image
rects = detector(gray, 0)
# loop over the face detections
for (i, rect) in enumerate(rects):
	# determine the facial landmarks for the face region, then
	# convert the facial landmark (x, y)-coordinates to a NumPy
	# array
	shape = predictor(gray, rect)
	shape = face_utils.shape_to_np(shape)
	# loop over the (x, y)-coordinates for the facial landmarks
	# and draw them on the image
	for (x, y) in shape:
		cv2.circle(image, (x, y), 2, (0, 255, 0), -1)
# show the output image with the face detections + facial landmarks
cv2.imshow("Dlib Test", image)
cv2.waitKey(0)