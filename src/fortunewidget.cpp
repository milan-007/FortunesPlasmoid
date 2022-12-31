/*
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#include "fortunewidget.h"
#include <KLocalizedString>

FortuneWidget::FortuneWidget(QObject *parent, const QVariantList &args)
    : Plasma::Applet(parent, args),
      m_nativeText(i18n("Text coming from C++ plugin"))
{
}

FortuneWidget::~FortuneWidget()
{
}

QString FortuneWidget::nativeText()
{
	return m_nativeText;
}

QString FortuneWidget::dejHlasku(){
	int hlasek				=	0;
	int kterySoubor		=	0;
	QString hlaska			=	"";
	QStringList hlasky	= QStringList();
	kterySoubor = FortuneWidget::randInt( 0, seznamSouboru.count()-1 );
	qDebug() << 28 << kterySoubor  << seznamSouboru.at( kterySoubor ) ;
	QFile vybrany( seznamSouboru.at( kterySoubor ) );
		if(!vybrany.open(QIODevice::ReadOnly)) {
		qDebug() << vybrany.errorString();
		return seznamSouboru.at( kterySoubor ) + " - " + vybrany.errorString();
	}
	QTextStream in(&vybrany);
	while(!in.atEnd()) {
		QString line = in.readLine();
		if( line.startsWith("%") ){
			hlasek ++;
			hlasky	<<	hlaska;
			hlaska	=	"";
			line		=	"";
		}
		if( line.startsWith("\t")){
			line.replace( "\t", "   ");
		}
		hlaska	+=	line +"\n";
	}
	hlasek ++;
	int vybranahlaska	=	FortuneWidget::randInt( 0, hlasky.count()-1 );

	qDebug() <<48 <<  hlasky.count();
	return hlasky.at(vybranahlaska);
// 	qDebug() << " tady";
// 	return "blabla";
}

bool FortuneWidget::dir_exists( QString durl ) {
	//QString durl = "";
	QString adresar = "";
	QString loc = QLocale().name().left(2);
	if( QDir( durl ).exists() ){
		if( QDir( durl+loc).exists() ){
			adresar= durl+loc;
		} else {
			adresar =  durl;
		}
		QDir tentoAdresar( adresar );
		tentoAdresar.setNameFilters( QStringList() <<"*.u8");
		QStringList soubory	= tentoAdresar.entryList();
		if( soubory.isEmpty() ){
			return false;
		}
		for( int i = 1; i < soubory.size(); i++ ){
			seznamSouboru << tentoAdresar.filePath( soubory.at(i) );
		}
	} else {
		adresar	=	"";
	}

	if( adresar.isEmpty() ){
		return false;
	} else {
		nalezeneAdresare<<adresar;
		return true;
	}

}

int FortuneWidget::randInt( int low, int high ){
	 int nahCislo	=	 QRandomGenerator::global()->generate();
	 //qDebug() << 30 << nahCislo;
	 if( nahCislo < 0 ) nahCislo = qAbs( nahCislo );
	 // qDebug() << 32 << nahCislo;
	 nahCislo	=	nahCislo % ((high + 1) - low) + low;
	 return nahCislo;
}



K_EXPORT_PLASMA_APPLET_WITH_JSON(fortunewidget, FortuneWidget, "metadata.json")

#include "fortunewidget.moc"
