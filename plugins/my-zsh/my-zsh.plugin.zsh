# Git version checking
autoload -Uz is-at-least
git_version="${${(As: :)$(git version 2>/dev/null)}[3]}"

# 当前分支
function current_branch() {
  git_current_branch
}
# 主分支
function git_main_branch() {
  if [[ -n "$(git branch --list main)" ]]; then
    echo main
  else
    echo master
  fi
}
# 重命名
function grename() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 old_branch new_branch"
    return 1
  fi

  # Rename branch locally
  git branch -m "$1" "$2"
  # Rename branch in origin remote
  if git push origin :"$1"; then
    git push --set-upstream origin "$2"
  fi
}

alias g='git'

alias ga='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gc='git commit -v'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gf='git fetch'
alias gfo='git fetch origin'


alias gph='git push'
alias gpl='git pull'
alias gpho='git push origin'
alias gplo='git pull origin'
alias gplc='git pull origin "$(git_current_branch)"'
alias gphc='git push origin "$(git_current_branch)"'

alias gh='git help'

alias glg='git log --stat'

alias gm='git merge'
alias gmo='git merge origin'
alias gmom='git merge origin/$(git_main_branch)'

alias gr='git remote'
alias gra='git remote add'
alias grt='git reset'
alias grhh='git reset --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grv='git remote -v'

alias gs='git status'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gst='git stash --all'

alias c='clear'
alias npmst='npm start'
alias npmi='npm install'

unset git_version