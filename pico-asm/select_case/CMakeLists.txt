add_executable( select_case
	select_case.S
)

target_link_libraries(select_case pico_stdlib)

pico_add_extra_outputs(select_case)


