let s:data_dir = '~/.local/share/nvim'
let s:jetpackfile = s:data_dir . '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"

if empty(glob(s:jetpackfile))
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack

call jetpack#begin()
Jetpack 'tani/vim-jetpack', { 'opt': 1 }      
Jetpack 'cocopon/iceberg.vim'
Jetpack 'itchyny/lightline.vim'
Jetpack 'junegunn/fzf', { 'do': { -> fzf#install() } }
Jetpack 'junegunn/fzf.vim'
call jetpack#end()

" Install plugins if not existed
for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor
