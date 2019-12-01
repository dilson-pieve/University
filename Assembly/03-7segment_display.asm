          absentry  inic
ram       equ       $1000
rom       equ       $4000
nb        equ       8
vrst      equ       $fffe
;----
portb     equ       1
ddrb      equ       3         ;saida=1 ou entrada=0
;--
porta     equ       0               
ddra      equ       2              
;----
stkf      equ       $3fff
tstk      equ       4 * nb
stki      equ       stkf - tstk + 1
;---                         
          org       ram
dig       dc.b      $3f,$06,$5b,$4f,$66 ;0,1,2,3,4
          dc.b      $6d,$7c,$07,$7f,$67 ;5,6,7,8,9
          dc.b      $11,$22,$33,$44,$55,$66;a,b,c,d,e,f
;-------------------------------
          org       rom
inic      lds       #stkf + 1
          ;---
          bset      ddrb,$FF
          bclr      portb,$FF
          ;---
          bclr      ddra,$0F
          ;---
          ldx       #dig      ;aponta início digitos (hexadecimal)
pk0       ldaa      porta     ;leio o binário do inter.
          ldab      a, x      
          stab      portb     ;mostra no display 7seg
          bsr       tempo
          bra       pk0
;----
tempo     pshc       ;subrotina gasta um tempinho
          pshd
          ldd       #40000
pk1       dbne      d, pk1
          puld
          pulc
          rts       
;----
          org       vrst
rst_      dc.w      inic
          end