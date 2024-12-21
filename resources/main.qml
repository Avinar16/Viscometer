import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Scene3D
import QtQuick3D
import QtQuick3D.Helpers

import "."

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600
    title: "Viscosimeter App"

    Row {
        anchors.fill: parent

        Scene3D {
            id: scene3d

            width: parent.width * 0.6
            height: parent.height
            
            focus: true
            aspects: ["render", "logic", "input"]
            hoverEnabled: true
            cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
            antialiasing: true

            RootEntity {
                id: root
            }
        }

        Rectangle {
            anchors.left: scene3d.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: "#FFFACD"
            
            ColumnLayout {
                spacing: 10
                anchors.right: parent.right
                anchors.left: parent.left

                Rectangle {
                    Layout.topMargin: 10   
                    Layout.alignment: Qt.AlignHCenter

                    width: 100
                    height: 30
                    radius: 5
                    color: controller.isRunning ? "green" : "red"

                    Text {
                        anchors.centerIn: parent
                        text: controller.isRunning ? "Работа" : "Пауза"
                        color: "white"
                    }
                }

                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Начать/Остановить"
                    onClicked: controller.toggleRotation()
                    enabled: !controller.isWaiting
                }2

                RowLayout {
                    spacing: 10
                    Layout.alignment: Qt.AlignHCenter

                    Button {
                        text: "3 RPM"
                        onClicked: controller.setSpeedWithDelay(3)
                        enabled: !controller.isWaiting && controller.isRunning
                    }

                    Button {
                        text: "6 RPM"
                        onClicked: controller.setSpeedWithDelay(6)
                        enabled: !controller.isWaiting && controller.isRunning
                    }

                    Button {
                        text: "100 RPM"
                        onClicked: controller.setSpeedWithDelay(100)
                        enabled: !controller.isWaiting && controller.isRunning
                    }
                }

                TextArea {
                    id: logArea
                    Layout.fillWidth: true
                    Layout.minimumHeight: 100
                    readOnly: true
                    placeholderText: "Лог работы будет выводиться здесь"
                }

                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Добавить каплю NaOH"
                    onClicked: controller.addDropWithDelay()
                    enabled: !controller.isWaiting && controller.isRunning
                }
            }
        }
    }

    Connections {
        target: controller

        onLogMessage: {
            logArea.text = message
        }
    }
}
