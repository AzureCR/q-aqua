# Quarantine Pattern
## Demo Steps
1. Edit routes\index.js Bump version number
1.  Set ENV variables for which scanner to test
    * Aqua
        ```sh
        ACR_NAME=quarantinetest1
        SCANNER=aqua
        ```
    * Twistlock
        ```
        ACR_NAME=quarantinetest2
        SCANNER=twistlock
        ```
1.  Build the image    
    ```
    docker build -t $ACR_NAME.azurecr-test.io/q-${SCANNER}:6 --build-arg A_SCANNER=$SCANNER .
    ```
1.  ***OPTIONAL***: Run the image
    ```
    docker run -p 80:80 $ACR_NAME.azurecr-test.io/q-$SCANNER:6
    ```
1.  Push the image
    ```
    docker push $ACR_NAME.azurecr-test.io/q-$SCANNER:6
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
