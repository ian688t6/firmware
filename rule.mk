CC := gcc
AR := ar
LD := ld

FIRMWARE_LDFLAG := $(FIRMWARE_INC) $(LOC_INCLUDE) $(FIRMWARE_LIBS) $(LOC_LIBS)
LOCAL_SRC := $(shell find ${FIRMWARE_CUR} -name *.c)
LOCAL_OBJ := $(patsubst %.c,%.o,$(LOCAL_SRC))
TARGET_BIN := bin
TARGET_SO := so

.PHONY:all clean
all: $(TARGET)
$(TARGET):$(LOCAL_OBJ)
	@echo "===== $(TARGET_TYPE) $(TARGET):$(LOCAL_OBJ) ====="
ifeq ($(TARGET_TYPE),$(TARGET_BIN))
	$(CC) $^ -o $@ $(FIRMWARE_LDFLAG) -Wl,-rpath=$(FIRMWARE_TOP)/libs
endif

ifeq ($(TARGET_TYPE),$(TARGET_SO))
	$(CC) -shared $^ -o $@ $(FIRMWARE_LDFLAG)
	@cp -rf $@ $(FIRMWARE_TOP)/libs
endif

%.o:%.c
ifeq ($(TARGET_TYPE),$(TARGET_BIN))
	$(CC) -c $^ -o $@ $(FIRMWARE_CFLAG) $(FIRMWARE_LDFLAG) 
endif

ifeq ($(TARGET_TYPE),$(TARGET_SO))
	$(CC) -shared -fPIC -c $^ -o $@ $(FIRMWARE_CFLAG) $(FIRMWARE_LDFLAG)
endif
clean:
	@rm $(LOCAL_OBJ)
	@rm $(TARGET)
