FROM ubuntu:16.04

ARG HOME=/usr/local/lib
ARG DEBIAN_FRONTEND=noninteractive
ARG JDK_ARCHIVE_NAME="jdk-8u231-linux-x64.tar.gz"

WORKDIR $HOME

RUN apt-get update
RUN apt-get install -y wget

# Download and unpuck
RUN wget --no-check-certificate "https://www.dropbox.com/s/os574q8xgf9wskx/jdk-8u231-linux-x64.tar.gz?dl=0" -O $JDK_ARCHIVE_NAME
RUN tar -xvzf $JDK_ARCHIVE_NAME
RUN rm -f $JDK_ARCHIVE_NAME

#Add to PATH
ENV JAVA_HOME=$HOME/jdk1.8.0_231
ENV PATH=$PATH:$JAVA_HOME/bin

RUN echo "Java has been installed:"
RUN java -version

CMD ["/bin/bash"]
