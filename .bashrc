 # .bashrc file
 parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
 }
 
 PS1='\[\033[01;35m\]\u\[\e[0m\] :\[\033[01;34m\]\w \[\033[33m\]$(parse_git_branch)\$ \[\033[00m\]'
 
 PROMPT_DIRTRIM=1 #shows just the current directory name
 alias ls='ls --color=auto'
 alias ll='ls -alF'
 alias la='ls -A'
 alias l='ls -CF'
 
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 
g() {
     git add -A
     git commit -m "$1"
     git push origin main
     echo "Jonner"
}
 
ts() {
     npm install typescript --save-dev
         npm install ts-node --save-dev
         npx tsc --init!
     mkdir src
     touch ./src/$1.ts
 }
 
runts() {
     npx ts-node ./src/$1
         npx prettier --write ./src/$1
     npx eslint ./src/$1
 }
 
rules() { 
     printf "g \nts \nrunts\n"
}
