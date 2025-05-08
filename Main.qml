import QtQuick
import QtQuick.Controls

Window {
    id: mainApp
    visible: true
    width: 800
    height: 600

    // Lista de usuarios aceptados
    property var acceptedUsers: [
        {username: "user1", password: "1234"},
        {username: "atorresc1", password: "1234"}
    ]

    //propiedades de la aplicacion
    property bool changedScreen2: true
    property bool checkBoxChecked : false

    // Hacemos alias de los controles para poder acceder a ellos desde el test
    property alias boton: loginButton
    property alias botonColor: buttonColor
    property alias txtUsername: usernameField
    property alias txtPassword: passwordField
    property alias lblMensaje: messageText
    property alias backgroundColor: screen2.color
    property alias checkBoxCheck: checkbox


    // Parte izquierda: Login
    Rectangle {
        id:screen1
        width: parent.width / 2
        height: parent.height
        color: "lightgray"
        border.color: "black"
        border.width: 2

        Column {
            spacing: 10
            anchors.centerIn: parent

            TextField {
                id: usernameField
                placeholderText: qsTr("Username")
            }

            TextField {
                id: passwordField
                placeholderText: qsTr("Password")
                //echoMode: TextInput.Password
            }

            Button {
                id: loginButton
                text: qsTr("Login")
                onClicked: {
                    if (isLoginSuccessful(usernameField.text, passwordField.text)) {
                        messageText.text = "Login successfully"
                        messageText.color = "green"
                    } else {
                        messageText.text = "Failed to log"
                        messageText.color = "red"
                    }
                }
            }

            Text {
                id: messageText
                color: "red"
            }
        }
    }

    // Parte derecha: Nuevos elementos
    Rectangle {
        id:screen2
        width: parent.width / 2
        height: parent.height
        color: changedScreen2 ? "lightblue" : "#ffff00"
        border.color: "black"
        border.width: 2
        anchors.right: parent.right

        Column {
            spacing: 10
            anchors.centerIn: parent

            // CheckBox
            CheckBox {
                id: checkbox
                text: qsTr("Option 1")
                checked: false

                onCheckedChanged: {
                    checkBoxChecked = !checkBoxChecked
                }
            }

            // Botón para cambiar el fondo
            Button {
                id:buttonColor
                text:"Cambiar Fondo"
                onClicked: {
                    changedScreen2=!changedScreen2
                }
            }

        }
    }
    function isLoginSuccessful(username, password) {
        for (var i = 0; i < acceptedUsers.length; i++) {
            if (acceptedUsers[i].username === username &&
                acceptedUsers[i].password === password) {
                return true
            }
        }
        return false
    }
}
