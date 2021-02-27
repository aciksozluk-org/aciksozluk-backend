FROM node:14

RUN mkdir /api/

WORKDIR /api/

COPY . /api/

# RUN npm install -g nodemon
RUN npm install

RUN npm install pm2 -g

ENV TZ 'Europe/Istanbul'

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Expose port
EXPOSE 3000

CMD [ "pm2-runtime", "start", "pm2.json" ]