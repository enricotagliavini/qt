# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit qt4-build-edge

DESCRIPTION="The Qt3 support module for the Qt toolkit."
HOMEPAGE="http://www.trolltech.com/"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="4"
KEYWORDS=""
IUSE="+accessibility"

DEPEND="~x11-libs/qt-core-${PV}[qt3support]
	~x11-libs/qt-gui-${PV}[accessibility=,qt3support]
	~x11-libs/qt-sql-${PV}[qt3support]
	!x11-libs/qt:${SLOT}"
RDEPEND="${DEPEND}"

QT4_TARGET_DIRECTORIES="
src/qt3support
src/tools/uic3
tools/designer/src/plugins/widgets
tools/qtconfig
tools/porting"
QT4_EXTRACT_DIRECTORIES="${QT4_TARGET_DIRECTORIES}
src/tools/uic/
"

src_configure() {
	myconf="${myconf} -qt3support -no-gstreamer -no-phonon
		$(qt_use accessibility)"

	qt4-build_src_configure
}
