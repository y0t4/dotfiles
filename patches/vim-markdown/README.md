"indent.patch" is patch file.
If you apply this patch, the indentation setting of markdown is possible.

# Usage
Run following command.

## If you want to apply the patch
$ patch ~/.vim/bundle/vim-markdown/indent/mkd.vim indent.patch

## If you want to reverse patch
$ patch -R ~/.vim/bundle/vim-markdown/indent/mkd.vim indent.patch

# Options
## Disable increase indent
Add the following line to your .vimrc to disable increase indent.
`let g:vim_markdown_auto_increase_indent_disabled=1`

## Setting indent width
Add the following line to your .vimrc to set indent width.
The option defaults to 4.
`let g:vim_markdown_indent_width=2`
