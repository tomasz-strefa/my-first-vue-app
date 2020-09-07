FROM node:alpine AS my-app-build
WORKDIR /app
# COPY package*.json ./
# RUN npm install
COPY . .
RUN npm install && npm run build

# stage 2

FROM nginx:latest
COPY --from=my-app-build /app/dist /usr/share/nginx/html/
EXPOSE 80
