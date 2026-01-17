import QtQuick
import QtQuick.Shapes

Rectangle {
    id: home
    height: 372
    width: 600
    clip: true
    color: "#0f111c"

    Item {
        id: main
        x: -1
        y: 124
        height: 87
        width: 601

        Text {
            id: stepSketch
            height: 75
            width: 602
            color: "#ffffff"
            font.family: "Zen Loop"
            font.pixelSize: 55
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignHCenter
            text: "StepSketch"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignTop
        }
        Item {
            id: row
            x: 202
            y: 64
            height: 23
            width: 211

            Item {
                id: input
                height: 23
                width: 181

                Rectangle {
                    id: rectangle_1
                    height: 23
                    width: 181
                    color: "#2b2d3a"
                    radius: 40
                }
                Text {
                    id: enter_a_task_to_generate_plan_
                    x: 14.12
                    y: 6
                    height: 10
                    width: 153.76
                    color: "#b2b2b2"
                    font.family: "Tuffy"
                    font.pixelSize: 7
                    font.weight: Font.Normal
                    horizontalAlignment: Text.AlignLeft
                    text: "Enter a task to generate plan..."
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }
            }
            Item {
                id: button
                x: 188
                height: 23
                width: 23

                Rectangle {
                    id: rectangle_3
                    height: 23
                    width: 23
                    color: "#2b2d3a"
                    radius: 100
                }
                Shape {
                    id: _vector
                    x: 8
                    y: 9
                    height: 6
                    width: 8

                    ShapePath {
                        id: _vector_ShapePath0

                        fillColor: "#00000000"
                        fillRule: ShapePath.WindingFill
                        strokeColor: "#b1b1b1"
                        strokeWidth: 1

                        PathSvg {
                            id: _vector_ShapePath0_PathSvg0

                            path: "M 0 3 L 8 3 M 8 3 L 5 0 M 8 3 L 5 6"
                        }
                    }
                }
            }
        }
    }
    Item {
        id: group_1
        x: 12
        y: 339
        height: 23
        width: 23

        Image {
            id: ellipse_1
            source: Qt.resolvedUrl("assets/ellipse_1.png")
        }
        Text {
            id: element
            x: 9
            y: 8
            height: 7
            width: 5
            color: "#ffffff"
            font.family: "Tuffy"
            font.pixelSize: 9
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignLeft
            text: "?"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
    }
    Image {
        id: ellipse_2
        y: 54.60
        source: Qt.resolvedUrl("assets/ellipse_2.png")
    }
    Image {
        id: ellipse_3
        y: 54.60
        source: Qt.resolvedUrl("assets/ellipse_3.png")
    }
}