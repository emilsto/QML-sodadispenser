import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Soda O Matic")


    Rectangle {
        width: parent.width
        height: parent.height

        Rectangle {
            id: drinkDispenser
            // properties
            property int balance: 0
            property string selectedCan: ""
            property string status: "Please select a can"

            // signals
            signal dispenseDrink(var drink)
            signal addMoney(var amount)


            width: parent.width
            height: parent.height * (2/3)
            color: "#76b5c5"
            //anchor to right side of parent
            anchors.right: parent.right
            anchors.rightMargin: 0
            //and anchor to bottom of parent
            anchors.bottom: parent.bottom
            border.color: "black"
            border.width: 2

            //on bottom of the drink dispenser, display the status of the dispenser
            Text {
                id: statusText
                text: drinkDispenser.status
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
            }

            //display the balance as text
            Text {
                id: balanceText
                text: "Balance: $" + drinkDispenser.balance
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pixelSize: 20
            }

            //display the amount of remaining cans
            Text {
                id: canCountText
                text: "Cola Remaining: " + colaCan.cans + "\n" + "Fanta Remaining: " + fantaCan.cans + "\n" +
                      "Sprite Remaining: " + spriteCan.cans
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                font.pixelSize: 20
            }
        }


        Spritecan {
            property int cans: 10
            id : spriteCan
            x : 280
            y : 200
            scale: 0
            Behavior on scale {
                PropertyAnimation {
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        }

        Colacan {
            property int cans: 10
            id : colaCan
            x : 280
            y : 200
            scale: 0
            Behavior on scale {
                PropertyAnimation {
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        }
        
        Fantacan {
            property int cans: 10
            id : fantaCan
            x : 280
            y : 200
            scale: 0
            Behavior on scale {
                PropertyAnimation {
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        }



        Button {
            id: colaBtn
            buttonText : "Cola"
            backgroundColor: "#F40009"
            originalColor: "#F40009"
            anchors.left: parent.left
            anchors.top: parent.top
            onButtonClicked: {
                canSelected("cola")
            }
        }

        Button {
            id: fantaBtn
            buttonText : "Fanta"
            backgroundColor: "#F7941E"
            originalColor: "#F7941E"
            anchors.left: colaBtn.right
            anchors.top: parent.top
            onButtonClicked: {
                canSelected("fanta")
            }
        }

        Button {
            id: spriteBtn
            buttonText : "Sprite"
            backgroundColor: "#F8CD24"
            originalColor: "#F8CD24"
            anchors.left: fantaBtn.right
            anchors.top: parent.top
            onButtonClicked: {
                canSelected("sprite")
                console.log(spriteCan.cans)
            }
        }

    }

    //button in left bottom corner
    FunctionBtn  {
        id: returnBtn
        buttonText : "Add coin"
        backgroundColor: "#F7941E"
        anchors.left: parent.left
        anchors.leftMargin : 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        onButtonClicked:{
            addMoney(1)
        }
    }

    //button in right bottom corner
    FunctionBtn  {
        id: buyBtn
        buttonText : "Buy drink"
        backgroundColor: "#F7941E"
        anchors.right: parent.right
        anchors.rightMargin : 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        onButtonClicked:{
            consumeCan(drinkDispenser.selectedCan)
        }
    }



    function canSelected(selectedCan) {
        if (selectedCan === "sprite") {
            spriteCan.scale = 1
            colaCan.scale = 0
            fantaCan.scale = 0
        }
        else if (selectedCan === "cola"){
            colaCan.scale = 1
            spriteCan.scale = 0
            fantaCan.scale = 0
        }
        else {
            fantaCan.scale = 1
            spriteCan.scale = 0
            colaCan.scale = 0
        }
        drinkDispenser.selectedCan = selectedCan
        updateDispenserStatus("")
    }
       function consumeCan(selectedCan){
        //remove can from inventory
        if (selectedCan === "sprite") {
            //check if there are any cans left
            if (spriteCan.cans > 0) {
                console.log(spriteCan.cans)
                //check if there is enough money
                if (drinkDispenser.balance >= 1) {
                    spriteCan.cans -= 1
                    drinkDispenser.balance -= 1
                    console.log(drinkDispenser.balance)
                    updateDispenserStatus("Enjoy your " + selectedCan + "!")
                }
                else {
                    updateDispenserStatus("Not enough money")
                }
            }
            else {
                updateDispenserStatus("No more cans left")
            }
        }
        else if (selectedCan === "cola"){
            //check if there are any cans left
            if (colaCan.cans > 0) {
                //check if there is enough money
                if (drinkDispenser.balance >= 1) {
                    drinkDispenser.balance -= 1
                    console.log(drinkDispenser.balance)
                    drinkDispenser.dispenseDrink(selectedCan)
                    colaCan.cans -= 1
                    console.log(colaCan.cans)
                    updateDispenserStatus("Enjoy your " + selectedCan + "!")
                }
                else {
                    updateDispenserStatus("Not enough money")
                }
            }
            else {
                updateDispenserStatus("No more cans left")
            }
        }
        else {
            //check if there are any cans left
            if (fantaCan.cans > 0) {
                //check if there is enough money
                if (drinkDispenser.balance >= 1) {
                    fantaCan.cans -= 1
                    drinkDispenser.balance -= 1
                    console.log(drinkDispenser.balance)
                    drinkDispenser.dispenseDrink(selectedCan)
                    updateDispenserStatus("Enjoy your " + selectedCan + "!")

                }
            }
            else {
                updateDispenserStatus("No more cans left")
            }
        }
       }

       //function to add money to the machine
         function addMoney(amount) {
          drinkDispenser.balance += amount
          console.log("balance: " + drinkDispenser.balance)
         }
         //function to update dispenser status
            function updateDispenserStatus(status) {
            drinkDispenser.status = status
            }
}



