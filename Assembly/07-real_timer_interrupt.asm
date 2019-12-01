            absentry    inic
;------------------------------
ram         equ         $1000                               ;padrao           
rom         equ         $4000
nb          equ         8
vrst        equ         $fffe
;------------------------------                             ;reserva stk
stkf        equ         $3fff
tstk        equ         4 * nb 
stki        equ         stkf - tstk + 1
;------------------------------
portb       equ         $3                                  ;ports
ddrb        equ         $1
;------------------------------
crgflg      equ         $37     ;$80                        ;RTI
crgint      equ         $38
rtictl      equ         $3b     ;$28
;------------------------------
            org         stki                                ;config stack
stack       dc.b        tstk
;------------------------------
            org         ram
dig         dc.b        $3f, $06, $5b, $4f, $66             ;dig display
            dc.b        $6d, $7c, $07, $7f, $67
            dc.b        $11, $22, $33, $44, $55, $66 
;------------------------------
            org         rom                                 ;programa
inic        lds         #stkf + 1
            bset        ddrb, $ff
            bclr        portb,$ff
            movb        #$28, rtictl
            bset        crgint, #$80                        
pk0         ldx         #dig     
pk1         brclr       crgflg, $80, pk1
            stx         portb
            jsr         zerar
            cpx         #dig + 17
            lbne        pk1
            lbra        pk0
;----
zerar       pshc
            psha
            ldaa        $80
            staa        crgflg
            inx
            pula
            pulc
            rts
;------------------------------
            org         vrst
rst_        dc.w        inic
            end



   
