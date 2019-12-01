            absentry    inic
ram         equ         $1000
rom         equ         $4000
nb          equ         8
vrst        equ         $fffe
;---
stkf        equ         $3fff
tstk        equ         4 * nb
stki        equ         stkf - tstk + 1
;---
atd0ctl2    equ         $82
atd0ctl3    equ         $83
atd0ctl4    equ         $84
atd0ctl5    equ         $85
;---
atd0stat0   equ         $86
;---
atd0dr0h    equ         $90
atd0dr1h    equ         $92
atd0dr2h    equ         $94
atd0dr3h    equ         $96
;---
            org         stki
stk         ds.b        tstk
;---
            org         ram
v1          ds.b        1
v2          ds.b        1
v3          ds.b        1
v4          ds.b        1
;------------------------------
            org         rom
inic        lds         #stkf + 1
            ;---
            bset        atd0ctl3,$20
            bclr        atd0ctl3,$58
            ;---
            bset        atd0ctl4,$80
            bclr        atd0ctl4,$1F
            ;---
            bclr        atd0ctl5,$85
            bset        atd0ctl5,$02
            ;---
            jsr         ligarAD
            nop
            nop
            ;---
pk0         brclr       atd0stat0,$80,pk0
            ldx         #v1
            ldy         #atd0dr0h
copia       movb        1,x+, 2,y+
            cpx         #v1 + 4
            bne         copia
            ;---
            jsr         desligarAD
            lbra         *
;------
ligarAD     bset        atd0ctl2,$80
            jsr         tempo
            rts
;------
desligarAD  bclr        atd0ctl2,$80
            rts
;------
tempo       pshc
            pshb
            ldab        #$80
pk1         dbne        b,pk1
            pulb
            pulc
            rts
;------------------------------
            org         vrst
rst_        dc.w        inic
            end
         
