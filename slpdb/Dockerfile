FROM node

# Install typescript
RUN npm install typescript -g

# Install app
RUN git clone https://github.com/simpleledger/slpdb.git /app
WORKDIR /app
RUN npm install
RUN npm install cashaddrjs-slp

# Ports
EXPOSE 28332

# Install pm2
COPY pm2-process.json /app/pm2-process.json
RUN npm install pm2 -g

CMD ["pm2-runtime", "start", "/app/pm2-process.json"]