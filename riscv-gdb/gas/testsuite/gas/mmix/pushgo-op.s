# PUSHGO.  Like T, but $X can be expressed as a constant.
# Using regt-op as a template caused this to go out of control.
Main	PUSHGO X,Y,Z
	PUSHGO XC,Y,Z
	PUSHGO $32,Y,Z
	PUSHGO 32,Y,Z
	PUSHGO X,$32,Z
	PUSHGO XC,$32,Z
	PUSHGO $232,$133,Z
	PUSHGO 232,$133,Z
	PUSHGO X,Y,$73
	PUSHGO XC,Y,$73
	PUSHGO $31,Y,$233
	PUSHGO 31,Y,$233
	PUSHGO X,$38,$212
	PUSHGO XC,$38,$212
	PUSHGO $4,$175,$181
	PUSHGO 4,$175,$181

	PUSHGO X,Y,Z0
	PUSHGO XC,Y,Z0
	PUSHGO $32,Y,Z0
	PUSHGO 32,Y,Z0
	PUSHGO X,$32,Z0
	PUSHGO XC,$32,Z0
	PUSHGO $232,$133,Z0
	PUSHGO 232,$133,Z0
	PUSHGO X,Y,203
	PUSHGO XC,Y,203
	PUSHGO $31,Y,213
	PUSHGO 31,Y,213
	PUSHGO X,$38,211
	PUSHGO XC,$38,211
	PUSHGO $4,$175,161
	PUSHGO 4,$175,161

	PUSHGO X,Y
	PUSHGO XC,Y

	PUSHGO $41,Y
	PUSHGO 241,Y

	PUSHGO X,$27
	PUSHGO XC,$48

	PUSHGO $223,$219
	PUSHGO 223,$229

	PUSHGO X,Y,0
	PUSHGO XC,Y,0
	PUSHGO $32,Y,0
	PUSHGO 32,Y,0
	PUSHGO X,$32,0
	PUSHGO XC,$32,0
	PUSHGO $232,$133,0
	PUSHGO 232,$133,0
	PUSHGO X,Y,0
	PUSHGO XC,Y,0
	PUSHGO $31,Y,0
	PUSHGO 31,Y,0
	PUSHGO X,$38,0
	PUSHGO XC,$38,0
	PUSHGO $4,$175,0
	PUSHGO 4,$175,0
X IS $23
XC IS 203
Y IS $12
Z IS $67
Z0 IS 176
