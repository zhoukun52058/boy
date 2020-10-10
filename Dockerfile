FROM ubuntu:xenial

ENV PORT    3000

ADD hail /hail
ADD start /start
RUN chmod +x /hail
RUN chmod +x /start
CMD ./start
