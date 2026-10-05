# check=skip=InvalidDefaultArgInFrom

# The Makefile supplies the required digest-pinned BASE_IMAGE argument.

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG VINYL_VER
ARG TARGETPLATFORM
ARG BUILDPLATFORM

ENV VINYL_VER="${VINYL_VER}"

COPY GeoLite2-Country.mmdb.gz /usr/share/GeoIP/

RUN set -ex; \
    \
    addgroup -g 1000 -S varnish; \
	adduser -u 1000 -D -S -s /bin/bash -G varnish varnish; \
	echo "PS1='\w\$ '" >> /home/varnish/.bashrc; \
    \
    apk --update --no-cache -t .varnish-run-deps add \
        gcc \
        libc-dev \
        libedit \
        libmaxminddb \
        libmhash --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        libunwind \
        geoip \
        libgcc \
        make \
        ncurses-libs \
        openssl \
        pcre \
        pwgen \
        xz-libs; \
    \
    apk --update --no-cache -t .varnish-build-deps add \
        attr \
        autoconf \
        automake \
        build-base \
        git \
        geoip-dev \
        libedit-dev \
        libmaxminddb-dev \
        libmhash-dev --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        libunwind-dev \
        libtool \
        linux-headers \
        ncurses-dev \
        openssl-dev \
        pcre2-dev \
        py3-docutils \
        py3-sphinx \
        python3 \
        rsync \
        xz-dev; \
    \
    vinyl_url="https://vinyl-cache.org/downloads/vinyl-cache-${VINYL_VER}.tgz"; \
    wget -qO- "${vinyl_url}" | tar xz -C /tmp/; \
    cd /tmp/vinyl-cache-*; \
    mkdir -p /tmp/pkg; \
    \
    # musl does not define ssize_t through the headers this file includes. \
    sed -i 's|^#include "vapi/vsm.h"|#include <sys/types.h>\n&|' bin/vinyltest/vtc_vsm.c; \
    # This test expects glibc's wording of a getopt error message. \
    rm bin/vinyltest/tests/u00022.vtc; \
    \
    ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--localstatedir=/var/lib \
		--with-statedir=/var/lib/varnish \
        --with-unwind \
		--without-jemalloc; \
    \
    make -j "$(nproc)"; \
    make -j "$(nproc)" check VERBOSE=1; \
    make DESTDIR=/tmp/pkg install; \
    \
    mkdir -p /tmp/pkg/usr/share/vinyl-cache; \
    mv LICENSE /tmp/pkg/usr/share/vinyl-cache/; \
    \
    pkgdir="/tmp/pkg"; \
    binfiles=$(scanelf -R "$pkgdir" | grep ET_DYN | sed "s:$pkgdir\/::g" | sed "s:ET_DYN ::g"); \
    for f in $binfiles; do \
        srcdir=$(dirname $pkgdir/$f); \
        srcfile=$(basename $pkgdir/$f); \
        cd $srcdir; \
        XATTR=$(getfattr --match="" --dump "${srcfile}"); \
        strip $srcfile; \
        [ -n "$XATTR" ] && { echo "$XATTR" | setfattr --restore=-; } \
    done; \
    \
    # Remove info, help, docs (default_docs from alpinelinux/abuild). \
    pkgdir=/tmp/pkg; \
    for i in doc man info html sgml gtk-doc ri help; do \
        if [ -d "$pkgdir/usr/share/$i" ]; then \
            rm -rf "$pkgdir/usr/share/$i"; \
        fi; \
    done; \
    \
    # Collect info about dev packages to delete after we run make check for modules. \
    # (modified version of default_dev from alpinelinux/abuild).
    cd /tmp/pkg; \
    libdirs=usr/; \
    [ -d lib/ ] && libdirs="lib/ $libdirs"; \
    for i in usr/include/* usr/lib/pkgconfig/vinyl* usr/share/aclocal/vinyl* \
            usr/share/gettext usr/bin/*-config \
            usr/share/vala/vapi usr/share/gir-[0-9]* \
            usr/share/qt*/mkspecs \
            usr/lib/qt*/mkspecs \
            usr/lib/cmake \
            $(find $libdirs -name '*.[acho]' \
                -o -name '*.prl' 2>/dev/null); do \
        if [ -e "$pkgdir/$i" ] || [ -L "$pkgdir/$i" ]; then \
            echo "/$i" >> /tmp/varnish-dev-files; \
        fi; \
    done; \
    \
    for i in lib/*.so usr/lib/*.so; do \
        if [ -L "$i" ]; then \
            echo "/$i" >> /tmp/varnish-dev-files; \
        fi; \
    done; \
    \
    rsync -a --links /tmp/pkg/ /; \
    \
    # Vinyl Cache 9 renamed its programs; keep the Varnish names working. \
    for f in /usr/bin/vinyl* /usr/sbin/vinyl*; do \
        ln -s "${f##*/}" "${f%/*}/varnish${f##*/vinyl}"; \
    done; \
    \
    gunzip /usr/share/GeoIP/GeoLite2-Country.mmdb.gz; \
    git clone --depth 1 -b devel --single-branch https://github.com/varnishcache-friends/libvmod-geoip2 /tmp/libvmod-geoip2; \
    cd /tmp/libvmod-geoip2; \
#    wget -qP /usr/share/GeoIP http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz; \
    ./autogen.sh; \
    ./configure; \
    make; \
    make install; \
    make -j "$(nproc)" check VERBOSE=1; \
    \
    libvmod_digest_ver="1.1.1"; \
    libvmod_digest_url="https://github.com/varnish/libvmod-digest/archive/libvmod-digest-${libvmod_digest_ver}.tar.gz"; \
    wget -qO- "${libvmod_digest_url}" | tar xz -C /tmp/; \
    cd /tmp/libvmod-digest-*; \
    # The release declares Varnish 9.1 only; build and test it against Vinyl Cache. \
    sed -i 's/datarootdir varnishapi/datarootdir vinylapi/' autogen.sh; \
    sed -i 's/VCACHE_REQUIRE(\[\[varnish\], \[9.1.0\]\])/VCACHE_REQUIRE([[vinyl], [9.1.0]])/' configure.ac; \
    grep -q 'VCACHE_REQUIRE(\[\[vinyl\]' configure.ac; \
    sed -i 's/^varnish v/vinyl v/' src/tests/*.vtc; \
    ./autogen.sh; \
    ./configure; \
    make; \
    make install; \
    make -j "$(nproc)" check VERBOSE=1; \
    \
    varnish_modules_ver="0.29.0"; \
    wget -qO- "https://github.com/varnish/varnish-modules/releases/download/${varnish_modules_ver}/varnish-modules-${varnish_modules_ver}.tar.gz" | tar xz -C /tmp/; \
    cd /tmp/varnish-modules*; \
    # One test still starts the server under its Varnish name. \
    sed -i 's/^varnish v/vinyl v/' src/tests/vsthrottle/test07.vtc; \
    ./configure; \
    make; \
    make install; \
    make -j "$(nproc)" check VERBOSE=1; \
    \
    install -d -o varnish -g varnish -m750 \
		/var/cache/varnish \
		/var/log/varnish \
		/var/lib/varnish; \
    \
    install -d -o root -g varnish -m750 \
	    /etc/varnish \
	    /etc/varnish/defaults \
	    /etc/varnish/includes; \
    \
    # VCL stays in /etc/varnish; the Vinyl Cache default path points to it. \
    ln -s /etc/varnish /etc/vinyl-cache; \
    \
    mkdir -p /etc/init.d/; \
    touch /etc/varnish/preset.vcl /etc/init.d/varnishd /etc/varnish/secret /etc/varnish/default.vcl; \
    chown varnish:varnish \
        /etc/varnish/preset.vcl \
        /etc/varnish/default.vcl \
        /etc/varnish/secret \
        /etc/init.d/varnishd \
        /etc/varnish/defaults \
        /etc/varnish/includes; \
    chmod +x /etc/init.d/varnishd; \
    \
    while IFS= read -r file ; do rm -rf -- "${file}" ; done < /tmp/varnish-dev-files; \
    apk del --purge .varnish-build-deps; \
    rm -rf /tmp/*; \
    rm -rf /var/cache/apk/*

USER varnish

EXPOSE 6081 6082

VOLUME /var/lib/varnish

COPY templates /etc/gotpl/
COPY bin /usr/local/bin/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/etc/init.d/varnishd"]
