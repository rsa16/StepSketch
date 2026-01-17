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
        id: backend;
    } 

    Home {
        id: home;
        anchors.fill: parent
    }
}
