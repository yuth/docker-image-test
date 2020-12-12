FROM circleci/node:10.18
WORKDIR /tmp
RUN sudo apt-get update && sudo apt-get install -y \
  xdg-utils

# Install Java 
WORKDIR /tmp
RUN curl -O https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar zxvf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN sudo mv jdk-11.0.2 /usr/local
ENV PATH=${PATH}:/usr/local/jdk-11.0.2/bin

# Install Gradle
WORKDIR /tmp
RUN wget https://services.gradle.org/distributions/gradle-6.3-bin.zip -P /tmp
RUN sudo unzip -d /opt/gradle /tmp/gradle-*.zip
ENV GRADLE_HOME=/opt/gradle/gradle-6.3
ENV PATH=${PATH}:/opt/gradle/gradle-6.3/bin

# Install Go
WORKDIR /tmp
RUN curl -O https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
RUN sudo tar -C /usr/local -xzf go1.14.1.linux-amd64.tar.gz
ENV PATH=${PATH}:/usr/local/go/bin

# Install Python
WORKDIR /tmp
RUN sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl
RUN curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz
RUN sudo tar -C /usr/local -xf Python-3.8.2.tar.xz
WORKDIR /usr/local/Python-3.8.2
RUN sudo ./configure
RUN sudo make -j 4
RUN sudo make install
RUN sudo apt install python3-pip
RUN pip3 install --user pipenv
RUN python3 --version


ENTRYPOINT echo $PATH && javac -version && gradle --version && go version && pipenv --version

