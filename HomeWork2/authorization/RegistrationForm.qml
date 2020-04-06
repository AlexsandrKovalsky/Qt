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
            id: titleSignUp
            text: "SIGN UP"
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField{
            id: loginUp
            width: window.width-25
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "login"
            font.pixelSize: 15
        }

        TextField{
            id:passwordUp
            width: window.width-25
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "password"
            echoMode : TextInput.Password
            font.pixelSize: 15
        }

        TextField{
            id: repeatPassword
            width: window.width-25
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "repeat password"
            echoMode : TextInput.Password
            font.pixelSize: 15
        }

        TextField{
            id: nickName
            width: window.width-25
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "nickname"
            font.pixelSize: 15
        }

        Button{
            id: buttonUp
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Sign up"
            enabled: loginUp.text.length >5 &&
                     passwordUp.text.length>5&&
                     repeatPassword.text.length>5&&
                     nickName.text.length>5
            onClicked: {
                error.visible=false
                if(passwordUp.text!=repeatPassword.text){
                    error.text= "Password values aren't same!"
                    error.visible= true
                } else{
                    indicator.running=true
                }
            }
        }

        BusyIndicator{
            id: indicator
            running: false
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: error
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: buttonUp.bottom
            color: "red"
            visible: false
            font.pixelSize: 16
        }
    }
}
