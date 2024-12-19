import Qt3D.Core
import Qt3D.Render
import Qt3D.Input

Entity{
    id: root
    property Camera camera;
    property real dt: 0.001
    property real linearSpeed: 1
    property real lookSpeed: 500
    property real zoomLimit: 5
    property real zoomOutLimit: 10
    property real minTilt: -45
    property real maxTilt: 45

    MouseDevice {
        id: mouseDevice
        sensitivity: 0.001
    }
    KeyboardDevice {
        id: keyboardDevice
    }

    MouseHandler {
        id: mh
        readonly property vector3d upVect: Qt.vector3d(0, 1, 0)
        property point lastPos;
        property real pan;
        property real tilt;
        property real currentTilt: 0
        sourceDevice: mouseDevice

        onPanChanged: root.camera.panAboutViewCenter(pan, upVect);
        onTiltChanged: {
            root.camera.tiltAboutViewCenter(tilt);
            currentTilt += tilt;
        }

        onPressed: {
            lastPos = Qt.point(mouse.x, mouse.y);


        }
        onPositionChanged: {
            if(!root.enabled) return;
            if (mouse.buttons === 1){ // Left button for rotation
                pan = -(mouse.x - lastPos.x) * dt * lookSpeed;

                let newTilt = (mouse.y - lastPos.y) * dt * lookSpeed;
                if (currentTilt + newTilt < minTilt) {
                    newTilt = minTilt - currentTilt;
                } else if (currentTilt + newTilt > maxTilt) {
                    newTilt = maxTilt - currentTilt;
                }
                tilt = newTilt;

            } else if (mouse.buttons === 3) { // Zoom
                ry = (mouse.y - lastPos.y) * dt * linearSpeed
                zoom(ry)
            }

            lastPos = Qt.point(mouse.x, mouse.y)
        }
        onWheel: {
            if(!root.enabled) return;

            zoom(wheel.angleDelta.y * dt * linearSpeed)
        }


    }

    KeyboardHandler {
        id: keyboardHandler
        sourceDevice: keyboardDevice
        focus: true

        onPressed: {

            switch(event.key)
            {

            case Qt.Key_PageUp:
            {
                zoom(120 * dt * linearSpeed)

                break;

            }
            case Qt.Key_PageDown:
            {

                zoom(-120 * dt * linearSpeed)

                break;

            }


            case Qt.Key_Up:
            {
                upODown(100 * dt * linearSpeed)

                break;
            }


            case Qt.Key_Down:
            {
                upODown(-100 * dt * linearSpeed)

                break;
            }


            case Qt.Key_Left:
            {

                leftORight(-100 * dt * linearSpeed)

                break;

            }


            case Qt.Key_Right:
            {
                leftORight(100 * dt * linearSpeed)

                break;

            }


            }


        }

    }


    function zoom(rz) {
        if (rz > 0 && zoomDistance(camera.position, camera.viewCenter) < zoomLimit ||  rz < 0 && zoomDistance(camera.position, camera.viewCenter) > zoomOutLimit) {
            return
        }

        camera.translate(Qt.vector3d(0, 0, rz), Camera.DontTranslateViewCenter)
    }

    function zoomDistance(posFirst, posSecond) {
        return posSecond.minus(posFirst).length()
    }

    function leftORight(rx)
    {
        if (rx > 0 && zoomDistance(camera.position, camera.viewCenter) < zoomLimit || rz < 0 && zoomDistance(camera.position, camera.viewCenter) > zoomOutLimit) {
            return
        }
        camera.setUpVector(Qt.vector3d( 0.0, 1.0, 0.0 ))

        camera.translate(Qt.vector3d(rx, 0, 0))


    }

    function upODown(ry)
    {
        if (ry > 0 && zoomDistance(camera.position, camera.viewCenter) < zoomLimit || rz < 0 && zoomDistance(camera.position, camera.viewCenter) > zoomOutLimit) {
            return
        }
        camera.setUpVector(Qt.vector3d( 0.0, 1.0, 0.0 ))

        camera.translate(Qt.vector3d(0, ry, 0))

    }
}