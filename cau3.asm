INCLUDE lib1.asm
.MODEL small
.DATA
    m1 db 13,10,"May tinh co FPU khong?: $"
    co db " Co$"
    ko db " Ko$"
	tieptuc db 13,10,' Co tiep tuc CT (c/k)?: $'
.CODE
PUBLIC @FPU$qv
@FPU$qv PROC
		mov  ax,@data
        mov  ds,ax
    L_DTT0:
        clrscr
        HienString m1
        int 11h
        shr al,2
        jc L_DTT1
        HienString ko
    L_DTT1:
        HienString co
    L_DTT2:
          HienString tieptuc	; Hiện thông báo M5 (‘Co tiep tuc CT (c/k)? ‘)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   L_DTT0		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	 ret
@FPU$qv ENDP
END
