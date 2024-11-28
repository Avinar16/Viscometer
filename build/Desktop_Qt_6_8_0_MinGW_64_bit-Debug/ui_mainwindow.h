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
#include <QtWidgets/QApplication>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QWidget *horizontalLayoutWidget;
    QHBoxLayout *horizontalLayout;
    QWidget *widget;
    QVBoxLayout *verticalLayout;
    QPushButton *ImageWindowButton;
    QPushButton *WidgetWindowButton;
    QPushButton *pushButton_3;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(789, 579);
        QSizePolicy sizePolicy(QSizePolicy::Policy::Preferred, QSizePolicy::Policy::Preferred);
        sizePolicy.setHorizontalStretch(100);
        sizePolicy.setVerticalStretch(100);
        sizePolicy.setHeightForWidth(MainWindow->sizePolicy().hasHeightForWidth());
        MainWindow->setSizePolicy(sizePolicy);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        horizontalLayoutWidget = new QWidget(centralwidget);
        horizontalLayoutWidget->setObjectName("horizontalLayoutWidget");
        horizontalLayoutWidget->setGeometry(QRect(0, 0, 781, 531));
        horizontalLayout = new QHBoxLayout(horizontalLayoutWidget);
        horizontalLayout->setObjectName("horizontalLayout");
        horizontalLayout->setContentsMargins(0, 0, 0, 0);
        widget = new QWidget(horizontalLayoutWidget);
        widget->setObjectName("widget");

        horizontalLayout->addWidget(widget);

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
        menubar->setGeometry(QRect(0, 0, 789, 22));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName("statusbar");
        MainWindow->setStatusBar(statusbar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
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
