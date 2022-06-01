ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache py3-pip openssh rsync sudo
RUN ssh-keygen -A
RUN ln -s $(which python3) /python

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]