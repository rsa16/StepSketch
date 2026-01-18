import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Item {
    id: timeline

    Shape {
        id: background
        anchors.fill: parent

        ShapePath {
            strokeColor: "#000"
            strokeWidth: 0
            fillGradient: LinearGradient {
                x1: parent.width * -0.099
                x2: parent.width * 1.0
                y1: parent.height * 0.57
                y2: parent.height * 1.0
                GradientStop {
                    color: "#ff0f111c"
                    position: 0
                }
                GradientStop {
                    color: "#ff202432"
                    position: 1
                }
            }
            PathRectangle {
                x: 0
                y: 0
                width: timeline.width
                height: timeline.height
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Left Column
        ColumnLayout {
            Layout.fillHeight: true
            Layout.preferredWidth: timeline.width * 0.5;
            spacing: 20

            Text {
                id: how_To_Build_a_PC
                text: "How To Build a PC"
                color: "#ffffff"
                font.pixelSize: 60
                font.family: "Poppins"
                font.weight: Font.Medium
            }

            RowLayout {
                spacing: 10
                Layout.fillWidth: true

                Rectangle {
                    id: rectangle_5
                    height: 4
                    color: "#3d3e4b"
                    radius: 2
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter

                    Rectangle {
                        id: rectangle_6
                        height: 4
                        width: parent.width * 0.125
                        color: "#e1e1e1"
                        radius: 2
                    }
                }

                Text {
                    id: element
                    text: "12.5%"
                    color: "#ffffff"
                    font.pixelSize: 12
                    font.family: "Poppins"
                    font.weight: Font.Medium
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Repeater {
                    id: stepsRepeater
                    model: [
                        { "number": "1.", "title": "Gather\nComponents", "active": true },
                        { "number": "2.", "title": "Prepare the\nPC Case" },
                        { "number": "3.", "title": "Install CPU on\nMotherboard" },
                        { "number": "4.", "title": "Prepare the\nPC Case" },
                        { "number": "5.", "title": "Install CPU on\nMotherboard" },
                        { "number": "6.", "title": "Install CPU on\nMotherboard" },
                        { "number": "7.", "title": "Install CPU on\nMotherboard" },
                        { "number": "8.", "title": "Install CPU on\nMotherboard" }
                    ]

                    delegate: Rectangle {
                        id: delegateRoot
                        property int rowIndex: Math.floor(index / 2)
                        property int colIndex: index % 2
                        property bool isOddRow: rowIndex % 2 !== 0

                        width: (parent.width - 80) / 2
                        height: 65
                        x: isOddRow ? (parent.width - width) - (colIndex * (width + 80)) : colIndex * (width + 80)
                        y: rowIndex * (height + 40)
                        color: modelData.active ? "#3d3d3d" : "#292a30"
                        border.color: modelData.active ? "#c1c1c1" : "transparent"
                        border.width: 2
                        radius: 10

                        Row {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 15
                            spacing: 15

                            Text {
                                text: modelData.number
                                color: "#afafaf"
                                font.pixelSize: 16
                                font.family: "Poppins"
                            }
                            Text {
                                text: modelData.title
                                color: modelData.active ? "#ffffff" : "#afafaf"
                                font.pixelSize: 14
                                font.family: "Poppins"
                            }
                        }
                    }
                }

                // Connectors
                Shape {
                    anchors.fill: parent
                    ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(0).x + stepsRepeater.itemAt(0).width; y: stepsRepeater.itemAt(0).y + stepsRepeater.itemAt(0).height / 2 }
                        PathLine { x: stepsRepeater.itemAt(1).x; y: stepsRepeater.itemAt(1).y + stepsRepeater.itemAt(1).height / 2 }
                    }
                    ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(1).x + stepsRepeater.itemAt(1).width / 2; y: stepsRepeater.itemAt(1).y + stepsRepeater.itemAt(1).height }
                        PathLine { x: stepsRepeater.itemAt(1).x + stepsRepeater.itemAt(1).width / 2; y: stepsRepeater.itemAt(3).y }
                    }
                    ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(3).x; y: stepsRepeater.itemAt(3).y + stepsRepeater.itemAt(3).height / 2 }
                        PathLine { x: stepsRepeater.itemAt(2).x + stepsRepeater.itemAt(2).width; y: stepsRepeater.itemAt(2).y + stepsRepeater.itemAt(2).height / 2 }
                    }
                     ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(2).x + stepsRepeater.itemAt(2).width / 2; y: stepsRepeater.itemAt(2).y + stepsRepeater.itemAt(2).height }
                        PathLine { x: stepsRepeater.itemAt(2).x + stepsRepeater.itemAt(2).width / 2; y: stepsRepeater.itemAt(4).y }
                    }
                    ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(4).x + stepsRepeater.itemAt(4).width; y: stepsRepeater.itemAt(4).y + stepsRepeater.itemAt(4).height / 2 }
                        PathLine { x: stepsRepeater.itemAt(5).x; y: stepsRepeater.itemAt(5).y + stepsRepeater.itemAt(5).height / 2 }
                    }
                    ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(5).x + stepsRepeater.itemAt(5).width / 2; y: stepsRepeater.itemAt(5).y + stepsRepeater.itemAt(5).height }
                        PathLine { x: stepsRepeater.itemAt(5).x + stepsRepeater.itemAt(5).width / 2; y: stepsRepeater.itemAt(7).y }
                    }
                    ShapePath {
                        strokeColor: "#555"
                        strokeWidth: 2
                        PathLine { x: stepsRepeater.itemAt(7).x; y: stepsRepeater.itemAt(7).y + stepsRepeater.itemAt(7).height / 2 }
                        PathLine { x: stepsRepeater.itemAt(6).x + stepsRepeater.itemAt(6).width; y: stepsRepeater.itemAt(6).y + stepsRepeater.itemAt(6).height / 2 }
                    }
                }
            }
             Item {
                Layout.fillHeight: true
             }
        }


        // Right Column
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rightMargin: 40
            spacing: 20

            Rectangle {
                id: rectangle_4
                color: "#444653"
                radius: 10
                Layout.fillWidth: true
                Layout.preferredHeight: 150

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15

                    RowLayout {
                        spacing: 5
                        Item {
                            id: mdi_clock_outline
                            width: 14
                            height: 14
                            clip: true
                            Shape {
                                anchors.fill: parent
                                ShapePath {
                                    fillColor: "#b6b6b6"
                                    PathSvg {
                                        path: "M 7,1 C 3.1,1 0,4.1 0,8 C 0,11.9 3.1,15 7,15 C 10.9,15 14,11.9 14,8 C 14,4.1 10.9,1 7,1 Z M 7,13 C 4.2,13 2,10.8 2,8 C 2,5.2 4.2,3 7,3 C 9.8,3 12,5.2 12,8 C 12,10.8 9.8,13 7,13 Z M 7.5,4 L 6.5,4 L 6.5,8.5 L 10.5,10.5 L 11,9.5 L 7.5,7.5 L 7.5,4 Z"
                                    }
                                }
                            }
                        }
                        Text {
                            id: days
                            text: "1-3 days"
                            color: "#b6b6b6"
                            font.pixelSize: 14
                            font.family: "Poppins"
                            font.weight: Font.DemiBold
                        }
                    }

                    Text {
                        id: acquire_all_necessary_PC_components_and_tools
                        text: "Acquire all necessary PC components and tools"
                        color: "#ffffff"
                        font.pixelSize: 20
                        font.family: "Poppins"
                        font.weight: Font.Light
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }
            }

            Rectangle {
                id: rectangle_7
                color: "#444653"
                radius: 10
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: lorem_Ipsum_is_simply_dummy_text_of_the_printing
                    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500"
                    color: "#d3d3d3"
                    font.pixelSize: 12
                    font.family: "Poppins"
                    anchors.fill: parent
                    anchors.margins: 15
                    wrapMode: Text.WordWrap
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                Rectangle {
                    id: rectangle_8
                    color: mouseAreaBack.containsMouse ? "#5a5c6d" : "#444653"
                    radius: 10
                    Layout.fillWidth: true
                    height: 40

                    Text {
                        id: back
                        text: "< Back"
                        color: "#ffffff"
                        font.pixelSize: 14
                        font.family: "Poppins"
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        id: mouseAreaBack
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Rectangle {
                    id: rectangle_9
                    color: mouseAreaNext.containsMouse ? "#5a5c6d" : "#444653"
                    radius: 10
                    Layout.fillWidth: true
                    height: 40

                    Text {
                        id: next
                        text: "Next >"
                        color: "#ffffff"
                        font.pixelSize: 14
                        font.family: "Poppins"
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        id: mouseAreaNext
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
    }
}
