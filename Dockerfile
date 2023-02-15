# Informa ao Docker qual imagem base iremos utilizar
FROM ubuntu:20.04 as base

# Versão do node que vamos instalar
ENV NODE_VERSION 19.6.0

# Instalacao libs necessarias
RUN apt-get update
RUN apt-get -y install curl wget tar apt-utils apt-transport-https lsb-release gnupg libc6
RUN apt-get install lsof
RUN apt-get install nano

#Instalação node
RUN wget "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz"
RUN tar xvfJ "node-v$NODE_VERSION-linux-x64.tar.xz"  -C /usr/
ENV PATH=/usr/node-v$NODE_VERSION-linux-x64/bin:$PATH
RUN rm -f "node-v$NODE_VERSION-linux-x64.tar.xz"

# #Instalação Dependências cypress
# RUN apt-get install -y libgtk2.0-0 libgconf-2-4 libxss1 libxtst6 xauth xvfb
# #   libgbm-dev libnotify-dev 

# #Instalação Dependências cypress e Chrome: em comum
# RUN apt-get install -y libgtk-3-0 libnss3 libasound2

# #Instalação Dependências Chrome
# RUN apt-get install -y fonts-liberation libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libdbus-1-3 libdrm2 libgbm1
# RUN apt-get install -y libglib2.0-0 libnspr4  libpango-1.0-0 libu2f-udev libvulkan1 libx11-6 libxcb1
# RUN apt-get install -y libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxrandr2 xdg-utils
# RUN apt-get update

# #Instalação Chrome
# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
# RUN dpkg -i  --force-depends google-chrome-stable_current_amd64.deb
# RUN apt-get -f install

WORKDIR /app


# Ambiente de desenvolvimento
FROM base as development
COPY . .
WORKDIR /app/src
EXPOSE 8080
# usado para o container não morrer enquanto a aplicação não foi criada, ao descomentar a linha acima, comente essa abaixo
# CMD tail -f /dev/null
# Caso já tenha o node com o package.json mas ainda não tem o comando de inicialização (npm run dev, etc)
# CMD npm install && tail -f /dev/null
# descomentar somente após a aplicação base ser criada
CMD npm install && npm run dev


# Ambiente de produção
FROM base as production
COPY . .
WORKDIR /app/src
EXPOSE 8000
CMD npm install && npm run build && npm run prod