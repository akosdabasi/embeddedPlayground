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
- **Transparency**: All components — from vector table to memory layout — are explicitly defined. The goal is to make it relatively easy to see how every single byte ends up in the memory.
- **Self-containment**: No external dependencies. 
- **Reusability**: Easily clone and adapt to start new projects with confidence.
- **Educational Value**: By following the commit history it will be clear how we can run application software on an embedded system absolutely from scratch.

## Repository Structure
project-root/
├── CMSIS-core/
│   ├── inc
│   └── src
├── CMSIS-drivers/
│   ├── inc
│   └── src
├── linker/
│   └── linker.ld
├── startup/
│   └── startup.c
├── app/
│   └── main.c
├── examples/
│   ├── main_example1.c
│   └── main_example2.c
├── cmake/
│   |── gcc-arm-none-eabi.cmake
├── CMakeLists.txt
└── README.md


## Project History
1. Adding a simple linker script
2. Adding typedefs.h 
    - for the moment we dont have standard library
    - so we dont have access to types like uint32_t from stdint.h
    - these typedefs are platform dependent
    - we should also add .vscode/c_cpp_properties.json file to make IntelliSense and other things work well in VS Code
3. Adding the startup file(startup.c) and main.c
    - at this point we should be able to build the firmware and flash it on the target and start debugging.
    - this requires: (there are many solutions, I'm only listing the sw/hw that I'm using)
    ((I will add a Dev Container solution to be able to avoid all the below tool setup))
    ------------- bare minimum -------------------------------------------------------------
        - debug probe (hw): STLink (on Nucleo board) with JLink firmware
        - debug probe driver: JLink.exe
            - requires a flash script for flashing (flash_script.jlink)
        - debug sw: cortex-debug VS Code extension
            - requires gdb and gdb-server(arm-none-eabi-gdb, JLinkGDBServerCL.exe)
            - has to be configured in .vscode/launch.json
        - toolchain (compiler, linker, assembler): the goal is to support multiple toolchains
            - default toolchain: arm-none-eabi-xxx
            - other supported toolchains(in future): clang
    ------------- for keeping your sanity -----------------------------------------------------
        - build system generator: we could use the toolchain directly to manually compile and link source code but no one should do that, if its not for educational reasons. A build system automates this process. A build system generator, creates build systems
            - CMake: will be used to generate Make and/or Ninja build systems
                - has to be configured in CMakeLists.txt + CMakePresets.json
        - VS Code tasks for: Debug/Release builds, Flashing and other common tasks
            - can be invoked on clicking a button with the Task Runner extension
    -------------- ideal case ------------------------------------------------------------------
        - all these tools are contained in a dev container image that you can pull and run locally with Docker + Dev Container extension and work inside it without having to install and set up most of these tools on your host PC. --> This will be provided in the future.
4. Adding configuration files for the required toolchain/workflow
    - .vscode/c_cpp_properties.json: VS Code needs it for IntelliSense and other functionalities
    - .vscode/launch.json: cortex-debug configuration
    - .vscode/STM32F103xx.svd: register definitions for cortex-debug
    - .vscode/tasks.json: defines VS Code tasks to make life easier
    - build_scripts: scripts used by the VS Code tasks
    - CMakeLists.txt: CMake project file, defines how to build the project
    - CMakePresets.json: contains predefined build configurations
    - cmake: CMake modules referenced by CMakeLists.txt
5. Adding processor core and MCU peripheral drivers
    - I'm using an incomplete custom stipped down version for educational reasons, but CMSIS driver files should be provided by Arm (core drivers) and by ST (MCU peripherals)
    


