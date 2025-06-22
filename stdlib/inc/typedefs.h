#pragma once

typedef unsigned char       uint8_t;
typedef signed char         int8_t;

typedef unsigned short      uint16_t;
typedef signed short        int16_t;

typedef unsigned int        uint32_t;
typedef signed int          int32_t;

typedef unsigned long long  uint64_t;
typedef signed long long    int64_t;

// Compile-time checks to ensure sizes are correct (in bytes)
_Static_assert(sizeof(uint8_t)  == 1, "uint8_t is not 8 bits");
_Static_assert(sizeof(int8_t)   == 1, "int8_t is not 8 bits");
_Static_assert(sizeof(uint16_t) == 2, "uint16_t is not 16 bits");
_Static_assert(sizeof(int16_t)  == 2, "int16_t is not 16 bits");
_Static_assert(sizeof(uint32_t) == 4, "uint32_t is not 32 bits");
_Static_assert(sizeof(int32_t)  == 4, "int32_t is not 32 bits");
_Static_assert(sizeof(uint64_t) == 8, "uint64_t is not 64 bits");
_Static_assert(sizeof(int64_t)  == 8, "int64_t is not 64 bits");

//other type definitions
//function pointers
typedef void (*isr_callback_t)(void);

//null pointer
#define NULL ((void*)0);

//type modifier defines for memmory mapped peripheral registers
#define __vo volatile
#define __IO volatile
#define __I const volatile
#define __O volatile


//other common defines
#define TRUE    1
#define FALSE   0
#define SET     TRUE
#define UNSET   FALSE
#define ENABLE  TRUE
#define DISABLE FALSE
#define HIGH    TRUE
#define LOW     FALSE

typedef enum {
  disabled = 0,
  enabled  = 1
} state_t;
