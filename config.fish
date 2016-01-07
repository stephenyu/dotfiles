function start_docker
  command docker-machine create --driver virtualbox default
  echo "eval \"(docker-machine env default)\""
end

function fish_greeting
end

function watch-commit --argument-names person
  command watch --differences=permanent --interval 3600 "svn log --search $person 'https://trac.maglabs.net/svn-repos/' | head -n 2"
end

function tm
  command tmux -2 attach -t main; or command tmux -2 new -s main
end

function cs --argument-names command cs
  switch $command
    case --sum
            set previous (math $cs - 1)
            echo "Websvn URL: http://trac.maglabs.net/websvn/listing.php?repname=Main&path=%2F&rev=$cs&sc=1"
            command svn log -l 1 -r$cs 'https://trac.maglabs.net/svn-repos/'
            command svn diff -r$previous:$cs --summarize 'https://trac.maglabs.net/svn-repos/'
    case --diff
            set previous (math $cs - 1)
            echo "Websvn URL: http://trac.maglabs.net/websvn/listing.php?repname=Main&path=%2F&rev=$cs&sc=1"
            command svn log -l 1 -r$cs 'https://trac.maglabs.net/svn-repos/'
            command svn diff -r$previous:$cs 'https://trac.maglabs.net/svn-repos/'
    case '*'
            set cs $command
            echo "Websvn URL: http://trac.maglabs.net/websvn/listing.php?repname=Main&path=%2F&rev=$cs&sc=1"
            command svn log -l 1 -r$cs "https://trac.maglabs.net/svn-repos/"
  end
end

function last-commit-by --argument-names person
  command svn log --search $person 'https://trac.maglabs.net/svn-repos/' | head -n 2
end


