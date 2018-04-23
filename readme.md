# Quarantine Pattern
## Demo Steps

1. Edit routes\index.js Bump version number
1.  Build the image    
    From bash, execute:
    * Aqua
        ```sh
        ./aqua.sh
        ```
    * Twistlock
        ```sh
        ./twistlock.sh
        ```
1.  View the image in the scanner to see the results
1.  View the image
    * Aqua
     https://q-aqua.azurewebsites.net/
    * Twsitlock https://q-twistlock.azurewebsites.net/

## Viewing a failed/quarantined scan
Edit the dockerfile to reference a clean base image, and update the base node runtime: https://github.com/nodejs/docker-node/issues/690
```dockerfile
FROM node:9
#FROM node:9-alpine
…
#RUN cd /app && npm install -g npm
RUN cd /app && npm install
```
Remove vulnerabilities
```dockerfile
#FROM node:9
FROM node:9-alpine
…

RUN cd /app && npm install -g npm
#RUN cd /app && npm install
```
