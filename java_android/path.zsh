# Install Android: https://gist.github.com/patrickhammond/4ddbe49a67e5eb1b9c03

asdf_update_maven_and_gradle_home() {
  local current
  if current=$(asdf current maven); then
    local version=$(echo $current | cut -d ' ' -f 1)
    export MAVEN_HOME=$(asdf where maven $version)
  else
    echo "No java version set. Type `asdf list-all maven` for all versions."
  fi

  if current=$(asdf current gradle); then
    local version=$(echo $current | cut -d ' ' -f 1)
    export GRADLE_HOME=$(asdf where gradle $version)
  else
    echo "No java version set. Type `asdf list-all gradle` for all versions."
  fi
}
asdf_update_maven_and_gradle_home

# Set JAVA_HOME
. ~/.asdf/plugins/java/set-java-home.zsh

export ANT_HOME=/usr/local/opt/ant
# export ANDROID_HOME=/usr/local/share/android-sdk/
# export ANDROID_NDK_HOME=/usr/local/share/android-ndk
# export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_SDK_ROOT="/Users/$USER/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT

export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
# export PATH=$JAVA_HOME/bin:$PATH
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# export PATH=$ANDROID_HOME/platform-tools:$PATH
# export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH
