syntax match hsNiceOperator "||\ze[[:alpha:][:space:]_([]" conceal cchar=∨
syntax match hsNiceOperator "&&\ze[[:alpha:][:space:]_([]" conceal cchar=∧
syntax match hsNiceOperator "\<not\>" conceal cchar=¬
syntax match hsNiceOperator "\\\ze[[:alpha:][:space:]_([]" conceal cchar=λ

hi link hsNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
