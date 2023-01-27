add_executable( do_until
	do_until.S
)

target_link_libraries(do_until pico_stdlib)

pico_add_extra_outputs(do_until)


