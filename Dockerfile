# İlk aşama: Vue.js uygulamasını derleme
FROM node:14-alpine as build-stage

WORKDIR /app

# package.json ve package-lock.json dosyalarını kopyalayıp bağımlılıkları yükleyelim
COPY package*.json ./
RUN npm install

# Tüm projeyi kopyalayıp uygulamayı derleyelim
COPY . .
RUN npm run build

# İkinci aşama: Nginx tabanlı hafif bir imaj kullanma
FROM nginx:alpine as production-stage

WORKDIR /usr/share/nginx/html

# İlk aşamadan (build-stage) oluşturduğumuz derlenmiş uygulamayı kopyalayalım
COPY --from=build-stage /app/dist .

# Nginx konfigürasyon dosyasını kopyalayalım (isteğe bağlı, özelleştirilebilir)
COPY nginx.conf /etc/nginx/nginx.conf

# Jenkins için gerekli izinleri verme
USER root

# Jenkins'ın çalışabilmesi için gerekli izinleri verelim
RUN chmod -R 777 /usr/share/nginx/html

# Jenkins'ta çalıştığımızda çalışacak olan başlatma komutu
CMD ["nginx", "-g", "daemon off;"]
