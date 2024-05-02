import QtQuick 2.15
import QtQml 2.15

Item {
    id: root
    property int w: 50
    property int h: 50
    property int rangevalue: 65
    property int nowrange: 0
    //画布大小
    property int mw: 300
    property int mh: 300
    property int linewidth: 3
    property bool animation_running:false

    //画圆
    property double r: mh / 2  //半径
    property double cr: r - 20 * linewidth

    //绘制曲线
    property int sx: 0
    property int sy: mh / 2
    property int axislength: mw //轴长度
    property double wavewidth: 0.1
    property double waveheight:5
    property double speed: 0.08
    property double xoffset: 1   //波浪x偏移量

    Canvas {
        id: mycanvas
        width: mw
        height: mh
        anchors.centerIn: parent
        antialiasing:true
        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, mw, mh)
            //显示外圈
            ctx.beginPath()
            ctx.strokeStyle = 'navy'
            ctx.arc(r, r, cr + 2, 0, 2 * Math.PI,)
            ctx.stroke()
            ctx.beginPath()
            ctx.arc(r, r, cr, 0, 2 * Math.PI,)
            ctx.stroke()
            ctx.clip()  //将绘画限制在内圈

            //显示曲线
            ctx.save()
            var points = []
            ctx.beginPath()
            for (var x = sx; x < sx + root.axislength; x += 20 / root.axislength) {
                var y = -Math.sin((sx + x) * root.wavewidth + root.xoffset)
                var dy = mh * (1 - root.nowrange / 100)
                points.push([x, dy + y * root.waveheight])
                ctx.lineTo(x, dy + y * root.waveheight)

            }
            ctx.lineTo(root.axislength, mh)
            ctx.lineTo(root.sx, mh)
            ctx.lineTo(points[0][0], points[0][1])
            ctx.fillStyle = 'royalblue'
            ctx.stroke()
            ctx.fill()
            ctx.restore()

            //显示百分
            if (root.nowrange <= root.rangevalue) {
                root.nowrange = root.nowrange + 1
            }

            if (root.nowrange > root.rangevalue) {
                root.nowrange = root.nowrange - 1
            }
            root.xoffset = root.xoffset + root.speed
        }
        Timer{
            id:mTimer
            running:root.animation_running
            repeat:true
            interval:50
            onTriggered:{
                parent.requestPaint()
            }

        }
    }

}
