#!/bin/bash

#
# Optimize default Firefox settings for best performance of Adobe Flash
#

PREFS=/usr/lib/firefox-$(firefox --version | awk '{ print $3 }' | sed -e s/,//g)/greprefs/all.js

sed -i -e 's/pref("network.http.max-connections", 30);/pref("network.http.max-connections", 96);/g' ${PREFS}
sed -i -e 's/pref("network.http.max-connections-per-server", 15);/pref("network.http.max-connections-per-server", 32);/g' ${PREFS}
sed -i -e 's/pref("network.http.pipelining"      , false);/pref("network.http.pipelining", true);/g' ${PREFS}
sed -i -e 's/pref("network.http.pipelining.maxrequests" , 4);/pref("network.http.pipelining.maxrequests", 8);/g' ${PREFS}
sed -i -e 's/pref("network.http.proxy.pipelining", false);/pref("network.http.proxy.pipelining", true);/g' ${PREFS}

