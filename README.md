# meta-tinyai - 南极熊嵌入式Linux发行版

**meta-tinyai** 是一个基于 Yocto 的 Linux 发行版。

## 🎯 两个核心目标

### 1. 在资源受限设备上部署本地 AI

在树莓派3B（1GB内存）这样的设备上，跑起本地AI推理。

- 基于 `poky-tiny` + `musl`，镜像极致精简
- 预集成轻量推理框架（`llama.cpp` / TinyLlama）
- 支持端侧小模型部署，不依赖云端

### 2. 开箱即用的 QEMU 模拟

无需硬件，一键启动虚拟树莓派3B，随时随地进行开发和实验。

- QEMU `raspi3b` 完美模拟，串口/网络/USB键盘已调通
- 设备树已优化（禁用蓝牙，释放串口）
- 适合学习、调试、CI/CD 自动化测试

## 💡 谁适合用？

- 想在树莓派3上跑AI，但资源受限的开发者
- 想学习嵌入式Linux，但不想买开发板的学生
- 需要可复现、可移植的嵌入式开发环境的工程师

## 🚀 快速开始

...

## 📦 预编译镜像（付费版）

如果你不想自己构建，可以直接购买我预编译好的镜像，烧录即可用。

👉 [南极熊爱发电链接]
### 南极熊 · 嵌入式开发者

- 📧 邮箱：`zishuowang696@gmail.com`
- 🐻 抖音：`73630949149`
- 🧊 爱发电：南极熊（待补充）
- 🐙 GitHub：[zishuowang](https://github.com/zishuowang696)

  


---

## 🙏 致谢

- [Yocto Project](https://www.yoctoproject.org/)
- [meta-raspberrypi](https://github.com/agherzan/meta-raspberrypi)
- [QEMU](https://www.qemu.org/)
- 所有踩过的坑和填坑的同行

---

## ⭐ Star History

如果这个项目对你有帮助，希望你能给它一个 Star。  
不是为了虚荣，是为了让我知道：这条路，不是只有我一个人在走。
