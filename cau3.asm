INCLUDE lib1.asm
.MODEL small
.DATA
 m1 db 13,10,'        CHUC NANG THONG TIN VE FPU'
    db 13,10,'        ------------oOo-----------'
    db 13,10,13,10,'     May tinh co FPU khong?: $'
 co  db 'Co$'
 ko  db 'Khong$'
 tieptuc db 13,10,'     An phim bat ky de ve man hinh chuc nang $'
.CODE
PUBLIC @FPU$qv
@FPU$qv PROC
    L_DTT0:
        clrscr                  ; Xoa man hinh
        HienString m1           ; Hien thong bao m1
        int 11h                 ; 0:410h -> AL va 0:411h -> AH
        shr al,2                ; Dich phai 2 lan (dua trang thai FPU -> CF)
        jc  L_DTT1              ; Neu CF=1 (Co FPU) thi nhay,
        HienString ko           ; con CF=0 thi Hien ko
    L_DTT1:                                    
        HienString co           ; Hien co
    L_DTT2:
        HienString tieptuc 
	mov  ah,1		
        int  21h
   Exit:
        ret
@FPU$qv ENDP
END
