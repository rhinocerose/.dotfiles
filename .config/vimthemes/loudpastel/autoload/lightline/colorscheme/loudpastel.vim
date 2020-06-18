let s:base00 = [ '#0A0F0E',  0 ] " black
let s:base01 = [ '#192220', 18 ]
let s:base02 = [ '#273431', 19 ]
let s:base03 = [ '#3B4D49',  8 ]
let s:base04 = [ '#546B66', 20 ]
let s:base05 = [ '#71908A',  7 ]
let s:base06 = [ '#94BBB3', 21 ]
let s:base07 = [ '#BCECE2', 15 ] " white

let s:base08 = [ '#F63589',  1 ] " red
let s:base09 = [ '#FC619B', 16 ] " orange
let s:base0A = [ '#EF9FB7',  3 ] " yellow
let s:base0B = [ '#658C42',  2 ] " green
let s:base0C = [ '#FC1487',  6 ] " teal
let s:base0D = [ '#0BAE9A',  4 ] " blue
let s:base0E = [ '#FA83AA',  5 ] " pink
let s:base0F = [ '#6F9E3E', 17 ] " brown

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base00, s:base0D ], [ s:base05, s:base01 ] ]
let s:p.insert.left     = [ [ s:base01, s:base0C ], [ s:base05, s:base01 ] ]
let s:p.visual.left     = [ [ s:base00, s:base0A ], [ s:base05, s:base01 ] ]
let s:p.replace.left    = [ [ s:base00, s:base08 ], [ s:base05, s:base01 ] ]
let s:p.inactive.left   = [ [ s:base04, s:base00 ] ]

let s:p.normal.middle   = [ [ s:base07, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base00 ] ]

let s:p.normal.right    = [ [ s:base01, s:base03 ], [ s:base06, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base01, s:base00 ] ]

let s:p.normal.error    = [ [ s:base07, s:base08 ] ]
let s:p.normal.warning  = [ [ s:base07, s:base09 ] ]

let s:p.tabline.left    = [ [ s:base05, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base05, s:base01 ] ]
let s:p.tabline.right   = [ [ s:base05, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:base02, s:base0A ] ]

let g:lightline#colorscheme#loudpastel#palette = lightline#colorscheme#flatten(s:p)
