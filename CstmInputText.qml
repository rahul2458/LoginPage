import QtQuick
import QtQuick.Controls

Item {
    id: root
    implicitHeight: 36
    implicitWidth: 120

    // custom property
    property string text : ""
    property int customEchoMode: TextInput.Normal

    Rectangle {
        anchors.centerIn: parent
        width: 120
        height: 36
        color: "transparent"
        radius: 5
        //border.color: "black"

        BorderImage {
            id: name
            source: "Resources/Icons/icons8_horizontal_line_30px.png"
            asynchronous: false
            horizontalTileMode: BorderImage.Stretch
            anchors.fill: parent
            anchors.topMargin: 23
            border { left: 1; top: 0; right: 1; bottom: 1 }
        }

        TextInput {
            id: inputText
            anchors.centerIn: parent
            width: parent.width - 10
            color: "white"
            font.pixelSize: 16
            selectionColor: "#Ab491B"
            text: root.text
            echoMode: root.customEchoMode
            onActiveFocusChanged: {
                    if (!activeFocus && text === "") {

                        text = "User name..";
                    }
                }
                onTextChanged: {
                    if (text !== "User name..") {
                        console.log("Text changed:", text);
                    }
                }
        }
    }

}
