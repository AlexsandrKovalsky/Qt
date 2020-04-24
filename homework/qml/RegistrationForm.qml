import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import Manager 1.0
import QtQuick.Dialogs 1.3

Item {
    width: parent.width
    height: parent.height

    MessageDialog {
        id: messageDialog
        title: "Уведомление"
    }

    Manager{
        id:manager
        onRegisterFinished: {
            messageDialog.text= error.length>0?
                        "Ошибка регистрации:\n"+error:
                        "Регистрация  прошла успешно"
            messageDialog.open()
        }
    }

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
                    error.visible= true
                } else{
                    manager.registration(loginUp.text, passwordUp.text)
                }                
            }
        }

        BusyIndicator{
            id: indicator
            running: manager.processing
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: error
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: buttonUp.bottom
            text: "Password values aren't same!"
            color: "red"
            visible: false
            font.pixelSize: 16
        }
    }
}
