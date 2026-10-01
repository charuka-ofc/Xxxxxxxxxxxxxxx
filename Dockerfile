FROM node:20-alpine

# ffmpeg witharai athi sticker hadanna. imagemagick one na.
RUN apk add --no-cache ffmpeg webp

WORKDIR /usr/src/app

COPY package*.json ./

# --production + legacy fix
RUN npm install --production --legacy-peer-deps && \
    npm install -g qrcode-terminal pm2 --legacy-peer-deps --force

COPY . .

EXPOSE 8000

CMD ["node", "--expose-gc", "--max-old-space-size=250", "index.js"]
