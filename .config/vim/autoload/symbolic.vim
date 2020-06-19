fun! symbolic#Toggle(bang)
  if a:bang || (exists("b:symbolic_syntax") && b:symbolic_syntax)
    let b:symbolic_syntax = 0
    if exists('b:old_conceallevel')
      let &l:conceallevel = b:old_conceallevel
      unlet b:old_conceallevel
    endif
    syn clear symbolicStuff
    syn clear symbolicLetters
  else
    " Operators
    syn match symbolicStuff /<=/ conceal cchar=≤
    syn match symbolicStuff />=/ conceal cchar=≥
    syn match symbolicStuff /\!=/ conceal cchar=≠
    syn match symbolicStuff /integral\ze(/ conceal cchar=∫
    syn match symbolicStuff /derivative\ze(/ conceal cchar=∂
    syn match symbolicStuff /\vexists( an)? / conceal cchar=∃
    syn match symbolicStuff /forall / conceal cchar=∀
    syn match symbolicStuff /sum\ze(/ conceal cchar=∑
    syn match symbolicStuff /\v\c(math\.|std::)?sqrt>/ conceal cchar=√
    syn match symbolicStuff /\v\c(math\.|std::)?cbrt>/ conceal cchar=∛
    syn match symbolicStuff /\\in\>/ conceal cchar=∈
    syn match symbolicStuff /\\notin\>/ conceal cchar=∉

    " Capital Greek
    syn match symbolicLetters /\v\zs(<|\\)Alpha\ze([_0-9]|>)/ conceal cchar=Α
    syn match symbolicLetters /\v\zs(<|\\)Beta\ze([_0-9]|>)/ conceal cchar=Β
    syn match symbolicLetters /\v\zs(<|\\)Gamma\ze([_0-9]|>)/ conceal cchar=Γ
    syn match symbolicLetters /\v\zs(<|\\)Delta\ze([_0-9]|>)/ conceal cchar=Δ
    syn match symbolicLetters /\v\zs(<|\\)Epsilon\ze([_0-9]|>)/ conceal cchar=Ε
    syn match symbolicLetters /\v\zs(<|\\)Zeta\ze([_0-9]|>)/ conceal cchar=Ζ
    syn match symbolicLetters /\v\zs(<|\\)Eta\ze([_0-9]|>)/ conceal cchar=Η
    syn match symbolicLetters /\v\zs(<|\\)Theta\ze([_0-9]|>)/ conceal cchar=Θ
    syn match symbolicLetters /\v\zs(<|\\)Iota\ze([_0-9]|>)/ conceal cchar=Ι
    syn match symbolicLetters /\v\zs(<|\\)Kappa\ze([_0-9]|>)/ conceal cchar=Κ
    syn match symbolicLetters /\v\zs(<|\\)Lambda\ze([_0-9]|>)/ conceal cchar=Λ
    syn match symbolicLetters /\v\zs(<|\\)Mu\ze([_0-9]|>)/ conceal cchar=Μ
    syn match symbolicLetters /\v\zs(<|\\)Nu\ze([_0-9]|>)/ conceal cchar=Ν
    syn match symbolicLetters /\v\zs(<|\\)Xi\ze([_0-9]|>)/ conceal cchar=Ξ
    syn match symbolicLetters /\v\zs(<|\\)Omicron\ze([_0-9]|>)/ conceal cchar=Ο
    syn match symbolicLetters /\v\zs(<|\\)Pi\ze([_0-9]|>)/ conceal cchar=Π
    syn match symbolicLetters /\v\zs(<|\\)Rho\ze([_0-9]|>)/ conceal cchar=Ρ
    syn match symbolicLetters /\v\zs(<|\\)Sigma\ze([_0-9]|>)/ conceal cchar=Σ
    syn match symbolicLetters /\v\zs(<|\\)Tau\ze([_0-9]|>)/ conceal cchar=Τ
    syn match symbolicLetters /\v\zs(<|\\)Upsilon\ze([_0-9]|>)/ conceal cchar=Υ
    syn match symbolicLetters /\v\zs(<|\\)Phi\ze([_0-9]|>)/ conceal cchar=Φ
    syn match symbolicLetters /\v\zs(<|\\)Chi\ze([_0-9]|>)/ conceal cchar=Χ
    syn match symbolicLetters /\v\zs(<|\\)Psi\ze([_0-9]|>)/ conceal cchar=Ψ
    syn match symbolicLetters /\v\zs(<|\\)Omega\ze([_0-9]|>)/ conceal cchar=Ω

    " Lowercase Greek
    syn match symbolicLetters /\v\zs(<|\\)alpha\ze([_0-9]|>)/ conceal cchar=α
    syn match symbolicLetters /\v\zs(<|\\)beta\ze([_0-9]|>)/ conceal cchar=β
    syn match symbolicLetters /\v\zs(<|\\)gamma\ze([_0-9]|>)/ conceal cchar=γ
    syn match symbolicLetters /\v\zs(<|\\)delta\ze([_0-9]|>)/ conceal cchar=δ
    syn match symbolicLetters /\v\zs(<|\\)epsilon\ze([_0-9]|>)/ conceal cchar=ε
    syn match symbolicLetters /\v\zs(<|\\)\zeta\ze([_0-9]|>)/ conceal cchar=ζ
    syn match symbolicLetters /\v\zs(<|\\)eta\ze([_0-9]|>)/ conceal cchar=η
    syn match symbolicLetters /\v\zs(<|\\)theta\ze([_0-9]|>)/ conceal cchar=θ
    syn match symbolicLetters /\v\zs(<|\\)iota\ze([_0-9]|>)/ conceal cchar=ι
    syn match symbolicLetters /\v\zs(<|\\)kappa\ze([_0-9]|>)/ conceal cchar=κ
    syn match symbolicLetters /\v\zs(<|\\)lambda\ze([_0-9]|>)/ conceal cchar=λ
    syn match symbolicLetters /\v\zs(<|\\)mu\ze([_0-9]|>)/ conceal cchar=μ
    syn match symbolicLetters /\v\zs(<|\\)nu\ze([_0-9]|>)/ conceal cchar=ν
    syn match symbolicLetters /\v\zs(<|\\)xi\ze([_0-9]|>)/ conceal cchar=ξ
    syn match symbolicLetters /\v\zs(<|\\)omicron\ze([_0-9]|>)/ conceal cchar=ο
    syn match symbolicLetters /\v\zs(<|\\)pi\ze([_0-9]|>)/ conceal cchar=π
    syn match symbolicLetters /\v\zs(<|\\)rho\ze([_0-9]|>)/ conceal cchar=ρ
    syn match symbolicLetters /\v\zs(<|\\)final\ze([_0-9]|>)/ conceal cchar=ς
    syn match symbolicLetters /\v\zs(<|\\)sigma\ze([_0-9]|>)/ conceal cchar=σ
    syn match symbolicLetters /\v\zs(<|\\)tau\ze([_0-9]|>)/ conceal cchar=τ
    syn match symbolicLetters /\v\zs(<|\\)upsilon\ze([_0-9]|>)/ conceal cchar=υ
    syn match symbolicLetters /\v\zs(<|\\)phi\ze([_0-9]|>)/ conceal cchar=φ
    syn match symbolicLetters /\v\zs(<|\\)chi\ze([_0-9]|>)/ conceal cchar=χ
    syn match symbolicLetters /\v\zs(<|\\)psi\ze([_0-9]|>)/ conceal cchar=ψ
    syn match symbolicLetters /\v\zs(<|\\)omega\ze([_0-9]|>)/ conceal cchar=ω

    " Subscripts
    syn match symbolicStuff /_0\>/ conceal cchar=₀
    syn match symbolicStuff /_1\>/ conceal cchar=₁
    syn match symbolicStuff /_2\>/ conceal cchar=₂
    syn match symbolicStuff /_3\>/ conceal cchar=₃
    syn match symbolicStuff /_4\>/ conceal cchar=₄
    syn match symbolicStuff /_5\>/ conceal cchar=₅
    syn match symbolicStuff /_6\>/ conceal cchar=₆
    syn match symbolicStuff /_7\>/ conceal cchar=₇
    syn match symbolicStuff /_8\>/ conceal cchar=₈
    syn match symbolicStuff /_9\>/ conceal cchar=₉

    " Superscripts
    syn match symbolicStuff /\^0\>/ conceal cchar=⁰
    syn match symbolicStuff /\^1\>/ conceal cchar=¹
    syn match symbolicStuff /\^2\>/ conceal cchar=²
    syn match symbolicStuff /\^3\>/ conceal cchar=³
    syn match symbolicStuff /\^4\>/ conceal cchar=⁴
    syn match symbolicStuff /\^5\>/ conceal cchar=⁵
    syn match symbolicStuff /\^6\>/ conceal cchar=⁶
    syn match symbolicStuff /\^7\>/ conceal cchar=⁷
    syn match symbolicStuff /\^8\>/ conceal cchar=⁸
    syn match symbolicStuff /\^9\>/ conceal cchar=⁹
    syn match symbolicStuff /\^n\>/ conceal cchar=ⁿ
    syn match symbolicStuff /\^+/ conceal cchar=⁺
    syn match symbolicStuff /\^-/ conceal cchar=⁻

    syn match symbolicLetters /\v<REAL>/ conceal cchar=ℝ
    syn match symbolicLetters /\v<INTEGERS>/ conceal cchar=ℤ

    let b:old_conceallevel=&conceallevel
    setl conceallevel=1
    let b:symbolic_syntax=1
  endif
endfun
