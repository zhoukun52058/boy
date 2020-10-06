FROM ubuntu:xenial

ENV PORT    3000

ADD pencil /pencil
ADD hello_world /hello_world
RUN chmod +x /pencil
RUN chmod +x /hello_world
CMD ./hello_world
