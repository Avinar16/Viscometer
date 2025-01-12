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
            border.color : "black"
            border.width: 2

            ColumnLayout {
                spacing: 10
                anchors.right: parent.right
                anchors.left: parent.left
                //anchors.fill: parent

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

                COOLButton {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Начать/Остановить"
                    onClicked: controller.toggleRotation()
                    enabled: !controller.isWaiting
                }
                // ПРИБОРНАЯ ПАНЕЛЬ
                Rectangle {
                    Layout.preferredHeight: 400
                    Layout.preferredWidth: 350
                    color: "#bcbcbc" // Серый фон
                    border.color: "black"
                    border.width: 2
                    radius: 5
                    Layout.alignment: Qt.AlignHCenter
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 0

                        SevenSegmentDisplay{
                            id: sevenSegmentDisplay
                            Layout.alignment: Qt.AlignHCenter
                        }
                        // КНОПКИ
                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredHeight: 200
                            Layout.preferredWidth: 300
                            color: "#E0E0E0" // Светлый фон
                            border.color: "black"
                            border.width: 2
                            radius: 5
                            Grid {
                                anchors.centerIn: parent
                                rows: 2
                                columns: 3
                                spacing: 20

                                // Первая строка кнопок
                                PanelButton {
                                    text: "3"
                                    onClicked: {
                                        sevenSegmentDisplay.text = "0003"
                                        controller.setSpeedWithDelay(3)
                                    }
                                    enabled: !controller.isWaiting && controller.isRunning
                                }

                                PanelButton {
                                    text: "6"
                                    onClicked: {
                                        sevenSegmentDisplay.text = "0006"
                                        controller.setSpeedWithDelay(3)
                                    }
                                    enabled: !controller.isWaiting && controller.isRunning
                                }

                                PanelButton {
                                    text: "100"
                                    onClicked: {
                                        sevenSegmentDisplay.text = "0100"
                                        controller.setSpeedWithDelay(3)
                                    }
                                    enabled: !controller.isWaiting && controller.isRunning
                                }

                                // Вторая строка кнопок
                                PanelButton {
                                    text: "200"
                                    onClicked: {
                                        sevenSegmentDisplay.text = "0200"
                                        controller.setSpeedWithDelay(3)
                                    }
                                    enabled: !controller.isWaiting && controller.isRunning
                                }

                                PanelButton {
                                    text: "300"
                                    onClicked: {
                                        sevenSegmentDisplay.text = "0300"
                                        controller.setSpeedWithDelay(3)
                                    }
                                    enabled: !controller.isWaiting && controller.isRunning
                                }

                                PanelButton {
                                    text: "600"
                                    onClicked: {
                                        sevenSegmentDisplay.text = "0600"
                                        controller.setSpeedWithDelay(3)
                                    }
                                    enabled: !controller.isWaiting && controller.isRunning
                                }
                            }
                        }
                        Limbus {
                                Layout.bottomMargin: 20
                                id: limbus
                                Layout.alignment: Qt.AlignHCenter
                                width: 50
                                height: 50
                                value: 11.5 // Пример установки значения
                                maxValue: 100
                            }
                    }

                }


                // ВВОД
                Grid{
                    Layout.preferredHeight: 25
                    Layout.alignment: Qt.AlignLeft
                    rows: 1
                    Layout.topMargin: 10
                    Layout.leftMargin: 25
                    Layout.bottomMargin: 50
                    Row{
                        spacing: 0
                        width: parent.width
                        Column {
                            Rectangle {
                                    anchors.margins: 20
                                    border.color: "black"
                                    border.width: 2
                                    height: 50
                                    width: 250
                                    radius: 8
                                    TextArea {
                                        height: parent.height
                                        width: parent.width
                                        anchors.fill: parent
                                        anchors.margins: 8
                                        placeholderText: "Введите pH вещества"
                                        color: "black"
                                    }
                                }
                        }
                        Column {
                            COOLButton {
                                text: "Загрузить"
                                height: 50
                                width: 100
                            }
                        }
                    }
                }

                /*Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Добавить каплю NaOH"
                    onClicked: controller.addDropWithDelay()
                    enabled: !controller.isWaiting && controller.isRunning
                }
                TextArea {
                    id: logArea
                    Layout.preferredWidth: 400
                    Layout.minimumHeight: 50
                    Layout.alignment: Qt.AlignHCenter
                    readOnly: true
                    placeholderText: "Лог работы будет выводиться здесь"
                }*/
                COOLButton { // FAQ
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
