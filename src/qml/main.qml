import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./pages"

import io.stepsketch.backend 1.0

ApplicationWindow {
    width: 1024
    height: 768
    visible: true
    title: "Task Plan Viewer"

    Backend {
        id: backend
        onTaskPlanGenerated: {
            stackView.push(timelinePage)
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homePage
    }

    Component {
        id: homePage
        Home {}
    }

    Component {
        id: timelinePage
        Timeline {}
    }
}
