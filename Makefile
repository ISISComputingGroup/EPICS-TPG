# Makefile for Asyn TPG300 support
#
# Created by mjc23 on Fri Nov 15 08:41:32 2013
# Based on the Asyn streamSCPI template

TOP = .
include $(TOP)/configure/CONFIG

DIRS := configure
DIRS += $(wildcard *[Ss]up)
DIRS += $(wildcard *[Aa]pp)
DIRS += $(wildcard ioc[Bb]oot)
DIRS := $(DIRS) $(filter-out $(DIRS), iocs)

include $(TOP)/configure/RULES_TOP
