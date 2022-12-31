/*
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {

	property var searchedDirs : [
		"/usr/share/games/fortunes/",
		"~/.local/share/fortunes/"
	]
	property int fortuneDirFound: 0

	Plasmoid.fullRepresentation: ColumnLayout {
		anchors.fill: parent
		//Image {
			//Layout.fillHeight: true
			//Layout.fillWidth: true
			//fillMode: Image.PreserveAspectFit
			//source: "../images/pairs.svgz"
		//}

		PlasmaComponents.Label {
			id : label1
			Layout.alignment : Qt.AlignCenter
			text: "Začínáme..."
		}

		Timer{
			id : provozniTimer
			interval: 1000 * 120 //10 sek
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

			label1.text	=	plasmoid.nativeInterface.hlaska
		}

		Component.onCompleted: {
			provozniTimer.stop()
			fortuneDirFound	=	0;
			for( var i=0; i<searchedDirs.length; i++ ){
				//console.log( dirs[i] )

				if( plasmoid.nativeInterface.dir_exists( searchedDirs[i] ) ){
					exists = true
				}
			}

			if( fortuneDirFound ){
				label1.text="Fortunes nalezeny !"
			} else {
				label1.text="Fortunes nejsou nalezeny nebo nainstalovány !"
			}
			//console.log( exists )
		}
	}


}
