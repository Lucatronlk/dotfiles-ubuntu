#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

chsh -s /bin/bash

# Install Homebrew Packages
brew_install "Android File Transfer" "android-file-transfer" "--cask"
brew_install "eyeD3" "eye-d3"
brew_install "Rectangle" "rectangle" "--cask"
brew_install "Unarchiver" "the-unarchiver" "--cask"
brew_install "VLC" "vlc" "--cask"
brew_install "Python" "python"
brew_install "Kubectl" "kubectl"
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

kubectl krew install neat

brew_install "Helm" "helm"
brew_install "Lens" "lens"
brew_install "Kubenav" "kubenav"

brew_tap "Hashicorp" "hashicorp/tap"
brew_install "Terraform" "hashicorp/tap/terraform"
# need to unlink terraform so that I can install tfenv

brew_tap "Terraform Docs" "terraform-docs/tap"
brew_install "Terraform Docs" "terraform-docs/tap/terraform-docs"

brew_install "AWS CLI" "awscli"
brew_install "Azure CLI" "azure-cli"
brew_install "Google Cloud SDK" "google-cloud-sdk" "--cask"
brew_install "Multipass" "multipass" "--cask"
brew_install "Podman" "podman"
brew_install "Iterm2" "iterm2" "--cask"
brew_install "Powerline-go" "powerline-go"
brew_install "Ansible" "ansible"
brew_install "Certificates" "ca-certificates"
brew_install "Coreutils" "coreutils"
brew_install "Git" "git"
brew_install "Gitleaks" "gitleaks"
brew_install "Golang" "go"
brew_install "GolangCi lint" "golangci-lint"
brew_install "GoSec" "gosec"
brew_install "Jq" "jq"
brew_install "K6" "k6"
brew_install "K8s Kind" "kind"
brew_install "TF Sec" "tfsec"
brew_install "Nmap" "nmap"
brew_install "Virtual ENV" "virtualenv"
brew_install "Java" "openjdk"
brew_install "Pre-commit" "pre-commit"
brew_install "SQLite" "sqlite"
brew_install "Wget" "wget"
brew_install "OpenSSL" "openssl"
brew_install "Putty" "putty"
brew_install "Telnet" "telnet"
brew_install "Packer" "packer"
brew_install "Tfenv" "tfenv"
brew_install "KubeLinter" "kube-linter"
brew_install "Grep" "grep"
brew_install "Tmux" "tmux"
brew_install "Ruby" "ruby"
brew_install "JFrog CLI" "jfrog-cli"
brew_install "Vim" "vim"
brew_install "Vault" "vault"
brew_install "Docker" "docker"
brew_install "Docker Compose" "docker-compose"
brew_install "Monitor Control" "MonitorControl"
