FROM node:18 AS base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Run
FROM node:18-alpine
WORKDIR /app
COPY --from=base /app .
EXPOSE 3000
CMD ["node", "index.js"]
