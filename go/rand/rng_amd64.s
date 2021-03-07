// +build amd64

#include "textflag.h"

TEXT ·getInt63(SB),NOSPLIT,$0
	// RDRAND RAX
	BYTE $0x48; BYTE $0x0f; BYTE $0xc7; BYTE $0xf0;
	SHRQ $1, AX
	MOVQ AX, ret+0(FP)
	RET

TEXT ·getUint64(SB),NOSPLIT,$0
	// RDRAND RAX
	BYTE $0x48; BYTE $0x0f; BYTE $0xc7; BYTE $0xf0
	MOVQ AX, ret+0(FP)
	RET
