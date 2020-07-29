" Cf - check a flag. Return true if the flag is specified.
function! Cf(flag)
    return exists('g:javacoptions') && stridx(g:javacoptions, a:flag) >= 0
endfunction

" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax clear javaOperator
syntax clear javaBoolean 
syntax clear javaConstant
syntax clear javaType
syntax clear javaParen
syntax clear javaParenT1
syntax clear javaParenT
syntax clear javaParen1
syntax clear javaParenT2
syntax clear javaParen2
syntax clear javaBraces

syn keyword javaType            boolean char byte short int long float double
"syn keyword javaType            void
"syn keyword javaType		  Integer Double Date Boolean Float String Array Vector List
syn keyword javaType		  Double Boolean Float Vector 

" Constants
syntax match javaNull1 contained "\<n" conceal cchar= 
syntax match javaNull2 contained "u" conceal cchar=⊥
syntax match javaNull3 contained "ll\>" conceal cchar= 
syntax match javaNull "\<null\>" contains=javaNull1,javaNull2,javaNull3
"syntax match javaNiceConstant "\<null\>" conceal cchar=⊥

syntax match javaTrue1 contained "\<t" conceal cchar= 
syntax match javaTrue2 contained "r" conceal cchar=𝐓
syntax match javaTrue3 contained "ue\>" conceal cchar= 
syntax match javaTrue "\<true\>" contains=javaTrue1,javaTrue2,javaTrue3
"syntax match javaNiceBoolean "\<true\>" conceal cchar=𝐓

syntax match javaFalse1 contained "\<f" conceal cchar= 
syntax match javaFalse2 contained "a" conceal cchar=𝐅
syntax match javaFalse3 contained "lse\>" conceal cchar= 
syntax match javaFalse "\<false\>" contains=javaFalse1,javaFalse2,javaFalse3
"syntax match javaNiceBoolean "\<false\>" conceal cchar=𝐅


" Comparisons
syntax match javaNiceOperator "\s<=\s" conceal cchar=≤
syntax match javaNiceOperator "\s>=\s" conceal cchar=≥
syntax match javaNiceOperator "=\@<!===\@!" conceal cchar=≡

syntax match javaNeq1 contained "\s!" conceal cchar= 
syntax match javaNeq2 contained "=\s" conceal cchar=≢
syntax match javaNeqFull "\s!=\s" contains=javaNeq1,javaNeq2

" Boolean operations
syntax match javaOr1 contained "\s|" conceal cchar=∨
syntax match javaOr2 contained "|\s" conceal cchar= 
syntax match javaOrFull "\s||\s" contains=javaOr1,javaOr2

syntax match javaAnd1 contained "\s&" conceal cchar=∧
syntax match javaAnd2 contained "&\s" conceal cchar= 
syntax match javaAndFull "\s&&\s" contains=javaAnd1,javaAnd2

syntax match javaNand1 contained "\s&" conceal cchar=⊼
syntax match javaNand2 contained "&\s*!" conceal cchar= 
syntax match javaNandFull "\s&&\s*!" contains=javaNand1,javaNand2

syntax match javaNor1 contained "\s|" conceal cchar=⊽
syntax match javaNor2 contained "|\s*!" conceal cchar= 
syntax match javaNorFull "\s||\s*!" contains=javaNor1,javaNor2

syntax match javaNiceOperator "\s^\s" conceal cchar=⊻

syntax match javaNiceOperator "\<not\>" conceal cchar=¬
syntax match javaNiceOperator "!\@<!!=\@!" conceal cchar=¬ 

" Types
syntax match javaNiceType "\<Boolean\>" conceal cchar=𝔹
syntax match javaNiceType "\<Integer\>" conceal cchar=ℤ
syntax match javaNiceType "\<Float\>" conceal cchar=ℜ

" Assignment arrow
syntax match javaRLArrow1 contained "\s\+" conceal cchar= 
syntax match javaRLArrow2 contained "=" conceal cchar=←
syntax match javaRLArrow3 contained "\s\+" conceal cchar= 
syntax match javaRLArrowFull "\s\+=\s\+" contains=javaRLArrow1,javaRLArrow2,javaRLArrow3

syntax match javaSize1 contained "\<s" conceal cchar=#
syntax match javaSize2 contained "ize\>" conceal cchar=ₛ
syntax match javaSize "\<size\>" contains=javaSize1,javaSize2

syntax match javaCount1 contained "\<c" conceal cchar=#
syntax match javaCount2 contained "ount\>" conceal cchar=ₙ
syntax match javaCount "\<count\>" contains=javaCount1,javaCount2

syntax match javaLength1 contained "\<l" conceal cchar=#
syntax match javaLength2 contained "ength" conceal cchar=ₗ
syntax match javaLength "\<length\>" contains=javaLength1,javaLength2

syntax keyword javaNiceReturn return conceal cchar=↵

" Misc
syntax match javaVoid1 contained "\<v" conceal cchar= 
syntax match javaVoid2 contained "o" conceal cchar=⊥
syntax match javaVoid3 contained "id\>" conceal cchar= 
syntax match javaVoid "\<void\>" contains=javaVoid1,javaVoid2,javaVoid3

syntax match javaArray1 contained "\<A" conceal cchar= 
syntax match javaArray2 contained "r" conceal cchar=𝒜
syntax match javaArray3 contained "rray\>" conceal cchar= 
syntax match javaArray "\<Array\>" contains=javaArray1,javaArray2,javaArray3
syntax match javaList1 contained "\<L" conceal cchar= 
syntax match javaList2 contained "i" conceal cchar=ℒ
syntax match javaList3 contained "st\>" conceal cchar= 
syntax match javaList "\<List\>" contains=javaList1,javaList2,javaList3

" Single character variable names usually indicate something generic and
" should be emphasized. eg 𝒇(𝒊)
" 's' Option to disable this.
if !Cf('S')
    syntax keyword javaNiceStatement a conceal cchar=𝒂
    syntax keyword javaNiceStatement b conceal cchar=𝒃
    syntax keyword javaNiceStatement c conceal cchar=𝒄
    syntax keyword javaNiceStatement d conceal cchar=𝒅
    syntax keyword javaNiceStatement e conceal cchar=𝒆
    syntax keyword javaNiceStatement f conceal cchar=𝒇
    syntax keyword javaNiceStatement g conceal cchar=𝒈
    syntax keyword javaNiceStatement h conceal cchar=𝒉
    syntax keyword javaNiceStatement i conceal cchar=𝒊
    syntax keyword javaNiceStatement j conceal cchar=𝒋
    syntax keyword javaNiceStatement k conceal cchar=𝒌
    syntax keyword javaNiceStatement l conceal cchar=𝒍
    syntax keyword javaNiceStatement m conceal cchar=𝒎
    syntax keyword javaNiceStatement n conceal cchar=𝒏
    syntax keyword javaNiceStatement o conceal cchar=𝒐
    syntax keyword javaNiceStatement p conceal cchar=𝒑
    syntax keyword javaNiceStatement q conceal cchar=𝒒
    syntax keyword javaNiceStatement r conceal cchar=𝒓
    syntax keyword javaNiceStatement s conceal cchar=𝒔
    syntax keyword javaNiceStatement t conceal cchar=𝒕
    syntax keyword javaNiceStatement u conceal cchar=𝒖
    syntax keyword javaNiceStatement v conceal cchar=𝒗
    syntax keyword javaNiceStatement w conceal cchar=𝒘
    syntax keyword javaNiceStatement x conceal cchar=𝒙
    syntax keyword javaNiceStatement y conceal cchar=𝒚
    syntax keyword javaNiceStatement z conceal cchar=𝒛
endif

if Cf('s')
    syntax keyword javaNiceStatement A conceal cchar=𝐴
    syntax keyword javaNiceStatement B conceal cchar=𝐵
    syntax keyword javaNiceStatement C conceal cchar=𝐶
    syntax keyword javaNiceStatement D conceal cchar=𝐷
    syntax keyword javaNiceStatement E conceal cchar=𝐸
    syntax keyword javaNiceStatement F conceal cchar=𝐹
    syntax keyword javaNiceStatement G conceal cchar=𝐺
    syntax keyword javaNiceStatement H conceal cchar=𝐻
    syntax keyword javaNiceStatement I conceal cchar=𝐼
    syntax keyword javaNiceStatement J conceal cchar=𝐽
    syntax keyword javaNiceStatement K conceal cchar=𝐾
    syntax keyword javaNiceStatement L conceal cchar=𝐿
    syntax keyword javaNiceStatement M conceal cchar=𝑀
    syntax keyword javaNiceStatement N conceal cchar=𝑁
    syntax keyword javaNiceStatement O conceal cchar=𝑂
    syntax keyword javaNiceStatement P conceal cchar=𝑃
    syntax keyword javaNiceStatement Q conceal cchar=𝑄
    syntax keyword javaNiceStatement R conceal cchar=𝑅
    syntax keyword javaNiceStatement S conceal cchar=𝑆
    syntax keyword javaNiceStatement T conceal cchar=𝑇
    syntax keyword javaNiceStatement U conceal cchar=𝑈
    syntax keyword javaNiceStatement V conceal cchar=𝑉
    syntax keyword javaNiceStatement W conceal cchar=𝑊
    syntax keyword javaNiceStatement X conceal cchar=𝑋
    syntax keyword javaNiceStatement Y conceal cchar=𝑌
    syntax keyword javaNiceStatement Z conceal cchar=𝑍
endif

" Handle exponentiation
" '1' option to disable numeric superscripts concealing, e.g. x².
if !Cf('1')
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)0\>" conceal cchar=⁰
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)1\>" conceal cchar=¹
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)4\>" conceal cchar=⁴
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)5\>" conceal cchar=⁵
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)6\>" conceal cchar=⁶
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)7\>" conceal cchar=⁷
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)8\>" conceal cchar=⁸
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)9\>" conceal cchar=⁹
endif 

" 'a' option to disable alphabet superscripts concealing, e.g. xⁿ.
if !Cf('a')
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)a\>" conceal cchar=ᵃ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)b\>" conceal cchar=ᵇ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)c\>" conceal cchar=ᶜ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)d\>" conceal cchar=ᵈ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)e\>" conceal cchar=ᵉ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)f\>" conceal cchar=ᶠ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)g\>" conceal cchar=ᵍ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)h\>" conceal cchar=ʰ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)i\>" conceal cchar=ⁱ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)j\>" conceal cchar=ʲ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)k\>" conceal cchar=ᵏ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)l\>" conceal cchar=ˡ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)m\>" conceal cchar=ᵐ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)o\>" conceal cchar=ᵒ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)p\>" conceal cchar=ᵖ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)r\>" conceal cchar=ʳ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)s\>" conceal cchar=ˢ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)t\>" conceal cchar=ᵗ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)u\>" conceal cchar=ᵘ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)v\>" conceal cchar=ᵛ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)w\>" conceal cchar=ʷ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)x\>" conceal cchar=ˣ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)y\>" conceal cchar=ʸ
    syntax match javaNiceOperator "\( \|\)\*\*\( \|\)z\>" conceal cchar=ᶻ
endif



" Fractions
" 'f' option to enables fractions
if Cf('f')
    syntax keyword javaNiceBuiltin 0.25 conceal cchar=¼
    syntax keyword javaNiceBuiltin 0.5 conceal cchar=½
    syntax keyword javaNiceBuiltin 0.75 conceal cchar=¾
    " ⅓ ¼ ⅕ ⅙ ⅛  ⅔ ⅖  ¾ ⅗ ⅜  ⅘  ⅚ ⅝a ⅞
" ¼   &frac14;    &#188;  &#xBC;
" VULGAR FRACTION 1/2 ½   &frac12;    &#189;  &#xBD;
" VULGAR FRACTION 3/4 ¾   &frac34;    &#190;  &#xBE;
" VULGAR FRACTION 1/3 ⅓   --  &#8531; &#x2153;
" VULGAR FRACTION 2/3 ⅔   --  &#8532; &#x2154;
" VULGAR FRACTION 1/5 ⅕   --  &#8533; &#x2155;
" VULGAR FRACTION 2/5 ⅖   --  &#8354; &#x2156;
" VULGAR FRACTION 3/5 ⅗   --  &#8535; &#x2157;
" VULGAR FRACTION 4/5 ⅘   --  &#8536; &#x2158;
" VULGAR FRACTION 1/6 ⅙   --  &#8537; &#x2159;
" VULGAR FRACTION 5/6 ⅚   --  &#8538; &#x215A;
" VULGAR FRACTION 1/8 ⅛   --  &#8539; &#x215B;
" VULGAR FRACTION 3/8 ⅜   --  &#8540; &#x215C;
" VULGAR FRACTION 5/8 ⅝   --  &#8541; &#x215D;
" VULGAR FRACTION 7/8 ⅞
endif 



hi link javaNiceOperator Operator
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=LightGreen

setlocal conceallevel=2
setlocal concealcursor=nv
