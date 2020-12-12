FROM circleci/node:10.18
RUN sudo apt-get update && apt-get install -y \
  xdg-utils

# Install Java 
RUN curl -O https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar zxvf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mv jdk-11* /usr/local/

