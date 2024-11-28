#include "WidgetWindow.h"
#include <QLabel>
#include <QVBoxLayout>



WidgetWindow::WidgetWindow(QWidget *parent) : QWidget(parent)
{
    setFixedSize(400, 300);

    auto *label = new QLabel("52", this);
    this->setWindowTitle("Новое Окно");

    label->setAlignment(Qt::AlignCenter);

    QVBoxLayout *layout = new QVBoxLayout(this);
    this->setLayout(layout);

    label->move(150, 150);
}
