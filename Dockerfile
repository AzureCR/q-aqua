#FROM node:9
FROM node:9-alpine
WORKDIR /app
EXPOSE 80
ENV PORT 80
#ENV DEBUG acr-patch-sample-web:*
COPY . /app
RUN cd /app && npm install -g npm
RUN cd /app && npm install
CMD ["npm","start" ] 
ENV SCANNER aqua
