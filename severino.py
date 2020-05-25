from picamera import PiCamera
from time import sleep

camera = PiCamera()

camera.start_preview()
sleep(300)
camera.stop_preview()