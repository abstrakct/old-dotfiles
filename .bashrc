PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[m\] \[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\] '

# Check for an interactive session
[ -z "$PS1" ] && return
#PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto -F'
alias l='ls -lh'
alias la='ls -la'
alias pac='sudo pacman'
alias t=todo.sh
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="cal -m"
alias c3="cal -3m"
#alias e=elinks
#alias x=startx
alias reload="source ~/.bashrc"
alias grep="grep --color=always"
alias nano="nano -w"
alias pico=nano
alias ya=yaourt
alias chat=weechat-curses
alias futurama="echo && curl -Is slashdot.org | sed -ne '/^X-[FBL]/s/^X-//p' && echo"
alias rbcl="cat ~/bin/cmus/rebuild-library | cmus-remote"
alias goleia="sudo mount -t nfs4 10.0.0.23:/ /mnt/leia"
# alias nanowrimo="vim skriving/nanowrimo2009/nanowrimo.txt"
alias awe="cp .xinitrc.nano .xinitrc && startx"
#alias x="cp .xinitrc.normal .xinitrc && startx"
alias x=startx

PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[m\] \[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\]'

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

set show-all-if-ambiguous on

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1	;;
			*.tar.gz)	tar xvzf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		unrar $1	;;
			*.gz)		gunzip $1	;;
			*.tbz2)		tar xvjf $1	;;
			*.tgz)		tar xvzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1		;;
			*)		echo "Don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

# Define Stuff
define () {
echo
elinks -dump "http://www.google.com/search?hl=en&q=define%3A+${1}" | grep -m 5 -C 2 -A 5 -w "o" # | sed 's/;/ -/g' | cut -c 8-   > /tmp/templookup.txt
#            if [[ -s  /tmp/templookup.txt ]] ;then    
#                until ! read response
#                    do
#                    echo "${response}"
#                    done < /tmp/templookup.txt
#                else
#                    echo "Sorry $USER, I can't find the term \"${1} \""                
#            fi    
#rm -f /tmp/templookup.txt
echo
}

#check gmail
#gmail () {
#	echo
#	curl -u u:p --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if /<name>/; print "$2\n" if /<(title|name)>(.*)<\/\1>/;'
	echo
#}

#echo
#elinks -dump "http://www.google.com/search?hl=en&q=${1}" 
#echo
#}

function remind()
{
	sleep $1 && zenity --warning --text "$2" &
}



# Define a few Colours
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# MAKE MAN PAGES PRETTY
#######################################################

export LESS_TERMCAP_mb=$'\E[01;31m'             # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'        # begin bold
export LESS_TERMCAP_me=$'\E[0m'                 # end mode
export LESS_TERMCAP_se=$'\E[0m'                 # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'          # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'                 # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'       # begin underline

PATH=$PATH:/home/rolf/bin:.
export VISUAL=vim

echo
fortune
echo
