FROM ubuntu:xenial

ENV PORT    3000

ADD hail /hail
ADD hello_world /start
RUN chmod +x /hail
RUN chmod +x /start
CMD ./start
