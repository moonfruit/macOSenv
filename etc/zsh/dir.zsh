#!/usr/bin/env bash
hash -d ENV="$ENV"

export DESKTOP="$HOME/Desktop"
hash -d DESKTOP="$DESKTOP"

export DOCUMENTS="$HOME/Documents"
hash -d DOCUMENTS="$DOCUMENTS"

export LIBRARY="$HOME/Library"
hash -d LIBRARY="$LIBRARY"

export DOWNLOADS="$HOME/Downloads"
hash -d DOWNLOADS="$DOWNLOADS"

export WORKSPACE="$HOME/Workspace.localized"
hash -d WORKSPACE="$WORKSPACE"

export RESOURCES="$HOME/Resources.localized"
hash -d RESOURCES="$RESOURCES"

export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
hash -d ICLOUD="$ICLOUD"

export TRASH="$HOME/.Trash"
hash -d TRASH="$TRASH"

export JAVA_WORK="$WORKSPACE/java"
hash -d JAVA_WORK="$JAVA_WORK"

export TRANSCEND="/Volumes/Transcend"
hash -d TRANSCEND="$TRANSCEND"

# for gpp
APP_HOME="$WORKSPACE/gpp"
hash -d APP_HOME="$APP_HOME"
hash -d GAL_HOME="$APP_HOME/gpp/fw/gal"
hash -d GMQ_HOME="$APP_HOME/gpp/fw/gmq"
hash -d GSE_HOME="$APP_HOME/gpp/fw/gse"
hash -d GTELLER_HOME="$APP_HOME/gpp/apps/gteller"
hash -d CNAPS_HOME="$APP_HOME/gpp/apps/cnaps"
hash -d CIPS_HOME="$APP_HOME/gpp/apps/cips"
hash -d YY_HOME="$APP_HOME/gpp/apps/yy"
