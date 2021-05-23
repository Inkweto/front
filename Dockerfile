FROM node:16-buster

# Dev user and workspace parameters
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG WORKSPACE=/app

RUN apt update && apt install git
RUN npm install -g @vue/cli

# User uid and gid change
RUN groupmod -g $USER_GID $USERNAME \
    && usermod -u $USER_UID $USERNAME \
    && chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}

RUN mkdir -p ${WORKSPACE}/node_modules
COPY ./package*.json ${WORKSPACE}
RUN chown -R ${USER_UID}:${USER_GID} ${WORKSPACE}

WORKDIR ${WORKSPACE}
USER ${USER_UID}:${USER_GID}
RUN npm install

EXPOSE 8080
