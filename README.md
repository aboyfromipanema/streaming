# JMeter Video Streaming Testing

This is a repository containing the material related to [How to Test Video Streaming with JMeter](https://www.blazemeter.com/blog/video-streaming-testing) blog post

## Usage

The test data is based on [Docker](https://www.docker.com/)  container 

 1. Building the container:

        docker build -t streaming .
 2. Running the container:

        docker run -p 8080:8080 streaming
 
        