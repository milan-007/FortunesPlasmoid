/*
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.private.fortunepokus 1.0

Item {
	id :root
		width: 480
		height: 150

	Rectangle {
		color: "#272822"
		width: 480
		height: 150
	}

	Plasmoid.fullRepresentation: ColumnLayout {
		anchors.fill: parent
		id : item
		property string loca: ""
		property int level: 0
		property var dirs : [
			"/usr/share/games/fortunes/",
			"~/.local/share/fortunes/"
		]

		//Image {
				//Layout.fillHeight: true
				//Layout.fillWidth: true
				//fillMode: Image.PreserveAspectFit
				//source: "../images/pairs.svgz"
		//}

		Soubory{
			id:	soubory
		}

		PlasmaComponents.Label {
			id : label1
			Layout.alignment: Qt.AlignCenter
			text: "Ahoj"
		}

		Timer{
			id : provozniTimer
			interval: 1000 * 10 //10 sek
			repeat: true
			running: true
			onTriggered: {
				dejHlasku()
			}
		}

		Timer{
			id : pocatecniTimer
			interval: 1000  //1sek
			repeat: true
			running: true
			onTriggered: {
				dejHlasku()
				provozniTimer.start()
				pocatecniTimer.stop()
			}
		}

		function dejHlasku(){

			label1.text	=	soubory.nacistSoubor()
		}


		Component.onCompleted: {
			provozniTimer.stop()
			console.log( dirs, dirs.length )
			var exists = false
			var loca = (Qt.locale().name).substr(0,2)
			for( var i=0; i<dirs.length; i++ ){
				console.log( dirs[i] )
				if( soubory.fileExists( dirs[i], loca ) ){
					exists = true
				}
			}
			if( exists ){
				label1.text="Fortunes jsou nainstalovány !"
			} else {
				label1.text="Fortunes nejsou nainstalovány !"
			}
			console.log( exists )
		}



	}
}
