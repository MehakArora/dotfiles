# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#MY ALIASES
alias sqm='squeue -u maror24'
alias cdi='cd /labs/kamaleswaranlab/MODS/Encounter_Pickles/em/PSV_FILES_NEW/Imputed/'
alias cdp='cd /labs/kamaleswaranlab/MODS/Encounter_Pickles/em/PSV_FILES_NEW/Projected/'
alias cdsepy='cd /labs/kamaleswaranlab/MODS/EliteDataHacks/sepy/new_sepy_mehak/'
alias cdcxr='cd /labs/kamaleswaranlab/niffler-data/chest_xrays/'
alias sizeofd='du -sh * | sort -h'
alias tmuxa='tmux attach -t'
alias rapids='conda activate /labs/kamaleswaranlab/anaconda3/rapids'
alias multimodal='conda activate /labs/kamaleswaranlab/anaconda3/multimodal'
alias condact='conda deactivate'
alias monai='conda activate monai'
alias cdnifflerdata='cd /labs/kamaleswaranlab/niffler-data/'
alias cdh='cd ~'
alias getcwd='echo "$PWD"'
alias cdc='cd /labs/collab/'
alias bashrc='nano $HOME/.bashrc && source $HOME/.bashrc'
alias anon='cd /labs/kamaleswaranlab/niffler-data/Niffler/modules/dicom-anonymization/'
alias clust='cd /labs/collab/Sepsis/SepsisProjectionProject/Clustering/'
alias pe='cd /labs/collab/K-lab-MODS/MODS-PHI/Encounter_Pickles/em/PSV_FILES_NEW/'
alias pg='cd /labs/collab/K-lab-MODS/MODS-PHI/Encounter_Pickles/gr/PSV_FILES_NEW/'
alias g='git '
alias gcm='git commit -m'

sr () 
{ 
    srun --mem=$1 --pty bash
}

function srunpy() {
    # Extract arguments
    time_allocation=$1
    memory=$2
    script_name=$3
    out=$4
    err=$5

    # Submit job to SLURM
    srun --time=$time_allocation --mem=$memory --job-name=$script_name --output=$out --error=$err python $script_name
}

function srgpu(){
    time_allocation=$1
    memory=$2
    gpus=$3
    
    srun --time=$time_allocation --mem=$memory --partition=gpu --gres=gpu:$3 --pty bash
}

function expl(){
        export LANGUAGE=UTF-8
        export LC_ALL=en_US.UTF-8
	export LANG=UTF-8
	export LC_CTYPE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_COLLATE=$LANG
	export LC_CTYPE=$LANG
	export LC_MESSAGES=$LANG
	export LC_MONETARY=$LANG
	export LC_NUMERIC=$LANG
	export LC_TIME=$LANG
	export LC_ALL=$LANG
}
	
# User specific aliases and functions
GRB_LICENSE_FILE=/home/maror24/gurobi/gurobi.lic
export PATH="/labs/kamaleswaranlab/tesseract-custom/bin:$PATH"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/maror24/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/maror24/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/maror24/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/maror24/anaconda3/bin:$PATH"
        #export PATH="/labs/kamaleswaranlab/tesseract-custom/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Modify virtual environment prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Custom virtual env prompt function
venv_prompt() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo -e "(venv)"
    elif [ -n "$CONDA_DEFAULT_ENV" ]; then
        echo -e "(conda:$CONDA_DEFAULT_ENV)"
    fi
}

# Update PS1 to include virtual env
export PS1="\[\033[94m\]\${USER:0:5}@\h\[\033[00m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \[\033[31m\]\$(venv_prompt)\[\033[00m\]$ "


