import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils
import "."

Window {
    id: appWindow
    title: "Viscosimeter App"
    visible: true

    minimumWidth: 1000
    minimumHeight: 800

    View3D {
        id: scene3d
        anchors.fill: parent

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
                    model;
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

            property int modelCounter: 0
            function makeChildModelsPickable(node) {
                if (node?.pickable !== undefined)
                    node.pickable = true;
                if (node instanceof Model) {
                    node.objectName = "Model_" + modelCounter;
                    modelCounter++;
                }
                node.children.forEach(childNode => makeChildModelsPickable(childNode));
            }

            Component.onCompleted: makeChildModelsPickable(importNode)
            onSourceChanged: makeChildModelsPickable(importNode)
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            onPressed: {
                let res = scene3d.pick(mouse.x, mouse.y);
                console.log(res.objectHit.objectName);
            }
        }
    }
}
