function kargo
    ~/.cargo/bin/kargo $argv

    set command_type $argv[1]
    if test "$command_type" = "app"
        set project_name $argv[2]
        cd $project_name
    else if test "$command_type" = "lib"
        set project_name $argv[2]
        cd $project_name
    end
end
