import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Text{
    id: clickText
    font.pixelSize: 20    
    signal clicked()
    MouseArea{
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
        onClicked: {
            clickText.clicked()
        }
    }
}
