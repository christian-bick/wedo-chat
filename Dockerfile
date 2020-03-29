# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:1.10

ARG app

# Create app directory and copy the Elixir projects into it

COPY . /project

WORKDIR /project

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
RUN mix local.rebar --force

# Compile the project
RUN mix deps.get
RUN mix do compile

WORKDIR /project/apps/$app

RUN pwd
RUN ls

ENTRYPOINT ["mix", "phx.server"]