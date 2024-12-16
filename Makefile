LAYOUTS_DIR := /usr/share/X11/xkb/symbols
install:
	cat ./katy_en > $(LAYOUTS_DIR)/custom
	cat ./katy_ru >> $(LAYOUTS_DIR)/custom
