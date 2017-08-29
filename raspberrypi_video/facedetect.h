/*
#ifndef FACEDETECT_H
#define FACEDETECT_H

#include <QThread>
#include <QtCore>
#include <QPixmap>
#include <QImage>

class facedetect : public QThread
{
public:
    facedetect();
    ~facedetect();
    virtual int run(int argc, char **argv);

signals:
  void updateText(QString);
  void updateImage(QImage);

private:

  QImage myImage1;

};

#endif // FACEDETECT_H
*/
