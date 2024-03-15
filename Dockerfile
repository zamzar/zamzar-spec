FROM node:20-bookworm

RUN npm install -g @stoplight/spectral-cli

COPY . /usr/src/zamzar-spec
WORKDIR /usr/src/zamzar-spec

CMD ["spectral", "lint", "openapi/spec.yaml"]