;Author:Peter Adamson
;This code will swap the first integer in an array of integers with the largest value in that array of integers

ENTRY
START
	MOV	R0,#0		;initializes a counter
	LDR	R1,=LIST	;stores the memory address of LIST in R1
	LDR	R2,[R1,R0]	;stores the first value of LIST in R2
	CMP	R2,#0	        ;compares the value in R2 with 0
	BEQ	END     	;if the first value in LIST is 0, end the program since no operation is needed
	ADD	R0,R0,#4	;increments the counter
	LDR	R3,[R1,R0]	;stores the second value of LIST in R2
	CMP	R3,#0	        ;compares the value in R3 with 0
	BEQ	END     	;if the value in R3 is 0, end the program since there is only one value in the array, meaning there is nothing to swap
	CMP	R2,R3   	;compares R2 and R3
	MOVGT	R4,R2	        ;if R2 is greater than R3, store R2 in R4
	MOVLT	R4,R3	        ;if R2 is less than R3, store R3 in R4.  R4 now contains the temporary largest value
L1	ADD	R0,R0,#4	;increments the counter
	LDR	R3,[R1,R0]      ;stores the ith element in LIST in R3
	CMP	R3,#0	        ;compares the value in R3 with 0
	BEQ	NEXT1	        ;if the value in R3 is 0, end the loop
	CMP	R3,R4	        ;compares R3 with R4
	MOVGT	R4,R3	        ;if R3 is greater than R4, store R3 in R4.  R4 contains the largest value
	MOVGT	R5,R0		;keeps track of the value of the counter whenever it encounters a new largest value
	B	L1	        ;loop back to L1
NEXT1   STR	R4,[R1]	        ;R4 contains the largest value, so store it at the first element of LIST 
	STR	R2,[R1,R5]	;R2 contains the original first value in LIST, so store it at the location where the largest number was found
END
STOP	B	STOP
LIST	DCD	5,0
