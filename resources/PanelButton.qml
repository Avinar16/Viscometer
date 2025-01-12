import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Button {
    id: dashboardButton
    width: 65
    height: 65
    text: "Default"
    font.pixelSize: 14
    font.bold: true
    flat: true
    background: Rectangle {
        color: dashboardButton.pressed ? "#455A64" : (dashboardButton.hovered ? "#546E7A" : "#37474F")
        width: dashboardButton.width
        height: dashboardButton.height

        border.color: dashboardButton.hovered ? "#263238" : "#1C313A"
        border.width: 1
        radius: 0 // Квадратные углы
    }
    contentItem: Text {
        text: dashboardButton.text
        color: "white"
        font: dashboardButton.font
        Layout.alignment: Qt.AlignVCenter
    }
    hoverEnabled: true
}
