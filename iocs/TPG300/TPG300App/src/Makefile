TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = TPG300
# TPG300.dbd will be created and installed
DBD += TPG300.dbd

# TPG300.dbd will be made up from these files:
TPG300_DBD += base.dbd

# Include dbd files from all support applications:
TPG300_DBD += stream.dbd
TPG300_DBD += asyn.dbd
TPG300_DBD += drvAsynSerialPort.dbd
TPG300_DBD += drvAsynIPPort.dbd
TPG300_DBD += devIocStats.dbd

TPG300_LIBS += stream pcre
TPG300_LIBS += asyn devIocStats

# TPG300_registerRecordDeviceDriver.cpp derives from TPG300.dbd
TPG300_SRCS += TPG300_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
TPG300_SRCS_DEFAULT += TPG300Main.cpp
TPG300_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#TPG300_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
TPG300_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

