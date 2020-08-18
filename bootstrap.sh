#!/bin/sh
    echo "checking for homebrew updates";
    brew update
    function install_current {
      echo "trying to update $1"
      brew upgrade $1 || brew install $1 || true
      brew link $1
    }
    if [ -e "Mintfile" ]; then
      install_current mint
      mint bootstrap
    fi
    # Install gems if a Gemfile exists
    if [ -e "Gemfile" ]; then
      echo "installing ruby gems";
      # install bundler gem for ruby dependency management
      gem install bundler --no-document || echo "failed to install bundle";
      bundle config set deployment 'true';
      bundle config path vendor/bundle;
      bundle install || echo "failed to install bundle";
    fi
    
    set -e

    if [ -f "./Podfile" ] && [ ! -d "./Pods" ]; then
        echo "Podfile found and Pods are not checked-in to git; installing Pods"
        if [ -f "./Podfile.lock" ]; then
            current_version=`pod --version | xargs echo -n`
            podfile_version=`cat Podfile.lock | grep -E 'COCOAPODS: \d(\.\d)*' | sed -E 's/COCOAPODS: (.*)/\1/' | xargs echo -n`
            if [ "$current_version" != podfile_version ]; then
                echo "Cocoapods version $current_version doesn't match the Podfile.lock version $podfile_version, installing Podfile.lock version"
                gem cleanup cocoapods || true
                gem uninstall cocoapods xcodeproj -ax --force || true
                gem install cocoapods -N --force --version "$podfile_version"
            else
                echo "Cocoapods version $current_version matches the Podfile.lock version"
            fi
        fi

        set +e
        pod install
        error_code=$?
        set -e
        if [ $error_code -eq 31 ]; then
            echo "Local specs is not up-to-date, re-running pod install and updating the local spec repo."
            pod install --repo-update
        else
            exit $error_code
        fi
    else
        echo "Podfile not found or Pods folder is checked-in to git; not installing Pods"
    fi
