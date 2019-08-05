import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import Calculate_Result.backend 1.0
import QtQuick.Controls.Material 2.3
import "exception_gui/GUI_Except.js" as Check





ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 600
    height: 500
    title: qsTr("Calculator_like_win10")
    minimumHeight: 250
    minimumWidth: 300
    Material.theme: Material.Dark

    Calculate_Result
    {
        id : calc
    }

    GridLayout {
        id: gridLayout
        anchors.top: column.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        columnSpacing: 0
        rowSpacing: 0
        rows: 6
        columns: 4

        Button {
            id: btn_Percent
            text: qsTr("%")
            Layout.fillHeight: true
            Layout.rightMargin: 5
            Layout.bottomMargin: 5
            Layout.leftMargin: 5
            Layout.topMargin: 5
            Layout.preferredHeight: 50
            Layout.preferredWidth: 100
            Layout.minimumHeight: 10
            Layout.minimumWidth: 25
            Layout.rowSpan: 1
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            onClicked:
            {
                Check.except_symbol_twice("%")
            }
        }

        Button
        {
            id: btn_Square
            text: qsTr("√")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
//                if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
//                        element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
//                        && element.text.length > 0 && element.text.indexOf("²",element.text.length-1) < 0 && element.text.indexOf("√",element.text.length-1) < 0)
//                {
//
//                }
                //Check.except_symbol_twice()
                element.text +="√"
            }
        }

        Button
        {
            id: btn_Power
            text: qsTr(" Х²")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                        element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                        && element.text.length > 0 && element.text.indexOf("²",element.text.length-1) < 0)
                {
                    element.text += "²"
                }
            }
        }

        Button {
            id: btn_minus_pow
            text: qsTr("1/x")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                Check.select_numb();
            }
        }

        Button {
            id: btn_CE
            text: qsTr("CE")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
               element.text = Check.ce()
            }
        }

        Button {
            id: btn_clear
            text: qsTr("C")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                element.text = ''
            }
        }

        Button {
            id: btn_delete
            text: qsTr("<-")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                element.text = element.text.substring(0,element.text.length-1)



            }
        }

        Button {
            id: btn_div
            text: qsTr("/")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                Check.except_symbol_twice("/")
            }

        }

        Button {
            id: btn_7
            text: qsTr("7")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 7
            }
        }

        Button {
            id: btn_8
            text: qsTr("8")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 8

            }
        }

        Button {
            id: btn_9
            text: qsTr("9")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 9
            }
        }

        Button {
            id: btn_mult
            text: qsTr("*")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                Check.except_symbol_twice("*")
            }
        }

        Button {
            id: btn_6
            text: qsTr("6")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 6
            }
        }

        Button {
            id: btn_5
            text: qsTr("5")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 5
            }
        }


        Button {
            id: btn_4
            text: qsTr("4")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 4
            }
        }

        Button {
            id: btn_sub
            text: qsTr("-")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                Check.except_symbol_twice("-")
            }

        }

        Button {
            id: btn_3
            text: qsTr("3")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 3
            }
        }

        Button {
            id: btn_2
            text: qsTr("2")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 2
            }
        }

        Button {
            id: btn_1
            text: qsTr("1")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if  (element.text.charAt(element.text.length-1) !== "²")
                element.text += 1
            }
        }

        Button {
            id: btn_add
            text: qsTr("+")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {
                 Check.except_symbol_twice("+")
            }
        }

        Button {
            id: btn_plus_minus
            text: qsTr("+/-")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked:
            {

            }
        }

        Button {
            id: btn_0
            text: qsTr("0")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if((element.text.charAt(0) != '0' || element.text.length > 1) && element.text.charAt(element.text.length-1) !== "²")
                    element.text += 0
            }
        }

        Button {
            id: btn_dot
            text: qsTr(".")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            onClicked: {
                if (element.text.length == 0)
                {
                    element.text += "0."
                }
                else
                if(Check.isDigit(element.text.charAt(element.text.length-1)) !== true
                        &&  element.text.charAt(element.text.length-1) !== "." && element.text.charAt(element.text.length-1) !== "²" )
                {
                    element.text += "0."
                }
                if (element.text.charAt(element.text.length-1) === "²")
                {
                    return
                }
                else
               // Check.except_symbol_twice(".")
                if(Check.incl_dot())
                {
                    element.text +="."
                }
            }
        }

        Button {
            id: btn_equal
            text: qsTr("=")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 5
            Layout.minimumWidth: 25
            Layout.minimumHeight: 10
            Layout.rightMargin: 5
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.rowSpan: 1
            Layout.preferredHeight: 50
            Layout.bottomMargin: 5
            Layout.preferredWidth: 100
            Material.background: Material.LightBlue

            onClicked:
            {
                //                      backend1.add = element.text.toString()
                //                       element.text = backend1.add

                calc.add = element.text.toString()
                element.text = calc.add;
            }
        }
    }


            Column
            {
                id: column
                height: 125
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                Material.accent: Material.background
                TextField
                {
                    id: element
                    text: qsTr("")
                    anchors.fill: parent
                    readOnly: true
                    hoverEnabled: false
                    font.underline: false
                    font.weight: Font.Light
                    font.capitalization: Font.AllLowercase
                    padding: 5
                    rightPadding: 5
                    leftPadding: 0
                    font.pointSize: element.height * 0.05 + element.width * 0.05
                    placeholderText: "0"
                  //  placeholderTextColor: "#000000"
                  //  color: "#000000"
                    horizontalAlignment: Text.AlignLeft
                    maximumLength: 100
                    onTextChanged:
                    {
                        calc.add = element.text.toString()
                        result_1.text = calc.add;
                    }
                    Rectangle   //make invisible accent in textfield i don`t know how remove him thiis is first methode
                    //which work
                    {
                        height: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 7
                        border.color: Material.accent
                        color: Material.accent
                        Material.background: Material.accent

                    }

                }

                Text {
                    id: result_1
                    color: "#000000"
                    text: qsTr("Text")
                    visible: true
                    anchors.bottomMargin: 5
                    anchors.rightMargin: 5
                    anchors.fill: parent
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignRight
                    fontSizeMode: Text.HorizontalFit
                    font.pixelSize: 12
                }



           }

}


































































