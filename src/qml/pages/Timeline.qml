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
            Layout.preferredWidth: timeline.width * 0.07;
            spacing: 20

            Text {
                id: how_To_Build_a_PC
                text: backend.taskPlanTitle
                color: "#ffffff"
                font.pixelSize: 60
                font.family: "Poppins"
                font.weight: Font.Medium
            }

            // RowLayout {
            //     spacing: 10
            //     Layout.fillWidth: true

            //     Rectangle {
            //         id: rectangle_5
            //         height: 4
            //         color: "#3d3e4b"
            //         radius: 2
            //         Layout.fillWidth: true
            //         Layout.alignment: Qt.AlignVCenter

            //         Rectangle {
            //             id: rectangle_6
            //             height: 4
            //             width: parent.width * backend.taskPlanProgress / 100
            //             color: "#e1e1e1"
            //             radius: 2
            //             Behavior on width { NumberAnimation { duration: 200 } }
            //         }
            //     }

            //     Text {
            //         id: element
            //         text: backend.taskPlanProgress.toFixed(1) + "%"
            //         color: "#ffffff"
            //         font.pixelSize: 12
            //         font.family: "Poppins"
            //         font.weight: Font.Medium
            //     }
            // }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Repeater {
                    id: stepsRepeater
                    model: backend.taskListModel

                    delegate: Rectangle {
                        id: delegateRoot
                        property int rowIndex: Math.floor(index / 2)
                        property int colIndex: index % 2
                        property bool isOddRow: rowIndex % 2 !== 0
                        property bool isActive: model.status === "IN_PROGRESS" || model.status === "COMPLETED"

                        width: (parent.width - 80) / 2
                        height: 65
                        x: isOddRow ? (1 - colIndex) * (width + 80) : colIndex * (width + 80)
                        y: rowIndex * (height + 40)
                        color: isActive ? "#3d3d3d" : "#292a30"
                        border.color: isActive ? "#c1c1c1" : "transparent"
                        border.width: 2
                        radius: 10

                        Row {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 15
                            spacing: 15

                            Text {
                                text: (index + 1) + "."
                                color: "#afafaf"
                                font.pixelSize: 16
                                font.family: "Poppins"
                            }
                            Text {
                                text: model.title.replace(" ", "\n")
                                color: isActive ? "#ffffff" : "#afafaf"
                                font.pixelSize: 14
                                font.family: "Poppins"
                            }
                        }
                    }
                }

                // Connectors
                Repeater {
                    model: stepsRepeater.count -1
                    delegate: Shape {
                        z: -1
                        property var startItem: stepsRepeater.itemAt(index)
                        property var endItem: stepsRepeater.itemAt(index + 1)
                        property bool isSameRow: Math.floor(index / 2) === Math.floor((index + 1) / 2)
                        visible: startItem && endItem

                        ShapePath {
                            strokeColor: "#555"
                            strokeWidth: 2
                            startX: isSameRow ? startItem.x + startItem.width : startItem.x + startItem.width / 2
                            startY: isSameRow ? startItem.y + startItem.height / 2 : startItem.y + startItem.height

                            PathLine {
                                x: isSameRow ? endItem.x : endItem.x + endItem.width / 2
                                y: isSameRow ? endItem.y + endItem.height / 2 : endItem.y
                            }
                        }
                    }
                }
            }
            Item {
               Layout.fillHeight: true
            }
        }


        // // Right Column
        // ColumnLayout {
        //     Layout.fillHeight: true
        //     Layout.rightMargin: 40
        //     spacing: 20

        //     Rectangle {
        //         id: rectangle_4
        //         color: "#444653"
        //         radius: 10
        //         Layout.fillWidth: true
        //         Layout.preferredHeight: 150

        //         ColumnLayout {
        //             anchors.fill: parent
        //             anchors.margins: 15

        //             RowLayout {
        //                 spacing: 5
        //                 Item {
        //                     id: mdi_clock_outline
        //                     width: 14
        //                     height: 14
        //                     clip: true
        //                     Shape {
        //                         anchors.fill: parent
        //                         ShapePath {
        //                             fillColor: "#b6b6b6"
        //                             PathSvg {
        //                                 path: "M 7,1 C 3.1,1 0,4.1 0,8 C 0,11.9 3.1,15 7,15 C 10.9,15 14,11.9 14,8 C 14,4.1 10.9,1 7,1 Z M 7,13 C 4.2,13 2,10.8 2,8 C 2,5.2 4.2,3 7,3 C 9.8,3 12,5.2 12,8 C 12,10.8 9.8,13 7,13 Z M 7.5,4 L 6.5,4 L 6.5,8.5 L 10.5,10.5 L 11,9.5 L 7.5,7.5 L 7.5,4 Z"
        //                             }
        //                         }
        //                     }
        //                 }
        //                 Text {
        //                     id: days
        //                     text: backend.currentTask ? backend.currentTask.timelineDuration : ""
        //                     color: "#b6b6b6"
        //                     font.pixelSize: 14
        //                     font.family: "Poppins"
        //                     font.weight: Font.DemiBold
        //                 }
        //             }

        //             Text {
        //                 id: acquire_all_necessary_PC_components_and_tools
        //                 text: backend.currentTask ? backend.currentTask.title : ""
        //                 color: "#ffffff"
        //                 font.pixelSize: 20
        //                 font.family: "Poppins"
        //                 font.weight: Font.Light
        //                 wrapMode: Text.WordWrap
        //                 Layout.fillWidth: true
        //             }
        //         }
        //     }

        //     Rectangle {
        //         id: rectangle_7
        //         color: "#444653"
        //         radius: 10
        //         Layout.fillWidth: true
        //         Layout.fillHeight: true

        //         Text {
        //             id: lorem_Ipsum_is_simply_dummy_text_of_the_printing
        //             text: backend.currentTask ? backend.currentTask.description : ""
        //             color: "#d3d3d3"
        //             font.pixelSize: 12
        //             font.family: "Poppins"
        //             anchors.fill: parent
        //             anchors.margins: 15
        //             wrapMode: Text.WordWrap
        //         }
        //     }

        //     RowLayout {
        //         Layout.fillWidth: true
        //         spacing: 10

        //         Rectangle {
        //             id: rectangle_8
        //             color: mouseAreaBack.containsMouse ? "#5a5c6d" : "#444653"
        //             radius: 10
        //             Layout.fillWidth: true
        //             height: 40

        //             Text {
        //                 id: back
        //                 text: "< Back"
        //                 color: "#ffffff"
        //                 font.pixelSize: 14
        //                 font.family: "Poppins"
        //                 anchors.centerIn: parent
        //             }

        //             MouseArea {
        //                 id: mouseAreaBack
        //                 anchors.fill: parent
        //                 hoverEnabled: true
        //                 cursorShape: Qt.PointingHandCursor
        //             }
        //         }

        //         Rectangle {
        //             id: rectangle_9
        //             color: mouseAreaNext.containsMouse ? "#5a5c6d" : "#444653"
        //             radius: 10
        //             Layout.fillWidth: true
        //             height: 40

        //             Text {
        //                 id: next
        //                 text: "Next >"
        //                 color: "#ffffff"
        //                 font.pixelSize: 14
        //                 font.family: "Poppins"
        //                 anchors.centerIn: parent
        //             }

        //             MouseArea {
        //                 id: mouseAreaNext
        //                 anchors.fill: parent
        //                 hoverEnabled: true
        //                 cursorShape: Qt.PointingHandCursor
        //             }
        //         }
        //     }
        // }
    }
}
