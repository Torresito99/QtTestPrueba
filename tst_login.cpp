#include <QtQuickTest>
#include <QQmlEngine>
#include <QQmlContext>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariantMap>
#include <QtQml/qqmlextensionplugin.h>

class TestDataLoader : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant testData READ testData NOTIFY testDataChanged)

public:
    TestDataLoader() {
        loadTestData();
    }

    QVariant testData() const {
        return m_testData;
    }

signals:
    void testDataChanged();

private:
    void loadTestData() {
        QFile file("/home/alex/proyectosQt/loginQMLapp/test_data.json");
        if (!file.open(QIODevice::ReadOnly)) {
            qWarning() << "Error al abrir test_data.json:" << file.errorString();
            return;
        }

        QJsonDocument doc = QJsonDocument::fromJson(file.readAll());
        m_testData = doc.object().toVariantMap();
        emit testDataChanged();
    }

    QVariant m_testData;
};

// Instancia global del cargador de datos
static TestDataLoader *g_testDataLoader = nullptr;

// Esta función se ejecutará automáticamente antes de que comience el bucle de eventos de Qt
static void registerTestDataSingleton()
{
    g_testDataLoader = new TestDataLoader();

    qmlRegisterSingletonInstance<TestDataLoader>("TestData", 1, 0, "TestData", g_testDataLoader);
}

// Registra la función para que se ejecute en el inicio de la aplicación
Q_COREAPP_STARTUP_FUNCTION(registerTestDataSingleton)

// La macro QUICK_TEST_MAIN define la función main completa
QUICK_TEST_MAIN(loginQMLapp)

#include "tst_login.moc"
