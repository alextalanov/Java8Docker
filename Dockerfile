FROM ubuntu:16.04

ARG HOME=/usr/local/lib
ARG DEBIAN_FRONTEND=noninteractive
ARG JDK_ARCHIVE_NAME="jdk-8u231-linux-x64.tar.gz"
ARG PYTHON_ARHIVE=Python-3.6.3.tgz

WORKDIR $HOME

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install zlib1g-dev
RUN apt-get install -y wget

ENV PYTHON_HOME=$HOME/Python-3.6.3
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz -O $PYTHON_ARHIVE
RUN tar -xvzf $PYTHON_ARHIVE
RUN rm -f $PYTHON_ARHIVE

WORKDIR $PYTHON_HOME

RUN ./configure
RUN make 
RUN make install

RUN echo "Python3 has been installed:"
RUN python3 -V

WORKDIR $HOME

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
