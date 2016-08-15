function vim
  command nvim $argv
end

function python
  command python3 $argv
end

function filedate
  command date +"%d%m%y_%H%m"
end

function fish_greeting
end

function tm
  command tmux -2 attach -t main; or command tmux -2 new -s main
end

function svn
        switch $argv[1]
        case where
                command svn info | grep '^URL:' | awk '{print $2}' | pbcopy
                set_color green
                echo -n '→ '
                set_color normal
                echo 'SVN URL Copied.'
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
    echo -n (prompt_pwd)

    set_color normal
    printf "\n~ "
end

set -gx SVN_EDITOR vim
set -gx PATH ~/.composer/vendor/bin /Users/stephen/.rvm/bin /Users/stephen/anaconda/bin /Users/stephen/.composer/vendor/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
