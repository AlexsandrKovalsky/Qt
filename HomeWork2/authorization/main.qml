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

    Loader{
        id:loader
        anchors.fill: parent
        anchors.bottomMargin: 40
        source: (activeWindow=="signIn")
                ? "qrc:/qml/LoginForm.qml"
                : "qrc:/qml/RegistrationForm.qml"
    }

    Text {
        id: slash
        text: "/"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        font.pixelSize: 20
    }

    ClickText{
        id: clickIn
        text: "Sign in"
        anchors.right: slash.left
        anchors.bottom: slash.bottom
        anchors.rightMargin: 10
        font.underline: activeWindow=="signIn"
        onClicked: {
            activeWindow="signIn"
        }
     }

    ClickText{
        id: clickUp
        text: "Sign up"
        anchors.left: slash.right
        anchors.bottom: slash.bottom
        anchors.leftMargin: 10
        font.underline: activeWindow=="signUp"
        onClicked: {
            activeWindow="signUp"
        }
    }
}
