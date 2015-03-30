# Debian packaging for Gradle 2.x

HOW TO USE:

```sh
gem install fpm
./gradle-mkdeb.sh
```

The script will download a Gradle binary distribution from gradle.org, unpack
it, and use [fpm](https://github.com/jordansissel/fpm) to produce a .deb
package.

The deb will put Gradle at /opt/gradle-${VERSION}/bin/gradle, and will use
[update-alternatives](http://manpages.ubuntu.com/manpages/utopic/en/man8/update-alternatives.8.html) to install a symlink on the system at /usr/bin/gradle.
