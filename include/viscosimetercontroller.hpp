#pragma once

#include <QObject>
#include <QDebug>
#include <QTimer>

class ViscosimeterController : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isRunning READ isRunning NOTIFY stateChanged)
    Q_PROPERTY(bool isWaiting READ isWaiting NOTIFY waitingChanged)

public:
    explicit ViscosimeterController(QObject *parent = nullptr)
        : QObject(parent), m_isRunning(false), m_isWaiting(false) {
        m_timer.setSingleShot(true);
        connect(&m_timer, &QTimer::timeout, this, [this]() {
            m_isWaiting = false;
            emit waitingChanged();
        });
    }

    Q_INVOKABLE void setSpeedWithDelay(int rpm) {
        if (m_isWaiting) return;
        startWaiting();
        qDebug() << "Setting speed to" << rpm << "RPM";
        emit logMessage(QString("Speed set to %1 RPM").arg(rpm));
    }

    Q_INVOKABLE void addDropWithDelay() {
        if (m_isWaiting) return;
        startWaiting();
        qDebug() << "Adding NaOH drop";
        emit logMessage("NaOH drop added");
    }

    Q_INVOKABLE void toggleRotation() {
        m_isRunning = !m_isRunning;
        emit stateChanged();
        qDebug() << "Toggling rotation. Current state:" << (m_isRunning ? "Running" : "Paused");
        emit logMessage(m_isRunning ? "State: Running" : "State: Paused");
    }

    bool isRunning() const {
        return m_isRunning;
    }

    bool isWaiting() const {
        return m_isWaiting;
    }

signals:
    void stateChanged();
    void waitingChanged();
    void logMessage(const QString &message);

private:
    void startWaiting() {
        m_isWaiting = true;
        emit waitingChanged();
        m_timer.start(2000);
    }

    bool m_isRunning;
    bool m_isWaiting;
    QTimer m_timer;
};
