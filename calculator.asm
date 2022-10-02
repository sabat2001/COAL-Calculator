include emu8086.inc
 

org 100h


.data

msg0 db "--------------------------------------------------",10, 13,
     db "-------------Welcome to ASM Calculator!-----------",10, 13,
     db "----Calculations Only Work on Integer Values!-----",10, 13,
     db "--------------------------------------------------$"
msg1 db "Choose Operations:",10, 13,
     db "1. Addition",10, 13,
     db "2. Subtraction",10, 13,
     db "3. Multiplication",10, 13,
     db "4. Division",10, 13,
     db "5. Square",10, 13,
     db "6. Cube$"
     
msg2 db "Enter 1st Number: $"
msg21 db "Enter Number: $" 
msg3 db "Enter 2nd Number: $" 

msg4 db "Enter the Operator: $"

msg5 db "The Answer is: $"
msg51 db "The Approximate Answer is: $"

msg6 db "Thank You for Using ASM Calculator." ,10, 13,
     db "Press any key to Exit.$"
msgdd db "Enter Dividend: $ "
msgdv db "Enter Divisor: $ "

num1 dw ?
num2 dw ?

err db  "Invalid Input.$"



.code

lea dx, msg0
mov ah, 09h    
int 21h
        
printn
printn        
 
lea dx, msg1
mov ah, 09h    
int 21h

printn
printn 

call scan_num


cmp cx, 0      
je exit  
                
cmp cx, 1
je plus

cmp cx, 2
je subt

cmp cx, 3
je mult

cmp cx, 4
je divi

cmp cx, 5
je sqr

cmp cx, 6
je cube


exit:
lea dx, msg6
mov ah, 09h
int 21h  

mov ah, 0
int 16h


ret  



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

plus:

lea dx, msg2
mov ah, 09h    
int 21h

call scan_num

mov num1, cx       

printn
printn  
  
lea dx, msg3
mov ah, 09h     
int 21h 

call scan_num

mov ax, num1
add ax, cx

mov num2, ax

printn
printn

lea dx, msg5
mov ah, 09h    
int 21h 

mov ax, num2

call print_num_uns
 
printn
printn

jmp exit



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

subt:

lea dx, msg2
mov ah, 09h    
int 21h

call scan_num

mov num1, cx       

printn
printn  
  
lea dx, msg3
mov ah, 09h     
int 21h 

call scan_num

mov ax, num1
sub ax, cx

mov num2, ax

printn
printn

lea dx, msg5
mov ah, 09h    
int 21h 

mov ax, num2

call print_num_uns
 
printn
printn

jmp exit



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mult:

lea dx, msg2
mov ah, 09h    
int 21h

call scan_num

mov num1, cx       

printn
printn  
  
lea dx, msg3
mov ah, 09h     
int 21h 

call scan_num

mov ax, num1
mul cx

mov num2, ax

printn
printn

lea dx, msg5
mov ah, 09h    
int 21h 

mov ax, num2

call print_num_uns
 
printn
printn

jmp exit



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

divi:
lea dx, msgdd
mov ah, 09h    
int 21h

call scan_num       

mov num1, cx       

printn
printn  
  
lea dx, msgdv
mov ah, 09h     
int 21h

mov dx, 0 

call scan_num

mov num2, cx
mov ax, num1
div num2

mov num2, ax

printn
printn
 
lea dx, msg51
mov ah, 09h    
int 21h 

mov ax, num2

call print_num_uns
 
printn
printn

jmp exit 


    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   

sqr:         

lea dx, msg21
mov ah, 09h    
int 21h

call scan_num

mov num1, cx
mov ax, num1
mul num1
mov num2, ax    

printn
printn

lea dx, msg5
mov ah, 09h    
int 21h 

mov ax, num2

call print_num_uns
 
printn
printn

jmp exit

     
     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   

cube:         

lea dx, msg21
mov ah, 09h    
int 21h

call scan_num

mov num1, cx
mov ax, num1
mul num1
mul num1
mov num2, ax    

printn
printn

lea dx, msg5
mov ah, 09h    
int 21h 

mov ax, num2

call print_num_uns

printn
printn  

jmp exit



DEFINE_SCAN_NUM   
DEFINE_PRINT_NUM_UNS
