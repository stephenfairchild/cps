FROM alpine:3.14

WORKDIR /app
COPY . . 
RUN apk update && apk upgrade --available 
RUN apk add --update vim bash python3 py3-pip

RUN export PATH=${PATH}:/usr/bin/python3.7
RUN ln -sf python3 /usr/bin/python

ENV PIP_ROOT_USER_ACTION=ignore
RUN pip3 install -r src/requirements.txt

ENV FLASK_APP=/app/src/app.py
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
