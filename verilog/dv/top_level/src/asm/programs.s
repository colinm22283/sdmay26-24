# Template file to assign ELF sections to the customasm stuff.
# Customasm can't assign sections to data, so LD has no idea what
# to do with it.

.section .shader_programs

# Vertex shader program, with start and end markers
.global _svertex_shader
_svertex_shader:
    .incbin "vertex_shader.bin"
.global _evertex_shader
_evertex_shader:
