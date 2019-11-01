FROM bdhwan/parse-server:3.1
MAINTAINER bdhwan@gmail.com

RUN sudo apt-get install -y build-essential 
RUN sudo apt-get install -y libcairo2-dev 
RUN sudo apt-get install -y libpango1.0-dev 
RUN sudo apt-get install -y libjpeg-dev 
RUN sudo apt-get install -y libgif-dev 
RUN sudo apt-get install -y librsvg2-dev
RUN sudo apt-get install -y imagemagick
RUN sudo apt-get install -y graphicsmagick


ADD healthcheck.js /home/healthcheck.js
ADD check.sh /home/check.sh

WORKDIR /home
HEALTHCHECK --interval=30s CMD node healthcheck.js
EXPOSE 8080
ENTRYPOINT ["/bin/sh", "check.sh"]



