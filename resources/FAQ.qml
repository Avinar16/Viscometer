import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Pdf

ApplicationWindow {
    visible: true
    width: 600
    height: 700
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    title: "Справочная информация"

    PdfDocument {
        id: pdfDoc
        source: "qrc:/images/FAQ.pdf"
    }

    Rectangle {
        anchors.fill: parent

        PdfPageView {
            anchors.topMargin: 10
            anchors.top: parent
            id: pdfView
            document: pdfDoc
            Layout.fillWidth: true
            Layout.fillHeight: true
            zoomEnabled: false
            renderScale : 1
        }

    }
}
