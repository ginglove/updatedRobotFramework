FROM centos:7

MAINTAINER truonggiangle91@gmail.com
USER root
WORKDIR /code
COPY ./python_setup_env/robot_requirements.txt .


RUN localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


RUN yum install -y \
        yum-utils \
        curl \
        git \
        tmux \
        vim \
        nano \
        wget \
        gcc \
        emacs-nox && \
    yum install -y \
        epel-release
RUN yum groupinstall -y "Development Tools" && \
    yum install -y \
        cairo-devel \
        libffi-devel \
        libxml2-devel \
        libxslt-devel \
        automake \
        autoconf  \
        openssl-devel
RUN yum clean -y all
RUN wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz && tar xzf Python-3.7.2.tgz
RUN rm -rf Python-3.7.2.tgz
RUN ls
RUN cd Python-3.7.2 && ./configure --enable-optimizations && make altinstall
RUN pip3.7 --version
RUN pip3.7 install --upgrade pip
# pipenv installation
RUN pip3.7 install pipenv
RUN pip3.7 install -r ./robot_requirements.txt
# Install google chrome stable and robot framework and dependencies
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN yum localinstall ./google-chrome-stable_current_x86_64.rpm -y
RUN rm -rf google-chrome-stable_current_x86_64.rpm
RUN webdrivermanager chrome


RUN chmod 777 /usr/local/bin/chromedriver
RUN chmod 777 /usr/bin/google-chrome
RUN chmod 777 /usr/bin/google-chrome-stable