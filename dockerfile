FROM node:6-alpine

#expose port
EXPOSE 3000

RUN apk add --update tini


#update packages

#create app directory
WORKDIR /usr/src/app

#Environment 
ENV NODE_ENV=production


#Install App Deoendencies
COPY package.json package.json

COPY . .

#permissions node

COPY --chown=node:node . .

#Install NPM
RUN npm install --production 


#Usermode

USER addi node

#RUN Command
CMD ["/sbin/tini", "--", "node", "./bin/www"]




