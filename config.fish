function vim
  command nvim $argv
end

function fish_greeting
end

function tm
  command tmux -2 attach -t main; or command tmux -2 new -s main
end

function d
  command docker $argv
end

function dr
  command docker run $argv
end

function drit
  command docker run -ti $argv
end

function fish_prompt
    set_color white
    printf "[%s] %s" (date +"%H:%M:%S")

    set_color red
    echo -n (whoami)
    set_color white
    echo -n " at "

    set_color cyan
    echo -n (hostname)
    set_color white
    echo -n " in "

    set_color green
    echo -n (pwd)

    set_color normal
    printf "\n~ "
end
