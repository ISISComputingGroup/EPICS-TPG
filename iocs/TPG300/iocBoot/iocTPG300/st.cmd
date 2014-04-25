#!../../bin/windows-x64/TPG300

## You may have to change TPG300 to something else
## everywhere it appears in this file

< envPaths

# Set iocTPG300_COMPORT=COM12 in config file

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/TPG300.dbd"
TPG300_registerRecordDeviceDriver pdbbase

< $(IOCSTARTUP)/init.cmd

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../TPG300Sup"
epicsEnvSet "TTY" "$(TTY=\\\\\\\\.\\\\$(iocTPG300_COMPORT))"
drvAsynSerialPortConfigure("L0", "$(TTY)", 0, 0, 0, 0)
asynSetOption("L0", -1, "baud", "9600")
asynSetOption("L0", -1, "bits", "8")
asynSetOption("L0", -1, "parity", "none")
asynSetOption("L0", -1, "stop", "1")

## Load record instances

< $(IOCSTARTUP)/dbload.cmd

dbLoadRecords("$(TOP)/../../db/devTPG300.db","P=$(MYPVPREFIX)$(IOCNAME):, PORT=L0")

< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit
