import QtQuick;
import Quickshell;
import "../widgets/";
import "../../colours.js" as Colours;


PanelWindow {
	id: panel

	anchors {
		top: true
		left: true
		right: true
	}

	implicitHeight: 40

	margins {
		top: 8
		left: 8
		right: 8

	}

	Rectangle {
		id: bar
		anchors.fill: parent
		color: Colours.base
		radius: 15

		border {
			color: Colours.mauve
			width: 2
		}

		// LEFT SIDE MODULES
		Row {
			anchors {
				left: parent.left
				verticalCenter: parent.verticalCenter
				leftMargin: 16
			}
			spacing: 8

			// Widgets

			Workspaces {
				showNumbers: false
			}
		}

		// CENTER MODULES
		Row {
			// alignment: Qt.AlignHCenter

			anchors {
				centerIn: parent
			}
			spacing: 8

			// Widgets

			Clock {
				showTime: true
				showDate: false
			}
		}

		// RIGHT SIDE MODULES
		Row {
			anchors {
				right: parent.right
				verticalCenter: parent.verticalCenter
				rightMargin: 16
			}
			spacing: 8

			// Widgets

			Workspaces {
				showNumbers: false
			}
		}
	}
}
