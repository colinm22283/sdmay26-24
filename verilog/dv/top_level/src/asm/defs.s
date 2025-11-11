; Opcodes
OPCODE_ADD      = 0x0`6
OPCODE_ADDI     = 0x1`6
OPCODE_SUB      = 0x2`6
OPCODE_MUL      = 0x3`6
OPCODE_MULI     = 0x4`6
OPCODE_DIV      = 0x5`6
OPCODE_DIVI     = 0x6`6
OPCODE_AND      = 0x7`6
OPCODE_ANDI     = 0x8`6
OPCODE_OR       = 0x9`6
OPCODE_ORI      = 0xA`6
OPCODE_XOR      = 0xB`6
OPCODE_XORI     = 0xC`6
OPCODE_MAC      = 0xE`6
OPCODE_MACCL    = 0xF`6
OPCODE_MACRD    = 0x10`6
OPCODE_SPEQ     = 0x11`6
OPCODE_SPLT     = 0x12`6
OPCODE_CLRP     = 0x13`6
OPCODE_SPR      = 0x14`6
OPCODE_SREQ     = 0x15`6
OPCODE_SRLT     = 0x16`6
OPCODE_LW       = 0x17`6
OPCODE_SW       = 0x18`6
OPCODE_SB       = 0x19`6
OPCODE_LWV      = 0x1A`6
OPCODE_SWV      = 0x1B`6
OPCODE_SBV      = 0x1C`6
OPCODE_JUMP     = 0x1D`6


; Registers and Immediates
#subruledef srcreg {
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

#subruledef destreg {
    $r{n: u4} => {
        assert(n < 16)
        (0 + n)`4
    }

    ; Special register names
    $tid => 0`4
}

; Predicate bits, can be used for predication
; or as arguments to speq, splt, clrp
#subruledef predicate {
    ($p{n: u2}) => {
      assert(n < 2)
      (1 << n)`3
    }
    () => 0`3
}


; Base Instructions
#ruledef {
    ; Basic math
    {pred: predicate} add     {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_ADD   @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} addi    {rd: destreg}, {rs1: srcreg}, {imm: s13}      => OPCODE_ADDI  @ pred @ rd @ rs1 @ imm
    {pred: predicate} sub     {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_SUB   @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} mul     {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_MUL   @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} muli    {rd: destreg}, {rs1: srcreg}, {imm: s13}      => OPCODE_MULI  @ pred @ rd @ rs1 @ imm
    {pred: predicate} div     {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_DIV   @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} divi    {rd: destreg}, {rs1: srcreg}, {imm: s13}      => OPCODE_DIVI  @ pred @ rd @ rs1 @ imm
    {pred: predicate} and     {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_AND   @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} andi    {rd: destreg}, {rs1: srcreg}, {imm: s13}      => OPCODE_ANDI  @ pred @ rd @ rs1 @ imm
    {pred: predicate} or      {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_OR    @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} ori     {rd: destreg}, {rs1: srcreg}, {imm: s13}      => OPCODE_ORI   @ pred @ rd @ rs1 @ imm
    {pred: predicate} xor     {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}   => OPCODE_XOR   @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} xori    {rd: destreg}, {rs1: srcreg}, {imm: s13}      => OPCODE_XORI  @ pred @ rd @ rs1 @ imm

    ; MAC
    {pred: predicate} mac     {rs1: srcreg}, {rs2: srcreg}  => OPCODE_MAC   @ pred @ 0`6 @ rs1 @ rs2 @ 0`7
    {pred: predicate} maccl                                 => OPCODE_MACCL @ pred @ 0`23
    {pred: predicate} macrd   {rd: destreg}                 => OPCODE_MACRD @ pred @ rd @ 0`19

    ; Branching and Predication
    {pred: predicate} speq    {pred_data: predicate}, {rs1: srcreg}, {rs2: srcreg}  => OPCODE_SPEQ  @ pred @ pred_data @ rs1 @ rs2 @ 0`7
    {pred: predicate} splt    {pred_data: predicate}, {rs1: srcreg}, {rs2: srcreg}  => OPCODE_SPLT  @ pred @ pred_data @ rs1 @ rs2 @ 0`7
    {pred: predicate} clrp    {pred_data: predicate}                                => OPCODE_CLRP  @ pred @ pred_data @ 0`19
    {pred: predicate} spr     {rd: destreg}                                         => OPCODE_SPR   @ pred @ rd @ 0`19
    {pred: predicate} sreq    {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}           => OPCODE_SREQ  @ pred @ rd @ rs1 @ rs2 @ 0`7
    {pred: predicate} srlt    {rd: destreg}, {rs1: srcreg}, {rs2: srcreg}           => OPCODE_SRLT  @ pred @ rd @ rs1 @ rs2 @ 0`7

    ; Memory
    {pred: predicate} lw      {rd: destreg}, {imm: s13}[{rs1: srcreg}] => OPCODE_LW    @ pred @ rd @ rs1 @ imm
    {pred: predicate} sw      {rd: destreg}, {imm: s13}[{rs1: srcreg}] => OPCODE_SW    @ pred @ rd @ rs1 @ imm
    {pred: predicate} sb      {rd: destreg}, {imm: s13}[{rs1: srcreg}] => OPCODE_SB    @ pred @ rd @ rs1 @ imm
    {pred: predicate} lwv     {rd: destreg}, {imm: s13}[{rs1: srcreg}] => OPCODE_LWV   @ pred @ rd @ rs1 @ imm
    {pred: predicate} swv     {rd: destreg}, {imm: s13}[{rs1: srcreg}] => OPCODE_SWV   @ pred @ rd @ rs1 @ imm
    {pred: predicate} sbv     {rd: destreg}, {imm: s13}[{rs1: srcreg}] => OPCODE_SBV   @ pred @ rd @ rs1 @ imm

    ; Jump
    j {offset: s26} => OPCODE_JUMP @ offset
}


; Pseudoinstructions
#ruledef {
    {pred: predicate} li {rd: destreg}, {imm: s32} => asm {
        {pred} andi {rd}, {rd}, 0`13
        {pred} ori  {rd}, {rd}, ({imm} >> 19)
        {pred} muli {rd}, {rd}, (1 << 12)
        {pred} ori  {rd}, {rd}, (({imm} >> 7) & 0xFFF)
        {pred} muli {rd}, {rd}, (1 << 12)
        {pred} ori  {rd}, {rd}, ({imm} & 0xFFF)
    }

    {pred: predicate} dot4 {vector1: srcreg}, {vector2: srcreg} => asm{
        {pred} maccl
        {pred} mac {vector1} + 0, {vector2} + 0
        {pred} mac {vector1} + 1, {vector2} + 1
        {pred} mac {vector1} + 2, {vector2} + 2
        {pred} mac {vector1} + 3, {vector2} + 3
    }
}