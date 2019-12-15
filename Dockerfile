FROM ubuntu:16.04
WORKDIR /root
RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  git \
  libgmp-dev \
  libssl-dev \
  sudo \
  software-properties-common \
  nano \
  wget \
  python3-flask
ADD source/ /root/source
ADD web/ /root/web
ADD README.md .
ADD pre_install.sh .
ADD install.sh .
ADD install_sock.sh .
ADD run_server.sh .
RUN ["bash", "pre_install.sh"]
RUN ["bash", "install.sh"]
EXPOSE 8000
EXPOSE 49000-50000
RUN ["bash", "install_sock.sh"]
CMD ["/bin/bash"]