#include "plasmoidplugin.h"
#include "backend.h"

#include <QtQml>
#include <QDebug>


void PlasmoidPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("org.kde.private.fortunepokus"));

    qmlRegisterType<NacitadloSouboru>(uri, 1, 0, "Soubory");
}
