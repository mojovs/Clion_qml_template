//main.qml
import QtQuick 2.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Button{
        id:btn_prog
        text:'测试'
        onClicked:{
        }
    }
    WaterProgress{
        id:waterProgress
        w:300
        h:300
        animation_running:true
        anchors.centerIn:parent


    }


}