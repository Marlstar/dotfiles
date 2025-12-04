import QtQuick;
import "../../colours.js" as Colours;

Text {
	id: clockWidget
	property bool showTime: true
	property string timeFormat: "HH:mm"

	property bool showDate: true
	property string dateFormat: "MMM dd"

	property string currentTime

	text: currentTime

	anchors.verticalCenter: parent.verticalCenter
	font {
		pixelSize: 18
	}
	color: Colours.text

	Timer {
		interval: 1000
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: {
			var now = new Date()
			var time_text = clockWidget.showTime ? Qt.formatTime(now, clockWidget.timeFormat) : ""
			var date_text = clockWidget.showDate ? Qt.formatDate(now, clockWidget.dateFormat) : ""
			var spacing = clockWidget.showTime && clockWidget.showDate ? " " : ""
			clockWidget.currentTime = date_text + spacing + time_text
		}
	}
}
