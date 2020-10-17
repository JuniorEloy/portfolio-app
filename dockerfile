FROM python:3-alpine

RUN apk add --virtual .build-dependencies \
            --no-cache \
            python3-dev \
            build-base \
            linux-headers \
            pcre-dev
RUN apk add --no-cache pcre

WORKDIR /
COPY /app /app
COPY ./requirements.txt /
COPY ./wsgi.ini /
COPY ./wsgi.py /

RUN pip install -r /requirements.txt

RUN apk del .build-dependencies && rm -rf /var/cache/apk/*

EXPOSE 5003

CMD ["uwsgi", "--ini", "/wsgi.ini"]