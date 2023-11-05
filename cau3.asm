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
          HienString tieptuc	
	mov  ah,1		
	int     21h
	cmp  al,'c'		
	jne    Exit		
	jmp   L_DTT0
   Exit:
	 ret
@FPU$qv ENDP
END
