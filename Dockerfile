# Dockerfile
FROM node:18 as build

WORKDIR /app

COPY . .

RUN npm install
RUN npx nx build web

# Nginx zum Serven der Angular-App
FROM nginx:alpine

COPY --from=build /app/dist/apps/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
