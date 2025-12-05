import QtQuick;
import Quickshell.Io;
import "../../colours.js" as Colours;


Text { // CPU stats
	id: root
	color: Colours.text
	text: ram.usageGB + "G "

	property int percentDecimalPlaces: 1

	Process {
		id: ram
		property int usage: 0
		property real usageGB: 0
		property int total: 0
		property int percent: 0

		command: ["sh", "-c", "free | grep Mem"]
		stdout: SplitParser {
			onRead: data => {
				if (!data) return
				var parts = data.trim().split(/\s+/)
				var total = parseInt(parts[1]) || 0
				var used = parseInt(parts[2]) || 0

				ram.usage = used
				ram.usageGB = (used / (1024 * 1024)).toFixed(root.percentDecimalPlaces)
				ram.total = total
				ram.percent = Math.round(100 * used / total)
			}
		}
		Component.onCompleted: running = true
	}

	Process {
		id: swap
		property int usage: 0
		property real usageGB: 0
		property int total: 0
		property int percent: 0

		command: ["sh", "-c", "free | grep Swap"]
		stdout: SplitParser {
			onRead: data => {
				if (!data) return
				var parts = data.trim().split(/\s+/)
				var total = parseInt(parts[1]) || 0
				var used = parseInt(parts[2]) || 0

				swap.usage = used
				swap.usageGB = (used / (1024 * 1024)).toFixed(root.percentDecimalPlaces)
				swap.total = total
				swap.percent = Math.round(100 * used / total)
			}
		}
		Component.onCompleted: running = true
	}

	Timer {
		interval: 500
		running: true
		repeat: true
		onTriggered: {
			ram.running = true
			swap.running = true
		}
	}
}
