# Quarantine Pattern
## Preset
1.  Log into the az cli, using dogfood
    ```
    az cloud set -n dogfood
    az account set -s KraterTeam
    az login
    ```

## Demo Steps

1. clone the repo
    ```sh
    git clone https://github.com/AzureCR/quarantine-booth-demo/
    ```
1.  switch to the directory
    ```sh
    cd quarantine-booth-demo
    ```
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
Edit the dockerfile to switch between node and node/alpine

The scanners will also refernce an SSRI vulnerability that can currently only be fixed by updating the base node runtime:

* https://github.com/nodejs/docker-node/issues/690
* https://nodesecurity.io/advisories/565

This adds to the discussion why developers care and need vul scanning as part of their check-in validations, as only developers can typically fix the underlying issues.

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
