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
