SUMMARY = "llama.cpp - LLM inference in C/C++"
DESCRIPTION = "A C/C++ implementation of LLaMA-based large language models \
with ARM NEON optimizations for efficient inference on edge devices."
HOMEPAGE = "https://github.com/ggerganov/llama.cpp"
SECTION = "devel/ai"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=223b26b3c1143120c87e2b13111d3e99"

SRC_URI = "git://github.com/ggerganov/llama.cpp;protocol=https;branch=master"

SRCREV = "dcad77cc3b0865153f486327064fb0320a57a476"
PV = "b8933"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

# RPi 3B (Cortex-A53) 优化: 开启 ARM NEON 等 aarch64 特有指令集
EXTRA_OECMAKE = "\
    -DCMAKE_BUILD_TYPE=Release \
    -DLLAMA_CPU_AARCH64=ON \
    -DLLAMA_BUILD_TESTS=OFF \
    -DLLAMA_BUILD_EXAMPLES=OFF \
"

do_install:append() {
    # llama-cli 和 llama-server 由 cmake --install 安装,
    # 此处确保 bin/ 下可执行文件被正确打包
    :
}

FILES:${PN} += "\
    ${bindir}/llama-cli \
    ${bindir}/llama-server \
"

# 运行时不需要编译依赖
RDEPENDS:${PN} += "libstdc++"
