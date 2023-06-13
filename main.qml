import QtQuick 2.15
import QtQuick.Window 2.15


Window {
    width: 640
    height: 480
    visible: true
    Rectangle{
        id:scene
        anchors.fill: parent
        state: "LeftState"
        Rectangle {
            id: leftRectangle
            x:100
            y: 200
            color: "lightgrey"
            width:100
            height:100
            border.color: "black"
            border.width: 3
            radius:5
            MouseArea {
                anchors.fill: parent
                onClicked: if(ball.x >= rightRectangle.x) {
                               scene.state = "InitialState"
                           } else {
                               ball.x += 20
                               scene.state = "OtherState"
                           }
            }
        }

        Rectangle {
            id: rightRectangle
            x:300
            y: 200
            color: "lightgrey"
            width:100
            height:100
            border.color: "black"
            border.width: 3
            radius:5
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }

        Rectangle {
            id:ball
            color: "darkgreen"
            border.color: "red"
            border.width: 5
            x:leftRectangle.x + 5
            y:leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }

        states: [
            State {
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            },
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            }
        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"
                NumberAnimation {
                    property: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
