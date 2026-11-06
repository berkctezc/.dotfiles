#!/usr/bin/env bash

brew update
brew upgrade
BREW_PREFIX=$(brew --prefix)

brew trust bramstein/webfonttools
brew tap bramstein/webfonttools
yes | brew install \
coreutils \
moreutils \
findutils \
gnu-sed \
bash \
wget \
gnupg \
vim \
grep \
openssh \
screen \
php \
gmp \
sfnt2woff \
woff2 \
aircrack-ng \
bfg \
binutils \
binwalk \
cifer \
dex2jar \
dns2tcp \
fcrackzip \
foremost \
hydra \
john \
knock \
netpbm \
nmap \
pngcheck \
socat \
sqlmap \
tcpflow \
tcpreplay \
ucspi-tcp \
xpdf \
xz \
ack \
git \
git-lfs \
gs \
imagemagick \
lua \
lynx \
p7zip \
pigz \
pv \
rename \
rlwrap \
ssh-copy-id \
tree \
vbindiff \
zopfli \

brew cleanup