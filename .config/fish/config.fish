if status is-interactive
    # Commands to run in interactive sessions can go here
end

# colors
set fish_color_autosuggestion "#7e818b"
set fish_color_command red
set fish_color_comment "#7e818b"
set fish_color_end cyan
set fish_color_error "#ff218c"
set fish_color_escape brgreen
set fish_color_keyword red
set fish_color_normal "#cac0a9"
set fish_color_operator cyan
set fish_color_option yellow
set fish_color_param "#cac0a9"
set fish_color_quote green
set fish_color_redirection blue
set fish_color_search_match "#5e81ac"
set fish_color_valid_path cyan

# keybindings
bind \cp _fzf_search_directory
bind \cg _fzf_search_git_log
bind \ch _fzf_search_history

# variables
# set -gx TERM alacritty-direct
set -U EDITOR nvim
set -x BAT_THEME Dracula

# fish prompt
set fish_prompt_pwd_full_dirs 2
set __fish_git_prompt_char_stateseparator " "
set __fish_git_prompt_char_upstream_prefix " "
set __fish_git_prompt_color "#03edf0"
set __fish_git_prompt_color_branch_detached green
set __fish_git_prompt_color_cleanstate yellow
set __fish_git_prompt_color_merging "#ff218c"
set __fish_git_prompt_color_prefix "#01edf0"
set __fish_git_prompt_color_suffix "#01edf0"
set __fish_git_prompt_color_upstream yellow
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showuntrackedfiles false
set __fish_git_prompt_showupstream "informative"

# abbreviations (aliases)
abbr --add ... "../.."
abbr --add .... "../../.."
abbr --add ..... "../../../.."
abbr --add b "btm"
abbr --add cb "cargo build"
abbr --add ch "cargo check"
abbr --add chmod uchmod
abbr --add ci "crates-tui"
abbr --add co "cargo outdated -R" # root dependencies only
abbr --add cp "ucp -iv"
abbr --add cr "cargo run"
abbr --add ct "cargo test"
abbr --add ctn "cargo test -- --nocapture"
abbr --add ctr "cargo tree --depth"
abbr --add cu "cargo update"
abbr --add cud "cargo update --dry-run"
abbr --add e "eza -ahlmT -F --color-scale=size --git --git-ignore --icons=auto --no-permissions --no-user -L3"
abbr --add ed "edgedb"
abbr --add eg "eza -ahlmT -F --color-scale=size --git --icons=auto --no-permissions --no-user -L3"
abbr --add ev "evcxr"
abbr --add find "ufind"
abbr --add g "git status -bs"
abbr --add ga "git add"
abbr --add gaa "git add -A"
abbr --add gc "git commit -m"
abbr --add gca "git commit -a -m"
abbr --add gcae "git commit -a" # e for editor
abbr --add gce "git commit" # e for editor
abbr --add gd "git diff"
abbr --add gds "git diff --staged"
abbr --add gfu "git fetch upstream"

abbr --add gl "\
git log \
--date=iso \
--graph \
--pretty=format:'\
%C(yellow)%h%Creset\
%C(auto)%d%Creset \
%C(blue)%cd%Creset \
%C(magenta)%an%Creset\
%n\
%s\
%n'"
# available colors for git log:
#   normal
#   black
#   red
#   green
#   yellow
#   blue
#   magenta
#   cyan
#   white

# colors can be combined with one of these formats:
#   bold
#   dim
#   ul
#   blink
#   reverse

abbr --add glt "git ls-tree -r main --full-tree --name-only"
abbr --add gm "git merge"
abbr --add gmf "git merge --ff-only"
abbr --add gpfl "git push --force-with-lease"
abbr --add gs "git switch"
abbr --add gsc "git switch -c"
abbr --add gsd "git switch dev"
abbr --add gsm "git switch main"
abbr --add hs "home-manager switch"
abbr --add j "jj status"
abbr --add jb "jj branch"
abbr --add jbc "jj branch create"
abbr --add jbl "jj branch list"
abbr --add jbla "jj branch list -a"
abbr --add jbs "jj branch set"
abbr --add jbsd "jj branch set dev"
abbr --add jbsm "jj branch set main"
abbr --add jbt "jj branch track"
abbr --add jc "jj commit -m"
abbr --add jd "jj diff"
abbr --add jdr "jj diff -r"
abbr --add je "jj edit"
abbr --add jf "jj files"
abbr --add jg "jj git"
abbr --add jgf "jj git fetch --all-remotes"
abbr --add jgi "jj git init --git-repo=."
abbr --add jgp "jj git push"
abbr --add jgpa "jj git push --all"
abbr --add jgpb "jj git push -b"
abbr --add jgr "jj git remote"
abbr --add jgra "jj git remote add"
abbr --add jgrl "jj git remote list"
abbr --add jgrr "jj git remote remove"
abbr --add jh "jj show"
abbr --add ji "jj describe -m"
abbr --add jl "jj log"
abbr --add jla "jj log -r 'all()'"
abbr --add jn "jj new"
abbr --add jnm "jj new -m"
abbr --add jo "jj obslog"
abbr --add jp "jj operation log"
abbr --add jq "jj squash"
abbr --add jr "jj rebase"
abbr --add js "jj split"
abbr --add jt "jj root"

abbr --add l "\
uls -1A \
--color=auto \
--group-directories-first"

abbr --add la "\
uls -Alh \
--color=auto \
--group-directories-first"

abbr --add lc "\
uls -A \
--color=auto \
--group-directories-first"

abbr --add lr "\
uls -1AR \
-I{node_modules,.git} \
--color=auto \
--group-directories-first"

abbr --add mc "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME"

abbr --add mca "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
add"

abbr --add mcc "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
commit -m"

abbr --add mcca "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
commit -am"

abbr --add mcd "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
diff"

abbr --add mcl "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
log \
--date=iso \
--graph \
--pretty=format:'\
%C(yellow)%h%Creset\
%C(auto)%d%Creset \
%C(blue)%cd%Creset \
%C(magenta)%an%Creset\
%n\
%s\
%n'"

abbr --add mcls "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
ls-tree -r \
--full-tree \
--name-only \
head"

abbr --add mcs "\
git \
--git-dir=$HOME/.mc/ \
--work-tree=$HOME \
status -bs"

abbr --add md "umkdir -pv"
abbr --add mkdir "umkdir -pv"
abbr --add mktemp "umktemp" # macOS mktemp is not POSIX compliant
abbr --add mv "umv -iv"
abbr --add n "nvim"
abbr --add ns "darwin-rebuild switch --flake ~/.config/nix-darwin"
abbr --add nu "nix flake update ~/.config/nix-darwin"
abbr --add ofd "open ."
abbr --add p "pnpm"
abbr --add pa "pnpm add"
abbr --add pad "pnpm add -D"
abbr --add pag "pnpm add -g"
abbr --add pc "pnpm create"
abbr --add pga "pg_ctl -D /usr/local/var/postgres -l logfile start"
abbr --add pgo "pg_ctl -D /usr/local/var/postgres stop"
abbr --add pgs "pg_ctl -D /usr/local/var/postgres status"
abbr --add pi "pnpm install"
abbr --add pl "pnpm list -depth 0"
abbr --add plg "pnpm list -g -depth 0"
abbr --add po "pnpm outdated"
abbr --add pr "pnpm run"
abbr --add pu "pnpm update"
abbr --add pug "pnpm update -g"
abbr --add pul "pnpm update --latest" # ignores package.json and fetches latest
abbr --add px "pnpm dlx" # equivalent to npx
abbr --add renamer "renamer -e nvim"
abbr --add rm "urm -iv"
abbr --add sed "gsed -E"
abbr --add so "source ~/.config/fish/config.fish"

abbr --add sup "\
sudo softwareupdate -aiR && \
brew update && \
brew upgrade && \
brew upgrade --cask && \
rustup update && \
cargo install-update -a && \
pnpm update -g"
# brew upgrade neovim --fetch-head && \

abbr --add t "tmux"
abbr --add ta "tmux attach"
abbr --add tl "tldr"
abbr --add tm "tmpl"
abbr --add tr "tree -CR --dirsfirst -I '.git|node_modules|target'"
abbr --add tua "sudo tlmgr update --self --all --reinstall-forcibly-removed"
abbr --add vim "nvim"
abbr --add x "extract"
abbr --add xargs "uxargs"

# future considerations:
# - colored man pages

# pnpm
set -gx PNPM_HOME "/Users/dustinpomerleau/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

zoxide init fish | source
