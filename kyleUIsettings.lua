function kyleUIsettingsFrame_OnLoad(self)
  -- Set the name for the Category for the Panel
	self.name = "kyleUI" -- .. GetAddOnMetadata("kyleUI", "Version")

    -- Add the panel to the Interface Options
    InterfaceOptions_AddCategory(self)    
end