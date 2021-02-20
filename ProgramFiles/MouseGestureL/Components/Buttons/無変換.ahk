Goto,MG_無変換_End

MG_無変換_Enable:
	Hotkey,*vk1D,MG_無変換_DownHotkey,On
	Hotkey,*vk1D up,MG_無変換_UpHotkey,On
return

MG_無変換_Disable:
	Hotkey,*vk1D,MG_無変換_DownHotkey,Off
	Hotkey,*vk1D up,MG_無変換_UpHotkey,Off
return

MG_無変換_DownHotkey:
	MG_TriggerDown("無変換")
return

MG_無変換_UpHotkey:
	MG_TriggerUp("無変換")
return

MG_無変換_Down:
	SetMouseDelay,-1
	Send,{Blind}{vk1D^vk1D~vk1D Down}
return

MG_無変換_Up:
	SetMouseDelay,-1
	Send,{Blind}{vk1D^vk1D~vk1D Up}
return

MG_無変換_End:
