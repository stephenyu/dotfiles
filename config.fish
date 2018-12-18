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

# Git Add All (Modified)
function gitaa
   command git status | grep "^\s.*\:" | awk '{print $2}' | xargs git add
end

function gitc
   command git commit $argv
end

function gitp
   command git push $argv
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
    echo -n 'Copied: '
    set_color green
    echo $filepath

    command echo -n $filepath | pbcopy
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

function filedate
    command date +"%d%m%y_%H%m"
end

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

function svn
    switch $argv[1]
    case where
        command svn info | grep '^URL:' | awk '{print $2}' | tr -d '\n' | pbcopy
        set url (svn info | grep '^URL:' | awk '{print $2}' | tr -d '\n')
        set_color green
        echo -n '→ '
        set_color normal
        echo 'SVN URL Copied: ' $url
    case branch
        set url (svn info | grep '^URL:' | awk '{print $2}' | tr -d '\n')
        command svn copy $url $argv[2] -m $argv[3]
        set_color green
        echo -n '→ '
        set_color normal
        echo 'SVN Branch Created at' $argv[2]
        command echo $argv[2] | pbcopy
    case '*'
        command svn $argv
    end
end

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

function dm
    command docker-machine $argv
end

function spotify
    command docker run -d -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
    --device /dev/snd:/dev/snd -v $HOME/.spotify/config:/home/spotify/.config/spotify -v $HOME/.spotify/cache:/home/spotify/spotify \
    r.j3ss.co/spotify
end

function dr
    command docker run $argv
end

function drit
    command docker run -ti $argv
end

function deit
    command docker exec -ti $argv
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

# 'AutoJump'
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set -gx SVN_EDITOR vim
set -gx PATH ./node_modules/.bin $PATH

nvm use default
