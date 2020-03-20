# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:1.10

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
WORKDIR /app

COPY . /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force

# Compile the project
RUN mix deps.get
RUN mix do compile

ENTRYPOINT ["mix", "phx.server"]