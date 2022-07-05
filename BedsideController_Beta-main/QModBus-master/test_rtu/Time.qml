import QtQuick 2.0

import QtQuick 2.0
import QtQuick.Controls 2.3

Rectangle{
    width: 767
    height: 422
    function findElement(Model)
    {
        for(var i=0;i<Model.count;i++)
        {
            if(i>0)
            {
                var date = new Date()
                var texttime = alarmModel.get(i).hour
                if(alarmModel.get(i).activated)
                {
                    if(date.toLocaleTimeString(Qt.locale("en_US"), "hh") == alarmModel.get(i).hour)
                    {
                        console.log("Hour pass");
                        if((alarmModel.get(i).minute+17) == date.toLocaleTimeString(Qt.locale("en_US"), "mm"))
                        {
                            console.log("WAKE UPPPPPPP")
                            alarmNontification.open()

                            alarmModel.get(i).activated=false
                            //console.log(date.toLocaleTimeString(Qt.locale("en_US"), "mm"))
                        }
                    }
                    //console.log(alarmModel.get(i).hour)
                    //console.log(date.toLocaleTimeString(Qt.locale("en_US"), "hh"))
                    //console.log(alarmModel.get(i).hour )
                    //console.log("Hour pass");
                    //console.log(text1.text)
                }
            }
            else
            {
                console.log(alarmModel.get(i).hour)
                console.log(alarmModel.get(i).minute)
            }
        }
    }

    Text {
        id: text1
        x: 233
        y: 151
        width: 301
        height: 31
        text: qsTr("Text")
        horizontalAlignment: Text.AlignHCenter
        font{
            family: "Time New Roman"
        }
    }

    Text {
        id: text2
        x: 247
        y: 198
        width: 274
        height: 27
        text: qsTr("Date")
        horizontalAlignment: Text.AlignHCenter
        font{
            family: "Time New Roman"
        }

    }
    Timer{
        interval: 500
        running: true
        repeat: true

        onTriggered: {
            var date = new Date()
            text1.text = date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm")
            text2.text = date.toLocaleDateString(Qt.locale("en_US"))
            //console.log(alarmListView.count)
            findElement(alarmListView)
            //console.log(text1.text)
            /*console.log(alarmModel.get(0).hour)
            console.log(alarmModel.get(0).minute)
            console.log("***********************")
            console.log(alarmModel.get(1).hour)
            console.log(alarmModel.get(1).minute+17)*/
        }
    }



}
