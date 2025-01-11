import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    FontLoader{id: sevenSegment; source: "qrc:/fonts/Seven Segment.ttf"}
    id: sevenSegmentDisplay
    property alias text: displayArea.text
    property alias font: displayArea.font

    width: 200
    height: 75
    color: "black"
    border.color: "gray"
    border.width: 2
    radius: 10

    TextArea {
        id: displayArea
        anchors.fill: parent
        anchors.margins: 10
        text: "0000"
        font.family: sevenSegment.name
        font.pixelSize: 70
        color: "red"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        readOnly: true
        wrapMode: Text.NoWrap
    }
}
