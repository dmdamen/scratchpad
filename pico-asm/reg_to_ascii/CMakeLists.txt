add_executable( reg_to_ascii
	reg_to_ascii.S
)

target_link_libraries(reg_to_ascii pico_stdlib)

pico_add_extra_outputs(reg_to_ascii)

