#once

; Opcodes
OPCODE_ADD      = 0x0`5
OPCODE_ADDI     = 0x1`5
OPCODE_SUB      = 0x2`5
OPCODE_MUL      = 0x3`5
OPCODE_MULI     = 0x4`5
OPCODE_DIV      = 0x5`5
OPCODE_DIVI     = 0x6`5
OPCODE_AND      = 0x7`5
OPCODE_ANDI     = 0x8`5
OPCODE_OR       = 0x9`5
OPCODE_ORI      = 0xA`5
OPCODE_XOR      = 0xB`5
OPCODE_XORI     = 0xC`5
OPCODE_MAC      = 0xE`5
OPCODE_MACCL    = 0xF`5
OPCODE_MACRD    = 0x10`5
OPCODE_SPEQ     = 0x11`5
OPCODE_SPLT     = 0x12`5
OPCODE_CLRP     = 0x13`5
OPCODE_SPR      = 0x14`5
OPCODE_SREQ     = 0x15`5
OPCODE_SRLT     = 0x16`5
OPCODE_LW       = 0x17`5
OPCODE_SW       = 0x18`5
OPCODE_SB       = 0x19`5
OPCODE_LWV      = 0x1A`5
OPCODE_SWV      = 0x1B`5
OPCODE_SBV      = 0x1C`5
OPCODE_JUMP     = 0x1D`5


; Registers and Immediates
#subruledef register {
    $r{n: u6} => {
        assert(n < 64)
        (0 + n)`6
    }
    $g{n: u6} => { ; Global register notation
        assert(n < 48)
        (16 + n)`6
    }

    ; Special register names
    $tid => 0`6
}

; Predicate bits, can be used for predication
; or as arguments to speq, splt, clrp
#subruledef predicate {
    $p{n: u3} => {
		assert(n < 4)
		(1 << n)`4
	}
}


; Base Instructions
#ruledef {
    ; Basic math
    ({pred: predicate}) add     {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_ADD   @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) addi    {rd: register}, {rs1, register}, {imm: s13}         => OPCODE_ADDI  @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) sub     {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_SUB   @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) mul     {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_MUL   @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) muli    {rd: register}, {rs1, register}, {imm: s13}         => OPCODE_MULI  @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) div     {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_DIV   @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) divi    {rd: register}, {rs1, register}, {imm: s13}         => OPCODE_DIVI  @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) and     {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_AND   @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) andi    {rd: register}, {rs1, register}, {imm: s13}         => OPCODE_ANDI  @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) or      {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_OR    @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) ori     {rd: register}, {rs1, register}, {imm: s13}         => OPCODE_ORI   @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) xor     {rd: register}, {rs1: register}, {rs2: register}    => OPCODE_XOR   @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) xori    {rd: register}, {rs1, register}, {imm: s13}         => OPCODE_XORI  @ pred @ rd @ rs1 @ imm

    ; MAC
    ({pred: predicate}) mac     {rs1: register}, {rs2: register}    => OPCODE_MAC   @ pred @ 0`6 @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) maccl                                       => OPCODE_MACCL @ pred @ 0`23
    ({pred: predicate}) macrd   {rd: register}                      => OPCODE_MACRD @ pred @ rd @ 0`19

    ; Branching and Predication
    ({pred: predicate}) speq    {pred_data: predicate}, {rs1: register}, {rs2: register}    => OPCODE_SPEQ  @ pred @ pred_data @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) splt    {pred_data: predicate}, {rs1: register}, {rs2: register}    => OPCODE_SPLT  @ pred @ pred_data @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) clrp    {pred_data: predicate}                                      => OPCODE_CLRP  @ pred @ pred_data @ 0`19
    ({pred: predicate}) spr     {rd: register}                                              => OPCODE_SPR   @ pred @ rd @ 0`19
    ({pred: predicate}) sreq    {rd: register}, {rs1: register}, {rs2: register}            => OPCODE_SREQ  @ pred @ rd @ rs1 @ rs2 @ 0`7
    ({pred: predicate}) srlt    {rd: register}, {rs1: register}, {rs2: register}            => OPCODE_SRLT  @ pred @ rd @ rs1 @ rs2 @ 0`7

    ; Memory
    ({pred: predicate}) lw      {rd: register}, {imm: s13}({rs1, register}) => OPCODE_LW    @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) sw      {rd: register}, {imm: s13}({rs1, register}) => OPCODE_SW    @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) sb      {rd: register}, {imm: s13}({rs1, register}) => OPCODE_SB    @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) lwv     {rd: register}, {imm: s13}({rs1, register}) => OPCODE_LWV   @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) swv     {rd: register}, {imm: s13}({rs1, register}) => OPCODE_SWV   @ pred @ rd @ rs1 @ imm
    ({pred: predicate}) sbv     {rd: register}, {imm: s13}({rs1, register}) => OPCODE_SBV   @ pred @ rd @ rs1 @ imm

    ; Jump
    j {offset: s26}=> OPCODE_JUMP @ offset
}


; Pseudoinstructions
#ruledef {
    ({pred: predicate}) li {rd: register} {imm: s32} => asm {
        andi rd, rd, 0`13
        ori rd, rd, (imm >> 19)
        muli rd, rd, (1 << 12)
        ori rd, rd, ((imm >> 7) & 0xFFF)
        muli rd, rd, (1 << 12)
        ori rd, rd, (imm & 0xFFF)
    }

    ({pred: predicate}) dot4 {vector1: register} {vector2: register} => asm {
        (pred) maccl
        (pred) mac vector1 + 0, vector2 + 0
        (pred) mac vector1 + 1, vector2 + 1
        (pred) mac vector1 + 2, vector2 + 2
        (pred) mac vector1 + 3, vector2 + 3
    }
}