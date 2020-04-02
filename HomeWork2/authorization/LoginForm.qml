import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Item {
    id: loginForm
    width: parent.width
    height: parent.height

    Text {
        id: titleSignIn
        text: "SIGN IN"
        anchors.top:parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
    }

    TextField{
        id: loginIn
        width: parent.width-25
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleSignIn.bottom
        anchors.topMargin: 10
        placeholderText: "login..."
        font.pixelSize: 15
    }

    TextField{
        id:passwordIn
        width: parent.width-25
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loginIn.bottom
        anchors.topMargin: 10
        placeholderText: "password..."
        echoMode : TextInput.Password
        font.pixelSize: 15
    }

    BusyIndicator{
        id: indicator
        running: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonIn.bottom
    }

    Button{
        id:buttonIn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passwordIn.bottom
        anchors.topMargin: 10
        text:"Sign in"
        enabled: loginIn.text.length<6||
                 passwordIn.text.length<6 ? false:true
        onClicked: {
            indicator.running=true
        }
    }
}
