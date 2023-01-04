FROM rust:1.66.0

LABEL maintainer="Tal Rasha"
LABEL version="1.66.0"
LABEL description="Rust + WASM toolchain"

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cargo install cargo-generate
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

RUN mkdir -p /pkg
WORKDIR /pkg

RUN USER=foo cargo generate --git https://github.com/rustwasm/wasm-pack-template --name foo && \
    cd foo && wasm-pack build && rm -rf foo
