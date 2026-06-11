import QtQuick
import Quickshell.Io
import "../Services"
Row {
    id: root
    spacing: 15

    property int lastActiveIndex: 0
    property int spinDirection: 1

    WorkspaceService { 
        id: wsService 
        
        onActiveIndexChanged: {
            root.lastActiveIndex = wsService.activeIndex
        }
    }

    Process {
        id: niriCommand
        command: [] 
    }

    Rectangle {
        width: (wsService.model.count * 30) + 4
        height: 32
        radius: 0
        color: "#292c3c"
        anchors.verticalCenter: parent.verticalCenter

        Behavior on width {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }

        Row {
            id: workspaceRow
            anchors.fill: parent
            anchors.leftMargin: 3
            spacing: 4

            Repeater {
                model: wsService.model

                Rectangle {
                    width: 26
                    height: 26
                    color: "transparent"
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        anchors.centerIn: parent
                        font.family: "Symbols Nerd Font"
                        font.pixelSize: 18
                        text: active ? "󰫢" : ""
                        color: active ? "#1e1e2e" : "#585b70"

                        scale: active ? 1.0 : 0.6
                    }

                    MouseArea {
                        anchors.fill: parent
                        anchors.margins: -4
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: {
                            niriCommand.running = false
                            niriCommand.command = ["niri", "msg", "action", "focus-workspace", model.idx]
                            niriCommand.running = true
                        }
                    }
                }
            }
        }
    }

    Text {
        text: "Workspace " + (wsService.activeIndex + 1)
        font.pixelSize: 14
        font.family: "Terminess Nerd Font Mono"
        font.weight: Font.Medium
        color: "#CDD6F4"
        anchors.verticalCenter: parent.verticalCenter
        elide: Text.ElideRight
        maximumLineCount: 1
        width: 300
    }
}
