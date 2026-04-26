PYTHON_VER ?= 3.14.4

ifeq ($(OS), Windows_NT)
    NUITKA-BIN := nuitka.cmd
else
    NUITKA-BIN := nuitka
endif

# ----- #
# build #
# ----- #

build-base-cmd = uv run --with nuitka

build-nuitka-cmd = $(NUITKA-BIN) \
	--module \
	--output-dir=build \
	test_module

.PHONY: build-lib-cp314-linux-x86_64
build-lib-cp314-linux-x86_64:
	$(build-base-cmd) --python "cpython-$(PYTHON_VER)-linux-x86_64-gnu" \
	$(build-nuitka-cmd)

.PHONY: build-lib-cp314-windows-x86_64
build-lib-cp314-windows-x86_64:
	$(build-base-cmd) --python "cpython-$(PYTHON_VER)-windows-x86_64-none" \
	$(build-nuitka-cmd)
