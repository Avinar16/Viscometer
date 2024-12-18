import QtQuick
import QtQuick.Controls
import QtQuick3D
import QtQuick3D.Helpers

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Viscosimeter App"

    Row {
        anchors.fill: parent

        View3D {
            id: scene3d
            width: parent.width * 0.7
            height: parent.height

            Node {
                id: cameraNode
                PerspectiveCamera {
                    id: camera
                    position: Qt.vector3d(0, 200, 300)
                    clipNear: 1
                    clipFar: 1000
                }
            }

            Node {
                id: node
                DirectionalLight {
                    id: directionalLight
                    position: Qt.vector3d(500, 500, 500)
                }

                Model {
                    id: cubeModel
                    source: "#Cube"
                    materials: DefaultMaterial {
                        diffuseColor: "yellow"
                    }
                    position: Qt.vector3d(0, 0, 0)
                    rotation: Qt.vector3d(0, 0, 0)
                }

                Model {
                    scale: Qt.vector3d(10, 10, 10)
                    geometry: GridGeometry {
                        horizontalLines: 20
                        verticalLines: 20
                        horizontalStep: 1
                        verticalStep: 1
                    }
                    materials: [DefaultMaterial {
                        diffuseColor: "gray"
                    }]
                    position: Qt.vector3d(0, 0, 0)
                }
            }

            MouseArea {
                id: mouse
                anchors.fill: parent
                property int lastX: 0
                property int lastY: 0

                onPressed: {
                    lastX = mouse.x
                    lastY = mouse.y
                }

                onPositionChanged: {
                    var deltaX = mouse.x - lastX
                    var deltaY = mouse.y - lastY

                    cubeModel.rotation = Qt.vector3d(cubeModel.rotation.x + deltaY, cubeModel.rotation.y + deltaX, 0)

                    lastX = mouse.x
                    lastY = mouse.y
                }

                onReleased: {
                    lastX = 0
                    lastY = 0
                }
            }

            environment: SceneEnvironment {
                clearColor: "#303030"
            }

            Component.onCompleted: {
                camera.lookAt(Qt.vector3d(0, 0, 0))  // Камера направлена на куб после инициализации
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onWheel: {
                    if (wheel.angleDelta.y > 0)
                        camera.z = Math.max(camera.z - 10, 10)
                    else
                        camera.z = Math.min(camera.z + 10, 500)
                }
            }
        }

        Column {
            width: parent.width * 0.3
            height: parent.height
            spacing: 10
            padding: 10

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

            Button {
                text: "Добавить каплю NaOH"
                onClicked: controller.addDrop()
            }

            Button {
                text: "Начать/Остановить"
                onClicked: controller.toggleRotation()
            }

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
        }
    }
}
