# Vim cheatsheet

<!-- TOC GFM -->

* [Modes](#modes)
* [Operators](#operators)
* [Commands](#commands)
* [Motions](#motions)
  * [Marks](#marks)
  * [Registers](#registers)
* [Special](#special)
  * [Undo, redo and repeat](#undo-redo-and-repeat)
* [Splits and Tabs](#splits-and-tabs)
* [Folds](#folds)
* [Search](#search)
  * [Regex replace](#regex-replace)
* [Macros](#macros)
* [Plugin Management](#plugin-management)
* [Checking](#checking)
  * [Spell checking](#spell-checking)
  * [Syntax checking](#syntax-checking)
* [Version control](#version-control)
  * [Vimdiff](#vimdiff)
  * [Git](#git)
* [Browse files](#browse-files)
* [Organization](#organization)
* [Misc](#misc)
  * [Fuzzy finder](#fuzzy-finder)
  * [REPL](#repl)
  * [Markdown](#markdown)
  * [Tabularize](#tabularize)
    * [Usage](#usage)
    * [Patterns](#patterns)
* [Scripts](#scripts)
* [Learning](#learning)
* [See also](#see-also)

<!-- /TOC -->

## Modes
| key | mode         |
| --- | ---          |
| :   | command mode |
| i   | insert mode  |
| v   | visual mode  |
| ESC | return       |

## Operators
| operator | behavior                            |
| ---      | ---                                 |
| a        | append                              |
| A        | append to end of line               |
| I        | append to start of line             |
| c        | copy extents of next motion         |
| C        | copy and insert after cursor        |
| ci{[{(}  | copy the inner-bracket contents     |
| y        | yawk (copy without deleting)        |
| x        | delete char                         |
| X        | delete line                         |
| d        | delete extennts of next motion      |
| dd       | delete line                         |
| dw       | delete until next word              |
| d0 or d^ | delete until start of line          |
| D or d$  | delete until end of line            |
| o        | insert line bellow cursor           |
| O        | insert line above cursor            |
| p        | paste before                        |
| P        | paste after                         |
| s        | substitute (delete and insert) char |
| S        | substitute line                     |
| v        | select char                         |
| V        | select line                         |

*Operators have different behaviors for each mode but in most cases they are similar between normal and visual mode.*

*All deletions copy to register.*

## Commands
| commands       | behavior                                     |
| ---            | ---                                          |
| :q             | quit                                         |
| :q! or ZQ      | quit without saving                          |
| :wq or ZZ      | save and quit                                |
| :wqa           | save and quit all                            |
| :w             | save                                         |
| :r             | read from file                               |
| :r!            | read from command                            |
| :so            | execute a file                               |
| @              | executes the register                        |
| ! (bang)       | execute commands                             |
| ...! (ex-bang) | execute commands                             |
| 20,30!sort     | sort in-place lines 20 to 30                 |
| gww            | format a paragraph (textwidth=79 by default) |
| guu            | make lowercase                               |
| gU             | make uppercase                               |
| g??            | ROT13 encoding                               |

*Bang and ex-bang read the results into the current text and can filter selections.* 

## Motions
| motion            | jumps to                                                        |
| ---               | ---                                                             |
| f<char>           | go to next ocorrence of that char                               |
| gg                | jump to beginning                                               |
| G                 | jump to end                                                     |
| h, l, j, k        | left, right, down up                                            |
| n{h,j,k,l}        | n lines/chars to direction                                      |
| {+, -}n           | n lines up/down                                                 |
| nG                | to specific line                                                |
| shift{left,right} | between words first char                                        |
| w and b           | between words last char                                         |
| e                 | end of word                                                     |
| ( and )           | between sentences                                               |
| { and }           | between paragraphs                                              |
| [ and ]           | between sections                                                |
| n<space>          | n characters                                                    |
| n<CR>             | n lines                                                         |
| ^                 | first non-blank character                                       |
| $                 | end of line                                                     |
| {H,M,L}           | top, middle and bottom of screen                                |
| {zt,zz,zb}        | top, middle and bottom of screen (scroll without moving cursor) |
| '.                | last changed line                                               |
| ''                | restore-position                                                |
| %                 | corresponding (eg. brace to brace)                              |
| / or ?<string>    | next or previous ocurrence of string                            |

### Marks
| sequence | behavior                                      |
| ---      | ---                                           |
| m[a-Z]   | set up a mark in the cursor position          |
| y'[a-]Z  | yank at mark position (could be any movement) |
| '[a-Z]   | jump to mark line beginning                   |

*' and \` have similar behaviors, but the first jumps to beginning of line while the later go to cursor position.*

### Registers
| sequence   | behavior                                  |
| ---        | ---                                       |
| "[a-Z]verb | store/read from different memory register |

## Special
- `+`   start vi/vim at a specific line and can be used with expressions.
- `vi +'/foo/d|wq!' ~/.ssh/known_hosts` remove an entry from SSH know hosts

### Undo, redo and repeat
| command | behavior                |
| ---     | ---                     |
| u       | undo                    |
| C^R     | redo                    |
| .       | repeats last change     |
| @:      | repeats last command    |

## Splits and Tabs
| action      | behavior                         |
| ---         | ---                              |
| :sp         | open horizontal split            |
| :vsp        | open vertical split              |
| :tabnew     | open new tab                     |
| C^{h,j,k,l} | navigate between splits (custom) |
| C^w{+-=}    | resize splits                    |
| C^wT        | convert split to tab             |
| gt          | switch between tabs              |


## Folds
| action | behavior              |
| ---    | ---                   |
| zf     | create fold           |
| zd     | delete fold           |
| zo     | open fold             |
| zc     | close fold            |
| za     | toggle fold           |
| zO     | open all under cursor |
| zR     | open all              |

## Search
| action | behavior        |
| ---    | ---             |
| \      | search          |
| n or * | next result     |
| N or # | previous result |

### Regex replace
- one line:          `:s/foo/bar/g`
- all lines:         `:%s/foo/bar/g`
- specific lines:    `:1,10s/foo/bar/g`
- specific markers:  `:'b,'ds/foo/bar/g`
- global:            `:%g/foo/s/bar/zzz/g` (in every line containing 'foo' substitute 'bar' by 'zzz')
- converse-global:   `:%v/foo/s/bar/zzz/g` (in every line not containing)
- from shell:        `vim -c '%s/orig-pattern/new-pattern/gc' filename.txt`

*To replace with new lines use `\r` instead of `\n`. Substituting by `\n` inserts a null character into the text while `\r` inserts a new line by inputting a carriage return. When searching for a newline, you’d still use `\n`, however.*

[Tutorial: search and replace](https://vim.fandom.com/wiki/Search_and_replace)

## Macros
| action | behavior                      |
| qx     | start recording to register x |
| q      | stop recording                |
| @x     | execute macro recorded at x   |
| @@     | execute last macro            |

## Plugin Management
[Plug](https://github.com/junegunn/vim-plug)

## Checking
### Spell checking
- \en      toggle spell checking for english (custom)
- \pt      toggle spell checking for portuguese (custom)

*note: red are errors while cyan are wrong regionalisms.*
*eg: behavior is correct in en-us while en-gb uses behaviour.*

Toggle for specific language:
`setlocal spell spellang=en_us`

### Syntax checking
[ALE](https://github.com/dense-analysis/ale) stands for Asynchronous Lite Engine
- C^b   jump to previous linting warning
- C^e   jump to next linting warning

Ale uses whatever is installed in the system.
Check [ale/supported-tools.md](https://github.com/dense-analysis/ale/blob/master/supported-tools.md).

## Version control
### Vimdiff
| action            | behavior             |
| ---               | ---                  |
| do                | get chunk of changes |
| dp                | put chunk of changes |
| :diffget LO or dh | get from LOCAL       |
| :diffget BA       | get from BASE        |
| :diffget RE or dl | get from REMOTE      |

Use vimdiff to solver merge conflicts:
```sh
git mergetool --prompt -t nvimdiff
```

- It will stage file on close and without `prompt` will open a new file automatically until all are reviewed
- Use `:cquit` to abort
- To exit normally use `:wqa`

### Git
Conflict resolution w/ [Fugitive](https://github.com/tpope/vim-fugitive)

| action         | behavior                                               |
| ---            | ---                                                    |
| ]c             | jump to next hunk                                      |
| [c             | jump to previous hunk                                  |
| :Gvdiffsplit!  | open target, working and merge in a three-splited view |
| :diffget //2   | use chunk from the left buffer at working              |
| :diffget //3   | use chunk from the right buffer at working             |
| :diffput or dp | put chunk on working (fugitive)                        |
| :only          | close all windows apart from the current one           |
| :Gwrite or Gw  | stage the selected buffer entirely                     |

[Tutorial: Resolving git conflicts with fugitive](http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff)

Flow w/ [Git Gutter](https://github.com/airblade/vim-gitgutter)

| action | behavior                      |
| -      | -                             |
| \hs    | hunk stage                    |
| \hu    | hunk unstage                  |
| \hp    | hunk preview                  |
| \hl    | toggle line highlight         |
| \hm    | browse commit messages        |
| ic     | operates on all lines of hunk |

Commit exploring w/ [Git Messenger](https://github.com/rhysd/git-messenger.vim)

| action | behavior                                                  |
| -      | -                                                         |
| \hm    | show window                                               |
| q      | close window                                              |
| o      | older commit in line                                      |
| O      | newer commit in line                                      |
| d      | toggle unified diff hunks only in current file            |
| D      | toggle all unified diff hunks of the commit               |
| r      | toggle word diff hunks only in current file of the commit |
| R      | toggle all word diff hunks of current commit              |
| ?      | show mappings help                                        |

## Browse files
[Vinegar](https://github.com/tpope/vim-vinegar) improves Netrw, Vim bultin file browser. 

## Organization
- `ftplugin/language.vim:` language specific configuration
- `ftplugin/language/*.vim:` language specific multi-configuration
- `after/*`: applied after vimrc and plugins

## Misc
### Fuzzy finder
[fzf](https://github.com/junegunn/fzf.vim)

| action | behavior            |
| ---    | ---                 |
| \F     | find files          |
| \fw    | find windows        |
| \fc    | find buffer commits |
| \fC    | find commits        |
| \fs    | find snippets       |

### REPL
[Codi](https://github.com/metakirby5/codi.vim)
- \c    enable REPL
- \C    disable REPL

### Markdown 
[Preview](https://github.com/iamcco/markdown-preview)
\p       start preview
\P       close preview

[TOC](https://github.com/mzlogin/vim-markdown-toc)
\t       generate table of contents

### Tabularize
[Tabular](https://github.com/godlygeek/tabular) is a script for text alignment.

#### Usage
`:Tabularize /$1 /$2`

Where `$1` is the place holder string and `$2` format options lke l1c1r1 where l, r, c are
left, right and center and the numbers refers to desired whitespaces for each.

When invoked without selection will consider the paragraph as its scope.

`\zs` is the zero-width ‘pattern start’ search atom. I don't know exactly what it does but when used as `:Tabularize:\zs` it will use `:` as delimiter but not space it.

#### Patterns
- Save: `:AddTabularPattern first_comma /^[^,]\zs,/r0c0l0`
- Invoke: `:Tabularize first_comma` 

Check its [documentation](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt).

## Scripts
While using maps beware of the danger of recursion. Always use noremaps.

## Learning
- [Exercism: vim resources](https://exercism.io/tracks/vimscript/resources)
- [vim-adventures](https://vim-adventures.com)
- [VimGolf](https://www.vimgolf.com/)
- [User levels](https://whileimautomaton.net/2008/11/vimm3/operator)
- [Learn Vimscript the hard way](https://learnvimscriptthehardway.stevelosh.com/)
- [Your problem with Vim is that you don't grok vi](https://stackoverflow.com/questions/1218390#1220118)
- [Browsing programs with vim](https://vim.fandom.com/wiki/Browsing_programs_with_tags)

## See also
- [Galore](https://github.com/mhinz/vim-galore): everything you need to know about vim
- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb): browser plugin
- [onivim](https://github.com/onivim): code editor powered by libvim
- [fern](https://github.com/lambdalisue/fern.vim): async tree viewer for vim
- [deoplete](https://github.com/Shougo/deoplete.nvim): completion framework
- [ale](https://github.com/dense-analysis/ale): language server protocol
- [papercolor](https://github.com/NLKNguyen/papercolor-theme): color schemes inspired by material, good readability
- [coc](https://github.com/neoclide/coc.nvim): load extensions from VSCode
- [command-t](https://github.com/wincent/command-t): fastest fuzzy finder
- [vim-dadbod](https://github.com/tpope/vim-dadbod): interact with databases
- [vimscript cheatsheet](https://devhints.io/vimscript)
