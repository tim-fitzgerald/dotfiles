for file in ~/.{path,bash_prompt,exports,aliases,functions,extra, secure}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#case insensitive globbing
shopt -s nocaseglob;

shopt -s histappend;

#autocorrect typos in path names using cd
shopt -s cdspell;

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/timfitz/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/timfitz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/timfitz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/timfitz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias gam="/Users/timfitz/bin/gamadv-xtd3/gam"

alias gam="/Users/timfitzgerald/bin/gamadv-xtd3/gam"
. "$HOME/.cargo/env"

alias gam="/Users/timfitzgerald1/bin/gamadv-xtd3/gam"
