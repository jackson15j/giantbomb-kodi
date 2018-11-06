KODI_PROFILE?=$(HOME)/.kodi
ADDON_NAME=plugin.video.giantbomb
ADDON_VERSION=6.0.1
ADDON_INSTALL_DIR=$(KODI_PROFILE)/addons/$(ADDON_NAME)

.PHONY: uninstall-dev
uninstall-dev:
	rm -rf $(ADDON_INSTALL_DIR)

.PHONY: install-dev
install-dev: uninstall-dev
	cp -R $(ADDON_NAME) $(ADDON_INSTALL_DIR)

.PHONY: package
package:
	find . -name "*.pyc" -exec rm {} \;
	rm -f $(ADDON_NAME)-$(ADDON_VERSION).zip
	zip -r $(ADDON_NAME)-$(ADDON_VERSION).zip $(ADDON_NAME)

.PHONY: test
test:
	PYTHONPATH=$(PWD)/$(ADDON_NAME):$(PYTHONPATH) \
	python -m unittest discover test
