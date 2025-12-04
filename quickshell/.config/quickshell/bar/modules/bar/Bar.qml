import QtQuick;
import Quickshell;
import Quickshell.Hyprland;
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

		Workspaces {
			showNumbers: false
			anchors {
				left: parent.left
				leftMargin: 8
			}
		}

		Clock {
			anchors {
				right: parent.right
				rightMargin: 16
			}
		}
	}
}
