export EDITOR=vim

export TERM=xterm-256color

export RAILS_ENV=development
export RACK_ENV=development
export NODE_ENV=development

export ANDROID_HOME=${HOME}/Android/Sdk
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default-java/jre
export PATH=$PATH:${JAVA_HOME}/bin:${HOME}/.local/bin:${HOME}/android-studio/bin:${ANDROID_HOME}/platform-tools

export AWS_VAULT_BACKEND=file

. ~/.nvm/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mio/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mio/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mio/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mio/google-cloud-sdk/completion.zsh.inc'; fi
