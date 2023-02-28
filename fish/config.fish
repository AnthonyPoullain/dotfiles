# if status is-interactive
#     set -l onedark_options '-b'
#
#     if set -q VIM
#         # Using from vim/neovim.
#         set onedark_options "-256"
#     else if string match -iq "eterm*" $TERM
#         # Using from emacs.
#         function fish_title; true; end
#         set onedark_options "-256"
#     end
#
#     set_onedark $onedark_options
# end

if status --is-login
		set -gx PATH "$HOME/.cargo/bin" $PATH;
end

    # TokyoNight Color Palette
    # set -l foreground c0caf5
    # set -l selection 33467C
    # set -l comment 565f89
    # set -l red f7768e
    # set -l orange ff9e64
    # set -l yellow e0af68
    # set -l green 9ece6a
    # set -l purple 9d7cd8
    # set -l cyan 7dcfff
    # set -l pink bb9af7
    # 
    # # Syntax Highlighting Colors
    # set -g fish_color_normal $foreground
    # set -g fish_color_command $cyan
    # set -g fish_color_keyword $pink
    # set -g fish_color_quote $yellow
    # set -g fish_color_redirection $foreground
    # set -g fish_color_end $orange
    # set -g fish_color_error $red
    # set -g fish_color_param $purple
    # set -g fish_color_comment $comment
    # set -g fish_color_selection --background=$selection
    # set -g fish_color_search_match --background=$selection
    # set -g fish_color_operator $green
    # set -g fish_color_escape $pink
    # set -g fish_color_autosuggestion $comment
    # 
    # # Completion Pager Colors
    # set -g fish_pager_color_progress $comment
    # set -g fish_pager_color_prefix $cyan
    # set -g fish_pager_color_completion $foreground
    # set -g fish_pager_color_description $comment
    # 
