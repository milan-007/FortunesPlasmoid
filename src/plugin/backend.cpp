#include "backend.h"

#include <stdio.h>
#include <stdlib.h>


QString NacitadloSouboru::nacistSoubor(){
	QStringList soubory	= QStringList();
	QStringList hlasky	= QStringList();
	QString hlaska			=	"";
	int hlasek	=	0;
	int kterySoubor	=	0;
	if( seznamSouboru.isEmpty()){
		//qDebug() << nalezeneAdresare;
		for( int i=0; i < nalezeneAdresare.count(); i++ ){
			//qDebug() << nalezeneAdresare[i];
			QDir prohledavanyAdresar( nalezeneAdresare.at(i) );
			prohledavanyAdresar.setNameFilters( QStringList() <<"*.u8");
			QStringList soubory	= prohledavanyAdresar.entryList();
			for( int i = 1; i < soubory.size(); i++ ){
				seznamSouboru << prohledavanyAdresar.filePath( soubory.at(i) );
			}
		}
		//qDebug() << soubory.count();
		qDebug() << seznamSouboru.count() << seznamSouboru;
		//qDebug() << seznamSouboru.at(1);
	}
	kterySoubor = NacitadloSouboru::randInt( 0, seznamSouboru.count()-1 );
	qDebug() << 29 << kterySoubor << seznamSouboru.at( kterySoubor ) ;
	QFile vybrany( seznamSouboru.at( kterySoubor ) );
	if(!vybrany.open(QIODevice::ReadOnly)) {
		qDebug() << vybrany.errorString();
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
		hlaska	+=	line +"\n";
	}
	hlasek ++;
	qDebug() <<45 <<  hlasky.count();
	int vybranahlaska	=	NacitadloSouboru::randInt( 0, hlasky.count()-1 );
	qDebug() << 47 << hlasky.at(vybranahlaska);
	return hlasky.at(vybranahlaska); ;
}

int NacitadloSouboru::randInt( int low, int high ){
	 int nahCislo	=	 QRandomGenerator::global()->generate();
	 //qDebug() << 30 << nahCislo;
	 if( nahCislo < 0 ) nahCislo = qAbs( nahCislo );
	 // qDebug() << 32 << nahCislo;
	 nahCislo	=	nahCislo % ((high + 1) - low) + low;
	 return nahCislo;
}

bool NacitadloSouboru::fileExists( QString jmeno, QString loc){
	QString adresar = "";
	if( QDir( jmeno ).exists() ){
		if( QDir( jmeno+loc).exists() ){
			adresar= jmeno+loc;
		} else {
			adresar =  jmeno;
		}
	} else{
		adresar	=	"";
	}
	if( adresar.isEmpty() ){
		return false;
	} else {
		nalezeneAdresare<<adresar;
		return true;
	}
}


