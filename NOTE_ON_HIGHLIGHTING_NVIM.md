## Who controls highlighting?
nvim-tresitter

## How to configure Highlighting?
We have to write lua specific code in our init.vim and provide the tag/names + the color we want.
Eg: Color the built-in types with color 202
Color list: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
```
lua << EOF

vim.cmd[[hi @type.builtin guifg=#fcba03 ctermfg=188]]

EOF
```

## How to know what colors are already applied to what?

- Approach 1: Check the whole list with ':hi' command
- Approach 2: If can't find a name then install the 'nvim-treesitter/playground' plugin, then keep cursor at the word and enter command:
```
:TSHighlightCapturesUnderCursor
```

That will give the name like '@type.builtin' for which you can then change the color.

References: 
- https://www.reddit.com/r/neovim/comments/p4f6di/treesitter_and_language_highlighting/
