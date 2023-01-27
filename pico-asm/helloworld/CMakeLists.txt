add_executable( helloworld
	helloworld.S
)

target_link_libraries(helloworld pico_stdlib)

pico_add_extra_outputs(helloworld)


