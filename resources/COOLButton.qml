import QtQuick

import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: styledButton
    width: 150
    height: 50
    text: "Click Me"
    font.pixelSize: 18
    font.bold: true
    flat: true
    background: Rectangle {
        color: styledButton.pressed ? "#1976D2" : (styledButton.hovered ? "#0f48aa" : "#2196F3")
        radius: 12
        border.color: "#1565C0"
        border.width: 2

    }
    contentItem: Text {
        text: styledButton.text
        color: "white"
        font: styledButton.font
        anchors.centerIn: parent
    }
    hoverEnabled: true
}
