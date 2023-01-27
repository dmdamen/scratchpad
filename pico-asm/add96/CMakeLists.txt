add_executable( add96
	add96.S
)

target_link_libraries(add96 pico_stdlib)

pico_add_extra_outputs(add96)


