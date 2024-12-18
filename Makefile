XKB_LAYOUT_DIR ?= /usr/share/X11/xkb/symbols
XKB_RULES_DIR ?= ~/.config/xkb/rules

.PHONY: install install-global

install: $(XKB_LAYOUT_DIR)/katy.xkb $(XKB_RULES_DIR)/evdev.xml

$(XKB_LAYOUT_DIR)/%: % $(XKB_LAYOUT_DIR)
	ln $< $@ -f

$(XKB_RULES_DIR)/evdev.xml: evdev.xml $(XKB_RULES_DIR)
	ln $< $@ -f

$(XKB_RULES_DIR):
	mkdir -p $@
