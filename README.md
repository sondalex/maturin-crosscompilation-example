# Maturin cross compilation from Linux

## Prerequisites


Install libsodium (required for manysign)

On Ubuntu

```bash
sudo install libsodium-dev
```

```bash
sudo dnf install libsodium-devel
```




Install manysign and zig, helpers are located in `scripts/`

Install maturin

```bash
uv venv && uv pip install maturin
```

# Cross compiling

**To Windows x86**

```bash
rustup target add x86_64-pc-windows-gnu
```

```bash
uv tool run maturin build --target x86_64-pc-windows-gnu --zig -i python3.10 
```


**To Windows arm**

```bash
rustup target add aarch64-pc-windows-gnullvm
```

```bash
uv tool run maturin build --target aarch64-pc-windows-gnullvm --zig -i python3.10 
```
