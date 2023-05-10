FROM node:14.21.3 as node

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=node /app/build /usr/share/nginx/html
