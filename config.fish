# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

alias storypoints="node -e \"console.log(Array(11).fill(1).reduce(([a,b, c]) => [b,a+b, c.concat(b)],[0,1, []])[2].join(' '))\""

# Git Tweaks
alias git="hub"
alias gitpr="git pull-request"
alias gitco="git checkout $argv"
alias checkout="git checkout $argv"
alias master="git checkout master"
alias show-pr="hub pr show $argv"
alias prs-for-me="open -a \"Google Chrome\" \"https://github.com/pulls?q=is%3Apr+is%3Aopen+archived%3Afalse+sort%3Aupdated-desc+review-requested%3Astephenyu\""

# function branches
#     if count $argv > /dev/null
#       set number $argv[1]
#       set param "$numberp"
#       echo $param
#         # command git branch -v --sort=-committerdate | grep -vi '*' | grep -vi 'master' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | cat -n | \
#         # sed -n $number 'p' | awk '{ print $3}' | gsed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"
#     else
#         command git branch -v --sort=-committerdate | grep -vi '*' | grep -vi 'master' | awk '{ print "\033[34m"$2 "  ""\033[37m" $1}' | cat -n
#     end
# end

function hub
    switch $argv[1]
        case pr
            if count $argv[2] > /dev/null
                command hub $argv
            else
                command hub pull-request
            end
        case ci
            command hub ci-status -v
        case pu
            set branchname (git rev-parse --abbrev-ref HEAD)
            set_color green
            echo 'Command: git push -u origin '$branchname

            while true
                read -l -P 'Do you want to continue? [y/N] ' confirm
                switch $confirm
                    case Y y
                        command git push -u origin (git rev-parse --abbrev-ref HEAD)
                        return 1
                    case ''
                        return 0
                end
            end
        case '*'
            command hub $argv
    end
end

git config --global alias.s "status --short --branch"
git config --global alias.cam "commit -am"
git config --global alias.ri "rebase --interactive"
git config --global alias.ap "add --patch"
git config --global alias.l1 'log --pretty=format:"%Cblue%h%Creset - %an, %Cred%ar%Creset : %Cgreen%s" --color=always'

alias vim="nvim $argv"

function gcal
    if count $argv > /dev/null
        command gcalcli $argv
    else
        command gcalcli --default-calendar=stephen@canva.com#green agenda --details=location --details=end
    end
end

function mov2mp4
   set_color green
   echo -n 'File Details: '
   command ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1 "$argv[1]"
   set_color normal
   command ffmpeg -i "$argv[1]" -vcodec h264 -acodec an "$argv[2]"
end

complete --command mov2mp4

function mov2gif
   command ffmpeg -i "$argv[1]"  -vf scale=$argv[2]:-1 -pix_fmt rgb8 -r 30 -f gif - | gifsicle --optimize=9 --delay=3 > "$argv[3]"
end

complete --command mov2gif

function fzf
    if count $argv > /dev/null
        command fzf --query=$argv[1]
    else
        command fzf
    end
end

function cdfzf
    set filepath (fzf)
    echo -n 'Filename: '
    set_color green
    echo $filepath

    set dir (dirname $filepath)
    set_color normal
    echo -n 'Directory: '
    set_color blue
    echo $dir

    cd $dir
end

function cppwd
    set filepath (pwd)
    command pwd | pbcopy
    echo -n 'Copied: '
    set_color green
    echo $filepath
end

function cpfzf
    set filepath (fzf)
    set path (realpath $filepath)
    echo -n 'Copied: '
    set_color green
    echo $path

    command echo -n $path | pbcopy
end

function dnginx
    if count $argv > /dev/null
        set port $argv[1]
    else
        set port '8080'
    end

    set_color green
    echo -n '→ '
    set_color normal
    echo 'Starting Docker nginx:alpine at :'$port
    command docker run -it --rm -p $port:80 -v (pwd):/usr/share/nginx/html nginx:alpine
end

function dnginx:h2
    set_color green
    echo -n '→ '
    set_color normal
    echo 'Starting Docker stephenyu/nginx-http2-ssl at 443 & 80'
    command docker run -it --rm -p 443:443 -p 80:80 -v (pwd):/usr/share/nginx/html stephenyu/nginx-http2-ssl:latest
end

alias filedate='date +"%d%m%y_%H%m"'

function fish_greeting
end

function tm
    if count $argv > /dev/null
        set sessionname $argv[1]
    else
        set sessionname 'main'
    end

    command tmux -2 attach -t $sessionname; or command tmux -2 new -s $sessionname
end


complete --command tm --no-files --arguments '(tmux ls | awk -F ":" \'{print $1}\')'

function spotify
    command docker run -d -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
    --device /dev/snd:/dev/snd -v $HOME/.spotify/config:/home/spotify/.config/spotify -v $HOME/.spotify/cache:/home/spotify/spotify \
    r.j3ss.co/spotify
end

function zoom
    command docker run -d --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix\$DISPLAY --device /dev/video0 --device /dev/snd:/dev/snd \
    --device /dev/dri -v /dev/shm:/dev/shm jess/zoom-us
end

# Docker Tweaks

alias dr="docker run $argv"
alias drit="docker run -ti $argv"
alias deit="docker exec -ti $argv"
alias dm="docker-machine $argv"

function d
    switch $argv[1]
    case ls
        set_color green
        echo -n '→ '
        set_color normal
        echo 'alias for \'docker images\''
        command docker images
    case '*'
        command docker $argv
    end
end

function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

    set_color white
    printf "[%s] %s" (date +"%H:%M:%S")

    set_color red
    echo -n (whoami)
    set_color white
    echo -n "@"

    set_color cyan
    echo -n (hostname)
    set_color white
    echo -n " in "

    set_color green
    echo -n (prompt_pwd)

    echo -n (__fish_git_prompt)

    set_color normal
    printf "\n~ "
end

nvm use default
set -gx SVN_EDITOR nvim
set -gx GIT_EDITOR nvim

set -gx TF_VAR_AWS_USER stephen

switch (uname -s)
case Darwin
    [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
case Linux
    set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
    setxkbmap -option caps:escape
    [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
end


thefuck --alias | source
