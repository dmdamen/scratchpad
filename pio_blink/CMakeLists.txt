cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)
project(pio_blink C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(pio_blink)

pico_generate_pio_header(pio_blink ${CMAKE_CURRENT_LIST_DIR}/blink.pio)

target_sources(pio_blink PRIVATE pio_blink.c)

target_link_libraries(pio_blink PRIVATE pico_stdlib hardware_pio)

pico_add_extra_outputs(pio_blink)
