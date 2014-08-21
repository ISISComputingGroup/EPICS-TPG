#!../../bin/windows-x64/TPG300_2

## You may have to change TPG300_2 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/TPG300_2.dbd"
TPG300_2_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=faa59Host")

< $(IOCSTARTUP)/init.cmd

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../TPG300Sup"
epicsEnvSet "TTY" "$(TTY=\\\\\\\\.\\\\$(COMPORT))"
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

## Start any sequence programs
#seq sncxxx,"user=faa59Host"
