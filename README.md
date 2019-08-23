# docker-rust-wasm
Docker image for rust wasm.

## How to use
```sh
docker run --rm -it -v $(pwd):/pkg -e USER=foo talrasha007/rust-wasm cargo generate --git https://github.com/rustwasm/wasm-pack-template
docker run --rm -it -v $(pwd):/pkg talrasha007/rust-wasm wasm-pack build
```

## Alias
```sh
alias wasm-init='docker run --rm -it -v "$(pwd)":/pkg -e USER="$USER" talrasha007/rust-wasm cargo generate --git https://github.com/rustwasm/wasm-pack-template'
alias wasm-pack='docker run --rm -it -v "$(pwd)":/pkg talrasha007/rust-wasm wasm-pack'
```
