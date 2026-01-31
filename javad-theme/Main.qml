import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Rectangle {
    id: root

    // Theme configuration
    property color backgroundColor: "#252D38"
    property color accentColor: "#7FD4C1"
    property color avatarBgColor: "#A8E6CF"
    property color inputBgColor: "#3A4352"
    property color textColor: "#E8E8E8"
    property color placeholderColor: "#6B7280"
    property int avatarSize: 120
    property int inputWidth: 320
    property int inputHeight: 52
    property int inputRadius: 26
    property int fadeInDuration: 800

    width: 640
    height: 480

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            // Success - optional animation
        }

        onLoginFailed: {
            errorMessage.visible = true
            errorText.text = textConstants.loginFailed
            passwordInput.text = ""
            passwordInput.focus = true
            hideErrorTimer.start()
        }
    }

    // Background
    Rectangle {
        anchors.fill: parent
        color: backgroundColor
    }

    // Vignette overlay for subtle edge darkening (vertical gradient)
    Rectangle {
        id: vignetteOverlay
        anchors.fill: parent
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 0.15) }
            GradientStop { position: 0.3; color: "transparent" }
            GradientStop { position: 0.7; color: "transparent" }
            GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0.15) }
        }
    }



    // Main content container with fade-in animation
    Item {
        id: contentContainer
        anchors.fill: parent
        opacity: 0

        // Fade-in animation on startup
        NumberAnimation on opacity {
            from: 0
            to: 1
            duration: fadeInDuration
            easing.type: Easing.OutQuad
            running: true
        }

        // Centered login container
        Column {
            id: loginContainer
            anchors.centerIn: parent
            spacing: 20

            // User avatar and username container
            Column {
                id: avatarSection
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter

                // User avatar
                Item {
                    id: avatarContainer
                    width: avatarSize
                    height: avatarSize
                    anchors.horizontalCenter: parent.horizontalCenter

                    // Avatar background circle
                    Rectangle {
                        id: avatarBackgroundRect
                        anchors.fill: parent
                        radius: avatarSize / 2
                        color: avatarBgColor

                        // Avatar image
                        Image {
                            id: avatarImage
                            anchors.centerIn: parent
                            width: avatarSize * 0.99
                            height: avatarSize * 0.99
                            source: "face.icon"
                            fillMode: Image.PreserveAspectFit
                            smooth: true

                            // Fallback if no user icon
                            onStatusChanged: {
                                if (status === Image.Error || status === Image.Null) {
                                    avatarFallback.visible = true
                                }
                            }
                        }

                        // Fallback icon (simple user silhouette)
                        Text {
                            id: avatarFallback
                            anchors.centerIn: parent
                            text: "●"
                            font.pixelSize: avatarSize * 0.4
                            color: "#3A4352"
                            visible: false
                        }
                    }
                }

                // Username text
                Text {
                    id: usernameText
                    text: userModel.lastUser
                    color: textColor
                    font.family: "monospace"
                    font.pixelSize: 14
                    font.letterSpacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            // Password input container
            Item {
                id: passwordContainer
                width: inputWidth
                height: inputHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // Drop shadow effect
                DropShadow {
                    anchors.fill: inputBackgroundRect
                    horizontalOffset: 0
                    verticalOffset: 6
                    radius: 20
                    samples: 41
                    color: Qt.rgba(0, 0, 0, 0.35)
                    source: inputBackgroundRect
                }

                // Main input background
                Rectangle {
                    id: inputBackgroundRect
                    anchors.fill: parent
                    radius: inputRadius
                    color: Qt.rgba(58/255, 67/255, 82/255, 0.85)

                    // Subtle border on focus
                    border.width: passwordInput.focus ? 2 : 0
                    border.color: accentColor

                    Behavior on border.width {
                        NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
                    }
                }

                // Password text input
                TextInput {
                    id: passwordInput
                    anchors.fill: parent
                    anchors.leftMargin: 24
                    anchors.rightMargin: 24
                    verticalAlignment: TextInput.AlignVCenter
                    
                    echoMode: TextInput.Password
                    passwordCharacter: "•"
                    
                    font.family: "monospace"
                    font.pixelSize: 18
                    font.letterSpacing: 4
                    
                    color: textColor
                    selectionColor: accentColor
                    selectedTextColor: backgroundColor
                    
                    focus: true

                    // Submit on Enter
                    Keys.onReturnPressed: {
                        sddm.login(userModel.lastUser, passwordInput.text, sessionModel.lastIndex)
                    }
                    Keys.onEnterPressed: {
                        sddm.login(userModel.lastUser, passwordInput.text, sessionModel.lastIndex)
                    }
                }
            }
        }

        // Branding logo in bottom-right corner
        Image {
            id: brandingLogo
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 50
            anchors.bottomMargin: 40
            width: 90
            height: 35
            source: "logo.png"
            fillMode: Image.PreserveAspectFit
            smooth: true
        }
    }

    // Error message display (subtle)
    Rectangle {
        id: errorMessage
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.7
        width: errorText.width + 40
        height: 36
        radius: 18
        color: Qt.rgba(239/255, 68/255, 68/255, 0.15)
        visible: false

        Text {
            id: errorText
            anchors.centerIn: parent
            text: ""
            color: "#EF4444"
            font.family: "monospace"
            font.pixelSize: 12
        }
    }

    Timer {
        id: hideErrorTimer
        interval: 3000
        onTriggered: {
            errorMessage.visible = false
        }
    }

    // Session selector (hidden by default, accessible via keyboard)
    Item {
        id: sessionSelector
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 30
        anchors.bottomMargin: 30
        visible: false

        Row {
            spacing: 10

            Text {
                text: "Session:"
                color: placeholderColor
                font.family: "monospace"
                font.pixelSize: 11
                anchors.verticalCenter: parent.verticalCenter
            }

            ComboBox {
                id: sessionCombo
                width: 150
                height: 28
                model: sessionModel
                
                property int selectedIndex: sessionModel.lastIndex
                
                onSelectedIndexChanged: {
                    sessionModel.lastIndex = selectedIndex
                }
            }
        }
    }

    // Keyboard shortcuts
    Keys.onPressed: {
        // F1 to toggle session selector
        if (event.key === Qt.Key_F1) {
            sessionSelector.visible = !sessionSelector.visible
        }
        // Escape to clear password
        if (event.key === Qt.Key_Escape) {
            passwordInput.text = ""
            passwordInput.focus = true
        }
    }

    // Ensure keyboard focus
    Component.onCompleted: {
        passwordInput.focus = true
    }
}
