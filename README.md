# Static Toolchains

Static cross-compilation toolchains for various architectures. Uses the following:

- https://github.com/richfelker/musl-cross-make 
- [Crosstool-ng](https://crosstool-ng.github.io/)

# Generating New Toolchains

## cross-make

This is generally just musl-cross-make with default settings.

Run the script `./build_musl.sh <TUPLE>` to see if it works.

## Crosstool-ng + uLibc

Crosstool-ng utilizes a nice CLI UI to configure builds. To quickly get the menu, run `build_crossng.sh`, then in the container shell that pops up, run `./ct-ng menuconfig`.

Once the config is good, copy to `/host/config_<ARCH>` (mounted to ./files) to use it with the `./build_ulibc.sh` script, which will copy that config during the build.