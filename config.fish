function __fish_describe_command
  return
end

# Because Bat is awesome, but I keep forgetting :|
alias cat="bat"

# Git Tweaks
alias checkout="git checkout $argv"
alias green="git checkout green"
alias master="git checkout master"

function ghv
   if count $argv > /dev/null
      command gh pr view $argv -w
   else
      command gh pr view -w
   end
end

function pull
    switch $argv[1]
        case green master
            set_color green
            echo -n '>> '
            set_color normal
            echo 'git checkout' $argv[1]
            command git checkout $argv[1]
            set_color green
            echo -n '>> '
            set_color normal
            echo 'git pull'
            command git pull
        case '*'
            command git pull $argv
    end
end

function gitfiles
    command git status --short | awk '{print $2}' | fzf $argv
end

function git
    switch $argv[1]
        case pu
            set branchname (git rev-parse --abbrev-ref HEAD)
            set_color green
            echo -n '>> '
            set_color normal
            echo 'git push -u origin' $branchname

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
        case 'remove-closed-branches'
           set_color green
           echo "The following branches will be removed:"
           command git fetch --quiet --prune
           set_color red
           command git branch -vv | grep 'gone]' | awk '{print $1}'
           set_color normal

            while true
                read -l -P 'Do you want to continue? [y/N] ' confirm
                switch $confirm
                    case Y y
                        command git branch -vv | grep 'gone]' | awk '{print $1}' | xargs git branch -D
                        return 1
                    case ''
                        return 0
                end
            end
        case '*'
            command git $argv
    end
end

# branches doesn't take files as an argument
complete -c branches -f

alias vimf="vim (f)"
alias vim="nvim $argv"

alias vipel="vipe l"

function vipe
   if count $argv > /dev/null
       switch $argv[1]
           case l last
               command nvim /tmp/vipe
       end
    else
       command rm /tmp/vipe
       command nvim /tmp/vipe
    end

   command sh /tmp/vipe
end

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

complete --command mov2mp4 -f -a "(ls -t *.mov)"

function mov2gif
   command ffmpeg -i "$argv[1]"  -vf scale=$argv[2]:-1 -pix_fmt rgb8 -r 30 -f gif - | gifsicle --optimize=9 --delay=3 > "$argv[3]"
end

complete --command mov2gif -f -a "(ls -t *.mov)"

alias f='ag -g "" | fzf'

function cdf
    set filepath (f)
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

function cpf
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
    command docker run -it --rm -p $port:80 -v (pwd):/usr/share/nginx/html nginx:1.18.0-alpine
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
    set_color white
    printf "%s %s" (date +"%H:%M:%S")

    set_color green
    echo -n (prompt_pwd)

    set_color cyan
    echo -n  " "(gitstatus_count)

    set_color normal
    printf "\n~ "
end

function fish_right_prompt
  #intentionally left blank
 end

set -gx SVN_EDITOR nvim
set -gx VISUAL nvim
set -gx EDITOR nvim

set -gx TF_VAR_AWS_USER stephen

switch (uname -s)
case Darwin
    [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
case Linux
    setxkbmap -option caps:escape
    [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

    alias pbcopy='xsel --clipboard --input'
end

if test -e '/Users/stephenyu/.nix-profile/etc/profile.d/nix.sh'
  fenv source '/Users/stephenyu/.nix-profile/etc/profile.d/nix.sh'
end

# update Slack Status on WFH or Office
if test -e slack_status_home_office
  slack_status_home_office
end

# fnm
set PATH /home/stephenyu/.fnm $PATH

# Cargo
set PATH ~/.cargo/bin $PATH

fnm env --multi | source
