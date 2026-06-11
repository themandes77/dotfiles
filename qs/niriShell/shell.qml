//@ pragma UseQApplication

import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Services.Pipewire
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick.Layouts
import "Components"

ShellRoot {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            property var modelData
            screen: modelData

            id: root
            property color colBg: "#4b413d"
            property color primaryText: "#dcd8c0"
            property color colMuted: "#4b413d"
            property color colAccent: "#c3bda8"
            property color colSecondary: "#b8b29d"
            property string fontFamily: "Terminess Nerd Font Mono"
            property int pixelSize: 16
            property int rightMargin: 7
            property int leftMargin: 5

            property var volume: Pipewire.defaultAudioSink?.audio?.volume != null
            ? Math.round(Pipewire.defaultAudioSink.audio.volume * 100) : 0

            property string keyboardLayout: ""

            PwObjectTracker {
                objects: [ Pipewire.defaultAudioSink ]
            }

            Process {
                id: layoutProc
                command: ["niri", "msg", "-j", "keyboard-layouts"]
                stdout: StdioCollector {
                    onStreamFinished: {
                        try {
                            const data = JSON.parse(this.text);
                            root.keyboardLayout = data.names[data.current_idx];
                        } catch (e) {
                            root.keyboardLayout = "";
                        }
                    }
                }
            }

            Timer {
                interval: 200
                running: true
                repeat: true
                onTriggered: layoutProc.running = true
            }

            anchors.top: true
            anchors.left: true
            anchors.right: true
            implicitHeight: 37
            color: root.colBg

            RowLayout {
                anchors.fill: parent
                anchors.margins: 0

                Item { Layout.leftMargin: root.leftMargin}

                Text {
                    color: root.primaryText
                    font { family: root.fontFamily; pixelSize: root.pixelSize; }
                    text: " " + root.volume + "%"
                }

                WorkspaceComponent {
                    anchors.verticalCenter: parent.verticalCenter
                }


                Item { Layout.fillWidth: true }


                Rectangle { width: 1; height: 16; color: root.colMuted }

                RowLayout {
                    spacing: 5
                    Repeater {
                        model: SystemTray.items

                        delegate: MouseArea {
                            id: delegate
                            required property SystemTrayItem modelData
                            property alias item: delegate.modelData

                            Layout.fillHeight: true
                            implicitWidth: icon.implicitWidth + 5

                            acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                            hoverEnabled: true

                            onClicked: (mouse) => {
                                if (mouse.button == Qt.LeftButton) {
                                    item.activate();
                                } else if (mouse.button == Qt.MiddleButton) {
                                    item.secondaryActivate();
                                } else if (mouse.button == Qt.RightButton) {
                                    menuAnchor.open();
                                }
                            }

                            IconImage {
                                id: icon
                                anchors.centerIn: parent
                                source: item.icon
                                implicitSize: 16
                            }

                            QsMenuAnchor {
                                id: menuAnchor
                                menu: item.menu
                                anchor.item: delegate
                            }

                            // ToolTip.visible: containsMouse
                            // ToolTip.text: item.tooltipTitle || item.id
                            // ToolTip.delay: 500
                        }
                    }
                }

                Rectangle { width: 1; height: 16; color: root.colMuted }

                Text {
                    color: root.primaryText
                    font { family: root.fontFamily; pixelSize: root.pixelSize; }
                    text: root.keyboardLayout
                }

                Rectangle { width: 1; height: 16; color: root.colMuted }

                Text {
                    id: clock
                    color: root.primaryText

                    font { family: root.fontFamily; pixelSize: root.pixelSize; bold: false }
                    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                    }
                }
                Item { Layout.rightMargin: root.rightMargin}
            }
        }
    }
}
