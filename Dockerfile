FROM jenkins/jenkins:lts-alpine
USER root
RUN apk add python3 && \
 python3 -m ensurepip && \
 pip3 install --upgrade pip setuptools && \
 if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
 if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
 rm -r /root/.cache
RUN pip install alpine==0.0.2
RUN apk add pkgconf
RUN apk add build-base
RUN apk add python3-dev
RUN apk add postgresql-dev
RUN apk add postgresql-client
FROM jenkins/jenkins:latest



# Install Python 3 and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Set Python 3 as the default Python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

USER jenkins

# Continue with your Jenkins setup and configurations

