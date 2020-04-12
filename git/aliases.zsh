# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gloc='git ls-files | xargs wc -l'
alias resetorigin='!git fetch origin && git reset --hard origin/master && git clean -f -d'
alias gbnf='g newf'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# alias gc='git commit'
# alias gca='git commit -a'
alias gcdv='git checkout devel'
# alias gcb='git copy-branch-name'
# alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.

alias gpnv='git push --no-verify'
# alias gac='git add -A && git commit -m'
# alias ge='git-edit-new'
alias gignore="git config --global alias.assume-unchanged 'update-index --assume-unchanged'"
alias gunignore="git config --global alias.assume-changed 'update-index --no-assume-unchanged'"
alias gnb="g newb"
