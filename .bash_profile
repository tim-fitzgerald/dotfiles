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



