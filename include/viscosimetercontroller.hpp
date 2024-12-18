#pragma once

#include <QObject>
#include <QDebug>

class ViscosimeterController : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isRunning READ isRunning NOTIFY stateChanged)

public:
    explicit ViscosimeterController(QObject *parent = nullptr)
        : QObject(parent), m_isRunning(false) {}

    Q_INVOKABLE void setSpeed(int rpm) {
        qDebug() << "Setting speed to" << rpm << "RPM";
    }

    Q_INVOKABLE void addDrop() {
        qDebug() << "Adding NaOH drop";
    }

    Q_INVOKABLE void toggleRotation() {
        m_isRunning = !m_isRunning;
        emit stateChanged();
        qDebug() << "Toggling rotation. Current state:" << (m_isRunning ? "Running" : "Paused");
    }

    bool isRunning() const {
        return m_isRunning;
    }

signals:
    void stateChanged();

private:
    bool m_isRunning;
};
