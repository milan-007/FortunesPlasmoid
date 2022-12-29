# Install script for directory: /home/milan/projects/FortunePokus/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xplasma-fortunepokusx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets" TYPE MODULE FILES "/home/milan/projects/FortunePokus/src/plasma_applet_fortunepokus.so")
  if(EXISTS "$ENV{DESTDIR}/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/applets/plasma_applet_fortunepokus.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xplasma-fortunepokusx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/plasma/plasmoids/org.kde.plasma.fortunepokus" TYPE DIRECTORY FILES "/home/milan/projects/FortunePokus/src/package/" REGEX "/\\.svn$" EXCLUDE REGEX "/[^/]*\\.qmlc$" EXCLUDE REGEX "/CMakeLists\\.txt$" EXCLUDE REGEX "/Messages\\.sh$" EXCLUDE REGEX "/dummydata$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xplasma-fortunepokusx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/plasma/plasmoids/org.kde.plasma.fortunepokus" TYPE FILE RENAME "metadata.json" FILES "/home/milan/projects/FortunePokus/src/org.kde.plasma.fortunepokus-plasmoids-metadata.json")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xplasma-fortunepokusx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo" TYPE FILE OPTIONAL FILES "/home/milan/projects/FortunePokus/src/org.kde.plasma.fortunepokus.appdata.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xplasma-fortunepokusx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kservices5" TYPE FILE RENAME "plasma-applet-org.kde.plasma.fortunepokus.desktop" FILES "/home/milan/projects/FortunePokus/src/package/metadata.desktop")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/milan/projects/FortunePokus/src/plugin/cmake_install.cmake")

endif()

