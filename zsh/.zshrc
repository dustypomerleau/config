# commented out all of below in favor of just $PATH where fish is not accepted (for automator scripts)

export PATH="\
/run/current-system/sw/bin:\
/opt/homebrew/bin:\
/Users/dn/Library/pnpm:\
/Users/dn/.cargo/bin:\
$PATH"

#
# # Path to your oh-my-zsh installation.
# export ZSH=/Users/dn/.oh-my-zsh
#
# # Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="theunraveler"
# # ZSH_THEME="wedisagree"
# # ZSH_THEME="agnoster" # for testing purposes
# # select theme for ccat (colorize_via_pygmentize)
# # ZSH_COLORIZE_STYLE="dpgruvbox"
# ZSH_COLORIZE_STYLE="yarravalley"
# export BAT_THEME="Dracula"
#
# DISABLE_UPDATE_PROMPT="true"
#
# # Uncomment the following line to use case-sensitive completion.
# # CASE_SENSITIVE="true"
#
# # Uncomment the following line to disable bi-weekly auto-update checks.
# # DISABLE_AUTO_UPDATE="true"
#
# # Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=7
#
# # Uncomment the following line to disable colors in ls.
# # DISABLE_LS_COLORS="true"
#
# # Uncomment the following line to disable auto-setting terminal title.
# # DISABLE_AUTO_TITLE="true"
#
# # Uncomment the following line to enable command auto-correction.
# # ENABLE_CORRECTION="true"
#
# # Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
#
# # Uncomment the following line if you want to disable marking untracked files
# # under VCS as dirty. This makes repository status check for large repositories
# # much, much faster.
# # DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# # Uncomment the following line if you want to change the command execution time
# # stamp shown in the history command output.
# # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="yyyy-mm-dd"
#
# # Would you like to use another custom folder than $ZSH/custom?
# # ZSH_CUSTOM=/path/to/new-custom-folder
#
# # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
#
# # note: plugins are whitespace separated
# # to accept autosuggestions use right arrow (or opt + right arrow to accept by word)
# plugins=(
#   # mix
#   # z
#   colored-man-pages
#   colorize
#   extract
#   git z
#   history-substring-search
#   macos
#   zsh-autosuggestions
# )
#
# # ignore duplicates when using the history-substring-search plugin
# setopt HIST_IGNORE_ALL_DUPS
# # allow extended glob operators
# setopt extendedglob
# # bind UP and DOWN arrow keys to history-substring-search
# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
# # allow fuzzy search (options 'words' or 'chars')
# HISTORY_SUBSTRING_SEARCH_FUZZY='chars'
# ZSHZ_ECHO=1
# ZSHZ_CASE=smart
# ZSHZ_UNCOMMON=1
#
# autoload zmv

# export MANPATH="\
# /usr/local/man:\
# /usr/local/opt/erlang/lib/erlang/man:\
# /usr/local/share/man:\
# /usr/share/man:\
# $MANPATH"
#
# # export NODE_PATH="\
# # /usr/local/lib/node_modules:\
# # $NODE_PATH"
# # DLP uncomment above if using asdf
# # To see the path added by asdf: `echo $(npm -g root)`
#
# # For compilers to find openssl@1.1 you may need to set:
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
#
# # For compilers to find ruby you may need to set:
# # export LDFLAGS="-L/usr/local/opt/ruby/lib"
# # export CPPFLAGS="-I/usr/local/opt/ruby/include"
#
# # For pkg-config to find ruby you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
#
# # export AWS_DEFAULT_PROFILE=wasabi
#
# # asdf setup (must come after you declare $PATH, $NODE_PATH, etc., and before you source oh-my-zsh)
# # . $(brew --prefix asdf)/asdf.sh # DLP uncomment to use asdf
# # if type brew &>/dev/null; then
# #   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
#
# # for EdgeDB ZSH completions (must be before compinit):
# fpath+=$HOME/.zfunc
#
# #   autoload -Uz compinit
# #   compinit
# # fi
#
# # direnv setup
# # eval "$(direnv hook zsh)" # DLP uncomment to use direnv
# # Note that even when the shims directory is no longer in PATH, you are always able to invoke any asdf managed command via `asdf exec`.
#
# export TERM_PROGRAM=code
#
# source $ZSH/oh-my-zsh.sh
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
#
# # You may need to manually set your language environment
# # export LANG=en_US.UTF-8
#
# # Preferred editor for local and remote sessions
# # if [[ -n $SSH_CONNECTION ]]; then
# #   export EDITOR='code'
# # else
# #   export EDITOR='code'
# # fi
#
# # Compilation flags
# # export ARCHFLAGS="-arch x86_64"
#
# # ssh
# # export SSH_KEY_PATH="~/.ssh/dsa_id"
#
# # zsh-syntax-highlighting must be last in your .zshrc
# # currently this is conflicting with substring highlights by history substring search
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
# # pnpm
# export PNPM_HOME="/Users/dn/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end
#
# # tere
# tere() {
#     local result=$(command tere "$@")
#     [ -n "$result" ] && cd -- "$result"
# }
#
# # aliases
#
# # unalias gcp, which is an ohmyzsh alias for git cherry-pick but collides with your cp alias
# unalias gcp
# # unalias grm, which is an ohmyzsh alias for git rm, but collides with your rm alias
# unalias grm
#
# # alias aws="aws --endpoint-url=https://s3.us-west-1.wasabisys.com"
# alias cat="colorize_cat" # ccat
# alias cb="cargo build"
# alias chmod="gchmod"
# alias cp="gcp -iv"
# alias cr="cargo run"
# alias ct1="cargo tree --depth 1"
# alias ct2="cargo tree --depth 2"
# alias ct="cargo test"
# alias ctn="cargo test -- --nocapture"
# alias e="exa -FhlmT --color-scale --git --git-ignore --no-permissions --no-user"
# alias el="exa -aFhlmT --color-scale" # eventually once https://github.com/ogham/exa/issues/1214 is fixed, you can add -a to `e` and remove this
# alias epub="asciidoctor-epub3 -D ebook"
# # alias et="grm -frv ~/.Trash" # disallowed by SIP
# alias erlv="erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), \"releases\", erlang:system_info(otp_release), \"OTP_VERSION\"])), io:fwrite(Version), halt().' -noshell"
# alias ev="evcxr"
# alias find="gfind"
# alias g="git status -bs"
# alias ga="git add"
# alias gaa="git add -A"
# alias gc="git commit -m"
# alias gca="git commit -a -m"
# alias gd="git diff"
# alias gds="git diff --staged"
#
# alias gl="\
# git log \
# --date=iso \
# --graph \
# --pretty=format:'\
# %C(yellow)%h%Creset\
# %C(auto)%d%Creset \
# %C(blue)%cd%Creset \
# %C(magenta)%an%Creset\
# %n\
# %s\
# %n'"
# # available colors for git log:
# #   normal
# #   black
# #   red
# #   green
# #   yellow
# #   blue
# #   magenta
# #   cyan
# #   white
#
# # colors can be combined with one of these formats:
# #   bold
# #   dim
# #   ul
# #   blink
# #   reverse
#
# alias glt="git ls-tree -r main --full-tree --name-only"
# alias gm="git merge"
# alias gmf="git merge --ff-only"
# alias gpfl="git push --force-with-lease"
#
# # `git pull origin master` for all repo subfolders
# alias gpoma="\
# gfind . \
# -maxdepth 1 \
# -mindepth 1 \
# -type d \
# -exec git \
# --git-dir={}/.git \
# --work-tree=$PWD/{} \
# pull origin master \;"
#
# alias grep="\
# ggrep -nP -C 2 \
# --color=auto \
# --exclude-dir=.git \
# -e"
#
# alias gs="git switch"
# alias gsc="git switch -c"
# alias gsd="git switch dev"
# alias gsm="git switch main"
#
# # `git status` for all repo subfolders
# alias gsa="\
# gfind . \
# -maxdepth 1 \
# -mindepth 1 \
# -type d \
# -exec git \
# --git-dir={}/.git \
# --work-tree=$PWD/{} \
# status -bs \;"
#
# alias idris="idris2"
#
# alias kf="\
# asciidoctor-epub3 \
# -D ebook \
# -a ebook-format=kf8"
#
# alias l="\
# gls -1A \
# --color=auto \
# --group-directories-first"
#
# alias la="\
# gls -Alh \
# --color=auto \
# --group-directories-first"
#
# alias lc="\
# gls -A \
# --color=auto \
# --group-directories-first"
#
# alias lr="\
# gls -1AR \
# -I{node_modules,.git} \
# --color=auto \
# --group-directories-first"
#
# alias mc="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME"
#
# alias mca="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# add"
#
# alias mcc="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# commit -m"
#
# alias mcca="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# commit -am"
#
# alias mcd="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# diff"
#
# alias mcl="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# log \
# --date=iso \
# --graph \
# --pretty=format:'\
# %C(yellow)%h%Creset\
# %C(auto)%d%Creset \
# %C(blue)%cd%Creset \
# %C(magenta)%an%Creset\
# %n\
# %s\
# %n'"
#
# alias mcls="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# ls-tree -r \
# --full-tree \
# --name-only \
# head"
#
# alias mcs="\
# git \
# --git-dir=$HOME/.mc/ \
# --work-tree=$HOME \
# status -bs"
#
# alias md="gmkdir -pv"
# alias mkdir="gmkdir -pv"
# alias mktemp="gmktemp" # macOS mktemp is not POSIX compliant
# alias mv="gmv -iv"
# alias p="pnpm"
# alias pa="pnpm add"
# alias pad="pnpm add -D"
# alias pag="pnpm add -g"
# alias pc="pnpm create"
# alias pga="pg_ctl -D /usr/local/var/postgres -l logfile start"
# alias pgo="pg_ctl -D /usr/local/var/postgres stop"
# alias pgs="pg_ctl -D /usr/local/var/postgres status"
# alias pi="pnpm install"
# alias pl="pnpm list -depth 0"
# alias plg="pnpm list -g -depth 0"
# alias po="pnpm outdated"
# alias pr="pnpm run"
# alias pu="pnpm update"
# alias pug="pnpm update -g"
# alias pul="pnpm update --latest" # ignores package.json and fetches latest
# alias px="pnpm dlx" # equivalent to npx
# alias rm="grm -iv"
# alias sed="gsed -r"
#
# alias sup="\
# sudo softwareupdate -aiR && \
# brew update && \
# brew upgrade && \
# brew upgrade --cask && \
# rustup update && \
# pnpm update -g && \
# sudo tlmgr update --self --all --reinstall-forcibly-removed"
# # mas upgrade && \
# #
# # asdf plugin update --all && \
# # asdf install direnv latest && \
# # asdf install nodejs latest && \
# # only CTAN mirror that seems to work well is:
# # sudo tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet
#
# alias t="tmux"
# alias tc="top -o cpu"
# alias tm="top -o mem"
# alias tr="tree -CR --dirsfirst -I '.git|node_modules|target'"
# alias vim="nvim"
# alias xargs="gxargs"
#
# # osx plugin aliases:
# # ofd - open current directory in finder
# # pfd - show the current directory in finder (frontmost)
# # cdf - cd to current directory in finder (frontmost)
#
# # built-in oh my zsh aliases:
# # -='cd -'
# # ...=../..
# # ....=../../..
# # .....=../../../..
# # ......=../../../../..
# # 1='cd -'
# # 2='cd -2'
# # 3='cd -3'
# # 4='cd -4'
# # 5='cd -5'
# # 6='cd -6'
# # 7='cd -7'
# # 8='cd -8'
# # 9='cd -9'
# # _=sudo
# # afind='ack -il'
# # ccat=colorize_via_pygmentize
# # d='dirs -v | head -10'
# # globurl='noglob urlglobber '
# # history='omz_history -i'
# # l='ls -lah'
# # la='ls -lAh'
# # ll='ls -lh'
# # ls='gls -A --color=auto --group-directories-first'
# # lsa='ls -lah'
# # md='mkdir -p'
# # rd=rmdir
# # run-help=man
# # which-command=whence
# # x=extract
# # z='_z 2>&1'
#
# # uncomment below to make zmv safer, but you'll have to approve every change in the list:
# # alias zmv="zmv -i"
# # more options to extend zmv:
# # alias zmz='noglob zmv'
# # alias zcp='noglob zmv -C'
# # alias zln='noglob zmv -L'
# # alias zsy='noglob zmv -Ls'
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# source /Users/dustinpomerleau/.config/broot/launcher/bash/br
