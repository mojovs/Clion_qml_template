import QtQuick 2.15

Item {
    id: root
    property int size: 45
    property int linewidth: 6
    property real value: 0
    property color primarycolor: "azure"
    property color secondarycolor: "blue"
    property int animationDuration:1000
    width: size
    height: size
    onValueChanged: {
        mycanvas.degree=value*360
    }
    Text{
        id:txt
        anchors.centerIn:parent
        font.pixelSize:20
        color:"black"
        text:parseInt(root.value*100)+"%"
    }


    Canvas {
        id: mycanvas
        property real degree: 0
        anchors.fill: parent
        antialiasing: true
        onDegreeChanged: {
            requestPaint();  //重绘
        }
        onPaint: {
            var ctx = getContext("2d");
            var x = root.width / 2;
            var y = root.height / 2;
            var radius = root.size / 2 - root.linewidth;
            var startangle = (Math.PI / 180) * 270;
            var fullangle = (Math.PI / 180) * (270 + 360);
            var cur_angle = (Math.PI / 180) * (270 + degree);
            console.log(degree)
            ctx.reset()
            ctx.lineCap = "round"
            ctx.lineWidth = root.linewidth

            ctx.beginPath()
            ctx.arc(x, y, radius, startangle, fullangle)
            ctx.strokeStyle = root.secondarycolor
            ctx.stroke()
            ctx.beginPath()
            ctx.arc(x, y, radius, startangle,cur_angle)
            ctx.strokeStyle = root.primarycolor
            ctx.stroke()
        }
        Behavior on degree{
            NumberAnimation{
                running:true
                from:0
                to:canvas.degree
                duration:root.animationDuration
            }

        }

    }
}
