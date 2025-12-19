FROM node:lts-alpine3.23 AS build
    WORKDIR /opt/app
    
    # Install dependencies
    RUN --mount=type=bind,source=package.json,target=package.json \
        --mount=type=bind,source=yarn.lock,target=yarn.lock \
            yarn install --frozen-lockfile --production

FROM node:lts-alpine3.23 AS run
    # Run app as non root user
    RUN addgroup -g 1001 -S nodeuser && \
        adduser -S nodeuser -u 1001

    WORKDIR /opt/app

    # Set production variable
    ENV NODE_ENV=production
    
    COPY --from=build --chown=nodeuser:nodeuser /opt/app/node_modules node_modules/
    COPY src/ src/
    COPY package.json package.json

    EXPOSE 3000
    HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
    
    USER nodeuser
    
    CMD [ "yarn", "run", "start" ]
