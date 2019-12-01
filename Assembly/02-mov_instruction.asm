          absentry  inic
ram       equ       $1000
rom       equ       $4000
nb        equ       8
vrst      equ       $fffe
;----
          org       ram
v1        ds.b      4 * nb          ; v1 => vimp/vpar
;--
          org       ram + 5 * nb
vpar      ds.b      2 * nb
vimp      ds.b      2 * nb    
;-------------------------------
          org       rom
inic      ldx       #v1   ;x vetor
          ldy       #vimp ;y impares
pk0       movb      1, x+, 0, y  ;impares  
          movb      1, x+, vpar-vimp, y ;pares
          iny
          cpx       #v1 + 4 * nb
          bne       pk0
          bra       inic
;----
          org       vrst
rst_      dc.w      inic
          end