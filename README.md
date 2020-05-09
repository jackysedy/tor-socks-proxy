

# DevOps Assignment Tor-socks-proxy

## Usage

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

