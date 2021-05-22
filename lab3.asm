; Swap the characters of all words between two spaces "He is    mine new friend    say hi" becomes "He is      enim wen dneirf    say hi"
;STEP 1: Declare the Model TINY and that we are using a x486 type device
;STEP 2: The DATA segment is defined. The STR! Holds the number of strings. The DAT1 holds the 10 strings that will be used.
;STEP 3: Begin with the code and the startup
;STEP 4: Move the dat1 offset into DI and the number of strings in CX. We also load the EAX register with the string ‘    ‘ (four timers spaces)
;STEP 5: We compare the strings one by one with EAX. This is achieved using the SCASD command. This repeats till we find first occurrence of ‘    ‘. If found the occurrence go to next step
;STEP 6: We copy DI into SI.
;STEP 7: We load the value of the next string into EAX register. If this string is not equal to ‘    ‘ we continue to step 8. Else jump out of the code.
;STEP 8: Using bswap command, the string is reversed and stored back in EAX. Next we use the STOSD command to write it back to the array. Jump back to step 7.

.MODEL TINY
.486
.DATA
str1 db 10
dat1 db 'math','have','    ','bury','mine','dine','    ','hell','deep','tree'

.code
.startup
	lea di,dat1
	mov cl,str1
	mov ch,00
	mov eax,'    '
repne 	scasd
	mov si,di
x1: 	lodsd
	cmp eax, '    '
	jz x2
	bswap eax
	stosd
	loop x1
x2:
.exit
end
