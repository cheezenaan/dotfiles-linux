# anyenv
set PATH $HOME/.anyenv/bin $PATH

if [ ! -e $HOME/__anyenv_init ]
  anyenv init --no-rehash - fish > $HOME/__anyenv_init
end
source $HOME/__anyenv_init

# golang
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

# Remove redundant paths
set PATH (echo $PATH | tr ' ' '\n' | sort -u)

