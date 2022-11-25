FROM node:16-alpine as builder
WORKDIR /app
COPY ./package.json ./ 
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# EXPOSE ternyata gk buat apa" klo di dockernya, cuma buat info ke sesama dev kalau docker ini butuh port 80 untuk dimapping
EXPOSE 8081
# Tapi kalau di ElasticBeanStalk (AWS) beda. Dia bakal beneran liat si EXPOSE ini untuk tau akan jalan di port mana 
COPY --from=builder /app/build /usr/share/nginx/html

