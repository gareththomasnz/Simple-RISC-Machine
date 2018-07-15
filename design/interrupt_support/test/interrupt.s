MOV R6, SW_BASE 
LDR R6, [R6] // load base address of switches
MOV R5, LEDR_BASE
LDR R5, [R5] // load base address of leds
MOV R4, counter
LDR R4, [R4] // load counter in memory
MOV R0, #0
STR R0, [R4] // initialize counter to 0
main:
MOV R3, #15
LDR R0, [R6] // load switch value
AND R0, R0, R3 // get lower 4 bits
LDR R1, [R4] // load counter value
AND R1, R1, R3 // get lower 4 bits
MOV R3, #0
ADD R1, R3, R1, LSL#1
ADD R1, R3, R1, LSL#1
ADD R1, R3, R1, LSL#1
ADD R1, R3, R1, LSL#1 // shift counter value left by 4 bits
ADD R0, R0, R1 // combine switch value and counter value 
STR R0, [R5] // store to leds
B main
isr:
LDR R0, [R6] // load switch value
LDR R1, [R4] // load counter value
ADD R0, R0, R1 // add switch value and counter value
STR R0, [R4] // update counter
B main
SW_BASE:
.word 0x0140
LEDR_BASE:
.word 0x0100
counter:
.word 0xFF






