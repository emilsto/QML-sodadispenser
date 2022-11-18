import QtQuick 2.15

Rectangle {
    property string buttonText: ""
    property color backgroundColor: "lightgreen"

    signal buttonClicked

    width: 100
    height : 100
    radius: 50
    color : backgroundColor
    Text {
        text: parent.buttonText
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.width = 90
            parent.height = 90
        }
        onReleased :  {
            parent.width = 100
            parent.height = 100
            parent.buttonClicked()
        }
    }

}
