# embeddedPlayground

`embeddedPlayground` is a bare-metal embedded systems project template designed for the STM32F103RB microcontroller. It serves as a transparent, self-contained starting point for future embedded projects — where **no details are hidden**. Whether you're learning, experimenting, or prototyping, this playground gives you full control over every layer of the system.

## Features

- **Bare-metal development**: No RTOS. --> Will be added as a derivate of this project.
- **STM32F103RB**: Future plans include targeting the whole STM32F1xx family.
- **CMake build system**: Cross-platform, reproducible, and easy to scale.
- **Custom startup code**: Over-documented `startup.c` .
- **Custom linker script**: Over-documented `linker.ld`.
- **CMSIS-based drivers**: Low-level hardware access with standard CMSIS components.
- **DevContainer**: The development environment will be provided as a Docker container.

## Why This Project?

This repository was created as a **foundation** for future embedded projects. The goal is to offer:
- **Transparency**: All components — from vector table to memory layout — are explicitly defined. The goal is to make it relatively easy to see how every singe byte ends up in the memory.
- **Self-containment**: No external dependencies. 
- **Reusability**: Easily clone and adapt to start new projects with confidence.
- **Educational Value**: By following the commit history it will be clear how we can run application software on an embedded system absolutely from scratch.

## Repository Structure

