FROM node:17-buster

# Dockerfile info
LABEL mantainer="Francesco Zanti"
LABEL maintainer_email="git@francescozanti.dev"

# System Update (1-Layer)
RUN set -e && apt update && apt install -y gettext && rm -rf /var/lib/apt/lists/*

# Git Branch
ARG branch=master

ENV NODE_ENV production

# Define workspace
WORKDIR /opt/magic_mirror

RUN git clone --depth 1 -b ${branch} https://github.com/MichMich/MagicMirror.git .

RUN npm install --silent

# Copy config from config folder
COPY config/ /opt/magic_mirror/config/

# Copy node_modules from node_modules folder
RUN cp -R modules /opt/default_modules

# Expose port 8080
EXPOSE 8080 

# Start MagicMirror
CMD ["node", "serveronly"]