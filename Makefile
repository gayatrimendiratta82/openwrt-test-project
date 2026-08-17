include $(TOPDIR)/rules.mk

PKG_NAME:=testproject
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/testproject
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Realtek OpenWrt Test Project
endef

define Package/testproject/description
  Simple Realtek OpenWrt test package for Jenkins.
endef

define Package/testproject/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/testproject.sh $(1)/usr/bin/testproject
endef

$(eval $(call BuildPackage,testproject))
