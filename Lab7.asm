; coloured boxes and naming 
.model tiny
.486
.data
CounterRow dw ? ;Counter for rows
counterCol dw ? ;Counter for columns
;black1
RectLen1 equ 150 ;Length of Rectangle
RectWid1 equ 250 ;Width of Rectangle
IniX1 equ 00 ;Initial X Co-ordinate
IniY1 equ 00 ;Initial Y Co-ordinate
;red
RectLen2 equ 146 ;Length of Rectangle
RectWid2 equ 246 ;Width of Rectangle
IniX2 equ 2 ;Initial X Co-ordinate

IniY2 equ 2 ;Initial Y Co-ordinate
;balck2
RectLen3 equ 125 ;Length of Rectangle
RectWid3 equ 210 ;Width of Rectangle
IniX3 equ 12 ;Initial X Co-ordinate
IniY3 equ 20 ;Initial Y Co-ordinate
;green
RectLen4 equ 120 ;Length of Rectangle
RectWid4 equ 206 ;Width of Rectangle
IniX4 equ 14 ;Initial X Co-ordinate
IniY4 equ 22 ;Initial Y Co-ordinate
;black3
RectLen5 equ 100 ;Length of Rectangle
RectWid5 equ 168 ;Width of Rectangle
IniX5 equ 24 ;Initial X Co-ordinate
IniY5 equ 41 ;Initial Y Co-ordinate
;blue
RectLen6 equ 95 ;Length of Rectangle
RectWid6 equ 164 ;Width of Rectangle
IniX6 equ 26 ;Initial X Co-ordinate
IniY6 equ 43 ;Initial Y Co-ordinate
;black4
RectLen7 equ 75 ;Length of Rectangle
RectWid7 equ 126 ;Width of Rectangle
IniX7 equ 36 ;Initial X Co-ordinate
IniY7 equ 62 ;Initial Y Co-ordinate
;magenta
RectLen8 equ 71 ;Length of Rectangle
RectWid8 equ 122 ;Width of Rectangle
IniX8 equ 38 ;Initial X Co-ordinate
IniY8 equ 64 ;Initial Y Co-ordinate

DesVidMode1 db 12h ;Set Display Mode (00h - text mode, 40x25, 16 colours, 8
pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours,
720x400 pixels, 1 page)
DesVidMode2 db 03h ;Set Display Mode (00h - text mode, 40x25, 16 colours, 8
pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours,
720x400 pixels, 1 page)
RowDisp db 00 ;Set Cursor Position
ColumnDisp db 00
PageNumDis db 00
PixelColor1 db 00h ;Fill a Pixel
PixelColor2 db 04h
PixelColor3 db 00h
PixelColor4 db 02h
PixelColor5 db 00h
PixelColor6 db 03h
PixelColor7 db 00h
PixelColor8 db 05H
PixelRow dw ?
PixelColumn dw ?

PageNumDis1 db ?
Character db ? ;Stores the Current Position
RowDisp1 db 20 ;Set Cursor Position 1
ColumnDisp1 db 00
RowDisp3 db 22 ;Set Cursor Position 3
ColumnDisp3 db 00
;AttrDisp1 db 1Eh ;Write Character at Cursor Position 1
AttrDisp1 db 7Ah ;Write Character at Cursor Position 2
.code
.startup

mov ah, 00h ;Set Display Mode
mov al, DesVidMode1
int 10h
mov PixelRow, IniY1 ;To create the outer black block
mov PixelColumn, IniX1
mov CounterRow, RectWid1
x1: mov CounterCol, RectLen1
mov PixelColumn, IniX1
x2: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor1
mov cx, PixelColumn
mov dx, PixelRow
int 10h
inc PixelColumn
dec CounterCol
jnz x2
inc PixelRow
dec CounterRow
jnz x1
mov PixelRow, IniY2 ;To create a red block
mov PixelColumn, IniX2
mov CounterRow, RectWid2
x3: mov CounterCol, RectLen2
mov PixelColumn, IniX2
x4: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor2
mov cx, PixelColumn
mov dx, PixelRow
int 10h
inc PixelColumn
dec CounterCol

jnz x4
inc PixelRow
dec CounterRow
jnz x3
mov PixelRow, IniY3 ;To create the next border black block
mov PixelColumn, IniX3
mov CounterRow, RectWid3
x5: mov CounterCol, RectLen3
mov PixelColumn, IniX3
x6: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor3
mov cx, PixelColumn
mov dx, PixelRow
int 10h
inc PixelColumn
dec CounterCol
jnz x6
inc PixelRow
dec CounterRow
jnz x5
mov PixelRow, IniY4 ;To create a green block
mov PixelColumn, IniX4
mov CounterRow, RectWid4
x7: mov CounterCol, RectLen4
mov PixelColumn, IniX4
x8: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor4
mov cx, PixelColumn
mov dx, PixelRow
int 10h
inc PixelColumn

dec CounterCol
jnz x8
inc PixelRow
dec CounterRow
jnz x7
mov PixelRow, IniY5 ;To create a 3rd Border block
mov PixelColumn, IniX5
mov CounterRow, RectWid5
x9: mov CounterCol, RectLen5
mov PixelColumn, IniX5
x10: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor5
mov cx, PixelColumn
mov dx, PixelRow
int 10h
inc PixelColumn
dec CounterCol
jnz x10
inc PixelRow
dec CounterRow
jnz x9
mov PixelRow, IniY6 ;To create a blue block
mov PixelColumn, IniX6
mov CounterRow, RectWid6
x11: mov CounterCol, RectLen6
mov PixelColumn, IniX6
x12: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor6
mov cx, PixelColumn
mov dx, PixelRow
int 10h

inc PixelColumn
dec CounterCol
jnz x12
inc PixelRow
dec CounterRow
jnz x11
mov PixelRow, IniY7 ;To create a 4th border block
mov PixelColumn, IniX7
mov CounterRow, RectWid7
x13: mov CounterCol, RectLen7
mov PixelColumn, IniX7
x14: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor7
mov cx, PixelColumn
mov dx, PixelRow
int 10h
inc PixelColumn
dec CounterCol
jnz x14
inc PixelRow
dec CounterRow
jnz x13

mov PixelRow, IniY8 ;To create a magenta block
mov PixelColumn, IniX8
mov CounterRow, RectWid8
x18: mov CounterCol, RectLen8
mov PixelColumn, IniX8
x19: mov ah, 0Ch ;Fill a Pixel(Set Pixel)
mov al, PixelColor8
mov cx, PixelColumn

mov dx, PixelRow
int 10h
inc PixelColumn
dec CounterCol
jnz x19
inc PixelRow
dec CounterRow
jnz x18

x22: mov ah, 02h ;Set Cursor Position 3
mov dh, RowDisp3
mov dl, ColumnDisp3
inc ColumnDisp3
mov bh, PageNumDis1
int 10h
mov ah, 01h ;Take Input
int 21h
cmp al, '$'
je x23
mov Character, al
mov ah, 02h ;Set Cursor Position 1
mov dh, RowDisp1
mov dl, ColumnDisp1
inc ColumnDisp1
mov bh, PageNumDis1
int 10h
mov ah, 09h ;Write Character at Cursor Position 1
mov al, Character
mov bh, PageNumDis1
mov bl, AttrDisp1

mov cx, 01
int 10h

jmp x22
x23: mov ah, 00h ;Set Display Mode
mov al, DesVidMode2
int 10h
.exit
end
