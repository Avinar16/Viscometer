import QtQuick

import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: styledButton
    font.pixelSize: 18
    font.bold: true
    flat: true
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 50
        color: styledButton.pressed ? "#1976D2" : (styledButton.hovered ? "#0f48aa" : "#2196F3")
        radius: 12
    }
    contentItem: Text {
        text: styledButton.text
        color: "white"
        font: styledButton.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    hoverEnabled: true
}
