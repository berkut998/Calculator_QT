QT += testlib
QT += gui
CONFIG += qt warn_on depend_includepath testcase

TEMPLATE = app

SOURCES +=  tst_test.cpp \
    ../Calculator_nees/calculate_result.cpp

HEADERS += \
    ../Calculator_nees/calculate_result.h
