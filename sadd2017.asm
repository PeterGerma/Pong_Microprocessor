; Saturating addition benchmark
; Works by cumulatively adding values in the "values array"
; After each saturating addition, the result is placed in the "results array"
; Saturating addition done by explicit test: checking V flag, then N flag and 
;    changing any result to $7FFF or $8000
         .ORG   $1000

         LDI   R0,$000D  ; initialize counter
         LDI   R3,$0000  ; initial sum value
         LDI   R1,DATA   ; address of values array
         LDI   R4, SUM   ; address of results array
LOOP     LDR   R2,R1      
         ADD   R3,R2      
         BRV   SAT       ; V because these values are signed
CKEND    STR   R4, R3    ; Store sum in results array
         INCR  R1
         INCR  R4     
         DECR  R0     
         BRN   DONE      ; done with adding?
         BRA   LOOP     
DONE     STOP            ; Yep, done
SAT      BRN   NEGTVE    ; 
         LDI   R3,$8000  ; Put value in range
         BRA   CKEND     ; 
NEGTVE   LDI   R3,$7FFF  ; Put value in range
         BRA   CKEND     ; 
    
         .ORG $2000

DATA     .DW $DEAD
         .DW $BEEF
         .DW $DEAD
         .DW $104E
         .DW $0ECE
         .DW $1BFD
         .DW $44E5
         .DW $0001
         .DW $0001
         .DW $2400
         .DW $5BF0
         .DW $000F
         .DW $FFF2
         .DW $0010
         
SUM      .DW $FF    ; Expect $DEAD
         .DW $FF    ; Expect $9D9C
         .DW $FF    ; Expect $8000
         .DW $FF    ; Expect $904E
         .DW $FF    ; Expect $9F1C
         .DW $FF    ; Expect $BB19
         .DW $FF    ; Expect $FFFE
         .DW $FF    ; Expect $FFFF
         .DW $FF    ; Expect $0000
         .DW $FF    ; Expect $2400
         .DW $FF    ; Expect $7FF0
         .DW $FF    ; Expect $7FFF
         .DW $FF    ; Expect $7FF1
         .DW $FF    ; Expect $7FFF
         .DW $FF    ; Expect no change
         .DW $00
         
         
  
    
