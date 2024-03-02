if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

function fish_prompt
  # Code to check for Git branch and display it
#   set_color bold green
#   git branch --show-current 2>/dev/null | if [ $? -eq 0 ]; then
#     echo -n "(git: $(git branch --show-current))"
#   end
  set_color normal white
  echo -n " $USER@$hostname "
  set_color blue
  echo -n "$PWD"
  echo -n " > "
end


function fish_prompt
    set -l last_status $status
    return_last_status $last_status
    __fish_prompt_orig
end