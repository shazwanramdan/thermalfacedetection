
TEMPLATE = app
QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = 

RPI_LIBS = ../raspberrypi_libs
LEPTONSDK = leptonSDKEmb32PUB

PRE_TARGETDEPS += sdk
QMAKE_EXTRA_TARGETS += sdk sdkclean
sdk.commands = make -C $${RPI_LIBS}/$${LEPTONSDK}
sdkclean.commands = make -C $${RPI_LIBS}/$${LEPTONSDK} clean

DEPENDPATH += .
INCLUDEPATH += . $${RPI_LIBS}
INCLUDEPATH += /usr/local/include/opencv2
INCLUDEPATH += /usr/include/python2.7
INCLUDEPATH += /usr/include/arm-linux-gnueabihf/python2.7


DESTDIR=.
OBJECTS_DIR=gen_objs
MOC_DIR=gen_mocs

HEADERS += *.h \
    facedetect.h

SOURCES += *.cpp \
    facedetect.cpp

unix:LIBS += -L$${RPI_LIBS}/$${LEPTONSDK}/Debug -lLEPTON_SDK

LIBS += -L/usr/local/lib -lopencv_core -lopencv_highgui \
    -lopencv_features2d \
    -lopencv_flann \
    -lopencv_hal \
    -lopencv_imgcodecs \
    -lopencv_imgproc \
    -lopencv_ml \
    -lopencv_calib3d \
    -lopencv_video \
    -lopencv_videoio \
    -lopencv_photo -lopencv_shape -lopencv_stitching -lopencv_superres -lopencv_videostab -lopencv_objdetect -lpython2.7


unix:QMAKE_CLEAN += -r $(OBJECTS_DIR) $${MOC_DIR}

