<p align="center">
  <img width="300px" src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Tor_project_logo_hq.png">
</p>

# Tor-socks-proxy

![license](https://img.shields.io/badge/license-GPLv3.0-brightgreen.svg?style=flat)
[![Build Status](https://travis-ci.com/PeterDaveHello/tor-socks-proxy.svg?branch=master)](https://travis-ci.com/PeterDaveHello/tor-socks-proxy)
[![Docker Hub pulls](https://img.shields.io/docker/pulls/peterdavehello/tor-socks-proxy.svg)](https://hub.docker.com/r/peterdavehello/tor-socks-proxy/)
[![Docker image layers](https://images.microbadger.com/badges/image/peterdavehello/tor-socks-proxy.svg)](https://microbadger.com/images/peterdavehello/tor-socks-proxy/)
[![Docker image version](https://images.microbadger.com/badges/version/peterdavehello/tor-socks-proxy.svg)](https://hub.docker.com/r/peterdavehello/tor-socks-proxy/tags/)

[![Docker Hub badge](http://dockeri.co/image/peterdavehello/tor-socks-proxy)](https://hub.docker.com/r/peterdavehello/tor-socks-proxy/)

The super easy way to setup a [Tor](https://www.torproject.org) [SOCKS5](https://en.wikipedia.org/wiki/SOCKS#SOCKS5) [proxy server](https://en.wikipedia.org/wiki/Proxy_server) inside a [Docker](https://en.wikipedia.org/wiki/Docker_(software)) [container](https://en.wikipedia.org/wiki/Container_(virtualization)) without relay/exit feature.

## Usage

DevOps Assignment

1. Fork tor-socks-proxy
2. Understand what is tor and tor socks proxy, how to change timing...
    - Create Image and run container of tor socks proxy
    - Create bash script that send requests to the proxy and check for a different IPs
    - Put the script in Image and run it with as a service
    - Create docker-compose to run both services.

Assumption 1: Each of the service should be in different network, the test service should access the proxy just through the expose port of the proxy.

3. Create Docker Hub repository
4. Configure Jenkins to work with GitHub and Docker Hub
5. Write Jenkinsfile.Tor
    Phase 1: 
          - Build tor-socks-proxy and push it to Docker Hub
          - Trigger Test Job
    Phase 2:
	- Add the ability to recognize from which branch building the image and to update the expose 
               port respectively. As just need to change one string in a file I selected to use sed command.
- Trigger Test Job with Build number as tag and port

Assumption 2: the tag of the image should contains the build number and the port that the image expose like, ${BUILD_NUMBER}_${Port}.

6. Write Jenkinsfile.Test
      Phase 1:
        - Build Test service
        - Run docker-compose 
                 - Pull the last Image from Docker Hub
                 - Start the 2 services, Test service wait 10 sec that the proxy be ready, and then start to send 
                    request every 10 sec to 2 min. If 2 new Ips are the same exit with code 1, and that means                 
                    the test fails, and also the job fails.
     Phase 2:
            - Add the ability to test the expose port, update docker-compose with the different ports, to run
              the proxy service and the environment variable for the test service.
            - Add the ability to manually trigger test   
     Phase 3: 
             - Add the ability of user select image from Docker Hub dynamically. 

