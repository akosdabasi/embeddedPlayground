#defines the type of platform tageted: Linux, Android... Generic for bare-metal
set(CMAKE_SYSTEM_NAME               Generic)

#specifies the target architecture
set(CMAKE_SYSTEM_PROCESSOR          arm)

#custom variables for convenience
set(toolchain_prefix                arm-none-eabi-)

# Define compiler settings
set(CMAKE_C_COMPILER                ${toolchain_prefix}gcc)
set(CMAKE_ASM_COMPILER              ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER              ${toolchain_prefix}g++)
set(CMAKE_OBJCOPY                   ${toolchain_prefix}objcopy)
set(CMAKE_SIZE                      ${toolchain_prefix}size)

set(CMAKE_EXECUTABLE_SUFFIX_ASM     ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C       ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX     ".elf")

#for making compiler checks pass
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)