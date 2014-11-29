# Debian packaging for Gradle 2.2.1

HOW TO USE:

```sh
gem install fpm
./gradle-mkdeb.sh
```

The script will download the Gradle 2.2.1 binary distribution from gradle.org,
unpack it, and use [fpm](https://github.com/jordansissel/fpm) to produce a .deb
package.

The deb will put Gradle at /opt/gradle-2.2.1/bin/gradle, and will use
[update-alternatives](http://manpages.ubuntu.com/manpages/utopic/en/man8/update-alternatives.8.html) to install a symlink on the system at /usr/bin/gradle.
