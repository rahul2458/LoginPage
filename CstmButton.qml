import QtQuick

Item {
    id: root
    implicitHeight: btHeight
    implicitWidth: btWidth

    // custom property
    property color btColor: "white"
    property color textColor: "black"
    property string btText : "Click here!"
    property real btWidth: 100
    property real btHeight: 30

    // mouse event
    property alias btMouse : btMouse

    Rectangle  {
        id: mainRect
        anchors.centerIn: parent
        height: root.btHeight
        width: root.btWidth
        color: root.btColor
        radius: height

        Text{
            id: btText
            anchors.centerIn: parent
            text: root.btText
            anchors.verticalCenterOffset: btMouse.pressed ? 1 : 0
            font.pixelSize: 14
            font.bold: true
            color: root.textColor

        }

        MouseArea {
            id: btMouse
            anchors.fill: mainRect
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                console.log("Clicked!")

            }
        }
    }

}
