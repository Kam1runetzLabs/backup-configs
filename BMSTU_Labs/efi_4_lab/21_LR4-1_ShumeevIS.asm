format pe64 efi
entry main

section '.text' code executable readable
main:
	mov [SystemTable], rdx

	mov	rcx, [rdx + 64]

	sub	rsp, 8 + (4 * 8)
	
	call qword[rcx + 48] ; ClearScreen

	mov rdx, [SystemTable]
	mov rcx, [rdx + 64]
    mov rdx, 0
    mov r8, 21
	call qword[rcx + 56] ; SetCursorPosition
	
	mov rdx, [SystemTable]
	mov rcx, [rdx + 64]
	mov rdx, 4
	call qword[rcx + 40] ; SetAttribute

	mov rdx, [SystemTable]
	mov rcx, [rdx + 64]
	mov rdx, NameString
	call qword[rcx + 8] ; OutputString

	mov rdx, [SystemTable]
    mov rcx, [rdx + 64]
    mov rdx, 111b
    call qword[rcx + 40] ; SetAttribute

	add	rsp, 8 + (4 * 8)	
	
	mov rax, 0x0
	ret

section '.data' data readable writeable

	SystemTable dq 0x0
	NameString du 'Shumeev Ilja', 13, 10, 0
