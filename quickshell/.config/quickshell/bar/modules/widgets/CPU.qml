import QtQuick;
import Quickshell.Io;
import "../../colours.js" as Colours;


Text { // CPU stats
	id: cpuText
	color: Colours.text
	text: cpuProc.cpuUsage + "%"
	Process {
		property int cpuUsage: 0
		property int lastCpuIdle: 0
		property int lastCpuTotal: 0

		id: cpuProc
		command: ["sh", "-c", "head -1 /proc/stat"]
		stdout: SplitParser {
			onRead: data => {
				if (!data) return
				var parts = data.trim().split(/\s+/)
				var user = parseInt(parts[1]) || 0
				var nice = parseInt(parts[2]) || 0
				var system = parseInt(parts[3]) || 0
				var idle = parseInt(parts[4]) || 0
				var iowait = parseInt(parts[5]) || 0
				var irq = parseInt(parts[6]) || 0
				var softirq = parseInt(parts[7]) || 0

				var total = user + nice + system + idle + iowait + irq + softirq
				var idleTime = idle + iowait

				if (cpuProc.lastCpuTotal > 0) {
					var totalDiff = total - cpuProc.lastCpuTotal
					var idleDiff = idleTime - cpuProc.lastCpuIdle
					if (totalDiff > 0) {
						cpuProc.cpuUsage = Math.round(100 * (totalDiff - idleDiff) / totalDiff)
					}
				}
				cpuProc.lastCpuTotal = total
				cpuProc.lastCpuIdle = idleTime
			}
		}
		Component.onCompleted: running = true
	}
	Timer {
		interval: 500
		running: true
		repeat: true
		onTriggered: cpuProc.running = true
	}
}
