#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backendcpp.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BackendCpp backend;

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/TestinCpp_And_QML1/Main.qml"_qs);
    qmlRegisterSingletonType(QUrl("qrc:/TestinCpp_And_QML1/Global_property.qml"), "Qt.Singleton", 1, 0, "GlobalProperties");
    engine.rootContext()->setContextProperty("BackedCpp", &backend);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
