BINUTILS_VER = 2.33.1
GCC_VER = 11.2.0

OUTPUT=/output
# Smaller builds
COMMON_CONFIG += CFLAGS="-g0 -Os" CXXFLAGS="-g0 -Os" LDFLAGS="-s"
