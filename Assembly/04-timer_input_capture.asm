;measure the period of an unknown signal
;period shorter than 128ms
;CPU = 4MHz
            absentry    inic
;---
ram         equ         $1000
rom         equ         $4000
nb          equ         8
vrst        equ         $fffe
;---
stkf        equ         $3fff
tstk        equ         4 * nb
stki        equ         stkf - tstk + 1
;---
tios        equ         $40         ;input capture
tc0         equ         $50         ;value
tscr1       equ         $46         ;start timer
tscr2       equ         $4d         ;ajust freq
tctl4       equ         $4b         ;rising edge
tflg1       equ         $4e         ;it's ok
;---------------------------------------
            org         stki
stk         ds.b        tstk
;---     
            org         ram
iper        ds.b        2
fper        ds.b        2
peri        ds.b        2
;---
            org         rom
inic        lds         #stkf + 1
            bclr        tios,$01
            movb        #30,tc0
            ;---
            bset        tctl4,$01
            bclr        tctl4,$02   ;rising                       
            ;---
            bset        tscr2,$04   ;/16
            bclr        tscr2,$03
            bset        tscr1,$80   ;start
            ;---
pk1         brclr       tflg1,$01,pk1 ;wait
            bsr         zerar         ;ajust
            ldd         tc0           ;get value
            std         iper
pk2         brclr       tflg1,$01,pk2 ;wait
            bsr         zerar         ;ajust
            ldd         tc0           ;get value
            std         fper
            subd        iper
            std         peri          ;period = final - begin
            jmp         inic
;----
zerar       movb        #$01,tflg1    ;zero is set to 1
            rts
;----------------------------------------
            org         vrst
rst_        dc.w        inic
            end

