FROM node:alpine as teamvoldemort

WORKDIR /var/usr/app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx as final
EXPOSE 80
COPY --from=teamvoldemort /var/usr/app/build /usr/share/nginx/html
