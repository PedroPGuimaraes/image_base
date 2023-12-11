FROM rhub/r-minimal:4.3-patched

ENV TZ=UTC

WORKDIR /usr/src/app

RUN apk update && apk add \
    cairo-dev \
    sudo \
    libressl-dev \
    gnutls-dev \
    libxt-dev \
    libssh2-dev \
    libxml2-dev \
    pkgconfig \
    zlib-dev \
    glib-dev \
    libcurl \
    libressl \
    libc6-compat \
    openssl

RUN apk add --no-cache linux-headers gfortran g++ curl-dev && \
    installr
    
RUN installr -c \
   remotes 
    
RUN apk add --no-cache linux-headers gfortran g++ curl-dev && \
    R -q -e 'remotes::install_github("PedroPGuimaraes/image_base.git@v1.0.0", auth_token = "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", dependencies = c("Imports"), force = TRUE, upgrade = FALSE)'  \