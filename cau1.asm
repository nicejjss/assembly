INCLUDE lib1.asm
.MODEL small
.DATA
dtt1  db 13,10,'        CHUC NANG DAT THUOC TINH CHO TEP'
      db 13,10,'        --------------oOo---------------'
      db 13,10,13,10,'     Hay vao ten tep can dat thuoc tinh: $'
dtt2  db 13,10,'     Vao thuoc tinh cho tep: '
        db 13,10,'          0. Khong dat thuoc tinh'
        db 13,10,'          1. Read Only'
        db 13,10,'          2. Hidden'
        db 13,10,'          3. Read Only+Hidden'
        db 13,10,'          4. System'
        db 13,10,'          5. Read Only+System'
        db 13,10,'          6. Hidden+System'
        db 13,10,'          7. Read Only+Hidden+System'
        db 13,10,'          8. Archive'
        db 13,10,'          9. Archive+Read Only'
        db 13,10,'         10. Archive+Hidden'
        db 13,10,'         11. Archive+Read Only+Hidden'
        db 13,10,'         12. Archive+System'
        db 13,10,'         13. Archive+Read Only+System'
        db 13,10,'         14. Archive+Hidden+System'
        db 13,10,'         15. Archive+Read Only+Hidden+System'
        db 13,10,13,10,'        -> Hay chon: $'
  Err_DTT db 13,10,'     Khong dat duoc thuoc tinh cho tep! $'
  Suc_DTT db 13,10,'     Tep da dat duoc thuoc tinh! $'
  buff          db 30
                db ?
  file_name db 30 dup(?)
  tieptuc      db 13,10,'     Co tiep tuc CT (c/k) ? $'
.CODE
PUBLIC @setthuoctinh$qv
@setthuoctinh$qv PROC
   L_DTT0:
           clrscr                 ; Xoa man hinh
           HienString dtt1        ; Hien thong bao dtt1
           lea    dx,buff
           call   GET_FILE_NAME   ; Vao ten tep can dat thuoc tinh 
           HienString dtt2        ; Hien thong bao dtt2
           call   VAO_SO_N        ; Vao thuoc tinh
           mov    cx,ax           ; Dua thuoc tinh - > CX
           cmp    cx,8            ; Lieu thuoc tinh tu 0 den 7 hay tren?
           jb     L_DTT1          ; Thuoc tinh vao duoi 8 thi nhay den L_DTT1,
           add    cx,24           ; con thuoc tinh vao tu 8 tro len thi xac lap TT la CX+4
   L_DTT1: 
           lea    dx,file_name    ; DX tro den dau xau ten tep
           mov    al,1            ; Dat thuoc tinh
           mov    ah,43h          ; Chuc nang dat thuoc tinh cho tep
           int    21h
           jnc    L_DTT2          ; CF=0 ... Dat thuoc tinh thnh cong thi nhay,
           HienString Err_DTT     ; con CF=1 ... Thong bao loi
           jmp    Exit_DTT
   L_DTT2:
           HienString Suc_DTT     ; Hien thong bao dat thuoc tinh thanh cong
  Exit_DTT:
           HienString tieptuc     ; Hien thong bao tiep tuc 
           mov    ah,1            ; Cho nhan 1 ky tu tu ban phim       
           int    21h                         
           cmp    al,'c'          ; Lieu ky tu nhan la 'c'?      
           jne    Thoat_DTT       ; Khong phai la 'c' thi nhay ve Thoat_DTT,
           jmp    L_DTT0          ; con la 'c' thi tro ve L_DTT0
  Thoat_DTT:                     
           ret
@setthuoctinh$qv ENDP
INCLUDE lib2.asm		
INCLUDE lib4.asm		
END
