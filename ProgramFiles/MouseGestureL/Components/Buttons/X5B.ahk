Goto,MG_X5B_End

MG_X5B_Enable:
	Hotkey,*ScrollLock,MG_X5B_DownHotkey,On
	Hotkey,*ScrollLock up,MG_X5B_UpHotkey,On
return

MG_X5B_Disable:
	Hotkey,*ScrollLock,MG_X5B_DownHotkey,Off
	Hotkey,*ScrollLock up,MG_X5B_UpHotkey,Off
return

MG_X5B_DownHotkey:
	MG_TriggerDown("X5B")
return

MG_X5B_UpHotkey:
	MG_TriggerUp("X5B")
return

MG_X5B_Down:
	SetMouseDelay,-1
	Send,{Blind}{ScrollLock^ScrollLock~ScrollLock Down}
return

MG_X5B_Up:
	SetMouseDelay,-1
	Send,{Blind}{ScrollLock^ScrollLock~ScrollLock Up}
return

MG_X5B_End:
