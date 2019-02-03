function git -d "the stupid content tracker" -w git
    switch $argv[1]
    case s
        set_color green
        echo -n '→ '
        set_color normal
        echo 'alias for \'git status\''
        command git status $argv
    case co
        set_color green
        echo -n '→ '
        set_color normal
        echo 'alias for \'git checkout\''
        command git checkout $argv
    case '*'
        command git $argv
    end
end
