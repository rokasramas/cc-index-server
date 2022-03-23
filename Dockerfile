FROM python:3.9

RUN apt-get -qq update && apt-get -qqy install awscli

# Install dependencies
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Add the cc-index-server code into the image
COPY ./ /opt/webapp/
WORKDIR /opt/webapp

CMD /usr/local/bin/wayback
