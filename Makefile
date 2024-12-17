XKB_LAYOUT_DIR ?= ~/.config/xkb/symbols
XKB_RULES_DIR ?= ~/.config/xkb/rules
# /usr/share/X11/xkb/symbols

.PHONY: install

install: $(XKB_LAYOUT_DIR)/katy_en $(XKB_LAYOUT_DIR)/katy_ru $(XKB_RULES_DIR)/evdev.xml

$(XKB_LAYOUT_DIR)/%: % $(XKB_LAYOUT_DIR)
	ln $< $@ -f

$(XKB_RULES_DIR)/evdev.xml: evdev.xml $(XKB_RULES_DIR)
	ln $< $@ -f

$(XKB_RULES_DIR) $(XKB_LAYOUT_DIR):
	mkdir -p $@	
