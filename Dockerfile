# Build
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run
FROM nginx
# With exposing port 80 Elastic Beanstalk will map it automatically
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
