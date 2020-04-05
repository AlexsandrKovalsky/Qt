import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Item {
    width: parent.width
    height: parent.height

    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5

        Text {
            id: titleSignIn
            text: "SIGN IN"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
        }

        TextField{
            id: loginIn
            width: window.width-25
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "login..."
            font.pixelSize: 15
        }

        TextField{
            id:passwordIn
            width: window.width-25
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "password..."
            echoMode : TextInput.Password
            font.pixelSize: 15
        }

        Button{
            id:buttonIn
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Sign in"
            enabled: login.text.length >=5 && password.text.length>=5
            onClicked: {
                indicator.running=true
            }
        }

        BusyIndicator{
            id: indicator
            running: false
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
