FROM alpine:3.1

# Update
RUN apk add --update python py-pip

# Install app dependencies
ADD . /bartly
WORKDIR /bartly
RUN pip install -r requirements.txt

# Bundle app source
COPY app.py /src/app.py

ENV LYFT_CLIENT_KEY gAAAAABXvLCPsGLkzSte0lWPnrzm9eND6kRTUtzyjBW4GhpYi-rC3k8bIzxLBpGrfsjvoSCld5m2dM-3tXNOEgkkpi8NszvSpIEgUa6FGElHzMx_3iMMKkE3BYCDxdVjU4VhKFT-I2kzz5QI5WNbqDNAD7XFWC5bCQPYIrhKuvqllAD47rWe8RI=

EXPOSE 5000
CMD ["python", "/src/app.py", "-p 5000"]
