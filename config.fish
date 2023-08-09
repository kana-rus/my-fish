if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_prompt_pwd_dir_length 0
    set -U theme_display_date no
    set -U theme_display_cmd_duration no
    eval (gh completion -s fish| source)

    cd ~/projects/
end

