; Input a file and read word and find frequency if each character
;Step 1: In the MASM data directive specify the file name and the other details first.
;Step 2: An array is made in the directive that holds frequency
;Step 3: in the code segment we take the file opening algo first.
;Step 4: The code then proceeds to the counter function
;Step 5: In the couter function we find the frequency of each alphabet. Using the between feature.
;Step 6: The offset os adjusted accordingly and updated
;Step 7: Next we move to the output generator
;Step 8: The output generator traverses over the array and for the ones that have some values otherthan 0, we output the corresponding number of asterisk
;Step 9: Close the file finaly.

.model tiny
.386
.data
fname db 'testfile.txt', 0
readdata db 100 dup (?)
alpha db 26 dup(0)
fhandler dw ?
.code
.startup
lea dx, fname
mov ah, 3dh
mov al, 0
int 21h
jc endmk
mov fhandler, ax
lea dx, readdata
mov bx, fhandler
mov cx, 100
mov ah, 3fh
int 21h
jc endmk
mov cx, ax
mov si, offset readdata
mov di, offset alpha
calp: call countalpha
inc si
loop calp
lea di, alpha
mov cx, 26
oalp: call outalpha

loop oalp
mov bx, fhandler
mov ah, 3eh
int 21h ; closing file
endmk:
.exit

countalpha proc near uses cx
mov bl, [si]
cmp bl, 61h
jb retpo
cmp bl, 7ah
ja retpo
sub bl, 61h
mov bh, 00h
inc byte ptr[di + bx]
retpo: ret
countalpha endp

outalpha proc near uses cx
mov bx, 26
sub bx, cx
mov cl, [di+bx]
mov ch, 00h
sub cl, 00h
jz endpo
mov dl, 0dh
mov ah, 02h
int 21h
mov dl, 0ah
int 21h ; newline for each histogram

mov dl, bl
add dl, 61h
mov ah, 02h
int 21h
mov dl, '*'
star: int 21h
loop star
endpo: ret
outalpha endp
end
