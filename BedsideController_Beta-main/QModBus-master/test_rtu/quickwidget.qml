import QtQuick 2.11
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQml.Models 2.2
import QtQml 2.2
import Qt.labs.calendar 1.0
Rectangle {
    id: base
    width: 767
    height: 422
    color: "#000000"
    signal switch01(bool checked);
    signal switch02(bool checked);
    signal switch03All(bool checked)

    StackLayout {
        id: stackLayout
        x: 0
        y: 0
        width: 767
        height: 366
        currentIndex: tabBar.currentIndex
        Time{

            width: 767
            height: 422   
        }
        LightSwitch
        {
            width: 767
            height: 422
        }
        Item{
            id: window
            width: 400
            height: 500
            visible: true
            ListView {
                id: alarmListView
                anchors.fill: parent
                model: AlarmModel {
                        id: alarmModel
                }
                delegate: AlarmDelegate {
                        //id: alarmDelegate
                }
            }

            RoundButton {
                id: addAlarmButton
                text: "+"
                anchors.bottom: alarmListView.bottom
                anchors.bottomMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:  alarmDialog.open()
            }

            AlarmClock {
                id: alarmDialog
                x: Math.round((parent.width - width) / 2)
                y: Math.round((parent.height - height) / 2)
                alarmModel: alarmListView.model

            }
            AlarmNotification{
                id: alarmNontification
                x: Math.round((parent.width - width) / 2)
                y: Math.round((parent.height - height) / 2)
            }

        }

    }

    TabBar {
        id: tabBar
        x: 0
        y: 366
        width: 767
        height: 56
        currentIndex: stackLayout.currentIndex

        TabButton {
            id: tabButton
            x: 0
            y: 0
            width: 238
            height: 48
            text: qsTr("Home")
        }

        TabButton {
            id: tabButton1
            x: 290
            y: 4
            width: 273
            height: 48
            text: qsTr("Lighting")
        }

        TabButton {
            id: tabButton2
            width: 254
            height: 48
            text: qsTr("Alarm")
        }

    }
    function formatNumber(number)
    {
        return number < 10 && number >= 0 ? "0" + number : number.toString()
    }
    Dialog{
        id: dialog2
        width: 767
        height: 422
        title: "Add new alarm"
        modal: true
        standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel


        Tumbler{
                id: hoursTumbler
                x: 23
                y: 53
                z: 1
                model: 24
                delegate: TumblerDelegate{
                    text: formatNumber(modelData)
                }
            }
        Tumbler{
                id: minuteTumbler
                x: 128
                y: 53
                z: 1
                model: 60
                delegate: TumblerDelegate{
                    text: formatNumber(modelData)
                }
        }


    }


}



















/*##^## Designer {
    D{i:2;anchors_y:378}
}
 ##^##*/
