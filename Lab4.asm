; You have a prestored ID and Password. Ask the user for the ID and password, if it matches, allow access or else exit code

;Step 1: We begin by declaring the assembly directive data in the top. It has strings like “Enter User Name”, “Hello”, etc. It also stores the default ID and password of the account. (In our case, ID is“2019A7PS0148P” and Password is “SR223”
;Step 2: We first print onto the screen the line “Enter user name” using the suitable interrupt
;Step 3: Now the input is taken from the user character by character using the ah,01h interrupt type. This is consequently being stored in the AX register using stosb command.
;Step 4: Using a CMPSB command, we compare each character of the string with the actual username stored in memory. If they are same, go to step 5 or else exit of the program (that is jump to step 8).
;Step 5: Now the password is entered on the screen in the same way as we did for the password. For this we again use the ah,01h type command. This is also stored using the stosb command.
;Step 6: Using the CMPSB command, we compare this password entered by the user with the actual password stored in the memory at the str2 location. If the password entered matches, move to Step 7 or else immediately exit from the code (that is jump to step 8)
;Step 7: Using the int 21h code alongside ah,09h code, we print the line “Hello Username”
;Step 8: End of code.

.model tiny
.data
dis1 db "Enter user name", 0ah,0dh,'$'
dis2 db 0ah,0dh,"Enter Password", 0ah,0dh, '$'
dis4 db 0ah,0dh,"hello "
dat3 db 14 dup('$')
dat31 db 10 dup('$')
str1 db "2019A7PS0148P"
str2 db "SR223"
dis3 db '*'
dat4 db 0ah, 0dh, '$'

.code
.startup
lea dx,dis1
mov ah,09h
int 21h ; This is for printing Enter the Username line
cld
lea di,dat3
mov cx,13
x1: mov ah,01h
int 21h
stosb
loop x1

mov cx,0dh
lea si,dat3
lea di,str1
repe cmpsb
cmp cx,00
jnz xn
lea dx,dis2
mov ah,09h
int 21h
lea di,dat31
mov cx,05
x2: mov ah,08h
int 21h
stosb
mov dl,dis3
mov ah,02h
int 21h
loop x2
lea si,dat31
lea di,str2
mov cx,5
repe cmpsb
cmp cx,00
jne xn
lea dx,dis4
mov ah,09h
int 21h
xn:
.exit
end
