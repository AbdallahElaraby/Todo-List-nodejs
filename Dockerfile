FROM node:18-alpine AS builder
WORKDIR /app
COPY src/package*.json ./
RUN npm install
COPY src/ ./
FROM node:18-alpine AS production
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 4000
CMD ["npm", "start"]
