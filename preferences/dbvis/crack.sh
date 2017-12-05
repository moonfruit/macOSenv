#!/usr/bin/env bash
LIB=/Applications/DbVisualizer.app/Contents/java/app/lib
JAR=$LIB/dbvis.jar
BAK=$JAR.bak

if [[ ! -f $BAK ]]; then
	mv $JAR $BAK
fi

cp $BAK $JAR
jar uvf $JAR dbvis.puk
