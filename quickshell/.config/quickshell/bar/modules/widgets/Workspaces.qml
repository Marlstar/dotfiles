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
		model: 9

		Rectangle {
			property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
			property var active: Hyprland.focusedWorkspace?.id === index + 1

			width: active ? 24 : 20
			height: 16
			radius: 15
			color: active ? Colours.subtext1 : ( ws ? Colours.overlay1 : Colours.surface1 )

			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("workspace " + ws.id)
			}

			Text {
				anchors.centerIn: parent
				visible: workspacesRow.showNumbers
				text: modelData.id
			}
		}
	}
}
