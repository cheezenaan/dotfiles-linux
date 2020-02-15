# General
alias cp 'cp -v'
alias mv 'mv -v'
alias mkdir 'mkdir -p'
alias ls 'ls -G' # Enable '-G' option only in Mac
alias la 'ls -la'

# Git
# ref. https://github.com/sorin-ionescu/prezto/blob/master/modules/git/alias.zsh
alias gcob 'git checkout -b'
alias gcom 'git checkout master'

## Branch (b)
alias gb 'git branch'
alias gba 'git branch --all --verbose'
alias gbc 'git checkout -b'
alias gbm 'git branch --move'
alias gbl 'git branch --verbose'

## Commit (c)
alias gc 'git commit --verbose'
alias gcm 'git commit --message'
alias gco 'git checkout'
alias gcf 'git commit --amend --reuse-message HEAD'
alias gcF 'git commit --verbose --amend'
alias gcp 'git cherry-pick --ff'
alias gcP 'git cherry-pick --no-commit'
alias gcr 'git revert'
alias gcy 'git cherry -v --abbrev'
alias gcY 'git cherry -v'

## Fetch (f)
alias gf 'git fetch'
alias gfa 'git fetch --all'
alias gfc 'git clone'
alias gfcr 'git clone --recurse-submodules'
alias gfm 'git pull'
alias gfr 'git pull --rebase'

## Merge (m)
alias gm 'git merge'
alias gmC 'git merge --no-commit'
alias gmF 'git merge --no-ff'
alias gma 'git merge --abort'
alias gmt 'git mergetool'

## Push (p)
alias gp 'git push'
alias gpf 'git push --force-with-lease'
alias gpt 'git push --tags'
alias gpp 'git pull origin @{u} ; and git push origin HEAD'

# Rebase (r)
alias gr 'git rebase'
alias gra 'git rebase --abort'
alias grc 'git rebase --continue'
alias gri 'git rebase --interactive'
alias grs 'git rebase --skip'

## Stash (s)
alias gs 'git stash'
alias gsl 'git stash list'
alias gsp 'git stash pop'

## Tag (t)
alias gt 'git tag'
alias gtl 'git tag -l'

## Working Copy (w)
alias gwd 'git diff --no-ext-diff'
alias gwr 'git reset --soft'
alias gwR 'git reset --hard'
alias gwc 'git clean -n'
alias gwC 'git clean -f'

## tig
if which tig >/dev/null
  alias ts 'tig status'
end

# Docker
alias d 'docker'
alias dc 'docker-compose'

# Like OS X
if [ (uname) = "Linux" ]
  alias pbcopy="xsel --clipboard --input"
  alias pbpaste="xsel --clipboard --output"
  alias time='time -p'
  alias code="code -r"
end
