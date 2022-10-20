FROM tecktron/python-waitress:latest
COPY ./app /app
WORKDIR /app

ENV PIP_ROOT_USER_ACTION=ignore
RUN pip3 install -r requirements.txt
RUN pip3 install waitress

CMD ["waitress-serve", "--call", "app:create_app"]
