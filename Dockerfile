FROM alpine

ENV PORT    3000

ADD v2ray /v2ray
ADD start.sh /start.sh
ADD base.txt /base.txt
RUN chmod 700 /v2ray
RUN chmod +x /start.sh
CMD /start.sh
