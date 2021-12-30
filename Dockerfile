FROM alpine:latest

ENV PORT    80

ADD boy /boy
ADD start.sh /start.sh
ADD base.txt /base.txt
RUN chmod 700 /boy
RUN chmod +x /start.sh
CMD /start.sh
