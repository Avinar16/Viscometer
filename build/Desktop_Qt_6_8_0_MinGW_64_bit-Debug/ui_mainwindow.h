/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.8.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtWidgets/QApplication>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout;
    QWidget *Widget_3D;
    QVBoxLayout *verticalLayout;
    QPushButton *ImageWindowButton;
    QPushButton *WidgetWindowButton;
    QPushButton *pushButton_3;
    QMenuBar *menubar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(1000, 600);
        QSizePolicy sizePolicy(QSizePolicy::Policy::Fixed, QSizePolicy::Policy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(MainWindow->sizePolicy().hasHeightForWidth());
        MainWindow->setSizePolicy(sizePolicy);
        MainWindow->setMinimumSize(QSize(1000, 600));
        MainWindow->setMaximumSize(QSize(1000, 600));
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/images/microscope.png"), QSize(), QIcon::Mode::Normal, QIcon::State::Off);
        MainWindow->setWindowIcon(icon);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        QSizePolicy sizePolicy1(QSizePolicy::Policy::Expanding, QSizePolicy::Policy::Expanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(centralwidget->sizePolicy().hasHeightForWidth());
        centralwidget->setSizePolicy(sizePolicy1);
        horizontalLayoutWidget = new QWidget(centralwidget);
        horizontalLayoutWidget->setObjectName("horizontalLayoutWidget");
        horizontalLayoutWidget->setGeometry(QRect(10, 0, 981, 571));
        horizontalLayout = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout->setObjectName("horizontalLayout");
        horizontalLayout->setContentsMargins(0, 0, 0, 0);
        Widget_3D = new QWidget(horizontalLayoutWidget);
        Widget_3D->setObjectName("Widget_3D");

        horizontalLayout->addWidget(Widget_3D);

        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName("verticalLayout");
        ImageWindowButton = new QPushButton(horizontalLayoutWidget);
        ImageWindowButton->setObjectName("ImageWindowButton");
        ImageWindowButton->setStyleSheet(QString::fromUtf8("QPushButton {\n"
"    background-color: #ebc0cb;\n"
"    border: 1px solid #C4C4C3;\n"
"    border-radius: 10px; /* \320\241\320\272\321\200\321\203\320\263\320\273\320\265\320\275\320\270\320\265 \321\203\320\263\320\273\320\276\320\262 */\n"
"    padding: 5px;\n"
"    min-width: 70px;\n"
"}\n"
"QPushButton:hover {\n"
"    background-color: #30d5c8;\n"
"}\n"
"\n"
"QPushButton:pressed {\n"
"    background-color: 	#90EE90;\n"
"}\n"
"\n"
""));

        verticalLayout->addWidget(ImageWindowButton);

        WidgetWindowButton = new QPushButton(horizontalLayoutWidget);
        WidgetWindowButton->setObjectName("WidgetWindowButton");
        WidgetWindowButton->setStyleSheet(QString::fromUtf8("QPushButton {\n"
"    background-color: #ebc0cb;\n"
"    border: 1px solid #C4C4C3;\n"
"    border-radius: 10px; /* \320\241\320\272\321\200\321\203\320\263\320\273\320\265\320\275\320\270\320\265 \321\203\320\263\320\273\320\276\320\262 */\n"
"    padding: 5px;\n"
"    min-width: 70px;\n"
"}\n"
"QPushButton:hover {\n"
"    background-color: #30d5c8;\n"
"}\n"
"\n"
"QPushButton:pressed {\n"
"    background-color: 	#90EE90;\n"
"}\n"
"\n"
""));

        verticalLayout->addWidget(WidgetWindowButton);

        pushButton_3 = new QPushButton(horizontalLayoutWidget);
        pushButton_3->setObjectName("pushButton_3");
        pushButton_3->setStyleSheet(QString::fromUtf8("QPushButton {\n"
"    background-color: #ebc0cb;\n"
"    border: 1px solid #C4C4C3;\n"
"    border-radius: 10px; /* \320\241\320\272\321\200\321\203\320\263\320\273\320\265\320\275\320\270\320\265 \321\203\320\263\320\273\320\276\320\262 */\n"
"    padding: 5px;\n"
"    min-width: 70px;\n"
"}\n"
"QPushButton:hover {\n"
"    background-color: #30d5c8;\n"
"}\n"
"\n"
"QPushButton:pressed {\n"
"    background-color: 	#90EE90;\n"
"}\n"
"\n"
""));

        verticalLayout->addWidget(pushButton_3);


        horizontalLayout->addLayout(verticalLayout);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName("menubar");
        menubar->setGeometry(QRect(0, 0, 1000, 22));
        MainWindow->setMenuBar(menubar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "Viscometer simulation", nullptr));
        ImageWindowButton->setText(QCoreApplication::translate("MainWindow", "\320\272\321\200\321\203\321\202\320\260\321\217 \320\272\320\260\321\200\321\202\320\270\320\275\320\272\320\260", nullptr));
        WidgetWindowButton->setText(QCoreApplication::translate("MainWindow", "\320\276\321\202\320\272\321\200\321\213\321\202\321\214 \320\275\320\276\320\262\320\276\320\265 \320\276\320\272\320\275\320\276", nullptr));
        pushButton_3->setText(QCoreApplication::translate("MainWindow", "useless", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
