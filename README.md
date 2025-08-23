# Maturin cross compilation from Linux

## Prerequisites

Install mingw

On Ubuntu

> ```bash
> sudo apt install mingw-w64
> ``` 

Install libsodium (required for manysign)

> On Ubuntu
> ```bash
> sudo install libsodium-dev
> ```
>
> On Fedora
>
> ```bash
> sudo dnf install libsodium-devel
> ```

Install manysign and zig. Helpers are located in `scripts/`

Install maturin

```bash
uv venv && uv pip install maturin
```

# Cross compiling Wheels

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

## Installing and Using the Wheel

Install the Wheel: After building, install the wheel for your platform (e.g., Linux x86_64) in the virtual environment.

```bash
uv pip install target/wheels/maturin_crosscompilation_example-*.whl
```

**Test installed package**

```bash
(.venv) python
>>> from maturin_crosscompilation_example import sum_as_string
>>> sum_as_string(1, 2)
'3'
```

