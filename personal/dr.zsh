function mkcd() {
    command mkdir $1 && cd $1
}

function dr() {
    name="$*"
    local dir="$HOME/obsidian/main/dolphin/local/reviewer/$name"
    command mkdir "$dir" && cd "$dir" && touch prompt.md feedback.md && \
    command xdotool key alt+grave alt+shift+u key ctrl+1 key ctrl+p type "$name prompt" && xdotool sleep 1 && xdotool key KP_Enter && xdotool sleep 1 && xdotool key p && xdotool sleep 0.1 && xdotool key ctrl+2 key ctrl+p type "$name feedback" && xdotool key KP_Enter
    return
    
    extension="$1"
    name="${@:2}"
    local dir="$HOME/obsidian/main/dolphin/local/ratings/$name"
    command mkdir "$dir" && cd "$dir" && \
    
    clipboard_content=$(xclip -selection clipboard -o) && \
    tokens=("${(@s/✨ Assistant/)clipboard_content}") && \
    alphabet=({A..Z}) && \
    for i in {2..${#tokens[@]}}; do
        truncated_token=$(echo "${tokens[i]}" | sed '/Rate the overall response quality:/,$d') && \
        echo "$truncated_token" > "res${alphabet[i-1]}.${extension}"
    done && \
    
    code -r .
}
