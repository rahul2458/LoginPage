import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls
import Qt.Singleton 1.0

Window {
    id: window_login
    width: GlobalProperties.width
    height: GlobalProperties.height
    visible: true
    title: qsTr("Login page")
    color: "#00000000"

    flags: Qt.FramelessWindowHint

    // cpp Connections
    Connections {
        target: BackedCpp
        function onUserVerification(status){
            console.log(status)
        }
    }

    //UI for login page
    Rectangle {
        id : mainBg
        anchors.fill: parent
        anchors.margins: 20
        radius: 20
        clip: true


        // Title top bar
        Rectangle {
            anchors.top: parent.top
            anchors.leftMargin: 27
            height: 35
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 40

            DragHandler{
                onActiveChanged: if(active){
                                     window_login.startSystemMove()
                                 }
            }

        }

        Image {
            id: backgroundImage
            anchors.fill: mainBg
            source: GlobalProperties.backgroundImage
            visible: false


        }

        FastBlur {
            source: backgroundImage
            anchors.fill: backgroundImage
            radius: 65
        }

        Rectangle {
            id: logArea
            anchors.centerIn: parent
            height: 350
            width: 300
            color: "gray"
            radius: 20
            opacity: 0.7

            Column {
                id: clmn
                spacing: 10
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -20

                Row {
                    spacing: 35
                    Text {
                        text: "User name: "
                        font.pixelSize: 16
                        color: "white"
                        anchors.verticalCenter: userName.verticalCenter
                    }

                    CstmInputText {
                        id: userName
                        text: "User Name.."
                    }
                }


                Row {
                    spacing: 8
                    Text {
                        id: username
                        text: "User password: "
                        font.pixelSize: 16
                        color: "white"
                        anchors.verticalCenter: userPassword.verticalCenter
                    }

                    CstmInputText {
                        id: userPassword
                        text: ""
                        customEchoMode: TextInput.Password

                    }
                }
            }

            CstmButton {
                id: logInBt
                btWidth: 238
                anchors.top: clmn.bottom
                anchors.topMargin: 45
                anchors.right: clmn.right
                btText: "Login!"
                btColor: "#2C3B90"
                textColor: "white"
                btMouse.onClicked: {
                    BackedCpp.accountVerify(username.text, userPassword.text)
                }

            }

            Text {
                text: "For more information click here!"
                anchors.left: parent.left
                anchors.leftMargin: -95
                anchors.verticalCenter: logArea.verticalCenter
                color: "yellow"
                font.pixelSize: 15
                font.underline: true
                rotation: 90
                opacity: 0.5

                MouseArea {
                    id: linkMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally("https://www.youtube.com/channel/UC4WlnOmqy_6yVidIrCuKnTw")
                    }
                }
            }


            // UI icons "Avtar"

            Rectangle {
                id: iconsAvt
                height: 100
                width: 100
                radius: height
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: iconsAvtr
                    anchors.fill: parent
                    anchors.margins: 0
                    source: "Resources/Images/1677420534414.jpg"
                    opacity: 1.0
                    // Apply rounded corners mask
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Rectangle {
                            width: iconsAvtr.width
                            height: iconsAvtr.height
                            radius: height // Should match the radius of the parent Rectangle
                            //color: "black"
                        }
                    }

                }


            }

            // some text on user bottom
            Text {
                id: forgot
                anchors.bottom: logInBt.top
                anchors.right: logInBt.right
                anchors.bottomMargin: 18
                text: "Forgot Password"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("Forgot button clicked!")
                    }
                }
            }

            CheckBox {
                text: "Remember me!"
                anchors.verticalCenter: forgot.verticalCenter
                anchors.left: logInBt.left
            }


            Text {
                id: loginOrText
                anchors.horizontalCenter: logInBt.horizontalCenter
                anchors.top: logInBt.bottom
                anchors.topMargin: 15
                text: "Or login with"
            }

            Row {
                anchors.top: loginOrText.bottom
                spacing: 10
                anchors.horizontalCenter: logInBt.horizontalCenter
                anchors.topMargin: 12
                CstmRoundBt {
                    iconColor: "black"
                    icons: "Resources/Icons/icons8_Facebook_24px.png"
                    iconMouseEvent.onClicked: Qt.openUrlExternally("https://www.facebook.com/")
                }
                CstmRoundBt {
                    iconColor: "black"
                    icons: "Resources/Icons/icons8_linkedin_circled_50px.png"
                    iconMouseEvent.onClicked: Qt.openUrlExternally("https://www.linkedin.com/login")
                }
                CstmRoundBt {
                    iconColor: "black"
                    icons: "Resources/Icons/icons8_google_plus_24px.png"
                    iconMouseEvent.onClicked: Qt.openUrlExternally("https://myaccount.google.com/?utm_source=sign_in_no_continue&pli=1")
                }
                CstmRoundBt {
                    iconColor: "black"
                    icons: "Resources/Icons/icons8_Twitter_24px.png"
                    iconMouseEvent.onClicked: Qt.openUrlExternally("https://twitter.com/login")
                }

                CstmRoundBt {
                    iconColor: "black"
                    icons: "Resources/Icons/icons8_YouTube_24px.png"
                    iconMouseEvent.onClicked: Qt.openUrlExternally("https://www.youtube.com/channel/UC4WlnOmqy_6yVidIrCuKnTw")
                }

            }

        }

        CstmRoundBt {
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            icons: "Resources/Icons/icons8_Close_24px.png"
            iconColor: "white"
            btBackgroundColor: "gray"
            iconMouseEvent.onClicked: window_login.close()
            offset: 5
            iconMouseEvent.onEntered: btBackgroundColor = "#E81123"
            iconMouseEvent.onExited: btBackgroundColor = "gray"
        }

    }
}
