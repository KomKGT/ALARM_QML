import QtQuick 2.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4

Item {
    id: light
    ;
    width: 767
    height: 422
    Image {
        id: image
        x: -42
        y: 0
        width: 853
        height: 422
        fillMode: Image.PreserveAspectFit
        source: "bedroom-g88700128f_1920.jpg"
    }

    ColumnLayout {
        id: columnLayout
        x: 284
        y: 107
        width: 278
        height: 179

        Switch {
            id: sw01
            text: qsTr("OFF")
            checkable: true
            checked: false
            onCheckedChanged: {
                if(sw01.checked)
                {
                    base.switch01(true)
                    sw01.text = "ON"
                }
                else
                {
                    base.switch01(false)
                    sw01.text = "OFF"
                }
            }
        }

        Switch {
            id: sw02
            text: qsTr("OFF")
            onCheckedChanged: {
                if(sw02.checked)
                {
                    base.switch02(true)
                    sw02.text = "ON"
                }
                else
                {
                    base.switch02(false)
                    sw02.text = "OFF"
                }
            }
        }

        Switch {
            id: sw03
            text: qsTr("OFF ALL")
            onCheckedChanged: {
                if(sw03.checked)
                {
                    base.switch03All(true)
                    sw03.text = "ON ALL"
                    sw01.checked = true
                    sw01.text = "ON"
                    sw02.checked = true
                    sw02.text = "ON"
                }
                else
                {
                    base.switch03All(false)
                    sw03.text = "OFF ALL"
                    sw01.checked = false
                    sw01.text = "OFF"
                    sw02.checked = false
                    sw02.text = "OFF"
                }
            }
        }
    }


}





