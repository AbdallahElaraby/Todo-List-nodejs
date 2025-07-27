FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json if it exists
COPY src/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY src/ ./

EXPOSE 4000

CMD ["npm", "start"]
