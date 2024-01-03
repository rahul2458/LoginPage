import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root
    implicitHeight: 25
    implicitWidth: 25

    property url icons : "Resources/Icons/icons8_Facebook_24px.png"
    property color iconColor: "gray"
    property alias iconMouseEvent : iconMouseEvent
    property color btBackgroundColor : "transparent"
    property real offset : 2

    Rectangle {
        id: mainRect
        anchors.centerIn: parent
        height: 25
        width: 25
        radius: height
        color: root.btBackgroundColor

        Image {
            id: icon
            anchors.fill: parent
            anchors.margins: root.offset
            anchors.verticalCenterOffset: iconMouseEvent.pressed ? 1 : 0
            source: root.icons
        }

        ColorOverlay {
            id: colorIcon
            anchors.fill: icon
            source: icon
            color: root.iconColor
        }

        MouseArea {
            id: iconMouseEvent
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }

    }

}
