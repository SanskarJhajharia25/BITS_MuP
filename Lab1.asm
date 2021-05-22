;FInding the smallest number from a set of defined numbers
;We begin with declaring the model tiny
;Then the 10 values are stored in an array of double word type. Next we start with the code and startup segment. As the final result has to be stored in a location of offset 0200H, that is stored in SI. The register BX is used to hold the array positions. The Count register CL stores the number of comparisons, that is 10. Firstly, the EAX is loaded with the first number itself. CL is decremented and BX is incremented by 4 at the same time. Next a loop is run multiple times each time comparing the EAX value with the next number. If EAX turns out to be lesser we directly increment the BX value by 4, decrement CL and repeat the same. If the EAX was not lesser than BX, we change the value at EAX. Then this runs as long CL doesn’t turn 0.This is checked using the JNZ command. Finally the EAX value is copies to offset specified in SI 


.model tiny
.386
.data
ARRAY dd 45678902h, 78076788h, 9008123ah, 345678abh, 12345678h, 54337641h, 0a2b1c3d4h, 28346532h,
12345677h, 718293a4h
.code
.startup
MOV SI,0200H
LEA BX, ARRAY
MOV DX,0200H
MOV CL, 0Ah
MOV EAX, [BX]
DEC CL
ADD BX, 4
X2: CMP EAX, [BX]
JBE X1
MOV EAX, [BX]
X1: ADD BX, 4
DEC CL
JNZ X2
mov [SI],eax
.exit
end

