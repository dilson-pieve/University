            absentry    inic
ram         equ         $1000
rom         equ         $4000
nb          equ         8
vrst        equ         $fffe
;----    10ms * 4Mhz = NC   0.010  = 40.000          
stkf        equ         $3fff
tstk        equ         4 * nb
stki        equ         stkf - tstk + 1
;----
            org         stki
stk         ds.b        tstk
;----
            org         ram
v1          ds.b        1
v2          ds.b        1
res         ds.b        1
;----
            org         rom
inic        lds         #stkf + 1
volta       ldaa        v1
            suba        v2
            beq         tempo
            bgt         pk1
            nega
pk1         dbne        a, pk1
            bra         volta
;-----
tempo       bsr         gasta
            bra         volta
;------       
gasta       pshc
            pshd
            ldd         #40000
continua    dbne        d, continua
            puld
            pulc
            rts
;----
            org         vrst
rst_        dc.w        inic
            end


