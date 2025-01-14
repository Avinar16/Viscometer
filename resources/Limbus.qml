// LimbusDisplay.qml
import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: root
    width: 200
    height: 200

    property double maxValue: 100.0  // Максимальное значение
    property double value: 0.0  // Текущее значение
    onValueChanged: {
        textValue.text = value.toFixed(1)
        canvas.requestPaint()
    }

    // Подложка для лимбуса
    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"  // Цвет подложки
        radius: width / 2
    }

    Canvas {
        id: canvas
        width: parent.width + 50
        height: parent.width + 50
        anchors.centerIn: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.beginPath();

            // Рисуем базовую окружность
            ctx.arc(width / 2, height / 2, width / 2 - 20, 0, Math.PI * 2, false);
            ctx.lineWidth = 12;
            ctx.strokeStyle = "#e0e0e0";
            ctx.stroke();

            // Рисуем индикатор прогресса
            ctx.beginPath();
            ctx.arc(width / 2, height / 2, width / 2 - 20, -Math.PI / 2, -Math.PI / 2 + Math.PI * 2 * (value / maxValue), false);
            ctx.lineWidth = 12;
            ctx.strokeStyle = "#2196F3";
            ctx.stroke();
        }
    }

    // Цифра внутри лимбуса
    Text {
        id: textValue
        text: value.toFixed(1)  // Отображение текущего значения
        font.pixelSize: 17
        anchors.centerIn: parent
        color: "#555"  // Цвет текста
    }
}
