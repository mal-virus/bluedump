# Minifi for BlueDump

Now that we have a bluetooth service that logs out to file, we can push that data to an instance of nifi by using minifi

## Usage

- To install docker, run 'curl -sSL https://get.docker.com | sh'
 - ./inst.docker has been provided to help install docker with  docker-compose
- To start up minifi
 - Edit /opt/bluedump/config.yml such that the id of your remote process group matches the id of the input on your nifi instance. Also change the IP Address to match the IP and port of your instance of nifi.
 - cd to /opt/bluedump and run the command `docker build .`
  - Note the final id number listed. If you didn't catch it, call `docker images` and look for an unnamed image
 - While still in /opt/bluedump, run `docker run -dit <id>`, replacing <id> with the id of your created image

If done correctly, you should see data coming into your nifi instance in a relatively short amount of time. My raspberry pi took 3-5 minutes to initialize.
