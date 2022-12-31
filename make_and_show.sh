#!/usr/bin/env bash
cmake ./ && make && sudo make install && plasmoidviewer -a org.kde.plasma.fortunewidget
