include console.inc

COMMENT ~

��������������� ������ 18
������� _________     ������ _______

~
COMMENT~ 
----------------------------------------------------------------------------
��������: ��� ������������ �������� ���������� � �������� ������ � ������
������ ���� ��������� !!!
---------------------------------------------------------------------------- 
������ (����������� 60 �����)
 
������� ������ � ����������:
----------------------------
IsEq  macro List_Elem,L,n
---------------------------- 
����� List_Elem � ������ ���� <E1,E2,�,Ek>,  k >= 0
������� ������ Ei ����� ���� ������ �������� ��������� ��� ���� �������� ������
(�� 32-������� ��������� ���������), ������ �������� ���������� (�������� ����,
�����, ������� ����� ��� ����������� �����). L � �����, n - ����� (�� 32-�������
��������� ���������). �������� L - ������������. ���� �������� n �����������, ��
�� ��������� ������������ ����� 1.

������ ������� ���������� �� ����� L, ���� � ������ List_Elem ���� ���� �� ����
�������, ������ n. 

����������: ������ �� ������ ������������ ������ ������.

������� ���������� ��������� (��� ������������) � ������� ��. � ������ ���� 
������ ���������.
 
~

;----------------------------------------------------------------------------------
; ���������������� (���� �������):
IsEq macro List_Elem, L:req, n:=<1>
local no, a
a = 0
for X, <List_Elem>
    if type X EQ 0
        if X EQ n
            jmp L
            a = 1
            exitm
        endif
    endif
endm
if a EQ 0
for X, <List_Elem>
    if type X NE 0
        if type X EQ 8
            cmp dword ptr X, n
            jNE no
            if n lt 0
                cmp dword ptr X+4,-1
                jE L
            else
                cmp dword ptr X+4,0
                jE L
            endif
        no:
        else
            cmp X, n
            jE L
        endif
    endif
endm
endif
endm
        
        

;----------------------------------------------------------------------------------

.data
T   db  "������ (�-� 18)  ������� 110"
Yes db 'Yes',0
No  db 'No',0
K1  =   -1
K2  =    2
K3  =    1
B1  db  -7
B2  db   3
W1  dw  -5
W2  dw   4
D1  dd  -5
D2  dd   1
Q1  dq   0FFFF0001h
Q2  dq   1

.code

Start:
    ConsoleTitle offset T	
;.listall
.listmacro
; ���  ������������ ���������� ������������ � ���� ���������������� (��. ����):
    IsEq  <-5,D1,K1,K2,1,4>,Go         ; ������� �����
;    IsEq  <>,Go                        ; �������� �� �����
;    IsEq  <3,D1,D2,K1,K2,4,5>,Go,%5-4  ; ������� �����
;    IsEq  <K1,K2,B1,W1,D1,Q1,8>,Go,3-2 ; �������� �� �����
 ;   IsEq  <K1,4,B1,W2,Q2,D1>,Go,K3     ; ������� �����
 ;  IsEq  <1,2,3>                      ; ������, ��� �����
.nolistmacro
    lea EAX,No
    jmp Fin
Go: lea EAX,Yes
Fin:outstrln EAX
    pause						; ����� ��� ����� �� e-mail
    exit						
end Start


 