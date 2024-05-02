#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>

int main(int argc, char** argv)
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // 建立信号和槽的连接

    // 显示QML文件
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));	// qrc: + <prefix> + <file>
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}