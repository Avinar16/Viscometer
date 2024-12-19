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
    minimumWidth: 600
    minimumHeight: 400
    title: "Viscosimeter App"

    Row {
        anchors.fill: parent

        Scene3D {
            id: scene3d

            width: parent.width * 0.7
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

        Column {
            width: parent.width * 0.3
            height: parent.height
            spacing: 10
            topPadding: 10

            Rectangle {
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
                text: "Начать/Остановить"
                onClicked: controller.toggleRotation()
            }

            RowLayout {
                spacing: 10

                Button {
                    text: "3 RPM"
                    onClicked: controller.setSpeed(3)
                }

                Button {
                    text: "6 RPM"
                    onClicked: controller.setSpeed(6)
                }

                Button {
                    text: "100 RPM"
                    onClicked: controller.setSpeed(100)
                }

            }

            RowLayout {
                spacing: 10

                Button {
                    text: "200 RPM"
                    onClicked: controller.setSpeed(200)
                }

                Button {
                    text: "300 RPM"
                    onClicked: controller.setSpeed(300)
                }

                Button {
                    text: "600 RPM"
                    onClicked: controller.setSpeed(600)
                }

            }

            Button {
                text: "Добавить каплю NaOH"
                onClicked: controller.addDrop()
            }

        }

    }

}
