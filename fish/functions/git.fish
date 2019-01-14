function git -d "the stupid content tracker" -w git
    switch $argv[1]
    case s
        set_color green
        echo -n '→ '
        set_color normal
        echo 'alias for \'git status\''
        command git status
    case '*'
        command git $argv
    end
end
