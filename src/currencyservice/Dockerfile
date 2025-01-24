# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Builder Stage
FROM node:20.17.0-alpine AS builder

# Install dependencies required for some Node.js packages
RUN apk add --no-cache python3 build-base

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --only=production --verbose

# Final Runtime Stage
FROM node:20.17.0-alpine

WORKDIR /usr/src/app

# Copy production dependencies and application files
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY . .

# Expose application port
EXPOSE 7000

# Start the application
ENTRYPOINT ["node", "server.js"]
