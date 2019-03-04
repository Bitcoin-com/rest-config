FROM node

# Install app
RUN git clone https://github.com/fountainhead-cash/slpserve.git /app
WORKDIR /app
RUN npm install

# Ports
EXPOSE 3000

# Install pm2
COPY ./pm2-process.json /app/pm2-process.json
RUN npm install pm2 -g

CMD ["pm2-runtime", "start", "/app/pm2-process.json"]