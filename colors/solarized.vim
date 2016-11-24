" Name:     Solarized vim colorscheme
" Author:   Ethan Schoonover <es@ethanschoonover.com>
" URL:      http://ethanschoonover.com/solarized
"           (see this url for latest release & screenshots)
" License:  OSI approved MIT license (see end of this file)
" Created:  In the middle of the night
" Modified: 2011 May 05
"
" Usage "{{{
"
" ---------------------------------------------------------------------
" ABOUT:
" ---------------------------------------------------------------------
" Solarized is a carefully designed selective contrast colorscheme with dual
" light and dark modes that runs in both GUI, 256 and 16 color modes.
"
" See the homepage above for screenshots and details.
"
" ---------------------------------------------------------------------
" OPTIONS:
" ---------------------------------------------------------------------
" See the "solarized.txt" help file included with this colorscheme (in the
" "doc" subdirectory) for information on options, usage, the Toggle Background
" function and more. If you have already installed Solarized, this is available
" from the Solarized menu and command line as ":help solarized"
"
" ---------------------------------------------------------------------
" INSTALLATION:
" ---------------------------------------------------------------------
" Two options for installation: manual or pathogen
"
" MANUAL INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1.  Download the solarized distribution (available on the homepage above)
"     and unarchive the file.
" 2.  Move `solarized.vim` to your `.vim/colors` directory.
" 3.  Move each of the files in each subdirectories to the corresponding .vim
"     subdirectory (e.g. autoload/togglebg.vim goes into your .vim/autoload
"     directory as .vim/autoload/togglebg.vim).
"
" RECOMMENDED PATHOGEN INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1.  Download and install Tim Pope's Pathogen from:
"     https://github.com/tpope/vim-pathogen
"
" 2.  Next, move or clone the `vim-colors-solarized` directory so that it is
"     a subdirectory of the `.vim/bundle` directory.
"
"     a. **clone with git:**
"
"       $ cd ~/.vim/bundle
"       $ git clone git://github.com/altercation/vim-colors-solarized.git
"
"     b. **or move manually into the pathogen bundle directory:**
"         In the parent directory of vim-colors-solarized:
"
"         $ mv vim-colors-solarized ~/.vim/bundle/
"
" MODIFY VIMRC:
"
" After either Option 1 or Option 2 above, put the following two lines in your
" .vimrc:
"
"     syntax enable
"     set background=dark
"     colorscheme solarized
"
" or, for the light background mode of Solarized:
"
"     syntax enable
"     set background=light
"     colorscheme solarized
"
" I like to have a different background in GUI and terminal modes, so I can use
" the following if-then. However, I find vim's background autodetection to be
" pretty good and, at least with MacVim, I can leave this background value
" assignment out entirely and get the same results.
"
"     if has('gui_running')
"       set background=light
"     else
"       set background=dark
"     endif
"
" See the Solarized homepage at http://ethanschoonover.com/solarized for
" screenshots which will help you select either the light or dark background.
"
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
" Download palettes and files from: http://ethanschoonover.com/solarized
"
" L\*a\*b values are canonical (White D65, Reference D50), other values are
" matched in sRGB space.
"
" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
" ---------------------------------------------------------------------
" COLORSCHEME HACKING
" ---------------------------------------------------------------------
"
" Useful commands for testing colorschemes:
" :source $VIMRUNTIME/syntax/hitest.vim
" :help highlight-groups
" :help cterm-colors
" :help group-name
"
" Useful links for developing colorschemes:
" http://www.vim.org/scripts/script.php?script_id=2937
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" http://www.frexx.de/xterm-256-notes/"
"
" }}}
" Environment Specific Overrides "{{{
" Allow or disallow certain features based on current terminal emulator or
" environment.

" Terminals that support italics
let s:terms_italic=[
            \"rxvt",
            \"gnome-terminal"
            \]
" For reference only, terminals are known to be incomptible.
" Terminals that are in neither list need to be tested.
let s:terms_noitalic=[
            \"iTerm.app",
            \"Apple_Terminal"
            \]
if (has("gui_running") || has("nvim"))
    let s:terminal_italic=1 " TODO: could refactor to not require this at all
else
    let s:terminal_italic=0 " terminals will be guilty until proven compatible
    for term in s:terms_italic
        if $TERM_PROGRAM =~ term
            let s:terminal_italic=1
        endif
    endfor
endif

" }}}
" Default option values"{{{
" ---------------------------------------------------------------------
" s:options_list is used to autogenerate a list of all non-default options
" using "call SolarizedOptions()" or with the "Generate .vimrc commands"
" Solarized menu option. See the "Menus" section below for the function itself.
let s:options_list=[
            \'" this block of commands has been autogenerated by solarized.vim and',
            \'" includes the current, non-default Solarized option values.',
            \'" To use, place these commands in your .vimrc file (replacing any',
            \'" existing colorscheme commands). See also ":help solarized"',
            \'',
            \'" ------------------------------------------------------------------',
            \'" Solarized Colorscheme Config',
            \'" ------------------------------------------------------------------',
            \]
let s:colorscheme_list=[
            \'syntax enable',
            \'set background='.&background,
            \'colorscheme solarized',
            \]
let s:defaults_list=[
            \'" ------------------------------------------------------------------',
            \'',
            \'" The following items are available options, but do not need to be',
            \'" included in your .vimrc as they are currently set to their defaults.',
            \''
            \]
let s:lazycat_list=[
            \'" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"',
            \'" ------------------------------------------------------------------',
            \]

function! s:SetOption(name,default)
    if type(a:default) == type(0)
        let l:wrap=''
        let l:ewrap=''
    else
        let l:wrap='"'
        let l:ewrap='\"'
    endif
    if !exists("g:solarized_".a:name) || g:solarized_{a:name}==a:default
        exe 'let g:solarized_'.a:name.'='.l:wrap.a:default.l:wrap.'"'
        exe 'call add(s:defaults_list, "\" let g:solarized_'.a:name.'='.l:ewrap.g:solarized_{a:name}.l:ewrap.'")'
    else
        exe 'call add(s:options_list,  "let g:solarized_'.a:name.'='.l:ewrap.g:solarized_{a:name}.l:ewrap.'    \"default value is '.a:default.'")'
    endif
endfunction

if ($TERM_PROGRAM ==? "apple_terminal" && &t_Co < 256)
    let s:solarized_termtrans_default = 1
else
    let s:solarized_termtrans_default = 0
endif
call s:SetOption("termtrans",s:solarized_termtrans_default)
call s:SetOption("degrade",0)
call s:SetOption("bold",1)
call s:SetOption("underline",1)
call s:SetOption("italic",1) " note that we need to override this later if the terminal doesn't support
call s:SetOption("termcolors",16)
call s:SetOption("contrast","normal")
call s:SetOption("visibility","normal")
call s:SetOption("diffmode","normal")
call s:SetOption("hitrail",0)
call s:SetOption("menu",1)

"}}}
" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "solarized"

"}}}
" GUI & cterm hexadecimal palettes"{{{
" ---------------------------------------------------------------------
"
" Set both gui and terminal color values in separate conditional statements

let s:vmode       = ["gui",     "cterm"]
let s:base03      = ["#002b36", "234"]
let s:base02      = ["#073642", "235"]
let s:base01      = ["#586e75", "239"]
let s:base00      = ["#657b83", "240"]
let s:base0       = ["#839496", "244"]
let s:base1       = ["#93a1a1", "245"]
let s:base2       = ["#eee8d5", "187"]
let s:base3       = ["#fdf6e3", "230"]
let s:yellow      = ["#b58900", "136"]
let s:orange      = ["#cb4b16", "166"]
let s:red         = ["#dc322f", "124"]
let s:magenta     = ["#d33682", "125"]
let s:violet      = ["#6c71c4", "61" ]
let s:blue        = ["#268bd2", "33" ]
let s:cyan        = ["#2aa198", "37" ]
let s:green       = ["#719e07", "64" ] "experimental
"let s:green       = ["#859900", "64" ] "original

if has("gui_running") || has("nvim")
    if g:solarized_degrade == 1
        " These colors are identical to the 256 color mode. They may be viewed
        " while in gui mode via "let g:solarized_degrade=1", though this is not
        " recommened and is for testing only.
        let s:base03[0]      = "#1c1c1c"
        let s:base02[0]      = "#262626"
        let s:base01[0]      = "#4e4e4e"
        let s:base00[0]      = "#585858"
        let s:base0[0]       = "#808080"
        let s:base1[0]       = "#8a8a8a"
        let s:base2[0]       = "#d7d7af"
        let s:base3[0]       = "#ffffd7"
        let s:yellow[0]      = "#af8700"
        let s:orange[0]      = "#d75f00"
        let s:red[0]         = "#af0000"
        let s:magenta[0]     = "#af005f"
        let s:violet[0]      = "#5f5faf"
        let s:blue[0]        = "#0087ff"
        let s:cyan[0]        = "#00afaf"
        let s:green[0]       = "#5f8700"
    endif
elseif g:solarized_termcolors != 256 && &t_Co >= 16
    let s:vmode[0]       = "cterm"
    let s:base03[0]      = "8"
    let s:base02[0]      = "0"
    let s:base01[0]      = "10"
    let s:base00[0]      = "11"
    let s:base0[0]       = "12"
    let s:base1[0]       = "14"
    let s:base2[0]       = "7"
    let s:base3[0]       = "15"
    let s:yellow[0]      = "3"
    let s:orange[0]      = "9"
    let s:red[0]         = "1"
    let s:magenta[0]     = "5"
    let s:violet[0]      = "13"
    let s:blue[0]        = "4"
    let s:cyan[0]        = "6"
    let s:green[0]       = "2"
elseif g:solarized_termcolors == 256
    let s:vmode[0]       = "cterm"
    let s:base03[0]      = "234"
    let s:base02[0]      = "235"
    let s:base01[0]      = "239"
    let s:base00[0]      = "240"
    let s:base0[0]       = "244"
    let s:base1[0]       = "245"
    let s:base2[0]       = "187"
    let s:base3[0]       = "230"
    let s:yellow[0]      = "136"
    let s:orange[0]      = "166"
    let s:red[0]         = "124"
    let s:magenta[0]     = "125"
    let s:violet[0]      = "61"
    let s:blue[0]        = "33"
    let s:cyan[0]        = "37"
    let s:green[0]       = "64"
else
    let s:vmode[0]       = "cterm"
    let s:bright[0]      = "* term=bold cterm=bold"
"   let s:base03[0]      = "0".s:bright
"   let s:base02[0]      = "0"
"   let s:base01[0]      = "2".s:bright
"   let s:base00[0]      = "3".s:bright
"   let s:base0[0]       = "4".s:bright
"   let s:base1[0]       = "6".s:bright
"   let s:base2[0]       = "7"
"   let s:base3[0]       = "7".s:bright
"   let s:yellow[0]      = "3"
"   let s:orange[0]      = "1".s:bright
"   let s:red[0]         = "1"
"   let s:magenta[0]     = "5"
"   let s:violet[0]      = "5".s:bright
"   let s:blue[0]        = "4"
"   let s:cyan[0]        = "6"
"   let s:green[0]       = "2"
    let s:base03[0]      = "DarkGray"      " 0*
    let s:base02[0]      = "Black"         " 0
    let s:base01[0]      = "LightGreen"    " 2*
    let s:base00[0]      = "LightYellow"   " 3*
    let s:base0[0]       = "LightBlue"     " 4*
    let s:base1[0]       = "LightCyan"     " 6*
    let s:base2[0]       = "LightGray"     " 7
    let s:base3[0]       = "White"         " 7*
    let s:yellow[0]      = "DarkYellow"    " 3
    let s:orange[0]      = "LightRed"      " 1*
    let s:red[0]         = "DarkRed"       " 1
    let s:magenta[0]     = "DarkMagenta"   " 5
    let s:violet[0]      = "LightMagenta"  " 5*
    let s:blue[0]        = "DarkBlue"      " 4
    let s:cyan[0]        = "DarkCyan"      " 6
    let s:green[0]       = "DarkGreen"     " 2

endif
"}}}
" Formatting options and null values for passthrough effect "{{{
" ---------------------------------------------------------------------
    let s:none            = ["NONE","NONE"]
    let s:none            = ["NONE","NONE"]
    let s:t_none          = "NONE"
    let s:n               = "NONE"
    let s:c               = ",undercurl"
    let s:r               = ",reverse"
    let s:s               = ",standout"
    let s:ou              = ""
    let s:ob              = ""
"}}}
" Background value based on termtrans setting "{{{
" ---------------------------------------------------------------------
if ((has("gui_running") || has("nvim")) || g:solarized_termtrans == 0)
    let s:back        = s:base03
else
    let s:back        = ["NONE","NONE"]
endif
"}}}
" Alternate light scheme "{{{
" ---------------------------------------------------------------------
if &background == "light"
    let s:temp03      = s:base03
    let s:temp02      = s:base02
    let s:temp01      = s:base01
    let s:temp00      = s:base00
    let s:base03      = s:base3
    let s:base02      = s:base2
    let s:base01      = s:base1
    let s:base00      = s:base0
    let s:base0       = s:temp00
    let s:base1       = s:temp01
    let s:base2       = s:temp02
    let s:base3       = s:temp03
    if (s:back[0] != "NONE")
        let s:back    = s:base03
    endif
endif
"}}}
" Optional contrast schemes "{{{
" ---------------------------------------------------------------------
if g:solarized_contrast == "high"
    let s:base01      = s:base00
    let s:base00      = s:base0
    let s:base0       = s:base1
    let s:base1       = s:base2
    let s:base2       = s:base3
    let s:back        = s:back
endif
if g:solarized_contrast == "low"
    let s:back        = s:base02
    let s:ou          = ",underline"
endif
"}}}
" Overrides dependent on user specified values and environment "{{{
" ---------------------------------------------------------------------
if (g:solarized_bold == 0 || &t_Co == 8 )
    let s:b           = ""
    let s:bb          = ",bold"
else
    let s:b           = ",bold"
    let s:bb          = ""
endif

if g:solarized_underline == 0
    let s:u           = ""
else
    let s:u           = ",underline"
endif

if g:solarized_italic == 0 || s:terminal_italic == 0
    let s:i           = ""
else
    let s:i           = ",italic"
endif
"}}}
" Highlighting primitives"{{{
" ---------------------------------------------------------------------
" When GUI is selected, we still set the cterm colors to let plugins fallback
" to the approximate palette if they can't use the GUI colors.

if s:vmode[0] == "gui"
    exe "let s:bg_none      = ' ".s:vmode[1]."bg=".s:none[1]   ." ".s:vmode[0]."bg=".s:none[0]   ."'"
    exe "let s:bg_back      = ' ".s:vmode[1]."bg=".s:back[1]   ." ".s:vmode[0]."bg=".s:back[0]   ."'"
    exe "let s:bg_base03    = ' ".s:vmode[1]."bg=".s:base03[1] ." ".s:vmode[0]."bg=".s:base03[0] ."'"
    exe "let s:bg_base02    = ' ".s:vmode[1]."bg=".s:base02[1] ." ".s:vmode[0]."bg=".s:base02[0] ."'"
    exe "let s:bg_base01    = ' ".s:vmode[1]."bg=".s:base01[1] ." ".s:vmode[0]."bg=".s:base01[0] ."'"
    exe "let s:bg_base00    = ' ".s:vmode[1]."bg=".s:base00[1] ." ".s:vmode[0]."bg=".s:base00[0] ."'"
    exe "let s:bg_base0     = ' ".s:vmode[1]."bg=".s:base0[1]  ." ".s:vmode[0]."bg=".s:base0[0]  ."'"
    exe "let s:bg_base1     = ' ".s:vmode[1]."bg=".s:base1[1]  ." ".s:vmode[0]."bg=".s:base1[0]  ."'"
    exe "let s:bg_base2     = ' ".s:vmode[1]."bg=".s:base2[1]  ." ".s:vmode[0]."bg=".s:base2[0]  ."'"
    exe "let s:bg_base3     = ' ".s:vmode[1]."bg=".s:base3[1]  ." ".s:vmode[0]."bg=".s:base3[0]  ."'"
    exe "let s:bg_green     = ' ".s:vmode[1]."bg=".s:green[1]  ." ".s:vmode[0]."bg=".s:green[0]  ."'"
    exe "let s:bg_yellow    = ' ".s:vmode[1]."bg=".s:yellow[1] ." ".s:vmode[0]."bg=".s:yellow[0] ."'"
    exe "let s:bg_orange    = ' ".s:vmode[1]."bg=".s:orange[1] ." ".s:vmode[0]."bg=".s:orange[0] ."'"
    exe "let s:bg_red       = ' ".s:vmode[1]."bg=".s:red[1]    ." ".s:vmode[0]."bg=".s:red[0]    ."'"
    exe "let s:bg_magenta   = ' ".s:vmode[1]."bg=".s:magenta[1]." ".s:vmode[0]."bg=".s:magenta[0]."'"
    exe "let s:bg_violet    = ' ".s:vmode[1]."bg=".s:violet[1] ." ".s:vmode[0]."bg=".s:violet[0] ."'"
    exe "let s:bg_blue      = ' ".s:vmode[1]."bg=".s:blue[1]   ." ".s:vmode[0]."bg=".s:blue[0]   ."'"
    exe "let s:bg_cyan      = ' ".s:vmode[1]."bg=".s:cyan[1]   ." ".s:vmode[0]."bg=".s:cyan[0]   ."'"

    exe "let s:fg_none      = ' ".s:vmode[1]."fg=".s:none[1]   ." ".s:vmode[0]."fg=".s:none[0]   ."'"
    exe "let s:fg_back      = ' ".s:vmode[1]."fg=".s:back[1]   ." ".s:vmode[0]."fg=".s:back[0]   ."'"
    exe "let s:fg_base03    = ' ".s:vmode[1]."fg=".s:base03[1] ." ".s:vmode[0]."fg=".s:base03[0] ."'"
    exe "let s:fg_base02    = ' ".s:vmode[1]."fg=".s:base02[1] ." ".s:vmode[0]."fg=".s:base02[0] ."'"
    exe "let s:fg_base01    = ' ".s:vmode[1]."fg=".s:base01[1] ." ".s:vmode[0]."fg=".s:base01[0] ."'"
    exe "let s:fg_base00    = ' ".s:vmode[1]."fg=".s:base00[1] ." ".s:vmode[0]."fg=".s:base00[0] ."'"
    exe "let s:fg_base0     = ' ".s:vmode[1]."fg=".s:base0[1]  ." ".s:vmode[0]."fg=".s:base0[0]  ."'"
    exe "let s:fg_base1     = ' ".s:vmode[1]."fg=".s:base1[1]  ." ".s:vmode[0]."fg=".s:base1[0]  ."'"
    exe "let s:fg_base2     = ' ".s:vmode[1]."fg=".s:base2[1]  ." ".s:vmode[0]."fg=".s:base2[0]  ."'"
    exe "let s:fg_base3     = ' ".s:vmode[1]."fg=".s:base3[1]  ." ".s:vmode[0]."fg=".s:base3[0]  ."'"
    exe "let s:fg_green     = ' ".s:vmode[1]."fg=".s:green[1]  ." ".s:vmode[0]."fg=".s:green[0]  ."'"
    exe "let s:fg_yellow    = ' ".s:vmode[1]."fg=".s:yellow[1] ." ".s:vmode[0]."fg=".s:yellow[0] ."'"
    exe "let s:fg_orange    = ' ".s:vmode[1]."fg=".s:orange[1] ." ".s:vmode[0]."fg=".s:orange[0] ."'"
    exe "let s:fg_red       = ' ".s:vmode[1]."fg=".s:red[1]    ." ".s:vmode[0]."fg=".s:red[0]    ."'"
    exe "let s:fg_magenta   = ' ".s:vmode[1]."fg=".s:magenta[1]." ".s:vmode[0]."fg=".s:magenta[0]."'"
    exe "let s:fg_violet    = ' ".s:vmode[1]."fg=".s:violet[1] ." ".s:vmode[0]."fg=".s:violet[0] ."'"
    exe "let s:fg_blue      = ' ".s:vmode[1]."fg=".s:blue[1]   ." ".s:vmode[0]."fg=".s:blue[0]   ."'"
    exe "let s:fg_cyan      = ' ".s:vmode[1]."fg=".s:cyan[1]   ." ".s:vmode[0]."fg=".s:cyan[0]   ."'"

    exe "let s:fmt_none     = ' gui=NONE".        " cterm=NONE".    "'"
    exe "let s:fmt_bold     = ' gui=NONE".s:b.    " cterm=NONE".s:b."'"
    exe "let s:fmt_bldi     = ' gui=NONE".s:b.    " cterm=NONE".s:b."'"
    exe "let s:fmt_undr     = ' gui=NONE".s:u.    " cterm=NONE".s:u."'"
    exe "let s:fmt_undb     = ' gui=NONE".s:u.s:b." cterm=NONE".s:u.s:b."'"
    exe "let s:fmt_undi     = ' gui=NONE".s:u.    " cterm=NONE".s:u."'"
    exe "let s:fmt_uopt     = ' gui=NONE".s:ou.   " cterm=NONE".s:ou."'"
    exe "let s:fmt_curl     = ' gui=NONE".s:c.    " cterm=NONE".s:c."'"
    exe "let s:fmt_ital     = ' gui=NONE".s:i.    " cterm=NONE".s:i."'"
    exe "let s:fmt_stnd     = ' gui=NONE".s:s.    " cterm=NONE".s:s."'"
    exe "let s:fmt_revr     = ' gui=NONE".s:r.    " cterm=NONE".s:r."'"
    exe "let s:fmt_revb     = ' gui=NONE".s:r.s:b." cterm=NONE".s:r.s:b."'"
else
    exe "let s:bg_none      = ' ".s:vmode[0]."bg=".s:none[0]   ."'"
    exe "let s:bg_back      = ' ".s:vmode[0]."bg=".s:back[0]   ."'"
    exe "let s:bg_base03    = ' ".s:vmode[0]."bg=".s:base03[0] ."'"
    exe "let s:bg_base02    = ' ".s:vmode[0]."bg=".s:base02[0] ."'"
    exe "let s:bg_base01    = ' ".s:vmode[0]."bg=".s:base01[0] ."'"
    exe "let s:bg_base00    = ' ".s:vmode[0]."bg=".s:base00[0] ."'"
    exe "let s:bg_base0     = ' ".s:vmode[0]."bg=".s:base0[0]  ."'"
    exe "let s:bg_base1     = ' ".s:vmode[0]."bg=".s:base1[0]  ."'"
    exe "let s:bg_base2     = ' ".s:vmode[0]."bg=".s:base2[0]  ."'"
    exe "let s:bg_base3     = ' ".s:vmode[0]."bg=".s:base3[0]  ."'"
    exe "let s:bg_green     = ' ".s:vmode[0]."bg=".s:green[0]  ."'"
    exe "let s:bg_yellow    = ' ".s:vmode[0]."bg=".s:yellow[0] ."'"
    exe "let s:bg_orange    = ' ".s:vmode[0]."bg=".s:orange[0] ."'"
    exe "let s:bg_red       = ' ".s:vmode[0]."bg=".s:red[0]    ."'"
    exe "let s:bg_magenta   = ' ".s:vmode[0]."bg=".s:magenta[0]."'"
    exe "let s:bg_violet    = ' ".s:vmode[0]."bg=".s:violet[0] ."'"
    exe "let s:bg_blue      = ' ".s:vmode[0]."bg=".s:blue[0]   ."'"
    exe "let s:bg_cyan      = ' ".s:vmode[0]."bg=".s:cyan[0]   ."'"

    exe "let s:fg_none      = ' ".s:vmode[0]."fg=".s:none[0]   ."'"
    exe "let s:fg_back      = ' ".s:vmode[0]."fg=".s:back[0]   ."'"
    exe "let s:fg_base03    = ' ".s:vmode[0]."fg=".s:base03[0] ."'"
    exe "let s:fg_base02    = ' ".s:vmode[0]."fg=".s:base02[0] ."'"
    exe "let s:fg_base01    = ' ".s:vmode[0]."fg=".s:base01[0] ."'"
    exe "let s:fg_base00    = ' ".s:vmode[0]."fg=".s:base00[0] ."'"
    exe "let s:fg_base0     = ' ".s:vmode[0]."fg=".s:base0[0]  ."'"
    exe "let s:fg_base1     = ' ".s:vmode[0]."fg=".s:base1[0]  ."'"
    exe "let s:fg_base2     = ' ".s:vmode[0]."fg=".s:base2[0]  ."'"
    exe "let s:fg_base3     = ' ".s:vmode[0]."fg=".s:base3[0]  ."'"
    exe "let s:fg_green     = ' ".s:vmode[0]."fg=".s:green[0]  ."'"
    exe "let s:fg_yellow    = ' ".s:vmode[0]."fg=".s:yellow[0] ."'"
    exe "let s:fg_orange    = ' ".s:vmode[0]."fg=".s:orange[0] ."'"
    exe "let s:fg_red       = ' ".s:vmode[0]."fg=".s:red[0]    ."'"
    exe "let s:fg_magenta   = ' ".s:vmode[0]."fg=".s:magenta[0]."'"
    exe "let s:fg_violet    = ' ".s:vmode[0]."fg=".s:violet[0] ."'"
    exe "let s:fg_blue      = ' ".s:vmode[0]."fg=".s:blue[0]   ."'"
    exe "let s:fg_cyan      = ' ".s:vmode[0]."fg=".s:cyan[0]   ."'"

    exe "let s:fmt_none     = ' term=NONE".    "'"
    exe "let s:fmt_bold     = ' term=NONE".s:b."'"
    exe "let s:fmt_bldi     = ' term=NONE".s:b."'"
    exe "let s:fmt_undr     = ' term=NONE".s:u."'"
    exe "let s:fmt_undb     = ' term=NONE".s:u.s:b."'"
    exe "let s:fmt_undi     = ' term=NONE".s:u."'"
    exe "let s:fmt_uopt     = ' term=NONE".s:ou."'"
    exe "let s:fmt_curl     = ' term=NONE".s:c."'"
    exe "let s:fmt_ital     = ' term=NONE".s:i."'"
    exe "let s:fmt_stnd     = ' term=NONE".s:s."'"
    exe "let s:fmt_revr     = ' term=NONE".s:r."'"
    exe "let s:fmt_revb     = ' term=NONE".s:r.s:b."'"
endif

" revbb (reverse bold for bright colors) is only set to actual bold in low
" color terminals (t_co=8, such as OS X Terminal.app) and should only be used
" with colors 8-15.
exe "let s:fmt_revbb    = ' ".s:vmode[0]."=NONE".s:r.s:bb.    " term=NONE".s:r.s:bb."'"
exe "let s:fmt_revbbu   = ' ".s:vmode[0]."=NONE".s:r.s:bb.s:u." term=NONE".s:r.s:bb.s:u."'"

if has("gui_running") || has("nvim")
    exe "let s:sp_none      = ' guisp=".s:none[0]   ."'"
    exe "let s:sp_back      = ' guisp=".s:back[0]   ."'"
    exe "let s:sp_base03    = ' guisp=".s:base03[0] ."'"
    exe "let s:sp_base02    = ' guisp=".s:base02[0] ."'"
    exe "let s:sp_base01    = ' guisp=".s:base01[0] ."'"
    exe "let s:sp_base00    = ' guisp=".s:base00[0] ."'"
    exe "let s:sp_base0     = ' guisp=".s:base0[0]  ."'"
    exe "let s:sp_base1     = ' guisp=".s:base1[0]  ."'"
    exe "let s:sp_base2     = ' guisp=".s:base2[0]  ."'"
    exe "let s:sp_base3     = ' guisp=".s:base3[0]  ."'"
    exe "let s:sp_green     = ' guisp=".s:green[0]  ."'"
    exe "let s:sp_yellow    = ' guisp=".s:yellow[0] ."'"
    exe "let s:sp_orange    = ' guisp=".s:orange[0] ."'"
    exe "let s:sp_red       = ' guisp=".s:red[0]    ."'"
    exe "let s:sp_magenta   = ' guisp=".s:magenta[0]."'"
    exe "let s:sp_violet    = ' guisp=".s:violet[0] ."'"
    exe "let s:sp_blue      = ' guisp=".s:blue[0]   ."'"
    exe "let s:sp_cyan      = ' guisp=".s:cyan[0]   ."'"
else
    let s:sp_none      = ""
    let s:sp_back      = ""
    let s:sp_base03    = ""
    let s:sp_base02    = ""
    let s:sp_base01    = ""
    let s:sp_base00    = ""
    let s:sp_base0     = ""
    let s:sp_base1     = ""
    let s:sp_base2     = ""
    let s:sp_base3     = ""
    let s:sp_green     = ""
    let s:sp_yellow    = ""
    let s:sp_orange    = ""
    let s:sp_red       = ""
    let s:sp_magenta   = ""
    let s:sp_violet    = ""
    let s:sp_blue      = ""
    let s:sp_cyan      = ""
endif

"}}}
" Basic highlighting"{{{
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back

exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_none   .s:fg_cyan   .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_bold   .s:fg_blue   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"      .s:fmt_none   .s:fg_green  .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none   .s:fg_orange .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none   .s:fg_yellow .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none   .s:fg_red    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_none   .s:fg_violet .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"          .s:fmt_bold   .s:fg_red    .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_bold   .s:fg_magenta.s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
"}}}
" Extended highlighting "{{{
" ---------------------------------------------------------------------
if      (g:solarized_visibility=="high")
    exe "hi! SpecialKey" .s:fmt_revr   .s:fg_red    .s:bg_none
    exe "hi! NonText"    .s:fmt_bold   .s:fg_red    .s:bg_none
elseif  (g:solarized_visibility=="low")
    exe "hi! SpecialKey" .s:fmt_bold   .s:fg_base02 .s:bg_none
    exe "hi! NonText"    .s:fmt_bold   .s:fg_base02 .s:bg_none
else
    exe "hi! SpecialKey" .s:fmt_bold   .s:fg_base00 .s:bg_base02
    exe "hi! NonText"    .s:fmt_bold   .s:fg_base00 .s:bg_none
endif
exe "hi! StatusLine"     .s:fmt_none   .s:fg_base1  .s:bg_base02 .s:fmt_revbb
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base00 .s:bg_base02 .s:fmt_revbb
exe "hi! Visual"         .s:fmt_none   .s:fg_base01 .s:bg_base03 .s:fmt_revbb
exe "hi! Directory"      .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base02
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
if ( (has("gui_running") || has("nvim")) || &t_Co > 8 )
    exe "hi! VertSplit"  .s:fmt_none   .s:fg_base00 .s:bg_base00
else
    exe "hi! VertSplit"  .s:fmt_revbb  .s:fg_base00 .s:bg_base02
endif
exe "hi! Title"          .s:fmt_bold   .s:fg_orange .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revbb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revbb
exe "hi! Folded"         .s:fmt_undb   .s:fg_base0  .s:bg_base02  .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02
if      (g:solarized_diffmode=="high")
exe "hi! DiffAdd"        .s:fmt_revr   .s:fg_green  .s:bg_none
exe "hi! DiffChange"     .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! DiffDelete"     .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! DiffText"       .s:fmt_revr   .s:fg_blue   .s:bg_none
elseif  (g:solarized_diffmode=="low")
exe "hi! DiffAdd"        .s:fmt_undr   .s:fg_green  .s:bg_none   .s:sp_green
exe "hi! DiffChange"     .s:fmt_undr   .s:fg_yellow .s:bg_none   .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! DiffText"       .s:fmt_undr   .s:fg_blue   .s:bg_none   .s:sp_blue
else " normal
    if (has("gui_running") || has("nvim"))
exe "hi! DiffAdd"        .s:fmt_bold   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_bold   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_base02
exe "hi! DiffText"       .s:fmt_bold   .s:fg_blue   .s:bg_base02 .s:sp_blue
    else
exe "hi! DiffAdd"        .s:fmt_none   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_none   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_none   .s:fg_red    .s:bg_base02
exe "hi! DiffText"       .s:fmt_none   .s:fg_blue   .s:bg_base02 .s:sp_blue
    endif
endif
hi! link SignColumn LineNr
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revbb
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revbb
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revbb
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revbb
exe "hi! TabLine"        .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineFill"    .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineSel"     .s:fmt_undr   .s:fg_base01 .s:bg_base2   .s:sp_base0  .s:fmt_revbbu
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! CursorLineNr"   .s:fmt_bold   .s:fg_magenta.s:bg_base03
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_bold   .s:fg_red    .s:bg_base01

"}}}
" vim syntax highlighting "{{{
" ---------------------------------------------------------------------
"exe "hi! vimLineComment" . s:fg_base01 .s:bg_none   .s:fmt_ital
"hi! link vimComment Comment
"hi! link vimLineComment Comment
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
exe "hi! vimCommentString"  .s:fmt_none    .s:fg_violet .s:bg_none
exe "hi! vimCommand"        .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimCmdSep"         .s:fmt_bold    .s:fg_blue   .s:bg_none
exe "hi! helpExample"       .s:fmt_none    .s:fg_base1  .s:bg_none
exe "hi! helpOption"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! helpNote"          .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpVim"           .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpHyperTextJump" .s:fmt_undr    .s:fg_blue   .s:bg_none
exe "hi! helpHyperTextEntry".s:fmt_none    .s:fg_green  .s:bg_none
exe "hi! vimIsCommand"      .s:fmt_none    .s:fg_base00 .s:bg_none
exe "hi! vimSynMtchOpt"     .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimSynType"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! vimHiLink"         .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimHiGroup"        .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimGroup"          .s:fmt_undb    .s:fg_blue   .s:bg_none
"}}}
" diff highlighting "{{{
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Identifier
"}}}
" git & gitcommit highlighting "{{{
"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"
exe "hi! gitcommitComment"      .s:fmt_ital     .s:fg_base01    .s:bg_none
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe "hi! gitcommitUnmerged"     .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitOnBranch"     .s:fmt_bold     .s:fg_base01    .s:bg_none
exe "hi! gitcommitBranch"       .s:fmt_bold     .s:fg_magenta   .s:bg_none
hi! link gitcommitNoBranch gitcommitBranch
exe "hi! gitcommitDiscardedType".s:fmt_none     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedType" .s:fmt_none     .s:fg_green     .s:bg_none
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
exe "hi! gitcommitHeader"       .s:fmt_none     .s:fg_base01    .s:bg_none
exe "hi! gitcommitUntrackedFile".s:fmt_bold     .s:fg_cyan      .s:bg_none
exe "hi! gitcommitDiscardedFile".s:fmt_bold     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedFile" .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitUnmergedFile" .s:fmt_bold     .s:fg_yellow    .s:bg_none
exe "hi! gitcommitFile"         .s:fmt_bold     .s:fg_base0     .s:bg_none
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"
" }}}
" html highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! htmlTag"           .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlEndTag"        .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlTagN"          .s:fmt_bold .s:fg_base1  .s:bg_none
exe "hi! htmlTagName"       .s:fmt_bold .s:fg_blue   .s:bg_none
exe "hi! htmlSpecialTagName".s:fmt_ital .s:fg_blue   .s:bg_none
exe "hi! htmlArg"           .s:fmt_none .s:fg_base00 .s:bg_none
exe "hi! javaScript"        .s:fmt_none .s:fg_yellow .s:bg_none
"}}}
" perl highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! perlHereDoc"    . s:fg_base1  .s:bg_back   .s:fmt_none
exe "hi! perlVarPlain"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! perlStatementFileDesc". s:fg_cyan.s:bg_back.s:fmt_none

"}}}
" tex highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! texStatement"   . s:fg_cyan   .s:bg_back   .s:fmt_none
exe "hi! texMathZoneX"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texRefLabel"    . s:fg_yellow .s:bg_back   .s:fmt_none
"}}}
" ruby highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! rubyDefine"     . s:fg_base1  .s:bg_back   .s:fmt_bold
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi! link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

"hi! link rubyClass             Keyword
"hi! link rubyModule            Keyword
"hi! link rubyKeyword           Keyword
"hi! link rubyOperator          Operator
"hi! link rubyIdentifier        Identifier
"hi! link rubyInstanceVariable  Identifier
"hi! link rubyGlobalVariable    Identifier
"hi! link rubyClassVariable     Identifier
"hi! link rubyConstant          Type
"}}}
" haskell syntax highlighting"{{{
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters=1

exe "hi! cPreCondit". s:fg_orange.s:bg_none   .s:fmt_none

exe "hi! VarId"    . s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! ConId"    . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsImport" . s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! hsString" . s:fg_base00 .s:bg_none   .s:fmt_none

exe "hi! hsStructure"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_hlFunctionName"  . s:fg_blue   .s:bg_none
exe "hi! hsStatement"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsImportLabel"      . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_OpFunctionName"  . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hs_DeclareFunction" . s:fg_orange .s:bg_none   .s:fmt_none
exe "hi! hsVarSym"           . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsType"             . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsTypedef"          . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsModuleName"       . s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! hsModuleStartLabel" . s:fg_magenta.s:bg_none   .s:fmt_none
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
exe "hi! hsNiceOperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsniceoperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none

"}}}
" pandoc markdown syntax highlighting "{{{
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
exe "hi! pandocTitleBlock"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocTitleBlockTitle"          .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocTitleComment"             .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocComment"                  .s:fg_base01 .s:bg_none   .s:fmt_ital
exe "hi! pandocVerbatimBlock"            .s:fg_yellow .s:bg_none   .s:fmt_none
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
exe "hi! pandocBlockQuote"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader1"        .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader2"        .s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader3"        .s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader4"        .s:fg_red    .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader5"        .s:fg_base0  .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader6"        .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocListMarker"               .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocListReference"            .s:fg_magenta.s:bg_none   .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_violet
exe "hi! pandocDefinitionBlock"              .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocDefinitionTerm"               .s:fg_pdef  .s:bg_none  .s:fmt_stnd
exe "hi! pandocDefinitionIndctr"             .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocEmphasisDefinition"           .s:fg_pdef  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedDefinition"   .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisDefinition" .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptDefinition"        .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
exe "hi! pandocTable"                        .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocTableStructure"               .s:fg_ptable.s:bg_none  .s:fmt_none
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
exe "hi! pandocTableZebraLight"              .s:fg_ptable.s:bg_base03.s:fmt_none
exe "hi! pandocTableZebraDark"               .s:fg_ptable.s:bg_base02.s:fmt_none
exe "hi! pandocEmphasisTable"                .s:fg_ptable.s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedTable"          .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisTable"          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedTable"    .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisTable"  .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeoutTable"               .s:fg_ptable.s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineTable"          .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptTable"             .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptTable"               .s:fg_ptable.s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_orange
exe "hi! pandocHeading"                      .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocHeadingMarker"                .s:fg_yellow.s:bg_none.s:fmt_bold
exe "hi! pandocEmphasisHeading"              .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocEmphasisNestedHeading"        .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocStrongEmphasisNestedHeading"  .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisHeading".s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutHeading"             .s:fg_phead .s:bg_none.s:fmt_revr
exe "hi! pandocVerbatimInlineHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSuperscriptHeading"           .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSubscriptHeading"             .s:fg_phead .s:bg_none.s:fmt_bold

" Links
" ---------------------------------------------------------------------
exe "hi! pandocLinkDelim"                .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocLinkLabel"                .s:fg_blue   .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkText"                 .s:fg_blue   .s:bg_none   .s:fmt_undb
exe "hi! pandocLinkURL"                  .s:fg_base00 .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkTitle"                .s:fg_base00 .s:bg_none   .s:fmt_undi
exe "hi! pandocLinkTitleDelim"           .s:fg_base01 .s:bg_none   .s:fmt_undi   .s:sp_base00
exe "hi! pandocLinkDefinition"           .s:fg_cyan   .s:bg_none   .s:fmt_undr   .s:sp_base00
exe "hi! pandocLinkDefinitionID"         .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocImageCaption"             .s:fg_violet .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnoteLink"             .s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! pandocFootnoteDefLink"          .s:fg_green  .s:bg_none   .s:fmt_bold
exe "hi! pandocFootnoteInline"           .s:fg_green  .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnote"                 .s:fg_green  .s:bg_none   .s:fmt_none
exe "hi! pandocCitationDelim"            .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitation"                 .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitationID"               .s:fg_magenta.s:bg_none   .s:fmt_undr
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
exe "hi! pandocStyleDelim"               .s:fg_base01 .s:bg_none  .s:fmt_none
exe "hi! pandocEmphasis"                 .s:fg_base0  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNested"           .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasis"           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNested"     .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasis"   .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeout"                .s:fg_base01 .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInline"           .s:fg_yellow .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscript"              .s:fg_violet .s:bg_none  .s:fmt_none
exe "hi! pandocSubscript"                .s:fg_violet .s:bg_none  .s:fmt_none

exe "hi! pandocRule"                     .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocRuleLine"                 .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocEscapePair"               .s:fg_red    .s:bg_none  .s:fmt_bold
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocNonBreakingSpace"         . s:fg_red   .s:bg_none  .s:fmt_revr
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
exe "hi! pandocMetadataDelim"            .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadataKey"              .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_bold
hi! link pandocMetadataTitle             pandocMetadata

"}}}
" Highlight Trailing Space {{{
" Experimental: Different highlight when on cursorline
function! s:SolarizedHiTrail()
    if g:solarized_hitrail==0
        hi! clear solarizedTrailingSpace
    else
        syn match solarizedTrailingSpace "\s*$"
        exe "hi! solarizedTrailingSpace " .s:fmt_undr .s:fg_red .s:bg_none .s:sp_red
    endif
endfunction
augroup SolarizedHiTrail
    autocmd!
    if g:solarized_hitrail==1
        autocmd! Syntax * call s:SolarizedHiTrail()
        autocmd! ColorScheme * if g:colors_name == "solarized" | call s:SolarizedHiTrail() | else | augroup! s:SolarizedHiTrail | endif
    endif
augroup END
" }}}
" Menus "{{{
" ---------------------------------------------------------------------
" Turn off Solarized menu by including the following assignment in your .vimrc:
"
"    let g:solarized_menu=0

function! s:SolarizedOptions()
    new "new buffer
    setf vim "vim filetype
    let failed = append(0, s:defaults_list)
    let failed = append(0, s:colorscheme_list)
    let failed = append(0, s:options_list)
    let failed = append(0, s:lazycat_list)
    0 "jump back to the top
endfunction
if !exists(":SolarizedOptions")
    command SolarizedOptions :call s:SolarizedOptions()
endif

function! SolarizedMenu()
    if exists("g:loaded_solarized_menu")
        try
            silent! aunmenu Solarized
        endtry
    endif
    let g:loaded_solarized_menu = 1

    if g:colors_name == "solarized" && g:solarized_menu != 0

        amenu &Solarized.&Contrast.&Low\ Contrast        :let g:solarized_contrast="low"       \| colorscheme solarized<CR>
        amenu &Solarized.&Contrast.&Normal\ Contrast     :let g:solarized_contrast="normal"    \| colorscheme solarized<CR>
        amenu &Solarized.&Contrast.&High\ Contrast       :let g:solarized_contrast="high"      \| colorscheme solarized<CR>
        an    &Solarized.&Contrast.-sep-                 <Nop>
        amenu &Solarized.&Contrast.&Help:\ Contrast      :help 'solarized_contrast'<CR>

        amenu &Solarized.&Visibility.&Low\ Visibility    :let g:solarized_visibility="low"     \| colorscheme solarized<CR>
        amenu &Solarized.&Visibility.&Normal\ Visibility :let g:solarized_visibility="normal"  \| colorscheme solarized<CR>
        amenu &Solarized.&Visibility.&High\ Visibility   :let g:solarized_visibility="high"    \| colorscheme solarized<CR>
        an    &Solarized.&Visibility.-sep-                 <Nop>
        amenu &Solarized.&Visibility.&Help:\ Visibility    :help 'solarized_visibility'<CR>

        amenu &Solarized.&Background.&Toggle\ Background :ToggleBG<CR>
        amenu &Solarized.&Background.&Dark\ Background   :set background=dark  \| colorscheme solarized<CR>
        amenu &Solarized.&Background.&Light\ Background  :set background=light \| colorscheme solarized<CR>
        an    &Solarized.&Background.-sep-               <Nop>
        amenu &Solarized.&Background.&Help:\ ToggleBG     :help togglebg<CR>

        if g:solarized_bold==0 | let l:boldswitch="On" | else | let l:boldswitch="Off" | endif
        exe "amenu &Solarized.&Styling.&Turn\\ Bold\\ ".l:boldswitch." :let g:solarized_bold=(abs(g:solarized_bold-1)) \\| colorscheme solarized<CR>"
        if g:solarized_italic==0 | let l:italicswitch="On" | else | let l:italicswitch="Off" | endif
        exe "amenu &Solarized.&Styling.&Turn\\ Italic\\ ".l:italicswitch." :let g:solarized_italic=(abs(g:solarized_italic-1)) \\| colorscheme solarized<CR>"
        if g:solarized_underline==0 | let l:underlineswitch="On" | else | let l:underlineswitch="Off" | endif
        exe "amenu &Solarized.&Styling.&Turn\\ Underline\\ ".l:underlineswitch." :let g:solarized_underline=(abs(g:solarized_underline-1)) \\| colorscheme solarized<CR>"

        amenu &Solarized.&Diff\ Mode.&Low\ Diff\ Mode    :let g:solarized_diffmode="low"     \| colorscheme solarized<CR>
        amenu &Solarized.&Diff\ Mode.&Normal\ Diff\ Mode :let g:solarized_diffmode="normal"  \| colorscheme solarized<CR>
        amenu &Solarized.&Diff\ Mode.&High\ Diff\ Mode   :let g:solarized_diffmode="high"    \| colorscheme solarized<CR>

        if g:solarized_hitrail==0 | let l:hitrailswitch="On" | else | let l:hitrailswitch="Off" | endif
        exe "amenu &Solarized.&Experimental.&Turn\\ Highlight\\ Trailing\\ Spaces\\ ".l:hitrailswitch." :let g:solarized_hitrail=(abs(g:solarized_hitrail-1)) \\| colorscheme solarized<CR>"
        an    &Solarized.&Experimental.-sep-               <Nop>
        amenu &Solarized.&Experimental.&Help:\ HiTrail    :help 'solarized_hitrail'<CR>

        an    &Solarized.-sep1-                          <Nop>

        amenu &Solarized.&Autogenerate\ options          :SolarizedOptions<CR>

        an    &Solarized.-sep2-                          <Nop>

        amenu &Solarized.&Help.&Solarized\ Help          :help solarized<CR>
        amenu &Solarized.&Help.&Toggle\ Background\ Help :help togglebg<CR>
        amenu &Solarized.&Help.&Removing\ This\ Menu     :help solarized-menu<CR>

        an 9999.77 &Help.&Solarized\ Colorscheme         :help solarized<CR>
        an 9999.78 &Help.&Toggle\ Background             :help togglebg<CR>
        an 9999.79 &Help.-sep3-                          <Nop>

    endif
endfunction

autocmd ColorScheme * if g:colors_name != "solarized" | silent! aunmenu Solarized | else | call SolarizedMenu() | endif

"}}}
" License "{{{
" ---------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim:foldmethod=marker:foldlevel=0
"}}}
