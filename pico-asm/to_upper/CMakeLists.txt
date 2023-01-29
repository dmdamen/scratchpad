add_executable( to_upper
	to_upper.S
)

target_link_libraries(to_upper pico_stdlib)

pico_add_extra_outputs(to_upper)


