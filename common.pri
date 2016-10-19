VERSION = 0.5.6
SPECIAL_BUILD = Internal
TOPDIR = $$PWD

# Setup build number, where available.
isEmpty(VER_BUILD):VER_BUILD = $$(APPVEYOR_BUILD_NUMBER)
isEmpty(VER_BUILD):VER_BUILD = 0
isEmpty(VER_PAT) {
    # Qmake only automatically assigns VER_PAT on some platforms.
    VER_PARTS = $$split(VERSION, .)
    VER_PAT = $$member(VER_PARTS, 2)
}
win32:VERSION = $$VERSION"."$$VER_BUILD

# Validate the special build (for inclusion in TCX output).
!contains(SPECIAL_BUILD, ^(Internal|Alpha|Beta|Release)) {
    error("SPECIAL_BUILD must be one of: Internal, Alpha, Beta, or Release")
}

# Disable automatic ASCII conversions (best practice for internationalization).
DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

# Enable C++11 for all supported compilers.
#CONFIG += c++11

# Enable all warnings for all targets.
CONFIG += warn_on

# Treat warnings as errors.
win32-msvc*:QMAKE_CXXFLAGS_WARN_ON += /WX
else:       QMAKE_CXXFLAGS_WARN_ON += -Werror

# Neaten the output directories.
CONFIG(debug,debug|release) DESTDIR = debug
CONFIG(release,debug|release) DESTDIR = release
MOC_DIR = $$DESTDIR/tmp
OBJECTS_DIR = $$DESTDIR/tmp
RCC_DIR = $$DESTDIR/tmp
UI_DIR = $$DESTDIR/tmp

# Workaround a couple of known bugs with C++11 support for Qt with gcc on OSX.
macx-g++:contains(CONFIG, c++11) {
    equals(QT_MAJOR_VERSION,5):equals(QT_MINOR_VERSION,2) {
        # https://bugreports.qt.io/browse/QTBUG-28097
        message(Setting OSX deployment target to 10.7 for for C++11 with $$QMAKE_CXX and $$QT_VERSION)
        QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.7
        message(Adding '-stdlib=libc++' flag for C++11 with $$QMAKE_CXX and $$QT_VERSION)
        QMAKE_CXXFLAGS += -stdlib=libc++
    }
    equals(QT_MAJOR_VERSION,5):equals(QT_MINOR_VERSION,5) {
        message(Adding '-stdlib=libc++' flag for C++11 with $$QMAKE_CXX and $$QT_VERSION)
        QMAKE_CXXFLAGS += -stdlib=libc++
    }
}
