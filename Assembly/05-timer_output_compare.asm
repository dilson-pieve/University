            absentry    inic
ram         equ         $1000
rom         equ         $4000
nb          equ         8
vrst        equ         $fffe
;---
stkf        equ         $3fff
tstk        equ         3 * nb
stki        equ         stkf - tstk + 1
;---
tios        equ         $40           ;confg. ptT output/input
tscr1       equ         $46           ;start counter
tscr2       equ         $4d           ;divide freq
tc4         equ         $58           ;2bytes compare
tctl1       equ         $48           ;confg. toggle
tflg1       equ         $4e           ;flag = 1 <=> counter = PC
;---
ptt         equ         $240          ;ptT    
ptit        equ         $241
ddrt        equ         $242
;---
t300u       equ         300           ;up
t700u       equ         700           ;down

            org         stki
stack       ds.b        tstk

            org         rom
inic        lds         #stkf + 1
            bset        ddrt, $10     ;output
            bclr        ptt, $10      ;start = 0
            bset        tscr2, $02    ; div F / 4
            bclr        tscr2, $05
            bset        tios, $10     ;4 = output
            bset        tctl1, $01    ;toggle = 01
            bclr        tctl1, $02
            movw        #$80, tc4     ;start = 80 compare
            bset        tscr1, $80
;---
pk1         brclr       tflg1, $10, pk1 ; loop untill tflg1 = 1 (sucess compare)
            ldd         tc4
            addd        #t300u
            std         tc4
            ldaa        #$10            ; prepare nxt compare        
            staa        tflg1

;---
pk2         brclr       tflg1, $10, pk2
            ldd         tc4
            addd        #700u
            std         tc4
            ldaa        #$10
            staa        tflg1
            jmp         pk1
                                         ;start again
;---
            org         vrst
rst_        dc.w        inic
            end