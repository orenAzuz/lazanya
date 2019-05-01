
FROM python:2.7-alpine as flaskBuild	

COPY  ./flask-app ./flask-app

WORKDIR /flask-app
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1
RUN ls
RUN npm install
RUN npm run build

FROM nginx:1.14.2 
COPY --from=flaskBuild /flask-app /var/www/web
# COPY /flask-app/static /var/www/web/static
COPY /flask-app/templates/index.html /var/www/web


WORKDIR /var/www/web
RUN chown :www-data /var/www/web
RUN ls