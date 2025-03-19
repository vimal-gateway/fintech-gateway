# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy application source
COPY . .

# Expose application port
EXPOSE 3002

# Run the application
CMD ["node", "dist/main.js"]
