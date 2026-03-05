ARG BASE_IMAGE_TAG

FROM wodby/alpine:${BASE_IMAGE_TAG}

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
    varnish_url="https://vinyl-cache.org/downloads/varnish-${VINYL_VER}.tgz"; \
    wget -qO- "${varnish_url}" | tar xz -C /tmp/; \
    cd /tmp/varnish-*; \
    mkdir -p /tmp/pkg; \
    \
    ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--localstatedir=/var/lib \
        --with-unwind \
		--without-jemalloc; \
    \
    make -j "$(nproc)"; \
    make check; \
    make DESTDIR=/tmp/pkg install; \
    \
    mkdir -p /usr/share/varnish; \
    mv LICENSE /usr/share/varnish/; \
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
    for i in usr/include/* usr/lib/pkgconfig/varnish* usr/share/aclocal/varnish* \
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
    gunzip /usr/share/GeoIP/GeoLite2-Country.mmdb.gz; \
    git clone --depth 1 -b main --single-branch https://github.com/varnishcache-friends/libvmod-geoip2 /tmp/libvmod-geoip2; \
    cd /tmp/libvmod-geoip2; \
#    wget -qP /usr/share/GeoIP http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz; \
    ./autogen.sh; \
    ./configure; \
    make; \
    make install; \
    make check; \
    \
    libvmod_digest_ver="1.0.3"; \
    libvmod_digest_url="https://github.com/varnish/libvmod-digest/archive/libvmod-digest-${libvmod_digest_ver}.tar.gz"; \
    wget -qO- "${libvmod_digest_url}" | tar xz -C /tmp/; \
    cd /tmp/libvmod-digest-*; \
    ./autogen.sh; \
    ./configure; \
    make; \
    make install; \
    make check; \
    \
    varnish_modules_ver="0.27.0"; \
    wget -qO- "https://github.com/varnish/varnish-modules/releases/download/${varnish_modules_ver}/varnish-modules-${varnish_modules_ver}.tar.gz" | tar xz -C /tmp/; \
    cd /tmp/varnish-modules*; \
    ./configure; \
    make; \
    make install; \
    make check; \
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
