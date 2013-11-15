#!../../bin/windows-x64/TPG300

## You may have to change TPG300 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))TPG300"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"
epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../TPG300Sup"
epicsEnvSet "TTY" "$(TTY=\\\\\\\\.\\\\COM12)"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/TPG300.dbd"
TPG300_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("L0", "$(TTY)", 0, 0, 0, 0)
asynSetOption("L0", -1, "baud", "9600")
asynSetOption("L0", -1, "bits", "8")
asynSetOption("L0", -1, "parity", "none")
asynSetOption("L0", -1, "stop", "1")

## Load record instances
dbLoadRecords("$(TOP)/../../db/devTPG300.db","P=$(IOCNAME):, PORT=L0")
dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

cd ${TOP}/iocBoot/${IOC}
iocInit