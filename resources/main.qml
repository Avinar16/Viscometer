import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Scene3D
import QtQuick3D
import QtQuick3D.Helpers

import "."

ApplicationWindow {
    visible: true
    width: 1000
    height: 800
    minimumWidth: width
    minimumHeight: height
    maximumHeight: height
    maximumWidth: width
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
                }

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
                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Справочная информация"
                    onClicked: {
                        var component = Qt.createComponent("FAQ.qml")
                        if (component.status === Component.Ready) {
                            var faqWindow = component.createObject(parent)
                            faqWindow.visible = true
                        } else if (component.status === Component.Error) {
                            console.log("Error loading Faq.qml:", component.errorString())
                        }
                    }
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
