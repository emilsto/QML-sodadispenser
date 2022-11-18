import QtQuick 2.15

Rectangle {
    id: fanta
    height: 160
    width: parent.width * (1/3)
    color: "#F7941E"

    signal fantaClicked

    Rectangle {
        height: 125
        width: 125
        radius: 67
        anchors.centerIn: parent
        color: "#f0f0f0"
        Text {
            anchors.centerIn: parent
            font {
                pixelSize: 35
                family: "Arial"
            }
            text: "Fanta"
            color : "#595959"
        }
                MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Fanta clicked")
                border.color = "green"
                border.width = 2
            }
            onReleased: {
                border.color = "transparent"
                border.width = 0
            }
        }
    }

}
