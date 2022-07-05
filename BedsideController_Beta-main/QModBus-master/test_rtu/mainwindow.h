#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "qmodbus.h"
#include <QQuickItem>




namespace Ui
{
    class MainWindow;
}



class MainWindow : public QMainWindow
{
    Q_OBJECT

    public:

        explicit MainWindow(QWidget *parent = 0);
        ~MainWindow();


    public slots:

        void connect_btn_clicked();
        void connect_to_dev();
        void disconnect_from_dev();

        void read_regs();
        void write_reg();

        void response_to_read_regs(int status);
        void response_to_write_reg(int status);

        void process_error(QModBus::ModBusError error);
        void change_status();

    private slots:

        void sw01_on(bool checked);
        void sw02_on(bool checked);
        void sw03_on(bool checked);

    private:

        Ui::MainWindow *ui;

        QModBus_RTU  mb;

        uint16_t  rd_buf[MODBUS_MAX_READ_REGISTERS];

        /*Address and Count in Read Register*/
        int address_read;
        int count_read;
        /*Address and Count in Read Register*/

        /*Address and Value in Write Register*/
        int address_write;
        int value_write;
        /*Address and Value in Write Register*/

        /*Swicth in QML*/
        QQuickItem *root_object_sw01;
        QQuickItem *root_object_sw02;
        QQuickItem *root_object_sw03;
        /*Swicth in QML*/
};



#endif // MAINWINDOW_H
