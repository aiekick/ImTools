# ImTools - LayoutManager

#demo

![DEMO](https://github.com/aiekick/ImTools/blob/main/gifs/LayoutManager.gif)

#dependency

LayoutManager need the use of cTools for :
- FileHelper => just for test if the file imgui.ini exist or not
- ConfigAbstract => for load/save xml settings
- cTools => for variant class and other helper

## Init : 

For add a pane you just need to do :

```cpp
LayoutManager::Instance()->Init("Layouts", "Default Layout");
LayoutManager::Instance()->AddPane(SamplePane::Instance(), "Sample", (1 << 0), PaneDisposal::LEFT, true, true);
```

## Display :

then call in you main display functions :

```cpp
if (LayoutManager::Instance()->BeginDockSpace(ImGuiDockNodeFlags_PassthruCentralNode))
{
	bool sCentralWindowHovered |= LayoutManager::Instance()->IsDockSpaceHoleHovered();

	LayoutManager::Instance()->EndDockSpace();
}

LayoutManager::Instance()->DisplayPanes(widgetId);

LayoutManager::Instance()->InitAfterFirstDisplay(ImVec2((float)vViewport.z, (float)vViewport.w)); // will apply default layout if needed
```

## Menu Bar Item:

in your menu bar you can do :

you will have a menu group called "Layouts" (defined with LayoutManager::Instance()->Init)
and you will have an item called "Default Layout" who will apply what was definded in Init Section

```cpp
LayoutManager::Instance()->DisplayMenu(m_DisplaySize);
```

## Dialogs Panes :

you can do that in you display dialog function :

```cpp
LayoutManager::Instance()->DrawDialogsAndPopups();
```

## Load/Save pane disposition :

if you are using ConfigAbstract, you can do that :

```cpp
std::string YourClass::getXml(const std::string& vOffset, const std::string& vUserDatas)
{
	UNUSED(vUserDatas);

	std::string str;

	str += LayoutManager::Instance()->getXml(vOffset, "app");
	
	return str;
}

bool YourClass::setFromXml(tinyxml2::XMLElement* vElem, tinyxml2::XMLElement* vParent, const std::string& vUserDatas)
{
	UNUSED(vUserDatas);

	// The value of this child identifies the name of this element
	std::string strName;
	std::string strValue;
	std::string strParentName;

	strName = vElem->Value();
	if (vElem->GetText())
		strValue = vElem->GetText();
	if (vParent != 0)
		strParentName = vParent->Value();

	LayoutManager::Instance()->setFromXml(vElem, vParent, "app");
	
	return true;
}
```
