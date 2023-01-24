add_executable( HelloWorld
	HelloWorld.S
)

target_link_libraries(HelloWorld pico_stdlib)

pico_add_extra_outputs(HelloWorld)


