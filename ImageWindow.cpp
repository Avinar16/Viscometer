#include "ImageWindow.h"
#include <QLabel>
#include <QPixmap>
#include <QVBoxLayout>

ImageWindow::ImageWindow(QWidget *parent) : QWidget(parent)
{
    setFixedSize(400, 300);

    auto *label = new QLabel(this);
    QPixmap pixmap(":/images/viscosimeter.png");
    label->setPixmap(pixmap.scaled(400, 300, Qt::KeepAspectRatio));

    QVBoxLayout *layout = new QVBoxLayout();
    layout->addWidget(label);
    this->setLayout(layout);
}
