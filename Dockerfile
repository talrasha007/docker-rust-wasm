FROM rust:1.37.0

LABEL maintainer="Tal Rasha"
LABEL version="1.37.0"
LABEL description="Rust + WASM toolchain"

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rustup target add wasm32-unknown-unknown
RUN cargo install cargo-generate wasm-bindgen-cli wasm-gc
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

RUN mkdir -p /pkg
WORKDIR /pkg

RUN USER=foo cargo generate --git https://github.com/rustwasm/wasm-pack-template --name foo && \
    cd foo && wasm-pack build && rm -rf foo

