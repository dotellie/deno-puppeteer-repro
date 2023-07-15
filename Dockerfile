FROM denoland/deno

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    chromium chromium-sandbox chromium-driver \
    fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf fonts-liberation \
    ca-certificates \
    ca-certificates \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    libdrm2 \
    libxkbcommon0 \
    libxshmfence1 \
    && apt-get -y -qq autoremove \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /home/deno

COPY ./index.ts ./index.ts

RUN deno compile -A --output app ./index.ts

ENTRYPOINT ["./app"]
