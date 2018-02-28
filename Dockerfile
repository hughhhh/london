FROM alpine:3.1

# Update
RUN apk add --update python py-pip

# Install app dependencies
ADD . /london
WORKDIR /london
RUN pip install -r requirements.txt

# Bundle app source
COPY app.py /src/app.py

ENV FOO bar

EXPOSE 8080
CMD ["python", "/src/app.py", "-p 8080"]
