import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import Calculate_Result.backend 1.0
import QtQuick.Controls.Material 2.4





Window {
    visible: true
    width: 600
    height: 500
    title: qsTr("Calculator_like_win10")
    minimumHeight: 250
    minimumWidth: 300
    Row {
        id: row
        anchors.fill: parent
        Calculate_Result
        {
            id:calc
        }

        Rectangle {
            id: rectangle
            height: parent.height*0.25
            color: "#ffffff"
            border.width: 1
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Column {
                id: column
                anchors.fill: parent

                Text {
                    id: element1
                    color: "#948a8a"
                    text: qsTr("Text")
                    font.family: "Courier"
                    leftPadding: 0
                    font.bold: true
                    font.pointSize: parent.width * 0.05 + parent.height * 0.05
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignBottom
                    padding: 5

                }

                TextField
                {
                    id: element
                    readOnly:true
                    text: qsTr("")
                    padding: 5
                    rightPadding: 5
                    leftPadding: 0
                    font.pointSize: 15
                    anchors.fill: parent
                    placeholderText: "0"
                    placeholderTextColor: "#000000"
                    color: "#000000"
                    horizontalAlignment: Text.AlignRight
                    activeFocusOnPress: false
                    autoScroll: true
                    maximumLength: 100
                    hoverEnabled: false

                }
            }
        }

        Rectangle {
            id: rectangle1
            y: 0
            color: "#ffffff"
            border.width: 2
            anchors.top: rectangle.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 0

            GridLayout {
                id: gridLayout
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
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
                        if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                                element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                                && element.text.length > 0 && element.text.indexOf("√",element.text.length-1) < 0)
                        {
                            element.text += "%"
                        }
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
                        if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                                element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                                && element.text.length > 0 && element.text.indexOf("²",element.text.length-1) < 0 && element.text.indexOf("√",element.text.length-1) < 0)
                        {
                            element.text += "√"
                        }
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
                    //                    onClicked:
                    //                    {
                    //                        for (i = element.text.length; i < 0; i--)
                    //                        {
                    //                            if (element.text.valueOf() )
                    //                        }
                    //                    }
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
                    onClicked: {
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
                        if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                                element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                                && element.text.length > 0 )
                        {
                            element.text += '/'
                        }
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
                        if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                                element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                                && element.text.length > 0 )
                        {
                            element.text += '*'
                        }
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
                        if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                                element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                                && element.text.length > 0 )
                        {
                            element.text += '-'
                        }
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
                        if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
                                element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
                                && element.text.length > 0 )
                        {
                            element.text += '+'
                        }
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
                        if(element.text.charAt(0) != '0' || element.text.length > 1)
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
                        else if(element.text.indexOf(".",0) < 0)
                        {

                            element.text += "."
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
        }
    }
}































/*##^## Designer {
    D{i:4;anchors_height:400;anchors_width:200}
}
 ##^##*/
