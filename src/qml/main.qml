import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import io.stepsketch.backend 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: "Task Plan Viewer"

    Backend {
        id: backend;
    }

    header: Rectangle {
        id: headerRect
        width: parent.width
        height: 50
        color: "#f0f0f0"
        border.color: "#cccccc"
        border.width: 1

        RowLayout {
            anchors.fill: parent
            spacing: 10

            TextField {
                id: taskInput
                Layout.fillWidth: true
                placeholderText: "Enter a task to generate a plan (e.g., 'Teach me how to build a PC')"
                onAccepted: backend.generatePlan(taskInput.text)
            }

            Button {
                text: "Generate Plan"
                onClicked: backend.generatePlan(taskInput.text)
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: headerRect.height
        color: "#e0e0e0"

        ColumnLayout {
            anchors.fill: parent
            spacing: 5

            Text {
                text: "Task Plan Nodes"
                font.pixelSize: 20
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#ffffff"
                border.color: "#cccccc"
                border.width: 1
                clip: true

                ListView {
                    id: taskListView
                    anchors.fill: parent
                    model: backend.taskListModel
                    spacing: 5
                    clip: true

                    delegate: Rectangle {
                        width: parent.width
                        height: childrenRect.height + 20 // Add padding for content
                        color: "#f8f8f8"
                        border.color: "#dddddd"
                        border.width: 1
                        radius: 5

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 5

                            Text {
                                text: "<b>ID:</b> " + id
                                font.pixelSize: 14
                            }
                            Text {
                                text: "<b>Title:</b> " + title
                                font.pixelSize: 16
                                font.bold: true
                                wrapMode: Text.WordWrap
                            }
                            Text {
                                text: "<b>Description:</b> " + description
                                font.pixelSize: 14
                                wrapMode: Text.WordWrap
                            }
                            Text {
                                text: "<b>Type:</b> " + type
                                font.pixelSize: 14
                                color: type === "milestone" ? "blue" : (type === "decision" ? "purple" : "black")
                            }
                            Text {
                                text: "<b>Status:</b> " + status
                                font.pixelSize: 14
                                color: status === "pending" ? "orange" : (status === "blocked" ? "red" : "green")
                            }
                            Text {
                                text: "<b>Depends On:</b> " + dependsOn
                                font.pixelSize: 14
                                wrapMode: Text.WordWrap
                            }
                            Text {
                                text: "<b>Timeline:</b> " + timelineDuration
                                font.pixelSize: 14
                            }
                        }
                    }
                }
            }
        }
    }
}
