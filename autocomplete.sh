

echo -e -n "would you like to allow tab completion for manpdf and manweb commands?\n(this may require you to type you password to modify the /usr/share/bash-completion/completions/man file)\n[y/n]";
read -r answer;
if [ "$answer" == "${answer#[Yy]}" ]; then
    echo "No changes made";
    exit 0;
fi

if [ -f "/usr/share/bash-completion/completions/man" ]; then 
        if grep   '^\s*complete.*\bman\b' "/usr/share/bash-completion/completions/man" | grep -qv 'manpdf\|manweb'; then 
            sudo sed -i '/^\s*complete.*\bman\b/ s/$/ manpdf manweb/' "/usr/share/bash-completion/completions/man"; 
            echo "Updated completion for man command"; 
        else \
            echo "ERROR: No suitable line found in /usr/share/bash-completion/completions/man could not update"; 
        fi \
else \
        echo "ERROR: /usr/share/bash-completion/completions/man not found could not update "; 
fi


