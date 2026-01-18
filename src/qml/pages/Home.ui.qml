import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: home
    anchors.fill: parent;
    width: 800
    height: 600
    clip: true
    color: "#0f111c"

    FontLoader {
        id: zenLoop;
        source: "../fonts/ZenLoop-Regular.ttf"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Item {
            Layout.fillHeight: true
            Layout.minimumHeight: 50
        }

        // Title
        Text {
            id: stepSketch
            Layout.alignment: Qt.AlignHCenter
            color: "#ffffff"
            font.family: "Zen Loop"
            font.pixelSize: 75
            font.weight: Font.Normal
            text: "StepSketch"
            textFormat: Text.PlainText
        }

        // Input row
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: 500
            Layout.fillWidth: true
            spacing: 10

            Rectangle {
                id: inputBackground
                Layout.fillWidth: true
                Layout.preferredHeight: 45
                color: "#2b2d3a"
                radius: 40
                clip: true

                TextInput {
                    id: taskInput
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    verticalAlignment: TextInput.AlignVCenter
                    color: "#ffffff"
                    font.family: "Tuffy"
                    font.pixelSize: 14
                    cursorVisible: true
                    selectionColor: "#3d3f4d"

                    Text {
                        anchors.fill: parent
                        anchors.leftMargin: 0
                        verticalAlignment: Text.AlignVCenter
                        color: "#b2b2b2"
                        font.family: "Tuffy"
                        font.pixelSize: 14
                        text: "Enter a task to generate plan..."
                        visible: !parent.text && !parent.activeFocus
                    }
                }
            }

            Rectangle {
                id: submitButton
                Layout.preferredWidth: 45
                Layout.preferredHeight: 45
                color: "#2b2d3a"
                radius: 100

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if (taskInput.text.trim()) {
                            backend.generatePlan(taskInput.text);
                            taskInput.text = "";
                        }
                    }
                    onEntered: parent.color = "#353749"
                    onExited: parent.color = "#2b2d3a"
                }

                Shape {
                    anchors.centerIn: parent;

                    ShapePath {
                        fillColor: "#00000000"
                        fillRule: ShapePath.WindingFill
                        strokeColor: "#b1b1b1"
                        strokeWidth: 1

                        PathSvg {
                            path: "M 0 3 L 8 3 M 8 3 L 5 0 M 8 3 L 5 6"
                        }
                    }
                }
            }
        }

        // Progress indicator
        ColumnLayout {
            Layout.fillWidth: true
            Layout.maximumWidth: 500
            Layout.alignment: Qt.AlignHCenter
            spacing: 8
            visible: backend.isGenerating

            Text {
                color: "#b2b2b2"
                font.pixelSize: 12
                text: "Generating plan..."
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 6
                color: "#2b2d3a"
                radius: 3

                Rectangle {
                    height: parent.height
                    width: parent.width * backend.progress / 100
                    color: "#4a9eff"
                    radius: 3
                    Behavior on width {
                        NumberAnimation {
                            duration: 200
                        }
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.minimumHeight: 50
        }
    }

    // Image {
    //     id: ellipse_1
    //     anchors.left: parent.left
    //     anchors.bottom: parent.bottom
    //     anchors.bottomMargin: 20
    //     anchors.leftMargin: 15

    //     height: 40
    //     width: 40
    //     source: Qt.resolvedUrl("../assets/ellipse_1.png")

    //     Text {
    //         id: element
    //         height: parent.height
    //         width: parent.width
    //         color: "#ffffff"
    //         font.family: "Tuffy"
    //         font.pixelSize: 16
    //         font.weight: Font.Normal
    //         horizontalAlignment: Text.AlignHCenter
    //         verticalAlignment: Text.AlignVCenter
    //         text: "?"
    //         textFormat: Text.PlainText
    //     }
    // }

    Image {
        id: ellipse_2
        width: parent.width * 0.75
        height: parent.height * 0.80
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        source: Qt.resolvedUrl("../assets/ellipse_2.png")
    }

    Image {
        id: ellipse_3
        width: parent.width * 0.75
        height: parent.height * 0.80
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        source: Qt.resolvedUrl("../assets/ellipse_3.png")
    }
}
