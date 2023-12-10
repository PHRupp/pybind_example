#https://hub.docker.com/layers/rockylinux/rockylinux/9-ubi-init/images/sha256-754106200a91e93cace4018fef0b1d4f36b61f315ae663af4e9fc78699a33374?context=explore

FROM rockylinux/rockylinux:9-ubi-init@sha256:754106200a91e93cace4018fef0b1d4f36b61f315ae663af4e9fc78699a33374

WORKDIR /root/Downloads

RUN yum groupinstall "Development Tools" -y; yum install openssl-devel libffi-devel libffi-devel bzip2-devel cmake-3.20.2 wget vim python3-devel -y

RUN echo "alias ll='ls -la'" >> ~/.bashrc; echo "set mouse=a" > ~/.vimrc; echo 'set completion-ignore-case On' >> ~/.inputrc; curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py; python3.9 get-pip.py; pip install "pybind11[global]"; echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64' >> ~/.bashrc

ENV app_dir=/app/pybind_example
WORKDIR ${app_dir}

COPY . ${app_dir}

#RUN mkdir build; cd build; cmake ../ && make;
RUN pip install .
