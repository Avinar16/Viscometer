#pragma once

#include <QMainWindow>
#include <QObject>

class MainWindow : public QMainWindow {
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
};
