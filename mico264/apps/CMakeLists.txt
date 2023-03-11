add_executable( mico264
	main.c
)

target_link_libraries(mico264 lib pico_stdlib)

pico_enable_stdio_uart(mico264 1)
pico_enable_stdio_usb(mico264 0)

pico_add_extra_outputs(mico264)


