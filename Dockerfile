FROM alpine

ENV PORT    3000

ADD eagle /eagle
ADD start.sh /start.sh
ADD base.txt /base.txt
RUN chmod 700 /eagle
RUN chmod +x /start.sh
CMD /start.sh
