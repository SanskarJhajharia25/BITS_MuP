; FILE OPERATION
;Step 1: We create a file using the MASM directives. Then we open it. Then we write the name and IDin it using separate lines. The Data for the same is stored in the data directive.
;Step 2: We then close this file
;Step 3: We reopen this file using the similar set of commands
;Step 4: Next we move the file pointer to the end of the file
;Step 5: To the end of the file we append the hostel name and the room number
;Step 6: Close this file next
;Step 7: Reopen this file. This time for re reading it.
;Step 8: We start re reading the file. However this time it aims at simply reading it one byte at a time.
;Step 9: A counter is maintained for the number of bytes in the list
;Step 10: After the end of the one byte read, we transfer some marker into it.
;Step 11: Then the data is outputted on the screen.
;Step 12: The same data is also stored at DS:0650 and the cunt in the cx register
;Step 13: End of program

.model tiny
.486
.data
Data1 db 'Name: Sanskar Jhajharia', 0Dh, 0Ah,'ID No.: 2019A7PS0148P',0Dh,0Ah
Count equ 48
NumWr1 dw ?
Handle dw ?
File db 'Task2.txt', 0
Data11 db 'Hostel: SR', 0Dh, 0Ah, 'Room No.: 223', 0Dh, 0Ah
NumWr11 dw ?
Count1 equ 27
Handle1 dw ?
Data12 db 150 dup(?), 24h
Count2 equ 1
Handle2 dw ?
.code

.startup
mov ah, 3Ch ;Creating a file
lea dx, File
mov cl, 01h
int 21h
mov Handle, ax
mov ah, 3Dh ;Opening a file
mov al, 02
lea dx, File
int 21h
mov Handle, ax
mov ah,40h ;Writing to a file
mov bx, Handle
mov cx, Count
lea dx, Data1
int 21h
mov NumWr1, ax
mov ah, 3Eh ;Closing a file
mov bx, Handle
int 21h

mov ah, 3Dh ;Opening a file
mov al, 02
lea dx, File
int 21h
mov Handle1, ax
mov ah,42h ;Moving the file pointer to the end of the file
mov al, 02h
mov bx, Handle1
mov cx, 0000h
mov dx, 0000h

int 21h
mov ah,40h ;Writing to a file
mov bx, Handle1
mov cx, Count1
lea dx, Data11
int 21h
mov NumWr11, ax
mov ah, 3Eh ;Closing a file
mov bx, Handle1
int 21h
mov bp,00h
mov ah, 3Dh ;Opening a file
mov al, 02
lea dx, File
int 21h
mov Handle2, ax
lea di, Data12 ;Reading from a file one byte at a time
x1: mov ah, 3Fh
inc bp
mov bx, Handle2
mov cx, Count2
mov dx, di
int 21h
inc di
cmp ax, 0000h

jne x1
mov byte ptr[di],0Dh;To place '$' after the transfer
inc di
mov byte ptr[di],0Ah
inc di

mov byte ptr[di],24h
lea dx, Data12 ;Output to Display
mov ah, 09h
int 21h
mov ah, 3Eh ;Closing a file
mov bx, Handle2
int 21h
mov cx, bp;
.exit
end
