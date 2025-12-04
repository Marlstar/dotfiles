import QtQuick;
import Quickshell.Hyprland;
import "../../colours.js" as Colours;


Row {
	id: workspacesRow
	property  bool showNumbers: false

	anchors {
		verticalCenter: parent.verticalCenter
	}

	spacing: 8

	Repeater {
		model: Hyprland.workspaces

		Rectangle {
			width: 24
			height: 16
			radius: 15
			color: modelData.active ? Colours.subtext0 : Colours.overlay0

			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("workspace " + modelData.id)
			}

			Text {
				anchors.centerIn: parent
				visible: workspacesRow.showNumbers
				text: modelData.id
			}
		}
	}
}
