FROM python:alpine

ENV DISABLE_LOOP=false
ENV HEARTBEAT_TIMEOUT=60
ENV RDY_MESSAGE=false

RUN apk add --no-cache build-base curl unzip ca-certificates linux-headers bash &&\
    curl https://codeload.github.com/gregzaal/Auto-Voice-Channels/zip/master -o avc.zip &&\
    unzip avc.zip &&\
    mv Auto-Voice-Channels-master AutoVoiceChannels &&\
    pip3 install -r AutoVoiceChannels/requirements.txt &&\
    apk del build-base curl unzip &&\
    rm avc.zip &&\
    rm -rf /var/cache/* && \
    rm -rf /root/.cache/*

WORKDIR /AutoVoiceChannels

COPY startAVC.sh startAVC.sh

CMD [ "bash", "startAVC.sh" ]