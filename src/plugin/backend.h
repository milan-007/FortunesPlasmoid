#ifndef BACKEND_H
#define BACKEND_H

#include <qt5/QtCore/QObject>
#include <qt5/QtCore/QUrl>
#include <qt5/QtCore/QFile>
#include <qt5/QtCore/QDebug>
#include <QDir>
#include "QRandomGenerator"
#include <QtWidgets/QMessageBox>

class NacitadloSouboru : public QObject
{
    Q_OBJECT

public:

		explicit NacitadloSouboru(QObject * parent = nullptr) : QObject(parent){}
		~NacitadloSouboru(){}
		QStringList seznamSouboru;
		QStringList nalezeneAdresare;
		Q_SLOT bool fileExists( QString jmeno, QString loc );
		Q_SLOT QString nacistSoubor();


private:
		int randInt( int low, int high );
		int i;


};




#endif
 // BACKEND_H
