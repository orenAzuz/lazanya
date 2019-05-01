FROM python:2.7-alpine as flaskBuild	

COPY  . /flask-app

WORKDIR /flask-app
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1
RUN ls
RUN npm install
RUN npm run build
RUN pip install -r requirements.txt

FROM python:2.7-alpine
COPY --from=flaskBuild . .
ENTRYPOINT [ "python", "flask-app/app.py" ]
# --no-cache