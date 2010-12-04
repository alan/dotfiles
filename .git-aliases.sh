alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gci='git commit'
alias gcia='git commit --amend -c HEAD'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gld='git log -p'
alias glf='git log --stat'
alias glg='git log --pretty=oneline --abbrev-commit --graph --decorate'
alias gll='git log --pretty=format:"%x1b[33m%h %Cgreen%m%Creset %s %Cgreen(%an)%Creset" -n 10'
alias gllnc='git log --pretty=format:"%h %m %s (%an)" -n 10'
alias gllr='gll refs/remotes/origin/HEAD...HEAD;echo " ^ not yet pushed";gll refs/remotes/origin/HEAD'
alias gllt='git log --pretty=format:"%x1b[33m%h %Cgreen%m %x1b[33m%ai %Creset %s %Cgreen(%an)%Creset" -n 10'
alias gpl='git pull'
alias gm='git merge'
alias gps='git push'
alias gsh='git stash'
alias gst='git status'
alias gsvn='git-svn'
alias gsdc='git-svn dcommit'
alias gsrb='git-svn rebase'
alias gf='git fetch'
alias grb='git rebase'
alias gri='git rebase --interactive'
alias giturl='git config --get remote.`git config --get branch.master.remote`.url'

complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_branch gba
complete -o default -o nospace -F _git_commit gc
complete -o default -o nospace -F _git_commit gci
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_diff gdc
complete -o default -o nospace -F _git_pull gpl
complete -o default -o nospace -F _git_log gll
complete -o default -o nospace -F _git_merge gm
complete -o default -o nospace -F _git_push gps
complete -o default -o nospace -F _git_stash gsh
complete -o default -o nospace -F _git_rebase grb
complete -o default -o nospace -F _git_rebase gri
