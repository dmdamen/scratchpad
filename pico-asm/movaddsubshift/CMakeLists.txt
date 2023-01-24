add_executable(movaddsubshift
	movaddsubshift.S
)

target_link_libraries(movaddsubshift pico_stdlib)

pico_add_extra_outputs(movaddsubshift)

