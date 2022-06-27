function __fish_describe_command
  return
end

# Because Bat is awesome, but I keep forgetting :|
alias cat="bat"

# Git Tweaks
alias checkout="git checkout $argv"
alias green="git checkout green"
alias master="git checkout master"
alias main="git checkout main"
alias push="git push $argv"
alias please="sudo"
alias pls="sudo"
alias find="echo 'Use fd'"
alias branches="git branch -vv | rg -v '\*' | awk '{print $1}'"

function cdb
  set path (cdback $argv)
  set_color green
  echo -n '>> '
  set_color normal
  echo $path
  cd $path
end

function branch
  set target (git branch | grep -v "*" | fzf | awk '{$1=$1;print}')

  switch $target
        case "+*"
            set worktree_name (echo $target | awk '{print $2}')
            set folder (git worktree list | rg $worktree_name | awk '{print $1}')
            set_color green
            echo -n '>> '
            set_color normal
            echo -n 'cd '
            set_color blue
            echo -n $folder
            set_color normal
            echo -n '@'
            set_color red
            echo $worktree_name
            set_color normal
            cd $folder
        case '*'
            git checkout $target
  end
end

function worktree
    switch $argv[1]
        case add
            set words (rand)
            set main_dir (git worktree list | awk '{print $1}' | sort -n | head -n1)
            set short_date (date +'%d-%m-%Y')
            set directory $main_dir"-"$short_date"-"$words

            set_color green
            echo -n '>> '
            set_color normal

            switch $argv[2]
                case -b
                    echo ' '$argv[3]
                    set_color normal
                    echo -n 'git worktree add '$directory' -b '$argv[3]
                    git worktree add $directory -b $argv[3]
                case '*'
                    echo ' '$argv[2]
                    set_color normal
                    echo -n 'git worktree add '$directory $argv[2]
                    git worktree add $directory $argv[2]
            end

            cd $directory
        case delete
            set_color red
            set_color normal
            set target (git worktree list | fzf)
            set directory (echo $target | awk '{print $1}')
            set_color green
            echo -n '>> '
            set_color red
            echo -n 'Deleting Directory: '
            set_color normal
            echo $directory
            sleep 3

            rm -r $directory
            set_color green
            echo -n '>> '
            set_color normal
            echo 'rm -r' $directory

            git worktree prune
            set_color green
            echo -n '>> '
            set_color normal
            echo 'git worktree prune'
        case main
            set main_dir (git worktree list | awk '{print $1}' | sort -n | head -n1)
            set_color green
            echo -n '>> '
            set_color normal
            echo -n 'cd '
            set_color blue
            echo $main_dir
            set_color normal
            cd $main_dir
        case ''
            set worktree_name (git worktree list | awk '{print $3}' | sed 's/[][]//g' | fzf)
            set folder (git worktree list | rg $worktree_name | awk '{print $1}')
            set_color green
            echo -n '>> '
            set_color normal
            echo -n 'cd '
            set_color blue
            echo -n $folder
            set_color normal
            echo -n '@'
            set_color red
            echo $worktree_name
            set_color normal
            cd $folder
    end
end

alias storybook="yarn storybook:single (f)"

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

function gh
    switch $argv[1]
        case commit
            set_color green
            echo -n '>> '
            set_color normal
            echo -n 'Setting Date to: '
            set_color blue
            echo (gitdate)
            set_color normal
            set -lx GIT_COMMITTER_DATE (gitdate)
            git commit --date="\""(gitdate)"\""
        case diff2html
            set_color green
            echo -n '>> '
            set_color normal
            echo 'git diff' $argv[2] '| diff2html -i stdin'
            git diff $argv[2] | diff2html -i stdin
        case push
            set_color green
            echo -n '>> '
            set_color normal
            echo 'git push (repeated until it passes...)'
            git_push
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
            command gh $argv
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

function mov2mp4
   set_color green
   echo -n 'File Details: '
   command ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1 "$argv[1]"
   set_color normal
   command ffmpeg -i "$argv[1]" -vcodec h264 -an "$argv[2]"
end

function dot2png
   command dot -Tpng "$argv[1]" -o "$argv[2]"
end

complete --command mov2mp4 -f -a "(ls -t *.mov)"

function mov2gif
   command ffmpeg -i "$argv[1]"  -vf scale=$argv[2]:-1 -pix_fmt rgb8 -r 30 -f gif - | gifsicle --optimize=9 --delay=3 > "$argv[2]"
end

complete --command mov2gif -f -a "(ls -t *.mov)"

alias f='ag -g "" | fzf'

function cdf
    if count $argv > /dev/null
        set filepath (f --query $argv[1])
    else
        set filepath (f)
    end

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
    echo 'Starting Docker nginx:stable-alpine at :'$port
    command docker run -it --rm -p $port:80 -v (pwd):/usr/share/nginx/html nginx:stable-alpine
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
    if test $status -eq 0
       set failed 0
    else
       set failed 1
    end

    set_color green
    printf "\n"
    echo -n "# "(prompt_pwd)

    set gitstatus (gitstatus)
    if test -n "$gitstatus"
        set_color cyan
        echo -n " "$gitstatus
    end

    if test $failed -eq 0
        set_color normal
        printf "\n; "
    else
        set_color red
        printf "\n; "
        set_color normal
    end
end

function fish_right_prompt
  #intentionally blank
end

set -gx SVN_EDITOR nvim
set -gx VISUAL nvim
set -gx EDITOR nvim

set -gx TF_VAR_AWS_USER stephen

switch (uname -s)
case Linux
    setxkbmap -option caps:escape

    alias pbcopy='xsel --clipboard --input'
    if status is-login
    and not set -q TMUX
      exec startx -- -keeptty
    end
end

# Cargo
set PATH ~/.cargo/bin $PATH

jump shell fish | source
