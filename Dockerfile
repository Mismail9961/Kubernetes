# Use lightweight Node image
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Create non-root user
RUN addgroup -S app && adduser -S app -G app

# Copy package files first (for caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy rest of the app
COPY . .

# Fix permissions
RUN chown -R app:app /app

# Switch to non-root user
USER app

# Set environment
ENV NODE_ENV=production

# Expose your app port (change if needed)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]