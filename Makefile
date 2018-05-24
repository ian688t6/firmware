export FIRMWARE_TOP := $(shell pwd)

export FIRMWARE_CFLAG := -Os -Wall -Werror

export FIRMWARE_INC := -I$(FIRMWARE_TOP)/include

export FIRMWARE_LIBS := -L$(FIRMWARE_TOP)/libs
firmware_subdir += basic
firmware_subdir += db
firmware_subdir += app
include $(FIRMWARE_TOP)/subdir.mk
