import QtQuick 2.15

Item {

    Rectangle{
        //counter for cans available
        property int cans: 10


        // can
        width: 100
        height: 225
        radius: 10
        color : "orange"
        Rectangle {
            // can text area
            anchors.centerIn: parent
            width: 50
            height: 50
            radius: 25
            Text {
                anchors.centerIn: parent
                text: "Fanta"
            }
        }
        Rectangle {
            //lid of the can
            anchors.top: parent.top
            width: 100
            height: 10
            radius: 10
            color: "grey"
            //punch hole
            Rectangle {
                anchors.left: parent.left
                width: 25
                height: 10
                radius: 5
                color: "silver"
            }
        }
    }
}
