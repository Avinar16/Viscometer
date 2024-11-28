#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "WidgetWindow.h"
#include "ImageWindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    setFixedSize(800, 600);

    connect(ui->ImageWindowButton, &QPushButton::clicked, this, &MainWindow::openImageWindow);
    connect(ui->WidgetWindowButton, &QPushButton::clicked, this, &MainWindow::openWidgetWindow);

}

void MainWindow::openImageWindow()
{
    auto *window = new ImageWindow();
    window->setAttribute(Qt::WA_DeleteOnClose);
    window->show();
}

void MainWindow::openWidgetWindow()
{
    auto *window = new WidgetWindow();
    window->setAttribute(Qt::WA_DeleteOnClose);
    window->show();
}

MainWindow::~MainWindow()
{
    delete ui;
}
