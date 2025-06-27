FROM node:20

WORKDIR /app
COPY . .
RUN npm install && npm run build

VOLUME ["/app/dist"]
CMD ["echo", "Build complete. Container is not meant to run."]
