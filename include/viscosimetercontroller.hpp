#pragma once

#include <QObject>
#include <QDebug>
#include <QTimer>
#include <map>
#include <cmath>

class ViscosimeterController : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isRunning READ isRunning NOTIFY stateChanged)
    Q_PROPERTY(bool isWaiting READ isWaiting NOTIFY waitingChanged)
    Q_PROPERTY(int getSpeed READ getSpeed NOTIFY speedChanged)
     Q_PROPERTY(double result READ getResult NOTIFY resultChanged)

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
        this->speed = rpm;
        if(this->pH != 0){
            calculateResult();
            emit resultChanged();
        }
        qDebug() << "Setting speed to" << rpm << "RPM";
        emit logMessage(QString("Speed set to %1 RPM").arg(rpm));
        emit speedChanged();
    }

    Q_INVOKABLE void addDropWithDelay(double pH) {
        if (m_isWaiting) return;
        startWaiting();
        this->pH = pH;
        calculateResult();
        emit resultChanged();
        qDebug() << QString("substance added %1").arg(result);
        emit logMessage(QString("substance added %1").arg(pH));
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
    int getSpeed() const{
        return speed;
    }
    double getResult(){
        if(result > 100) return 100;
        return result;
    }

signals:
    void stateChanged();
    void waitingChanged();
    void speedChanged();
    void resultChanged();
    void logMessage(const QString &message);

private:
    void startWaiting() {
        m_isWaiting = true;
        emit waitingChanged();
        m_timer.start(2000);
    }
    void calculateResult() {
        if(this->pH < 3.5 || this->pH > 10){
            return;
        }
        result = 0;
        double slow = std::round((resultMap[3.5] / speedCoefficient[speed])*2)/2;
        for(double i = 4.0; i <= 10 -1; i+= 0.5){
            //qDebug() << QString("slow %1").arg(slow);
            double fast = std::round((resultMap[i] / speedCoefficient[speed])*2)/2;
           // qDebug() << QString("fast %1").arg(fast);
           // qDebug() << QString("i %1").arg(i);
            if(this->pH == i-0.5){
                this->result = slow;
                return;
            }
            else if(this->pH == i){
                this-> result = fast;
                return;
            }
            else if(this->pH > i-0.5 && this->pH < i){
                double interpolateCoefficient = this->pH/(slow+ fast);
                double realMeasurment = std::lerp(slow, fast, interpolateCoefficient); // интерполяция реального значения
                realMeasurment = std::round(realMeasurment*10)/10;
                result = realMeasurment;
                return;
            }
            slow = fast;
        }
    }
    std::map<double, double> resultMap{ // РЕЗУЛЬТАТЫ НА СКОРОСТИ 100// ph/ВЯЗКОСТЬ
        {3.5, 2},
        {4.0, 9},
        {4.5, 24},
        {5, 51},
        {5.5, 75},
        {6, 95},
        {6.5, 112},
        {7, 126},
        {7.5, 135},
        {8, 133},
        {8.5, 86},
        {9, 58},
        {9.5, 33},
        {10, 19}
    };
    std::map<int, double> speedCoefficient{
        {3, 100},
        {6, 50},
        {100, 1.667},
        {200, 1.5},
        {300, 1},
        {600, 0.5}
    };

    int speed = 0;
    double pH = 0;
    double result = 0;
    bool m_isRunning;
    bool m_isWaiting;
    QTimer m_timer;
};
