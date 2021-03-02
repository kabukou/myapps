Goto,MG_X4B_End

MG_X4B_Enable:
	Hotkey,*Insert,MG_X4B_DownHotkey,On
	Hotkey,*Insert up,MG_X4B_UpHotkey,On
return

MG_X4B_Disable:
	Hotkey,*Insert,MG_X4B_DownHotkey,Off
	Hotkey,*Insert up,MG_X4B_UpHotkey,Off
return

MG_X4B_DownHotkey:
	MG_TriggerDown("X4B")
return

MG_X4B_UpHotkey:
	MG_TriggerUp("X4B")
return

MG_X4B_Down:
	SetMouseDelay,-1
	Send,{Blind}{Insert^Insert~Insert Down}
return

MG_X4B_Up:
	SetMouseDelay,-1
	Send,{Blind}{Insert^Insert~Insert Up}
return

MG_X4B_End:
