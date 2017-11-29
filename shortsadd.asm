; Saturating addition benchmark
; Works by cumulatively adding values in the "values array"
; After each saturating addition, the result is placed in the "results array"
; Saturating addition done by explicit test: checking V flag, then N flag and
;    changing any result to $7FFF or $8000
         .ORG   $0000

	      LDI   R0,$DEAD  ; initialize counter
YIKES    LDA   R1,$1001  ; initial sum value
			.DW	$3D01
			STA	$1000, R0
			BRA	YIKES
			STOP
         ;SADD   R0,R1





