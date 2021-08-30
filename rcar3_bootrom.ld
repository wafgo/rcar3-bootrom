/*
 * Copyright (c) 2021, Wadim Mueller
 */

OUTPUT_FORMAT("elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
ENTRY(__vector_start)

MEMORY {
    BRAM (rwx): ORIGIN = 0xEB100180, LENGTH = 0x30000
}

SECTIONS
{
    .vectors : {
    	PROVIDE(__vector_start = .);
    	*(.vectors)
    	PROVIDE(__vector_end = .);
	ASSERT((__vector_end - __vector_start) == 0x10 , "Number of vectors supposed to be exactly 4");
    } >BRAM

    .text . : {
        __text_start = .;
        *(.text*)
        __text_end = .;
     } >BRAM

    .rodata . : {
        __rodata_start = .;
        *(.rodata*)
        __rodata_end = .;
    } >BRAM
    
    .data . : {
        __data_start = .;
        *(.data*)
        __data_end = .;
    } >BRAM

    .bss : ALIGN(16) {
        __bss_start = .;
        *(SORT_BY_ALIGNMENT(.bss*))
        *(COMMON)
        __bss_end = .;
    } >BRAM
}
