# TODO: adapt "org.kde.plasma" here & elsewhere if needed (see README)
add_definitions(-DTRANSLATION_DOMAIN=\"plasma_applet_org.kde.plasma.fortunewidget\")

set(fortunewidget_SRCS
    fortunewidget.cpp
)

add_library(plasma_applet_fortunewidget MODULE ${fortunewidget_SRCS})

kcoreaddons_desktop_to_json(plasma_applet_fortunewidget package/metadata.desktop SERVICE_TYPES plasma-applet.desktop)

target_link_libraries(plasma_applet_fortunewidget
                      Qt5::Gui
                      KF5::Plasma
                      KF5::I18n)


install(TARGETS plasma_applet_fortunewidget DESTINATION ${KDE_INSTALL_PLUGINDIR}/plasma/applets)

plasma_install_package(package org.kde.plasma.fortunewidget)
