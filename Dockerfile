FROM alpine:latest

EXPOSE 5000
WORKDIR /app

COPY ./main.py /app/main.py
COPY ./requirements.txt /app/requirements.txt

RUN apk update && \
    apk add --no-cache python3 py3-pip

RUN python3 -m venv env
RUN source env/bin/activate
RUN . /app/env/bin/activate && \
    pip3 install --no-cache-dir -r ./requirements.txt

CMD ["/app/env/bin/python", "main.py"]