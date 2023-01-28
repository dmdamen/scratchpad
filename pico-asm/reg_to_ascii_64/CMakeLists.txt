add_executable( reg_to_ascii_64
	reg_to_ascii_64.S
)

target_link_libraries(reg_to_ascii_64 pico_stdlib)

pico_add_extra_outputs(reg_to_ascii_64)

