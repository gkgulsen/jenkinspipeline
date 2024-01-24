FROM node:14 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Nginx ile dağıtım için hafif bir imaj
FROM nginx:1.21
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
