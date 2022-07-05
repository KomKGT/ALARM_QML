import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0
//import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.10

Dialog{
    id: dialog
    title: "Add new alarm"
    modal: true
    standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel

    function formatNumber(number)
    {
        return number < 10 && number >= 0 ? "0" + number : number.toString
    }

    Tumbler{
            id: hoursTumbler
            x: 290
            y: 145
            model: 24
            delegate: TumblerDelegate{
                text: formatNumber(modelData)
            }
        }

}

