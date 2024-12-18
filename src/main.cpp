#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "viscosimetercontroller.hpp"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    ViscosimeterController controller;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("controller", &controller);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
