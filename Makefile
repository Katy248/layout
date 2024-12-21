# XKB_LAYOUT_DIR ?= /usr/share/X11/xkb/symbols
XKB_LAYOUT_DIR ?= ~/.config/xkb/symbols
XKB_RULES_DIR ?= ~/.config/xkb/rules

COPY ?= cp

.PHONY: install install-global

install: $(XKB_LAYOUT_DIR)/katy $(XKB_RULES_DIR)/evdev.xml

install-dev: COPY=ln
install-dev: $(XKB_LAYOUT_DIR)/katy $(XKB_RULES_DIR)/evdev.xml

$(XKB_LAYOUT_DIR)/%: %.xkb $(XKB_LAYOUT_DIR)
	$(COPY) $< $@ -f

$(XKB_RULES_DIR)/evdev.xml: evdev.xml $(XKB_RULES_DIR)
	$(COPY) $< $@ -f

$(XKB_RULES_DIR) $(XKB_LAYOUT_DIR):
	mkdir -p $@
