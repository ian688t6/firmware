LOCAL_CUR := $(shell pwd)

firmware_subdir_clean := ${addsuffix _clean,${firmware_subdir}}

.PHONY:all clean
.PHONY:$(firmware_subdir) $(firmware_subdir_clean)

all:$(firmware_subdir)
$(firmware_subdir):
	@echo "===== firmware_subdir: $@ ====="
	@make -C $@ all

clean:$(firmware_subdir_clean)
$(firmware_subdir_clean):
	@make -C ${patsubst %_clean,%,$@} clean
