touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

echo -ne '\n' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew uninstall --ignore-dependencies libimobiledevice
brew uninstall --ignore-dependencies usbmuxd
brew install --HEAD usbmuxd
brew install --HEAD libimobiledevice
