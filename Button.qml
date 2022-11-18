import QtQuick 2.15

Rectangle {
    property string buttonText: ""
    property color backgroundColor: "lightgreen"
    property color originalColor: "red"

    signal buttonClicked

    height: 160
    width: parent.width * (1/3)
    color : backgroundColor

    Rectangle {
        height: 125
        width: 125
        radius: 67
        anchors.centerIn: parent
        color: "#f0f0f0"
    }
    Text {
        anchors.centerIn: parent
        font {
            pixelSize: 35
            family: "Arial"
        }
        text: parent.buttonText
        color : "#595959"
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.backgroundColor = "green"

        }
        onReleased :  {
            //size = 1
            parent.backgroundColor = originalColor
            parent.buttonClicked()
        }
    }

}
