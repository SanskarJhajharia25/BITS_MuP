; Program to find the negative numbers from a list of numbers and covert each of them to positive number by repalcing the MSB by '1'
; 1) We begin by declaring the model details and in the data stack, we store the Array of values as ARRAY of type Double word
; 2) Now in the code part, we first load the ARRAY location in SI, the count of negatives in DX (initialised as 00), number of comparisons to be made is stored in BP. The CL register holds the number 4 for shifts.
; 3) We move the contents of the array one by one into the EAX register from the SI. The SI is incremented by 4 at the same time
; 4) Now we check if the number in EAX is positive or not. A positive number will be greater than 0H while a negative will be less than 0H. If the number is less than 0, that is negative, continue, or else we skip to step 6.
; 5) This step is reached in case of a negative number.
; a) Increment the value in DX
; b) Temporarily we store the value in EAX to EBX
; c) We manipulate the EBX as such that the MSB nibble is completely masked by 0. This is achieved by left and right shift
; d) Next we adjust EBX as such that its higher nibble stores 1
; e) We then copy the value in EBX to EBX
; 6) We now shift the contents from the EAX register to the desired memory location using the DI offset. The DI is then incremented by 4 to point to the next position
; 7) Decrement the BP register as it holds number of iterations. Finally check if BP is zero. If BP is zero, program ends. Else we go to step 4.

.model tiny
.386
.data
ARRAY dd 45678902h, 78076788h, 9008123ah, 345678abh, 0d2345678h, 54337641h, 0b2b1c3d4h, 28346532h, 92345677h, 718293a4h
.code
.startup
lea si, ARRAY
mov dx, 00h
mov di,0400h
mov cl,04h
mov bp,0Ah
X2: mov eax,[si]
add si,04
cmp eax,00h
JGE X1
inc dx
mov ebx,eax
shl ebx,cl
shr ebx,cl
add ebx,10000000h
and eax,ebx
or eax,ebx
X1: mov [di],eax
add di,04
dec bp
jnz X2
.exit
end
