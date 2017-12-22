#!/usr/bin/env bash
LIB=/Applications/DbVisualizer.app/Contents/java/app/lib
JAR=$LIB/dbvis.jar
BAK=$JAR.bak

mv $JAR $BAK
cp $BAK $JAR
jar uvf $JAR dbvis.puk
