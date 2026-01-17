import QtQuick.Shapes
import QtQuick

Shape {
    id: timeline
    height: 372
    width: 608
    clip: true

    ShapePath {
        id: frame_2ShapePath
        strokeColor: "#000"
        strokeWidth: 0
        fillGradient: LinearGradient {
            id: frame_2ShapePathLinearGradient
            x1: frame_2.width * -0.09950656927012363
            x2: frame_2.width * 0.9999999825920804
            y1: frame_2.height * 0.5739246959839713
            y2: frame_2.height * 0.9999999932541698
        
            GradientStop {
                id: frame_2ShapePathLinearGradientGradientStop0
                color: "#ff0f111c"
                position: 0
            }

            GradientStop {
                id: frame_2ShapePathLinearGradientGradientStop1
                color: "#ff202432"
                position: 1
            }
        }

        PathRectangle {
            id: frame_2PathRectangle
            x: 0
            y: 0
            height: 372
            width: 608
        }
    }
    Rectangle {
        id: rectangle_4
        x: 374
        y: 50
        height: 130
        width: 189
        color: "#444653"
        radius: 10
    }
    Rectangle {
        id: rectangle_7
        x: 374
        y: 189
        height: 93
        width: 189
        color: "#444653"
        radius: 10
    }
    Rectangle {
        id: rectangle_8
        x: 374
        y: 292
        height: 30
        width: 89
        color: "#444653"
        radius: 10
    }
    Rectangle {
        id: rectangle_9
        x: 474
        y: 292
        height: 30
        width: 89
        color: "#444653"
        radius: 10
    }
    Text {
        id: how_To_Build_a_PC
        x: 32
        y: 23
        height: 45
        width: 270
        color: "#ffffff"
        font.family: "Poppins"
        font.pixelSize: 30
        font.weight: Font.Medium
        horizontalAlignment: Text.AlignLeft
        text: "How To Build a PC"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
    }
    Rectangle {
        id: rectangle_5
        x: 34
        y: 74
        height: 4
        width: 202
        color: "#3d3e4b"
        radius: 30
    }
    Rectangle {
        id: rectangle_6
        x: 34
        y: 74
        height: 4
        width: 20
        color: "#e1e1e1"
        radius: 30
    }
    Text {
        id: element
        x: 241
        y: 73
        height: 6
        width: 45
        color: "#ffffff"
        font.family: "Poppins"
        font.pixelSize: 10
        font.weight: Font.Medium
        horizontalAlignment: Text.AlignLeft
        text: "10%"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        id: element_1
        x: 36
        y: 108
        height: 45
        width: 115
        border.color: "#c1c1c1"
        border.width: 2
        color: "#3d3d3d"

        Text {
            id: element_2
            x: 10
            y: 18
            height: 9
            width: 9
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "1."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: gather_Components
            x: 28
            y: 8.50
            height: 28
            width: 78
            color: "#ffffff"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "Gather Components"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }
    Rectangle {
        id: element_3
        x: 186
        y: 108
        height: 45
        width: 117
        color: "#292a30"

        Text {
            id: element_4
            x: 10
            y: 18
            height: 9
            width: 11
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "2."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: prepare_the_PC_Case
            x: 30
            y: 8.50
            height: 28
            width: 78
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "Prepare the PC Case"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }
    Rectangle {
        id: element_5
        x: 36
        y: 170
        height: 45
        width: 117
        color: "#292a30"

        Text {
            id: element_6
            x: 10
            y: 18
            height: 9
            width: 11
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "4."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: prepare_the_PC_Case_1
            x: 30
            y: 8.50
            height: 28
            width: 78
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "Prepare the PC Case"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }
    Rectangle {
        id: element_7
        x: 184
        y: 170
        height: 45
        width: 117
        color: "#292a30"

        Text {
            id: element_8
            x: 10
            y: 18
            height: 9
            width: 11
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "3."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: install_CPU_on_Motherboard
            x: 30
            y: 8.50
            height: 28
            width: 78
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "Install CPU on Motherboard"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }
    Rectangle {
        id: element_9
        x: 184
        y: 230
        height: 45
        width: 117
        color: "#292a30"

        Text {
            id: element_10
            x: 10
            y: 18
            height: 9
            width: 11
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "6."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: install_CPU_on_Motherboard_1
            x: 30
            y: 8.50
            height: 28
            width: 78
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "Install CPU on Motherboard"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }
    Rectangle {
        id: element_11
        x: 34
        y: 231
        height: 45
        width: 117
        color: "#292a30"

        Text {
            id: element_12
            x: 10
            y: 18
            height: 9
            width: 11
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "5."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: install_CPU_on_Motherboard_2
            x: 30
            y: 8.50
            height: 28
            width: 78
            color: "#afafaf"
            font.family: "Poppins"
            font.pixelSize: 11
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignLeft
            lineHeight: 14.30
            lineHeightMode: Text.FixedHeight
            text: "Install CPU on Motherboard"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }
    Image {
        id: line_1
        x: 153
        y: 131
        source: Qt.resolvedUrl("assets/line_1.png")
    }
    Image {
        id: line_3
        x: 153
        y: 191
        source: Qt.resolvedUrl("assets/line_3.png")
    }
    Image {
        id: line_5
        x: 151
        y: 253
        source: Qt.resolvedUrl("assets/line_5.png")
    }
    Image {
        id: line_2
        x: 234.50
        y: 161.50

        rotation: 90
        source: Qt.resolvedUrl("assets/line_2.png")
    }
    Image {
        id: line_4
        x: 87.50
        y: 221.50
        rotation: 90
        source: Qt.resolvedUrl("assets/line_4.png")
    }
    Text {
        id: acquire_all_necessary_PC_components_and_tools
        x: 387
        y: 83
        height: 106
        width: 159
        color: "#ffffff"
        font.family: "Poppins"
        font.pixelSize: 16
        font.weight: Font.Light
        horizontalAlignment: Text.AlignLeft
        lineHeight: 20.80
        lineHeightMode: Text.FixedHeight
        text: "Acquire all necessary PC components and tools"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: lorem_Ipsum_is_simply_dummy_text_of_the_printing
        x: 382
        y: 199
        height: 106
        width: 175
        color: "#d3d3d3"
        font.family: "Poppins"
        font.pixelSize: 8
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignLeft
        lineHeight: 10.40
        lineHeightMode: Text.FixedHeight
        text: "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
    }
    Text {
        id: back
        x: 395
        y: 298
        height: 17
        width: 48
        color: "#ffffff"
        font.family: "Poppins"
        font.pixelSize: 12
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 15.60
        lineHeightMode: Text.FixedHeight
        text: "Back"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
    }
    Text {
        id: next
        x: 495
        y: 298
        height: 17
        width: 48
        color: "#ffffff"
        font.family: "Poppins"
        font.pixelSize: 12
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 15.60
        lineHeightMode: Text.FixedHeight
        text: "Next"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
    }
    Text {
        id: days
        x: 401
        y: 64
        height: 9
        width: 32
        color: "#b6b6b6"
        font.family: "Poppins"
        font.pixelSize: 7
        font.weight: Font.DemiBold
        horizontalAlignment: Text.AlignLeft
        lineHeight: 9.10
        lineHeightMode: Text.FixedHeight
        text: "1-3 days"
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignTop
        wrapMode: Text.WordWrap
    }
    Item {
        id: mdi_clock_outline
        x: 389
        y: 64
        height: 10
        width: 10
        clip: true

        Shape {
            id: _vector
            x: 0.83
            y: 0.83
            height: 8.33
            width: 8.33

            ShapePath {
                id: _vector_ShapePath0
                fillColor: "#b6b6b6"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 0.67

                PathSvg {
                    id: _vector_ShapePath0_PathSvg0

                    path: "M 4.1666669845581055 7.50000057220459 C 5.050722050562922 7.500000572204589 5.898568633208709 7.1488112201578025 6.5236899266832555 6.5236899266832555 C 7.1488112201578025 5.898568633208709 7.500000572204589 5.050722050562922 7.50000057220459 4.1666669845581055 C 7.500000572204589 3.2826119185532887 7.1488112201578025 2.434765534589667 6.5236899266832555 1.8096442411151201 C 5.898568633208709 1.1845229476405734 5.050722050562922 0.8333333969116214 4.1666669845581055 0.8333333969116211 C 3.2826119185532887 0.8333333969116219 2.434765534589667 1.1845229476405734 1.8096442411151201 1.8096442411151201 C 1.1845229476405734 2.434765534589667 0.8333333969116222 3.2826119185532887 0.8333333969116211 4.1666669845581055 C 0.8333333969116222 5.050722050562922 1.1845229476405734 5.898568633208709 1.8096442411151201 6.5236899266832555 C 2.434765534589667 7.1488112201578025 3.2826119185532887 7.500000572204589 4.1666669845581055 7.50000057220459 Z M 4.1666669845581055 0 C 4.713841489973663 1.8503718488807522e-16 5.255658232802671 0.10777404733205459 5.761181555647363 0.31716865734115346 C 6.266704878492056 0.5265632673502523 6.72603467261734 0.8334777146687942 7.1129454635323786 1.2203885055838328 C 7.499856254447417 1.6072992964988715 7.806771099130287 2.0666290906241556 8.016165709139386 2.572152413468848 C 8.225560319148485 3.0776757363135405 8.33333396911621 3.619492479142548 8.333333969116211 4.1666669845581055 C 8.33333396911621 5.2717357922288555 7.894347117628468 6.3315438094362895 7.1129454635323786 7.1129454635323786 C 6.3315438094362895 7.894347117628468 5.2717357922288555 8.333333969116211 4.1666669845581055 8.333333969116211 C 1.8625000546773207 8.333333969116211 0 6.458333826065063 0 4.1666669845581055 C 1.8503718488807522e-16 3.0615981768873555 0.4389868514877435 2.0017901596799224 1.2203885055838328 1.2203885055838328 C 2.0017901596799224 0.4389868514877435 3.0615981768873555 7.401487395523009e-16 4.1666669845581055 0 Z M 4.375000333786011 2.0833334922790527 L 4.375000333786011 4.270833659172058 L 6.250000476837158 5.383333775838219 L 5.937500452995301 5.895833624203988 L 3.750000286102295 4.583333683013916 L 3.750000286102295 2.0833334922790527 L 4.375000333786011 2.0833334922790527 Z"
                }
            }
        }
    }
    Item {
        id: ic_baseline_chevron_right
        x: 534
        y: 299
        height: 16
        width: 16
        clip: true

        Shape {
            id: _vector_1
            x: 5.73
            y: 4
            height: 8
            width: 4.94

            ShapePath {
                id: _vector_1_ShapePath0
                fillColor: "#ffffff"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 0.67

                PathSvg {
                    id: _vector_1_ShapePath0_PathSvg0

                    path: "M 0.939999928519469 0 L 0 0.9399998982747395 L 3.0533333807124574 4 L 0 7.06000010172526 L 0.939999928519469 8 L 4.940000057220459 4 L 0.939999928519469 0 Z"
                }
            }
        }
    }
    Item {
        id: material_symbols_chevron_left
        x: 387
        y: 299
        height: 16
        width: 16
        clip: true

        Shape {
            id: _vector_2
            x: 5.33
            y: 4
            height: 8
            width: 4.93

            ShapePath {
                id: _vector_2_ShapePath0

                fillColor: "#ffffff"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 0.67

                PathSvg {
                    id: _vector_2_ShapePath0_PathSvg0

                    path: "M 4.000000257749829 8 L 0 4 L 4.000000257749829 0 L 4.933333396911621 0.9333333969116211 L 1.8666669141065038 4 L 4.933333396911621 7.066666920979817 L 4.000000257749829 8 Z"
                }
            }
        }
    }
}