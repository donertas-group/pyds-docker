if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH ~/.local/bin $PATH
set -g fish_greeting

function fish_prompt
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '🐳 #'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    echo -s (prompt_login) ' ' $cwd_color (prompt_pwd) $vcs_color (fish_vcs_prompt) $normal ' ' $prompt_status
    echo -n -s $status_color $suffix ' ' $normal
end
funcsave fish_prompt 2>/dev/null


set -U fish_color_autosuggestion 555
set -U fish_color_cancel --reverse
set -U fish_color_command blue
set -U fish_color_comment red
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end green
set -U fish_color_error brred
set -U fish_color_escape brcyan
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_host_remote \x1d
set -U fish_color_keyword \x1d
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator brcyan
set -U fish_color_option \x1d
set -U fish_color_param cyan
set -U fish_color_quote yellow
set -U fish_color_redirection cyan\x1e--bold
set -U fish_color_search_match bryellow\x1e--background=brblack
set -U fish_color_selection white\x1e--bold\x1e--background=brblack
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
set -U fish_key_bindings fish_default_key_bindings
set -U fish_pager_color_background \x1d
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D\x1e--italics
set -U fish_pager_color_prefix normal\x1e--bold\x1e--underline
set -U fish_pager_color_progress brwhite\x1e--background=cyan
set -U fish_pager_color_secondary_background \x1d
set -U fish_pager_color_secondary_completion \x1d
set -U fish_pager_color_secondary_description \x1d
set -U fish_pager_color_secondary_prefix \x1d