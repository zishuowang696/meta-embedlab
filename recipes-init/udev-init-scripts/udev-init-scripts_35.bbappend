# Fix: Gentoo gitweb tarball URL (https://gitweb.gentoo.org/...) returns 404/502
# Use git:// protocol which is still accessible.
SRC_URI = "git://anongit.gentoo.org/proj/udev-gentoo-scripts.git;branch=master;protocol=git"

SRCREV = "0262986f5d18b53f1b1bb2de8183678e7df0a68c"

# Fix for Yocto 6.0 UNPACKDIR change
# With git:// source, the checkout dir is named 'git' by default
S = "${UNPACKDIR}/git"
