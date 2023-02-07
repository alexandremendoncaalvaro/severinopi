cmake_minimum_required(VERSION 3.3 FATAL_ERROR)

project(picamera VERSION 0.1 LANGUAGES CXX)

# Enable general warnings
# See http://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

# Use 2014 C++ standard.
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Must use GNUInstallDirs to install libraries into correct locations on all platforms:
include(GNUInstallDirs)

# Pkg_config is used to locate headers and files for dependency libraries:
find_package(PkgConfig)

set(OpenCV_DIR /usr/local/cmake/opencv4)

# OpenCV can be linked in a more standard manner:
find_package( OpenCV REQUIRED )

# Compile files:
add_executable(picamera picamera.cpp)

# Add folder with all headers:
target_include_directories(picamera PRIVATE hpp)

# Link files:
target_link_libraries(picamera
    ${OpenCV_LIBS}
)