function _coder_run_complete
    if [ (count $argv) -eq 2 -a $argv[2] = run ]
        coder list -c workspace | rg stephen | sed 's/[ \t]*$//'
    end
end

complete --command coder --arguments '(_coder_run_complete (commandline -opc))' --no-files
