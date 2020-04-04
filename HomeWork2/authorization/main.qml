import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Window {
    id:window
    visible: true
    width: 300
    height: 500
    title: "Home work"
    flags: Qt.Dialog
    property string activeWindow: "signIn"
    property var forms: {"signIn":"qrc:/qml/LoginForm.qml",
                           "signUp": "qrc:/qml/RegistrationForm.qml"}
    Loader{
        id:loader
        anchors.fill: parent
        anchors.bottomMargin: 70
        source: forms[activeWindow];
    }

    Row{
        spacing: 5
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10

        ClickText{
            id: clickIn
            text: "Sign in"
            font.underline: activeWindow=="signIn"
            onClicked: {
                activeWindow="signIn"
            }
         }

        Text {
            id: slash
            text: "/"
            font.pixelSize: 20
        }

        ClickText{
            id: clickUp
            text: "Sign up"
            font.underline: activeWindow=="signUp"
            onClicked: {
                activeWindow="signUp"
            }
        }
    }
}
