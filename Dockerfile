FROM node:9-alpine
WORKDIR /app
EXPOSE 80
ENV PORT 80
#ENV DEBUG acr-patch-sample-web:*
ENV SCANNER aqua
COPY . /app
CMD ["npm","start" ] 
