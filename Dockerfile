FROM node:20-alpine
WORKDIR /app
COPY package.json ./
COPY server.js ./
COPY .env.example ./
COPY data ./data
ENV NODE_ENV=production
EXPOSE 4173
CMD ["node","server.js"]
