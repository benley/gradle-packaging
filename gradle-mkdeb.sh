#!/bin/bash
set -e
set -x

description="Groovy based build system
Gradle is a build system written in Groovy. It uses Groovy
also as the language for its build scripts. It has a powerful
multi-project build support. It has a layer on top of Ivy
that provides a build-by-convention integration for Ivy. It
gives you always the choice between the flexibility of Ant
and the convenience of a build-by-convention behavior."

VERSION="2.4"
ITERATION="2"

wget -c \
  https://downloads.gradle.org/distributions/gradle-${VERSION}-bin.zip
mkdir -p build/opt
unzip -q -o -d build/opt/ gradle-${VERSION}-bin.zip

fpm_args=(
  -t deb
  -s dir
  --force
  --name "gradle-${VERSION}"
  --version "${VERSION}"
  --iteration "${ITERATION}"
  --depends "java-runtime | default-jre-headless"
  --architecture all
  --maintainer "Benjamin Staffin <ben@folsomlabs.com>"
  --vendor "Folsom Labs"
  --license "Apache-2.0"
  --category java
  --url https://www.gradle.org/
  --after-install gradle.postinst.erb
  --before-remove gradle.prerm.erb
  --template-scripts
  -C build
  --provides groovy
  --exclude '*.bat'
  --description "$description"
  opt
)

fpm "${fpm_args[@]}"
