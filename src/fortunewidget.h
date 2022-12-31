/*
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#ifndef FORTUNEWIDGET_H
#define FORTUNEWIDGET_H


#include <Plasma/Applet>
#include "QRandomGenerator"
#include <qt5/QtCore/QDebug>
#include <QDir>
#include <qt5/QtCore/QFile>

class FortuneWidget : public Plasma::Applet
{
	Q_OBJECT
	Q_PROPERTY(QString nativeText READ nativeText CONSTANT)
	Q_PROPERTY(QString hlaska READ dejHlasku CONSTANT)

public:
	FortuneWidget( QObject *parent, const QVariantList &args );
	~FortuneWidget();

	Q_INVOKABLE bool dir_exists( QString durl );
	QString nativeText();
	QString dejHlasku();
	//bool dir_exists( QString durl );


private:
	QString m_nativeText;
	bool m_exists;
	QString hlaska();
	int randInt( int low, int high );
	QStringList seznamSouboru;
	QStringList nalezeneAdresare;

};

#endif
