# Fish configuration

# Disable greeting
set fish_greeting

# Initialize zoxide
if type -q zoxide
    zoxide init fish | source
end

# PATH (prepend to preserve paths from conf.d scripts like Nix)
fish_add_path --prepend $HOME/bin $HOME/.local/bin /opt/homebrew/bin /usr/local/bin

# Environment variables
set -gx EDITOR "code"

# Prompt
function fish_prompt
    set_color $fish_color_cwd
    echo -n (whoami)
    set_color normal
    echo -n "@"(hostname)" "
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    if type -q __fish_git_prompt
        __fish_git_prompt
    end
    set_color $fish_color_cwd
    if type -q docker; and docker ps -q 2>/dev/null | grep -q .
        echo -n " (docker)"
    end
    set_color normal
    echo -n "> "
end

# Git refresh branch function
function grf
    if test (count $argv) -eq 1
        git branch -D "$argv"
        git fetch origin "$argv"
        git checkout "$argv"
    else
        echo "Invalid number of arguments"
    end
end

# Fetch and rebase main
function fr
    if test (git rev-parse --abbrev-ref HEAD) != "main"
        git checkout main
    end
    git fetch origin main && git rebase origin/main
end

# Aliases
alias c="clear"
alias la="ls -A"
alias ll="ls -l"
alias lr="ls -R"
alias cat="bat"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias f="fish"

# Git aliases
alias g="git"
alias ga="git add"
alias gaa="git add -A"
alias gap="git add -p"
alias gf="git commit --fixup"
alias gaf="git add -A; git commit --fixup"
alias gfh="git commit --fixup HEAD"
alias gafh="git add -A; git commit --fixup HEAD"
alias gc="git commit -m"
alias gac="git add -A; git commit -m"
alias gd="git checkout -- ."
alias gdiff="git diff"
alias gdiffs="git diff --staged"
alias gr="git reset HEAD^"
alias gl="git log --oneline --ancestry-path origin/main^..HEAD"
alias gcp="git cherry-pick"
alias main="git checkout main"
alias pull="git pull --rebase origin"
alias push="git push origin"
alias fpush="git push origin --force-with-lease"
alias fetch="git fetch origin"
alias gs="git stash push -u"
alias gsm="git stash push -u -m"
alias gsd="git stash drop"
alias gsl="git stash list"
alias gsp="git stash pop"
alias b="git branch"
alias db="git branch -D"
alias nb="git checkout -b"
alias sb="git checkout"
alias fe="git fetch origin main"
alias re="git rebase origin/main"
alias rei="git rebase -i origin/main"
alias pr="gh pr create -t"
alias prd="gh pr create --draft -t"

# CI trigger aliases
alias run-qa="git commit --allow-empty -m '[qa]'"
alias run-cy="git commit --allow-empty -m '[cy]'"
alias run-eph="git commit --allow-empty -m '[ephemeral]'"
alias run-dev="git commit --allow-empty -m '[dev]'"

# Editor alias
alias code="cursor"

# Docker aliases
alias enter-db='docker exec -it freckle-megarepo-postgres bash -c "psql -U postgres -d classroom_dev"'
alias docker-clean="docker system prune -a"

# Make/Dev aliases
alias upd="make update"
alias w="yarn watch"

# Package manager aliases
alias ze="zellij"
alias p="pnpm"
alias y="yarn"

# Navigation
alias home="cd ~/home"

# Initialize direnv
if type -q direnv
    direnv hook fish | source
end
