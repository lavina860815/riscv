# For insns where X is a constant: 'X'-type operands.
#
Main	PRELD X,Y,Z
	PREGO 32,Y,Z
	SYNCD X,$32,Z
	PREST 0,$133,Z
	STCO X,Y,$73
	SYNCID 130,Y,$233
	PRELD X,$38,$212
	PREGO 1,$175,$181

	SYNCD X,Y,Z0
	PREST 32,Y,Z0
	STCO X,$132,Z0
	SYNCID 232,$133,Z0
	PRELD X,Y,203
	PREGO 231,Y,213
	SYNCD X,$38,211
	PREST 4,$175,161

	STCO X,Y,0
	SYNCID 23,Y,0
	PRELD 2,Y,0
	PREGO 232,$133,0
	SYNCD X,Y,0
	PREST 13,Y,0
	STCO X,$38,0
	SYNCID 4,$175,0

	PRELD X,Y
	PREGO 32,Y
	SYNCD X,$32
	PREST 232,$133
X IS 123
Y IS $12
Z IS $67
Z0 IS 176
