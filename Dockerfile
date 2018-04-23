#FROM node:9
FROM node:9-alpine
ARG SCANNER=aqua 
ARG VERSION= 
WORKDIR /app
EXPOSE 80
ENV PORT 80
ENV VERSION=$VERSION
COPY . /app
# https://github.com/nodejs/docker-node/issues/690
RUN cd /app && npm install -g npm
#RUN cd /app && npm install
ENV SCANNER=$SCANNER
CMD ["npm","start" ] 
