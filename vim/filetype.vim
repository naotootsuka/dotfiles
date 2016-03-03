augroup filetypedetect
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.html set filetype=htmljinja
    au BufRead,BufNewFile *.js setfiletype javascript
    au BufRead,BufNewFile *.md set filetype=markdown
augroup END
