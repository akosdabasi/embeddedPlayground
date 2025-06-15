ENTRY(Reset_Handler); /*Information for debugger and other tools*/

/*Memory layout of the system*/
MEMORY {
  sram(rwx) : ORIGIN = 0x20000000, LENGTH = 20k  
  flash(rx) : ORIGIN = 0x08000000, LENGTH = 128k
}

/*
A linker script defines how relocatable sections from object files are mapped into memory and organized into the final ELF file, specifying section placement, memory regions, and symbol addresses.

VMA: the address the section will have at run-time (execution address)
LMA: the address at which the section will be loaded (load address)
-> data section is loaded into flash(LMA) and copied into sram(VMA) for execution in startup.c

. keeps track of the current execution address.

Fundamental standard sections:
.text:      machine instructions
.rodata:    constants
.data:      initialized global/static variables
.bss:       zero initialized global/static variables

The following symbles are referenced in startup.c:
_sstack:    start of stack
_sdata:     start of .data execution address
_edata:     end of .data execution address
_sidata:    start of .data load(initial) address   
_sbss:      start of .bss
_ebss:      start of .bss
*/
/* Full-descending stack start at the end of SRAM*/
_sstack = ORIGIN(sram) + LENGTH(sram); 

SECTIONS{

    /*The vector table has to go in the beginning of the flash, because that is where the processor expects it. See further explanation in startup.c*/
    .vectors : 
    { 
      KEEP(*(.vectors)) /*KEEP: Otherwise it would get garbage collected by the linker, since it's not referenced in the code*/
    } > flash
    
    /*All the instructions from all the object files come next in flash*/
    .text : 
    {
      *(.text*) 
    } > flash
    
    /*Then all the constants*/
    .rodata :
    {
      *(.rodata*) 
    } > flash


    .data : AT (flash) /*load to flash*/
    {
      _sdata = .;             
      *(.data SORT(.data.*))  /*sections will be placed in memory in a stable order*/
      _edata = .;             
    } > sram /*but execute from sram*/

    _sidata = LOADADDR(.data);

    .bss : 
    {
      _sbss = .;                    /* .bss section start */
      *(.bss SORT(.bss.*) COMMON)   /*COMMON: unitialized global variables not explicitly placed in sections*/
      _ebss = .;                    /* .bss section end */
    } > sram
}