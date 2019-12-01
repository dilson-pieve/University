;portB muda com interrupção  [3:0] [7:4]
;timer in/out compare
            absentry    inic
ram         equ         $1000
rom         equ         $4000
nb          equ         8
vrst        equ         $fffe
vtimer      equ         $ffee
;---
stkf        equ         $3fff
tstk        equ         4 * nb
stki        equ         stkf - stki + 1
;---
tios        equ         $40            
tc0         equ         $50
tscr1       equ         $46
tscr2       equ         $4D              
tflg1       equ         $4E
tie         equ         $4C
;----
portb       equ         $1
ddrb        equ         $3
;---------------------------
            org         stki
stk         ds.b        tstk
;----
            org         ram
val         dc.b        $0F
;----
            org         rom
inic        sei
            ;---
            lds         #stkf + 1
            movb        #$80,tflg1
            ;---
            movb        #$FF, ddrb
            movb        #$00, portb
            ;---
            movw        #$80,tc0
            bset        tios,$01
            bset        tscr2,$03
            bset        tie,$01
            bset        tscr1,$80
            ;---
            cli
            ;---
pk1         wai
            ldaa        val
            coma        
            staa        val
            staa        portb
            bra         pk1
;-----
timer_inter movb        #$80, tflg1
            ldd         tc0
            addd        #$4000
            std         tc0
            rti            
;------------------------------------
            org         vrst
rst_        dc.w        inic
            ;----
            org         vtimer
timer_      dc.w        timer_inter
            end
