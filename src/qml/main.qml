import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./pages"

import io.stepsketch.backend 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: "Task Plan Viewer"

    Backend {
        id: backend;
    } 

    Home {
        id: home;
    }
}
