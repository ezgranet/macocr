
#!/bin/sh
# By Elijah Z Granet on 12 June 2015.
# Description: OCR pdfs
export PATH=$PATH:/opt/homebrew/bin


which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

else
    echo "Homebrew Installed"
fi
brew_install() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "Already Installed"
    else
        brew install $1 && echo "$1 is installed"
    fi }

brew_install "tesseract"; brew_install "tesseract-lang"; brew_install "ocrmypdf"; osascript -e 'display notification "Dependencies Installed!"'; killall "Dependency Installer"
