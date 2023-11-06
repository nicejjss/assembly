INCLUDE lib1.asm
.MODEL small
.DATA
M1      db 13,10,'         CHUC NANG TINH TRUNG BINH 2 SO NGUYEN'
        db 13,10,'         ------------------oOo----------------'
        db 13,10,13,10,'     Hay vao so thu 1: $'
M2      db 13,10,'     Hay vao so thu 2: $'
M3      db 13,10,'     Trung binh cong 2 so nguyen la : $'
dautru  db '-$'
M4      db '.5$'
M5      db 13,10,'     Co tiep tuc CT (c/k)? $'
buffvs   db 30
         db ?
dir_name db 30 dup(?)
.CODE
PUBLIC @trungbinhcong$qv
@trungbinhcong$qv PROC
    PS:
        clrscr                  ; Xoa mn hinh
        HienString M1           ; Hien thong bao M1
        call  VAO_SO_N          ; Vao so nguyen thu 1
        mov   bx,ax             ; BX=so nguyen thu 1
        HienString M2           ; Hien thong bao M2
        call  VAO_SO_N          ; Vao so nguyen thu 2
        HienString M3           ; Hien thong bao M3
        add   ax,bx             ; AX=tong 2 so nguyen
        and   ax,ax             ; Xet dau tong 2 so
        jns   L1                ; Neu tong la duong thi nhay,
        HienString dautru       ; con am thi hien dau '-'
        neg   ax                ; Doi dau tong (AX chua so duong)
    L1:
        shr   ax,1              ; Chia doi tong lam tron duoi
        pushf                   ; Cat thanh ghi co -> stack (cat trang thai bit co CF)
        call  HIEN_SO_N         ; Hien trung binh cong lam tron duoi
        popf                    ; Hoi phuc thanh ghi co (hoi phuc trang thai CF)
        jnc   L2                ; Neu CF=0 thi nhay den L2,
        HienString M4           ; con CF#0 thi hien them '.5'
    L2:
        HienString M5           ; Hien thong baos M5
        mov   ah,1              ; Cho nhan 1 ky tu tu ban phim
        int   21h
        cmp   al,'c'            ; Ky tu vao la 'c'
        jne   Exit              ; Khong phai thi nhay den Exit,
        jmp   PS                ; con dung la 'c' thi tro ve PS
   Exit:
	 ret
@trungbinhcong$qv ENDP
INCLUDE lib22.asm
END
