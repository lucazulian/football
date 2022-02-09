FROM elixir:1.13.2-alpine

MAINTAINER Luca Zulian <contact@lucazulian.it>

RUN apk add --no-cache \
    postgresql-client \
    curl \
    openssh \
    bash \
    git \
    inotify-tools

RUN mix local.hex --force && mix local.rebar --force

ENV ERL_AFLAGS "-kernel shell_history enabled"
