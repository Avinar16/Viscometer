import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils

import "."

ApplicationWindow {
    id: appWindow
    title: "Viscosimeter App"
    visible: true

    minimumWidth: 1000
    minimumHeight: 800

    View3D {
        id: scene3d
        width: parent.width * 0.6
        height: parent.height

        environment: SceneEnvironment {
            id: sceneEnvironment
            clearColor: "#AFDAFC"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }
        property real br: 3
        // Up light
        DirectionalLight {
            id: light1
            position: Qt.vector3d(0, 4, 0)
            rotation: Quaternion.fromEulerAngles(-90, 0, 0)
            brightness: scene3d.br
        }
        // Right light
        DirectionalLight {
            id: light2
            position: Qt.vector3d(4, 0, 0)
            rotation: Quaternion.fromEulerAngles(0, 90, 0)
            brightness: scene3d.br
        }
        // Left light
        DirectionalLight {
            id: light3
            position: Qt.vector3d(-4, 0, 0)
            rotation: Quaternion.fromEulerAngles(0, -90, 0)
            brightness: scene3d.br
        }
        // Back light
        DirectionalLight {
            id: light4
            position: Qt.vector3d(0, 0, -4)
            rotation: Quaternion.fromEulerAngles(0, 180, 0)
            brightness: scene3d.br
        }
        // Front light
        DirectionalLight {
            id: light5
            position: Qt.vector3d(0, 0, 4)
            rotation: Quaternion.fromEulerAngles(0, 0, 0)
            brightness: scene3d.br
        }

        Node {
            id: originNode
            PerspectiveCamera {
                id: cameraNode
                z: 4
                clipNear: 1
                clipFar: 1000

                property real minZoom: 3.5
                property real maxZoom: 10

                onZChanged: {
                    if (z < minZoom)
                        z = minZoom;
                    if (z > maxZoom)
                        z = maxZoom;
                }
            }

            property real minPitch: -85
            property real maxPitch: 10
            property bool rotationChangeBlocked: false

            onRotationChanged: {
                if (rotationChangeBlocked)
                    return;

                rotationChangeBlocked = true;
                const euler = rotation.toEulerAngles();
                const pitch = Math.max(minPitch, Math.min(maxPitch, euler.x));
                const yaw = euler.y % 360;
                const roll = 0;
                rotation = Quaternion.fromEulerAngles(pitch, yaw, roll);
                rotationChangeBlocked = false;
            }
        }

        OrbitCameraController {
            anchors.fill: parent
            origin: originNode
            camera: cameraNode
            panEnabled: false
        }

        RuntimeLoader {
            id: importNode
            position: Qt.vector3d(0, 0, 0)
            rotation: Quaternion.fromEulerAngles(0, 0, 0)
            source: "qrc:/models/viscosimeter_model.glb"
        }
    }

    ColumnLayout {
        id: controllerLayout
        width: parent.width * 0.4
        spacing: 10
        anchors.left: scene3d.right
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            Layout.topMargin: 10
            Layout.alignment: Qt.AlignHCenter
            width: 100
            height: 40

            radius: 5
            color: controller.isRunning ? "green" : "red"

            Text {
                font.pixelSize: 18
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
        // Приборная панель
        Rectangle {
            opacity: (controller.isRunning && !controller.isWaiting) ? 1 : 0.5
            layer.enabled: true

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

                SevenSegmentDisplay {
                    id: sevenSegmentDisplay
                    Layout.alignment: Qt.AlignHCenter
                }

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

                        PanelButton {
                            text: "3"
                            onClicked: {
                                sevenSegmentDisplay.text = "0003";
                                controller.setSpeedWithDelay(3);
                            }
                            enabled: !controller.isWaiting && controller.isRunning
                        }

                        PanelButton {
                            text: "6"
                            onClicked: {
                                sevenSegmentDisplay.text = "0006";
                                controller.setSpeedWithDelay(6);
                            }
                            enabled: !controller.isWaiting && controller.isRunning
                        }

                        PanelButton {
                            text: "100"
                            onClicked: {
                                sevenSegmentDisplay.text = "0100";
                                controller.setSpeedWithDelay(100);
                            }
                            enabled: !controller.isWaiting && controller.isRunning
                        }

                        PanelButton {
                            text: "200"
                            onClicked: {
                                sevenSegmentDisplay.text = "0200";
                                controller.setSpeedWithDelay(200);
                            }
                            enabled: !controller.isWaiting && controller.isRunning
                        }

                        PanelButton {
                            text: "300"
                            onClicked: {
                                sevenSegmentDisplay.text = "0300";
                                controller.setSpeedWithDelay(300);
                            }
                            enabled: !controller.isWaiting && controller.isRunning
                        }

                        PanelButton {
                            text: "600"
                            onClicked: {
                                sevenSegmentDisplay.text = "0600";
                                controller.setSpeedWithDelay(600);
                            }
                            enabled: !controller.isWaiting && controller.isRunning
                        }
                    }
                }
                Limbus {
                    id: limbus
                    Layout.bottomMargin: 20
                    Layout.alignment: Qt.AlignHCenter
                    width: 50
                    height: 50
                    value: controller.result
                    maxValue: 100
                }
            }
        }

        RowLayout {
            opacity: controller.isRunning ? 1 : 0.5
            layer.enabled: true

            Layout.alignment: Qt.AlignHCenter
            TextArea {
                id: phArea
                Layout.minimumHeight: 50
                Layout.maximumHeight: 50
                Layout.minimumWidth: 100
                placeholderText: "Введите pH вещества"
                color: "black"
                wrapMode: TextArea.Wrap

                property int maximumLength: 10
                property string lastValidText: ""
                onTextChanged: {
                    let filteredText = text.replace(/[^0-9.]+/g, "");
                    if (text.length > maximumLength) {
                        var currentPosition = cursorPosition - 1;
                        text = lastValidText;
                        cursorPosition = currentPosition;
                    }
                    else if (text !== filteredText) {
                        text = filteredText;
                        cursorPosition = text.length;
                    }
                    else {
                        lastValidText = text;
                    }
                }


            }

            Column {
                COOLButton {
                    text: "Загрузить"
                    onClicked: {
                        controller.addDropWithDelay(parseFloat(phArea.text));
                    }
                    enabled: (phArea.text.length > 0 && controller.getSpeed != 0) ? true : false;
                    opacity: (controller.isRunning && !controller.isWaiting && phArea.text.length > 0 && controller.getSpeed != 0) ? 1 : 0.5

                }
            }
        }

        COOLButton {
            Layout.alignment: Qt.AlignHCenter
            text: "Справочная информация"
            onClicked: {
                var component = Qt.createComponent("FAQ.qml");
                if (component.status === Component.Ready) {
                    var faqWindow = component.createObject(parent);
                    faqWindow.visible = true;
                } else if (component.status === Component.Error) {
                    console.log("Error loading Faq.qml:", component.errorString());
                }
            }
        }
    }

    Connections {
        target: controller
    }
}
