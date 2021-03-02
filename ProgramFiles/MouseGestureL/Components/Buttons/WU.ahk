﻿Goto, MG_WU_End

MG_WU_Enable:
	if (!MG_AlwaysHook) {
		MG_WU_HookEnabled := Func("MG_IsHookEnabled_WU")
		Hotkey, If, % MG_WU_HookEnabled
	}
	Hotkey, *WheelUp, MG_WU_Hotkey, On
	Hotkey, If
	MG_WU_Enabled := 1
return

MG_WU_Disable:
	Hotkey, *WheelUp, MG_WU_Hotkey, Off
	MG_WU_Enabled := 0
return

MG_WU_Hotkey:
	MG_ButtonPress("WU")
return

MG_WU_Press:
	MG_SendButton("WU", "WheelUp")
return

MG_WU_End:
