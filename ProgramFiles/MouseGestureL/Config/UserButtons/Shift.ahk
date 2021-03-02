Goto,MG_Shift_End

MG_Shift_Enable:
	Hotkey,*Shift,MG_Shift_DownHotkey,On
	Hotkey,*Shift up,MG_Shift_UpHotkey,On
return

MG_Shift_Disable:
	Hotkey,*Shift,MG_Shift_DownHotkey,Off
	Hotkey,*Shift up,MG_Shift_UpHotkey,Off
return

MG_Shift_DownHotkey:
	MG_TriggerDown("Shift")
return

MG_Shift_UpHotkey:
	MG_TriggerUp("Shift")
return

MG_Shift_Down:
	SetMouseDelay,-1
	Send,{Blind}{Shift^Shift~Shift Down}
return

MG_Shift_Up:
	SetMouseDelay,-1
	Send,{Blind}{Shift^Shift~Shift Up}
return

MG_Shift_End:
