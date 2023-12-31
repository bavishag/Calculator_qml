
import CalculatorStateMachine 1.0
import QtQuick 2.5
import QtQuick.Window 2.0
import QtScxml 5.8

Window {
    id: window
    visible: true
    width: 320
    height: 480

    CalculatorStateMachine {
        id: statemachine
        running: true
        EventConnection {
            events: ["updateDisplay"]
            onOccurred: resultText.text = event.data.display
        }
    }

    Rectangle {
        id: resultArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height * 3 / 8 - 10
        border.color: "white"
        border.width: 1
        color: "#003566"
        Text {
            id: resultText
            anchors.leftMargin: buttons.implicitMargin
            anchors.rightMargin: buttons.implicitMargin
            anchors.fill: parent
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            text: "0"
            color: "WHITE"
            font.pixelSize: window.height * 3 / 32
            font.family: "Open Sans Regular"
            fontSizeMode: Text.Fit
        }
    }

    Item {
        id: buttons
        anchors.top: resultArea.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        property real implicitMargin: {
            var ret = 0;
            for (var i = 0; i < visibleChildren.length; ++i) {
                var child = visibleChildren[i];
                ret += (child.implicitMargin || 0);
            }
            return ret / visibleChildren.length;
        }

        Repeater {
            id: operations
            model: ["÷", "×", "+", "-"]
            Button {
                y: 0
                x: index * width
                width: parent.width / 4
                height: parent.height / 5
                color: pressed ? "#e0fcf9" : "#B2F7EF"
                text: modelData
                fontHeight: 0.4
                onClicked: statemachine.submitEvent(eventName)
                property string eventName: {
                    switch (text) {
                    case "÷": return "OPER.DIV"
                    case "×": return "OPER.STAR"
                    case "+": return "OPER.PLUS"
                    case "-": return "OPER.MINUS"
                    }
                }
            }
        }

        Repeater {
            id: digits
            model: ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0", ".", "C"]
            Button {
                x: (index % 3) * width
                y: Math.floor(index / 3 + 1) * height
                width: parent.width / 4
                height: parent.height / 5
                color: pressed ? "#d6d6d6" : "#eeeeee"
                text: modelData
                onClicked: statemachine.submitEvent(eventName)
                property string eventName: {
                    switch (text) {
                    case ".": return "POINT"
                    case "C": return "C"
                    default: return "DIGIT." + text
                    }
                }
            }
        }

        Button {
            id: resultButton
            x: 3 * width
            y: parent.height / 5
            textHeight: y - 2
            fontHeight: 0.4
            width: parent.width / 4
            height: y * 4
            color: pressed ? "#e0fcf9" : "#B2F7EF"
            text: "="
            onClicked: statemachine.submitEvent("EQUALS")
        }
    }
}
