let s:bg = '#061a1a'
let s:bg_alt = '#082323'
let s:bg_soft = '#0d2c2c'
let s:fg = '#8ffcff'
let s:fg_dim = '#60c8cb'
let s:cyan = '#8ffcff'
let s:cyan_bright = '#b9ffff'
let s:red = '#ff6b6b'
let s:orange = '#ffb86c'
let s:yellow = '#f1fa8c'
let s:green = '#7ee787'
let s:purple = '#c792ea'
let s:muted = '#4d7070'

let s:p = {'normal': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'inactive': {}, 'tabline': {}}

let s:p.normal.left = [[s:bg, s:cyan, 0, 14, 'bold'], [s:fg, s:bg_soft, 14, 0]]
let s:p.normal.middle = [[s:fg_dim, s:bg_alt, 14, 0]]
let s:p.normal.right = [[s:bg, s:cyan, 0, 14], [s:fg, s:bg_soft, 14, 0]]
let s:p.normal.error = [[s:bg, s:red, 0, 9, 'bold']]
let s:p.normal.warning = [[s:bg, s:orange, 0, 11, 'bold']]

let s:p.insert.left = [[s:bg, s:green, 0, 10, 'bold'], [s:fg, s:bg_soft, 14, 0]]
let s:p.insert.right = [[s:bg, s:green, 0, 10], [s:fg, s:bg_soft, 14, 0]]
let s:p.replace.left = [[s:bg, s:red, 0, 9, 'bold'], [s:fg, s:bg_soft, 14, 0]]
let s:p.replace.right = [[s:bg, s:red, 0, 9], [s:fg, s:bg_soft, 14, 0]]
let s:p.visual.left = [[s:bg, s:purple, 0, 13, 'bold'], [s:fg, s:bg_soft, 14, 0]]
let s:p.visual.right = [[s:bg, s:purple, 0, 13], [s:fg, s:bg_soft, 14, 0]]

let s:p.inactive.left = [[s:muted, s:bg_alt, 8, 0], [s:fg_dim, s:bg, 14, 0]]
let s:p.inactive.middle = [[s:muted, s:bg, 8, 0]]
let s:p.inactive.right = [[s:muted, s:bg_alt, 8, 0], [s:fg_dim, s:bg, 14, 0]]

let s:p.tabline.left = [[s:fg_dim, s:bg_soft, 14, 0]]
let s:p.tabline.middle = [[s:muted, s:bg, 8, 0]]
let s:p.tabline.right = [[s:bg, s:cyan, 0, 14]]
let s:p.tabline.tabsel = [[s:bg, s:cyan_bright, 0, 14, 'bold']]

let g:lightline#colorscheme#elflord_custom#palette = lightline#colorscheme#fill(s:p)
