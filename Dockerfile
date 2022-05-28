FROM tensorflow/tensorflow:2.8.0-gpu-jupyter 

COPY ./cuda-keyring_1.0-1_all.deb cuda-keyring_1.0-1_all.deb

RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt-get update

RUN apt -y install libportaudio2
RUN pip install tflite-model-maker
RUN pip install pycocotools
RUN pip install opencv-python-headless==4.1.2.30
RUN pip install albumentations pandas
RUN apt-get -y install libusb-1.0-0-dev

