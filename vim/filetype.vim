au BufNewFile,BufRead *.groovy  setf groovy 
au BufNewFile,BufRead *.gradle setf groovy

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

