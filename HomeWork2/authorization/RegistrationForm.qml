import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Item {
    id: registrationForm
    width: parent.width
    height: parent.height

    Text {
        id: titleSignUp
        text: "SIGN UP"
        font.pixelSize: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField{
        id: loginUp
        width: parent.width-25
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleSignUp.bottom
        anchors.topMargin: 10
        placeholderText: "login"
        font.pixelSize: 15
    }

    TextField{
        id:passwordUp
        width: parent.width-25
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loginUp.bottom
        anchors.topMargin: 10
        placeholderText: "password"
        echoMode : TextInput.Password
        font.pixelSize: 15
    }

    TextField{
        id: repeatPassword
        width: parent.width-25
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passwordUp.bottom
        anchors.topMargin: 10
        placeholderText: "repeat password"
        echoMode : TextInput.Password
        font.pixelSize: 15
    }

    TextField{
        id: nickName
        width: parent.width-25
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: repeatPassword.bottom
        anchors.topMargin: 10
        placeholderText: "nickname"
        font.pixelSize: 15
    }

    BusyIndicator{
        id: indicator
        running: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonUp.bottom
    }
    
    Text {
        id: error
        anchors.top: buttonUp.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        color: "red"
        visible: false
        font.pixelSize: 16
    }

    Button{
        id: buttonUp
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: nickName.bottom
        anchors.topMargin: 10
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
}
