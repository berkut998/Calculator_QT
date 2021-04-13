import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import Calculate_Result.backend 1.0
import QtQuick.Controls.Material 2.3
import "exception_gui/GUI_Except.js" as Check


/*
    должен работать и и выглядить ка обычный калькулятор на 10 винде
    1)все кнопки и боксы должны работать печатают все что нужно
        кнопка смены знака не работает
                нижний текст выводит коряво (выводит правильно подсчеты идут не так если нет знака операции то результат не возвращаеться)
                проценты не работают
    2)Описаны все исключения
                добавить исключения на корень можно скока угодно но оно не считает пускай это и не прав с мат точки но так проще
                сделать запрет на написание первого нуля без точки у числа типа 02541
                кнопка 1/x не работает когда всего 1 символ +++ вроде работает
    3)Считать должно правильно
        написать больше авто тестов на разные случае в том числе и ноль при деление
    4)Вычисления нужно поравить
                результат не возвращаеться если нетвычислений
        нет скобок
                исключения для деления на 0
        на переполнение переменных не реально переполнить ))
            при вычислениях степень 1-e56 если нажать равно то оно и будет в боксе но оно не считает нормльно из за парсера дальше


*/
ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 600
    height: 500
    title: qsTr("Calculator_like_win10")
    minimumHeight: 350
    minimumWidth: 300
    Material.theme: Material.Dark

    Calculate_Result {
        id: calc
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

            onClicked: {

                /*
                  Получить значение процентов r
                  Получить занчение справа l
                  l_1 = r/100 * l
                  Вместо l=l_1
                  */
                Check.except_symbol_twice("%")
                var l = Check.select_term()
                element.text = element.text.substring(
                            0, element.text.length - l.length)
                l = l.substring(0, l.length - 1)
                var operation = element.text.charAt(element.text.length - 1)
                element.text = element.text.substring(0,
                                                      element.text.length - 1)
                var r = Check.select_term()
                l = r / 100 * l
                element.text += operation
                element.text += l
            }
        }

        Button {
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
            onClicked: {
                if (element.text.indexOf("²", element.text.length - 1) < 0
                        && element.text.indexOf("√",
                                                element.text.length - 1) < 0) {
                    if (Check.isDigit(element.text.charAt(
                                          element.text.length - 1))) {
                        element.text += "*√"
                        return
                    }
                    element.text += "√"
                }
                //Check.except_symbol_twice()
            }
        }

        Button {
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
            onClicked: {
                if (element.text.indexOf("+", element.text.length - 1) < 0
                        && element.text.indexOf("-", element.text.length - 1)
                        < 0 && element.text.indexOf("*", element.text.length - 1) < 0 && element.text.indexOf("/", element.text.length - 1) < 0 && element.text.length
                        > 0 && element.text.indexOf("²", element.text.length - 1) < 0) {
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
            onClicked: {
                Check.select_numb()
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
            onClicked: {
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
            onClicked: {
                element.text = element.text.substring(0,
                                                      element.text.length - 1)
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
            onClicked: {
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
            onClicked: {
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
            onClicked: {
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1)
                        && element.text.charAt(element.text.length - 1) !== "²")
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
            onClicked: {
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
            onClicked: {

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
                var s = Check.select_term()
                if ((s.charAt(0) !== '0' || s.length > 1) && s.charAt(
                            element.text.length - 1) !== "²")
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
                if (element.text.length == 0) {
                    element.text += "0."
                } else if (Check.isDigit(element.text.charAt(
                                             element.text.length - 1)) !== true
                           && element.text.charAt(
                               element.text.length - 1) !== "."
                           && element.text.charAt(
                               element.text.length - 1) !== "²") {
                    element.text += "0."
                }
                if (element.text.charAt(element.text.length - 1) === "²") {
                    return
                } else // Check.except_symbol_twice(".")
                    if (Check.incl_dot()) {
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

            onClicked: {

                //                      backend1.add = element.text.toString()
                //                       element.text = backend1.add
                calc.add = element.text.toString()
                element.text = calc.add
            }
        }
    }

    Column {
        id: column
        height: 125
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.accent: Material.background
        TextField {
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
            onTextChanged: {
                var tmp = 0
                if (element.text.charAt(
                            element.text.length - 1) === "+" || element.text.charAt(
                            element.text.length - 1) === "-" || element.text.charAt(
                            element.text.length - 1) === "/" || element.text.charAt(
                            element.text.length - 1) === "*")
                    return
                calc.add = element.text.toString()
                result_1.text = calc.add
                if (element.text.length === 0)
                    calc.result = 0.0
            }
            Rectangle //make invisible accent in textfield i don`t know how remove him thiis is first methode
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
            color: Material.foreground
            text: qsTr("Text")
            visible: {
                if (element.text === "") {
                    false
                } else {
                    true
                }
            }
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
