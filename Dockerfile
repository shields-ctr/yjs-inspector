# syntax=docker/dockerfile:1

FROM node:25-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps

# I can't get the build to work, some aliased import link doesn't work right in the container...
# COPY . .
# RUN npm run build

# this is a hack to just copy the successful ubuntu build...
COPY ./dist ./dist

EXPOSE 4173
# CMD ["npx", "vite", "preview", "--host"]
CMD ["npm", "run", "host"]


# Useful commands
# docker build -t ircsom-inspector-image ./yjsws/
# docker run --name ircsom-inspector -p 5173:5173 ircsom-inspector-image:latest
# docker stop ircsom-inspector
# docker rm ircsom-inspector