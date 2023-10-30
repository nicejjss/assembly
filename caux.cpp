#include <stdio.h>
#include <iostream.h>
#include <conio.h>
extern setthuoctinh();
extern trungbinhcong();
extern FPU();
void main()
{
      char tl;
      int cn; /*chuc nang*/
      clrscr();
      cout<<"\n          Truong Dai hoc Mo Ha Noi";
      cout<<"\n          KHOA CONG NGHE THONG TIN";
      cout<<"\n          -----------o0o----------";
      cout<<"\n\n\n           BAI TAP LON MON LTHT";
      cout<<"\n\n\n     Cac SV thuc hien:";
      cout<<"\n      1. Dao Duc Loc       Lop: 2010A02";
      cout<<"\n      2. Le Trong Thang    Lop: 2010A02";
      cout<<"\n      3. Le Thi Thao       Lop: 2010A02";
      cout<<"\n      4. Do Thanh Hai      Lop: 2010A04";
      cout<<"\n\n\n     Co tiep tuc CT (c/k)?";
      tl=getch();
      if(tl=='c') {
      L1:
            cout<<"\n            CAC CHUC NANG CUA BTL";
            cout<<"\n            ---------***----------";
            cout<<"\n\n     1. Dat thuoc tinh cho tep";
            cout<<"\n     2. Tinh trung binh cong 2 so nguyen";
            cout<<"\n     3. Lieu may tinh co FPU?";
            cout<<"\n     4. Thoat khoi chuong trinh";
            cout<<"\n\n     Hay chon: ";
            cin>>cn;
            switch(cn) {
                  case 1:  cout<<"\n Cau 1:"; setthuoctinh(); break;
                  case 2:  cout<<"\n Cau 2:"; trungbinhcong();break;
                  case 3:  cout<<"\n Cau 3:"; FPU(); break;
                  case 4:  cout<<"\n     Bye!"; break;
                  default: cout<<"\n     Vao sai roi!";
            }
      if(cn != 4){
            goto L1;
      }
      }
}
