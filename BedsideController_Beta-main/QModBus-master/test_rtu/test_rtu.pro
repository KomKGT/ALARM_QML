!include( ../qmodbus.pri ) {
    error( "Couldn't find the qmodbus.pri file!" )
}


TARGET = test_rtu

RESOURCES += \
    qquickwidget.qrc

DISTFILES += \
    qtquickcontrols2.conf

