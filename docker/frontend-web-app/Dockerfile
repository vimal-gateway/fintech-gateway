# Stage 1: Build React App
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the source code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Serve the App with Nginx
FROM nginx:stable-alpine

# Copy built files from the previous stage
COPY --from=builder /app/build /usr/share/nginx/html

# Expose the port Nginx runs on
EXPOSE 8081

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
