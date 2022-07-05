import QtQuick 2.0

Rectangle{
    width: 767
    height: 422

    Text {
        id: text1
        x: 372
        y: 153
        text: qsTr("Text")
        font{
            family: "Time New Roman"
        }
    }

    Text {
        id: text2
        x: 372
        y: 176
        text: qsTr("Text")
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
            text1.text = date.toLocaleTimeString(Qt.locale("en_US"))
            text2.text = date.toLocaleDateString(Qt.locale("en_US"))
        }
    }
}
