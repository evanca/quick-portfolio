# GitHub OAuth proxy for the CMS at /admin (see oauth/README.md).
# Build from the repository root: docker build -f oauth/Dockerfile .

FROM golang:1.25-alpine AS build
WORKDIR /src
COPY oauth/go.mod ./
RUN go mod download
COPY oauth/ ./
RUN CGO_ENABLED=0 GOOS=linux go build -trimpath -ldflags="-s -w" -o /out/oauth .

FROM alpine:3.23
RUN apk --no-cache add ca-certificates \
    && addgroup -S -g 10001 app \
    && adduser -S -u 10001 -G app -h /opt/app app
WORKDIR /opt/app
COPY --from=build --chown=app:app /out/oauth /opt/app/oauth
USER app
EXPOSE 8081
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget -q -O /dev/null http://localhost:8081/oauth/health || exit 1
ENTRYPOINT ["/opt/app/oauth"]
