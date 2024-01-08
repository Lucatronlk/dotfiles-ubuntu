#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

agree_with_xcode_licence() {

    # Automatically agree to the terms of the `Xcode` license.
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license accept &> /dev/null
    print_result $? "Agree to the terms of the Xcode licence"

}

are_xcode_command_line_tools_installed() {
    xcode-select --print-path &> /dev/null
}

install_xcode() {

    # If necessary, prompt user to install `Xcode`.

    if ! is_xcode_installed; then
        open "macappstores://itunes.apple.com/en/app/xcode/id497799835"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until `Xcode` is installed.

    execute \
        "until is_xcode_installed; do \
            sleep 5; \
         done" \
        "Install Xcode.app"

}

# install_lightshoot() {

#     # If necessary, prompt user to install `Lightshoot`.

#     if ! is_lightshoot_installed; then
#         open "macappstores://itunes.apple.com/en/app/lightshot-screenshot/id526298438"
#     fi

#     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#     # Wait until `Lightshoot` is installed.

#     execute \
#         "until is_lightshoot_installed; do \
#             sleep 5; \
#          done" \
#         "Install Lightshot Screenshot.app"

# }

# install_amphetamine() {

#     # If necessary, prompt user to install `Amphetamine`.

#     if ! is_amphetamine_installed; then
#         open "macappstores://itunes.apple.com/en/app/amphetamine/id937984704"
#     fi

#     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#     # Wait until `Amphetamine` is installed.

#     execute \
#         "until is_amphetamine_installed; do \
#             sleep 5; \
#          done" \
#         "Install Amphetamine.app"

# }

install_xcode_command_line_tools() {

    # If necessary, prompt user to install
    # the `Xcode Command Line Tools`.

    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the `Xcode Command Line Tools` are installed.

    execute \
        "until are_xcode_command_line_tools_installed; do \
            sleep 5; \
         done" \
        "Install Xcode Command Line Tools"

}

is_xcode_installed() {
    [ -d "/Applications/Xcode.app" ]
}

set_xcode_developer_directory() {

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`.
    #
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch "/Applications/Xcode.app/Contents/Developer" &> /dev/null
    print_result $? "Make 'xcode-select' developer directory point to the appropriate directory from within Xcode.app"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "   Xcode\n\n"

    install_xcode_command_line_tools
    install_lightshoot
    install_amphetamine
    #install_xcode
    #set_xcode_developer_directory
    #agree_with_xcode_licence

}

main
