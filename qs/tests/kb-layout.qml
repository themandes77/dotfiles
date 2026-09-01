import Quickshell
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io

Scope {
	id: root
	property string currentLayout: ""
	property bool shouldShowOsd: false

		Process {
		id: initLayout
		command: ["hyprctl", "devices", "-j"]
		running: true
		stdout: StdioCollector {
			onStreamFinished: {
				const obj = JSON.parse(text)
				const keyboards = obj.keyboards
				if (keyboards && keyboards.length > 0)
					root.currentLayout = keyboards[0].activeKeymap
			}
		}
	}

	Connections {
		target: Hyprland

		function onRawEvent(event) {
			if ( event.name == "activeLayout" ) {
				const parts = event.parse(2)
				currentLayout = parts[1]
			}
		}
	}


	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			anchors.bottom: true
			margins.bottom: screen.height / 5
			exclusiveZone: 0

			implicitWidth: 200
			implicitHeight: 50
			color: "transparent"

			mask: Region {}

			Rectangle {
				anchors.fill: parent
				radius: height / 2
				color: "#80000000"

				RowLayout {
					anchors {
						fill: parent
						leftMargin: 10
						rightMargin: 15
					}

					Rectangle {
						Layout.fillWidth: true

						implicitHeight: 10
						radius: 20
						color: "#50ffffff"

						Rectangle {
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}
						}
						Text {
							id: layout
							color: "#ffffffff"
							text: currentLayout
							font { family: "JetBrainsMono Nerd Font"; pixelSize: 16; bold: false}
						}
					}
				}
			}
		}
	}

}
