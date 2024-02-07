" syntax match texMathSymbol /\\set{\%([^}]*}\)\@=/ conceal cchar={
" syntax match texMathSymbol /\%(\\set{[^}]*\)\@<=}/ conceal cchar=}
" syntax match texMathSymbol /\%(\\set{\%([^{}]*|\%({[^{}]*}\)\)*\)\@<=}/ conceal cchar=}
" syntax match texMathCmd /\\set\>/ contained conceal

" These are concealed using Vimtex's conceal feature
" syntax match texMathSymbol /\\R\>/ conceal cchar=ℝ
" syntax match texMathSymbol /\\N\>/ conceal cchar=ℕ
" syntax match texMathSymbol /\\P\>/ conceal cchar=ℙ
" syntax match texMathSymbol /\\Z\>/ conceal cchar=ℤ
" syntax match texMathSymbol /\\Q\>/ conceal cchar=ℚ
" syntax match texMathSymbol /\\C\>/ conceal cchar=ℂ
" syntax match texMathSymbol /\\O\>/ conceal cchar=∅
" syntax match texMathSymbol /\\lxor\>/ conceal cchar=⊕

" SI prefixes
" syntax match texSIPrefix /\\nano\>/ conceal cchar=n
" syntax match texSIPrefix /\\micro\>/ conceal cchar=µ
" syntax match texSIPrefix /\\milli\>/ conceal cchar=m
" syntax match texSIPrefix /\\centi\>/ conceal cchar=c
" syntax match texSIPrefix /\\kilo\>/ conceal cchar=k
" syntax match texSIPrefix /\\mega\>/ conceal cchar=M
" syntax match texSIPrefix /\\giga\>/ conceal cchar=G
"
" " SI units
" syntax match texSIUnit /\\meter\>/ conceal cchar=m
" syntax match texSIUnit /\\second\>/ conceal cchar=s
" syntax match texSIUnit /\\gram\>/ conceal cchar=g
" syntax match texSIUnit /\\ampere\>/ conceal cchar=A
" syntax match texSIUnit /\\kelvin\>/ conceal cchar=K
" syntax match texSIUnit /\\volt\>/ conceal cchar=V
" syntax match texSIUnit /\\coulomb\>/ conceal cchar=C
" syntax match texSIUnit /\\farad\>/ conceal cchar=F
" syntax match texSIUnit /\\ohm/ conceal cchar=Ω
" syntax match texSIUnit /\\siemens\>/ conceal cchar=S
" syntax match texSIUnit /\\joule\>/ conceal cchar=J
" syntax match texSIUnit /\\watt\>/ conceal cchar=W
" syntax match texSIUnit /\\newton\>/ conceal cchar=N
" syntax match texSIUnit /\\tesla\>/ conceal cchar=T
" syntax match texSIUnit /\\henry\>/ conceal cchar=H
"
" " SI powers
" syntax match texSIPower /\\squared\>/ conceal cchar=²
" syntax match texSIPower /\\cubed\>/ conceal cchar=³
