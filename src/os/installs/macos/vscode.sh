#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {
    execute "code --install-extension $2" "$1 plugin"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"

# Install VSCode
brew_install "Visual Studio Code" "visual-studio-code" "--cask"

printf "\n"

# Install the VSCode plugins
install_plugin "EditorConfig" "EditorConfig.EditorConfig"
install_plugin "File Icons" "vscode-icons-team.vscode-icons"
install_plugin "MarkdownLint" "DavidAnson.vscode-markdownlint"
install_plugin "Vim" "vscodevim.vim"
install_plugin "Azure Terraform" "ms-azuretools.vscode-azureterraform"
install_plugin "Vs Code Dev Containers" "ms-vscode-remote.remote-containers"
install_plugin "Docker" "ms-azuretools.vscode-docker"
install_plugin "Git Extension Pack" "donjayamanne.git-extension-pack"
install_plugin "Git History" "donjayamanne.githistory"
install_plugin "Gitignore" "codezombiech.gitignore"
install_plugin "GitLens" "eamodio.gitlens"
install_plugin "Hashicorp Terraform" "hashicorp.terraform"
install_plugin "indent-rainbow" "oderwat.indent-rainbow"
install_plugin "json" "ZainChen.json"
install_plugin "K8s" "ms-kubernetes-tools.vscode-kubernetes-tools"
install_plugin "Java" "redhat.java"
install_plugin "Log Highligter" "emilast.LogFileHighlighter"
install_plugin "Maven" "vscjava.vscode-maven"
install_plugin "One Dark pro" "zhuangtongfa.material-theme"
install_plugin "Open in github" "ziyasal.vscode-open-in-github"
install_plugin "Project Manager" "alefragnani.project-manager"
install_plugin "Pylance" "ms-python.vscode-pylance"
install_plugin "Python" "ms-python.python"
install_plugin "Remote - SSH" "ms-vscode-remote.remote-ssh"
install_plugin "Remote - SSH - Edit" "ms-vscode-remote.remote-ssh-edit"
install_plugin "Remote - Tunnels" "ms-vscode.remote-server"
install_plugin "Remote - Development" "ms-vscode-remote.vscode-remote-extensionpack"  
install_plugin "Remote - Explorer" "ms-vscode.remote-explorer"
install_plugin "Save as Root in Remote" "yy0931.save-as-root"
install_plugin "Yaml" "redhat.vscode-yaml"

# Close VSCode
osascript -e 'quit app "Visual Studio Code"'
