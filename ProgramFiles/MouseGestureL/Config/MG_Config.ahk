MG_IniFileVersion=1.30
MG_8Dir=0
MG_ActiveAsTarget=0
MG_Interval=20
MG_Threshold=30
MG_LongThresholdX=800
MG_LongThresholdY=500
MG_LongThreshold=700
MG_TimeoutThreshold=10
MG_Timeout=1000
MG_DGInterval=0
MG_ORangeDefault=3
MG_ORangeA=3
MG_ORangeB=3
MG_EdgeInterval=20
MG_EdgeIndiv=0
MG_CornerX=1
MG_CornerY=1
MG_DisableDefMB=0
MG_DisableDefX1B=0
MG_DisableDefX2B=0
MG_UseNavi=1
MG_UseExNavi=3
MG_NaviInterval=10
MG_NaviPersist=0
MG_ExNaviTransBG=1
MG_ExNaviFG=000000
MG_ExNaviBG=FFFFFF
MG_ExNaviTranspcy=255
MG_ExNaviSize=24
MG_ExNaviSpacing=2
MG_ExNaviPadding=4
MG_ExNaviMargin=8
MG_AdNaviFG=FFFFFF
MG_AdNaviNI=7F7F7F
MG_AdNaviBG=000000
MG_AdNaviTranspcy=220
MG_AdNaviSize=12
MG_AdNaviFont=Meiryo
MG_AdNaviPosition=0
MG_AdNaviPaddingL=6
MG_AdNaviPaddingR=6
MG_AdNaviPaddingT=3
MG_AdNaviPaddingB=3
MG_AdNaviRound=1
MG_AdNaviMargin=14
MG_AdNaviSpaceX=2
MG_AdNaviSpaceY=2
MG_AdNaviOnClick=0
MG_ShowTrail=0
MG_DrawTrailWnd=1
MG_TrailColor=0000FF
MG_TrailTranspcy=255
MG_TrailWidth=3
MG_TrailStartMove=3
MG_TrailInterval=10
MG_ShowLogs=0
MG_LogPosition=4
MG_LogPosX=0
MG_LogPosY=0
MG_LogMax=20
MG_LogSizeW=400
MG_LogInterval=500
MG_LogFG=FFFFFF
MG_LogBG=000000
MG_LogTranspcy=100
MG_LogFontSize=10
MG_LogFont=MS UI Gothic
MG_HotkeyEnable=
MG_HotkeyNavi=
MG_ScriptEditor=
MG_UserName=
MG_Password=
MG_TraySubmenu=0
MG_AdjustDlg=0
MG_DlgHeightLimit=800
MG_EditCommand=
MG_FoldTarget=0
MG_MaxLength=15
MG_Triggers=RB_MB
MG_SubTriggers=LB_WU_WD


Goto,MG_RB_End

MG_RB_Enable:
	Hotkey,*RButton,MG_RB_DownHotkey,On
	Hotkey,*RButton up,MG_RB_UpHotkey,On
return

MG_RB_Disable:
	Hotkey,*RButton,MG_RB_DownHotkey,Off
	Hotkey,*RButton up,MG_RB_UpHotkey,Off
return

MG_RB_DownHotkey:
	MG_TriggerDown("RB")
return

MG_RB_UpHotkey:
	MG_TriggerUp("RB")
return

MG_RB_Down:
	SetMouseDelay,-1
	Send,{Blind}{RButton Down}
return

MG_RB_Up:
	SetMouseDelay,-1
	Send,{Blind}{RButton Up}
return

MG_RB_Check:
	if (!GetKeyState("RButton", "P")) {
		MG_UnpressCntRB++
		if (MG_UnpressCntRB > 3) {
			MG_TriggerUp("RB")
			SetMouseDelay,-1
			Send,{Blind}{RButton}
		}
	} else {
		MG_UnpressCntRB := 0
	}
return

MG_RB_End:


Goto,MG_MB_End

MG_MB_Enable:
	Hotkey,*MButton,MG_MB_DownHotkey,On
	Hotkey,*MButton up,MG_MB_UpHotkey,On
return

MG_MB_Disable:
	Hotkey,*MButton,MG_MB_DownHotkey,Off
	Hotkey,*MButton up,MG_MB_UpHotkey,Off
return

MG_MB_DownHotkey:
	MG_TriggerDown("MB")
return

MG_MB_UpHotkey:
	MG_TriggerUp("MB")
return

MG_MB_Down:
	if (!MG_DisableDefMB) {
		SetMouseDelay,-1
		Send,{Blind}{MButton Down}
	}
return

MG_MB_Up:
	if (!MG_DisableDefMB) {
		SetMouseDelay,-1
		Send,{Blind}{MButton Up}
	}
return

MG_MB_Check:
	if (!GetKeyState("MButton", "P")) {
		MG_UnpressCntMB++
		if (MG_UnpressCntMB > 3) {
			MG_TriggerUp("MB")
			SetMouseDelay,-1
			Send,{Blind}{MButton}
		}
	} else {
		MG_UnpressCntMB := 0
	}
return

MG_MB_End:


Goto,MG_LB_End

MG_LB_Enable:
	Hotkey,*LButton,MG_LB_DownHotkey,On
	Hotkey,*LButton up,MG_LB_UpHotkey,On
return

MG_LB_Disable:
	Hotkey,*LButton,MG_LB_DownHotkey,Off
	Hotkey,*LButton up,MG_LB_UpHotkey,Off
return

MG_LB_DownHotkey:
	MG_TriggerDown("LB")
return

MG_LB_UpHotkey:
	MG_TriggerUp("LB")
return

MG_LB_Down:
	SetMouseDelay,-1
	Send,{Blind}{LButton Down}
return

MG_LB_Up:
	SetMouseDelay,-1
	Send,{Blind}{LButton Up}
return

MG_LB_Check:
	if (!GetKeyState("LButton", "P")) {
		MG_UnpressCntLB++
		if (MG_UnpressCntLB > 3) {
			MG_TriggerUp("LB")
			SetMouseDelay,-1
			Send,{Blind}{LButton}
		}
	} else {
		MG_UnpressCntLB := 0
	}
return

MG_LB_End:


Goto,MG_WU_End

MG_WU_Enable:
	Hotkey,*WheelUp,MG_WU_Hotkey,On
return

MG_WU_Disable:
	Hotkey,*WheelUp,MG_WU_Hotkey,Off
return

MG_WU_Hotkey:
	MG_ButtonPress("WU")
return

MG_WU_Press:
	SetMouseDelay,-1
	Send,{Blind}{WheelUp}
return

MG_WU_End:


Goto,MG_WD_End

MG_WD_Enable:
	Hotkey,*WheelDown,MG_WD_Hotkey,On
return

MG_WD_Disable:
	Hotkey,*WheelDown,MG_WD_Hotkey,Off
return

MG_WD_Hotkey:
	MG_ButtonPress("WD")
return

MG_WD_Press:
	SetMouseDelay,-1
	Send,{Blind}{WheelDown}
return

MG_WD_End:


Goto,MG_Config_End


MG_IsDisable(){
	global
	return ((MG_WClass="Chrome_WidgetWin_2") || (MG_WClass="GHOST_WindowClass") || (MG_WClass="Afx:0000000140000000:8:0000000000010003:0000000000000000:000000000017114F"))
}

MG_IsTarget1(){
	global
	return ((MG_WClass="CabinetWClass") || (MG_WClass="ExploreWClass") || (MG_WClass="Progman") || (MG_WClass="WorkerW"))
}

MG_IsTarget2(){
	global
	return (MG_IsTarget1() && ((MG_WClass="WorkerW")))
}

MG_IsTarget3(){
	global
	return (MG_IsTarget1() && ((MG_TreeListHitTest())))
}

MG_IsTarget4(){
	global
	return ((MG_Exe="iexplore.exe") || (MG_Exe="chrome.exe") || (MG_Exe="firefox.exe"))
}

MG_IsTarget5(){
	global
	return ((MG_WClass="Framework::CFrame"))
}


MG_Gesture_MB_WU_:
	;左スクロール
	MG_Scroll2("H", -8, 0)
return

MG_GetAction_MB_WU_:
	MG_ActionStr := "左スクロール"
return

MG_Gesture_MB_WD_:
	;右スクロール
	MG_Scroll2("H", 8, 0)
return

MG_GetAction_MB_WD_:
	MG_ActionStr := "右スクロール"
return

MG_Gesture_RB_U_:
	;上スクロール
	MG_Scroll2("V", -8, 1)
return

MG_GetAction_RB_U_:
	MG_ActionStr := "上スクロール"
return

MG_Gesture_RB_D_:
	;下スクロール
	MG_Scroll2("V", 8, 1)
return

MG_GetAction_RB_D_:
	MG_ActionStr := "下スクロール"
return

MG_Gesture_RB_L_:
	;戻る
	Send, !{Left}
return

MG_GetAction_RB_L_:
	MG_ActionStr := "戻る"
return

MG_Gesture_RB_R_:
	;進む
	Send, !{Right}
return

MG_GetAction_RB_R_:
	MG_ActionStr := "進む"
return

MG_Gesture_RB_UD_:
	;更新
	Send, {F5}
return

MG_GetAction_RB_UD_:
	MG_ActionStr := "更新"
return

MG_Gesture_RB_UR_:
	if(MG_IsTarget5()){
		;下のページ
		Send,^{PgDn}
	}else{
		;次のタブ
		Send, ^{Tab}
	}
return

MG_GetAction_RB_UR_:
	if(MG_IsTarget5()){
		MG_ActionStr := "下のページ"
	}else{
		MG_ActionStr := "次のタブ"
	}
return

MG_Gesture_RB_UL_:
	if(MG_IsTarget5()){
		;上のページ
		Send,^{PgUp}
	}else{
		;前のタブ
		Send, +^{Tab}
	}
return

MG_GetAction_RB_UL_:
	if(MG_IsTarget5()){
		MG_ActionStr := "上のページ"
	}else{
		MG_ActionStr := "前のタブ"
	}
return

MG_Gesture_RB_DU_:
	;リネーム(F2)
	Send, {F2}
return

MG_GetAction_RB_DU_:
	MG_ActionStr := "リネーム(F2)"
return

MG_Gesture_RB_DL_:
	;タブを復元
	Send, +^t
return

MG_GetAction_RB_DL_:
	MG_ActionStr := "タブを復元"
return

MG_Gesture_RB_DR_:
	if(MG_IsTarget4()){
		;タブを閉じる
		Send, ^w
	}else if(MG_IsTarget1()){
		;タブを閉じる
		Send, ^w
	}else{
		;Alt+F4
		Send, !{F4}
	}
return

MG_GetAction_RB_DR_:
	if(MG_IsTarget4()){
		MG_ActionStr := "タブを閉じる"
	}else if(MG_IsTarget1()){
		MG_ActionStr := "タブを閉じる"
	}else{
		MG_ActionStr := "Alt+F4"
	}
return

MG_Gesture_RB_LU_:
	if(MG_IsTarget4()){
		;Ctrl+L
		Send, ^l
	}else{
		;Ctrl+N(ウィンドウを複製)
		Send, ^n
	}
return

MG_GetAction_RB_LU_:
	if(MG_IsTarget4()){
		MG_ActionStr := "Ctrl+L"
	}else{
		MG_ActionStr := "Ctrl+N(ウィンドウを複製)"
	}
return

MG_Gesture_RB_LD_:
	;新規フォルダ作成
	Send, ^+N
return

MG_GetAction_RB_LD_:
	MG_ActionStr := "新規フォルダ作成"
return

MG_Gesture_RB_LR_:
	;コピー
	Send, ^c
return

MG_GetAction_RB_LR_:
	MG_ActionStr := "コピー"
return

MG_Gesture_RB_RU_:
	;上端スクロール
	Send,^{Home}
return

MG_GetAction_RB_RU_:
	MG_ActionStr := "上端スクロール"
return

MG_Gesture_RB_RD_:
	;下端スクロール
	Send,^{End}
return

MG_GetAction_RB_RD_:
	MG_ActionStr := "下端スクロール"
return

MG_Gesture_RB_RL_:
	;ペースト
	Send, ^v
return

MG_GetAction_RB_RL_:
	MG_ActionStr := "ペースト"
return

MG_Gesture_RB_UDU_:
	;最大化
	WinMaximize
return

MG_GetAction_RB_UDU_:
	MG_ActionStr := "最大化"
return

MG_Gesture_RB_UDR_:
	;Alt+F4
	Send, !{F4}
return

MG_GetAction_RB_UDR_:
	MG_ActionStr := "Alt+F4"
return

MG_Gesture_RB_URD_:
	;全選択
	Send, ^a
return

MG_GetAction_RB_URD_:
	MG_ActionStr := "全選択"
return

MG_Gesture_RB_DUD_:
	;最小化
	WinMinimize
return

MG_GetAction_RB_DUD_:
	MG_ActionStr := "最小化"
return

MG_Gesture_RB_DLD_:
	;Ctrl+Alt+Tab
	Send, ^!{Tab}
return

MG_GetAction_RB_DLD_:
	MG_ActionStr := "Ctrl+Alt+Tab"
return

MG_Gesture_RB_DRU_:
	;Enter
	Send, {Enter}
return

MG_GetAction_RB_DRU_:
	MG_ActionStr := "Enter"
return

MG_Gesture_RB_LDL_:
	;Space
	Send,{Space}
return

MG_GetAction_RB_LDL_:
	MG_ActionStr := "Space"
return

MG_Gesture_RB_LDR_:
	;BackSpace
	Send, {Backspace}
return

MG_GetAction_RB_LDR_:
	MG_ActionStr := "BackSpace"
return

MG_Gesture_RB_LRL_:
	;アンドゥ
	Send, ^z
return

MG_GetAction_RB_LRL_:
	MG_ActionStr := "アンドゥ"
return

MG_Gesture_RB_RDL_:
	;Delete
	Send, {Delete}
return

MG_GetAction_RB_RDL_:
	MG_ActionStr := "Delete"
return

MG_Gesture_RB_RDR_:
	;カット
	Send, ^x
return

MG_GetAction_RB_RDR_:
	MG_ActionStr := "カット"
return

MG_Gesture_RB_RLD_:
	;新しいタブ
	Send, ^t
return

MG_GetAction_RB_RLD_:
	MG_ActionStr := "新しいタブ"
return

MG_Gesture_RB_RLR_:
	;リドゥ
	Send, ^y
return

MG_GetAction_RB_RLR_:
	MG_ActionStr := "リドゥ"
return


MG_Gesture_RB_LB_WU_:
	;Shift+←
	Send, +{Left}
return

MG_GetAction_RB_LB_WU_:
	MG_ActionStr := "Shift+←"
return

MG_Gesture_RB_LB_WD_:
	;Shift+→
	Send, +{Right}
return

MG_GetAction_RB_LB_WD_:
	MG_ActionStr := "Shift+→"
return

MG_Gesture_RB_MB_WU_:
	;↑(Shift押下時はShift+↑)
	if(GetKeyState("shift", "P")){ 
	Send, +{Up} 
	} 
	else{ 
	Send, {Up} 
	}
return

MG_GetAction_RB_MB_WU_:
	MG_ActionStr := "↑(Shift押下時はShift+↑)"
return

MG_Gesture_RB_MB_WD_:
	;↓(Shift押下時はShift+↓)
	if(GetKeyState("shift", "P")){ 
	Send, +{Down} 
	} 
	else{ 
	Send, {Down} 
	}
return

MG_GetAction_RB_MB_WD_:
	MG_ActionStr := "↓(Shift押下時はShift+↓)"
return

MG_Gesture_RB_WU_:
	;←(Shift押下時はShift+←)
	if(GetKeyState("shift", "P")){ 
	Send, +{left} 
	} 
	else{ 
	Send, {left} 
	}
return

MG_GetAction_RB_WU_:
	MG_ActionStr := "←(Shift押下時はShift+←)"
return

MG_Gesture_RB_WD_:
	;→(Shift押下時はShift+→)
	if(GetKeyState("shift", "P")){ 
	Send, +{Right} 
	} 
	else{ 
	Send, {Right} 
	}
return

MG_GetAction_RB_WD_:
	MG_ActionStr := "→(Shift押下時はShift+→)"
return


MG_Gesture_MB_LURD:
	;音量+
	Send,{Volume_Up 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_LURD:
	MG_ActionStr := "音量+"
return

MG_Gesture_MB_LDRU:
	;音量-
	Send,{Volume_Down 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_LDRU:
	MG_ActionStr := "音量-"
return

MG_Gesture_MB_ULDR:
	;音量-
	Send,{Volume_Down 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_ULDR:
	MG_ActionStr := "音量-"
return

MG_Gesture_MB_URDL:
	;音量+
	Send,{Volume_Up 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_URDL:
	MG_ActionStr := "音量+"
return

MG_Gesture_MB_RULD:
	;音量-
	Send,{Volume_Down 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_RULD:
	MG_ActionStr := "音量-"
return

MG_Gesture_MB_RDLU:
	;音量+
	Send,{Volume_Up 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_RDLU:
	MG_ActionStr := "音量+"
return

MG_Gesture_MB_DLUR:
	;音量+
	Send,{Volume_Up 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_DLUR:
	MG_ActionStr := "音量+"
return

MG_Gesture_MB_DRUL:
	;音量-
	Send,{Volume_Down 8}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_MB_DRUL:
	MG_ActionStr := "音量-"
return


MG_Gesture_RB_LRU_:
	;タスクマネージャー起動
	Send, +^{Escape}
return

MG_GetAction_RB_LRU_:
	MG_ActionStr := "タスクマネージャー起動"
return

MG_Gesture_RB_DRD_:
	;Ctrl+Alt+S
	Send, ^!s
return

MG_GetAction_RB_DRD_:
	MG_ActionStr := "Ctrl+Alt+S"
return

MG_Gesture_RB_LDLD_:
	;Ctrl+Alt+F(CliborFIFO)
	Send, ^!f
return

MG_GetAction_RB_LDLD_:
	MG_ActionStr := "Ctrl+Alt+F(CliborFIFO)"
return

MG_Gesture_RB_LDRDL_:
	;Ctrl+S
	Send,^s
return

MG_GetAction_RB_LDRDL_:
	MG_ActionStr := "Ctrl+S"
return

MG_Gesture_MB_UD_:
	;ウィンドウを隣のモニターへ
	Send, #+{Left}
return

MG_GetAction_MB_UD_:
	MG_ActionStr := "ウィンドウを隣のモニターへ"
return

MG_Gesture_MB_R_:
	;Win+1
	Send, #1
return

MG_GetAction_MB_R_:
	MG_ActionStr := "Win+1"
return

MG_Gesture_MB_RD_:
	;Win+2
	Send, #2
return

MG_GetAction_MB_RD_:
	MG_ActionStr := "Win+2"
return

MG_Gesture_MB_RDR_:
	;Win+3
	Send, #3
return

MG_GetAction_MB_RDR_:
	MG_ActionStr := "Win+3"
return

MG_Gesture_MB_RDRD_:
	;Win+4
	Send, #4
return

MG_GetAction_MB_RDRD_:
	MG_ActionStr := "Win+4"
return

MG_Gesture_RB_RDLD_:
	;セカンドモニターOn/Off
	Send,#p
	Sleep 1000
	Send,{Down}{Down}{Enter}
return

MG_GetAction_RB_RDLD_:
	MG_ActionStr := "セカンドモニターOn/Off"
return

MG_Gesture_RB_RDLDR_:
	;自動ログイン(Ctrl+Alt+Space)
	Send, {vkF2}{vkF3} ;英字入力モードにする
	Send, ^!{Space}
return

MG_GetAction_RB_RDLDR_:
	MG_ActionStr := "自動ログイン(Ctrl+Alt+Space)"
return


MG_Gesture_RB_:
	;アクティブ化
	IfWinNotActive
	{
		WinActivate
	}
return

MG_GetAction_RB_:
	MG_ActionStr := "アクティブ化"
return

MG_Gesture_RB_MB_:
	;ナビの表示を停止するためだけのジェスチャー(←→のときは表示されないため統一)
	MG_StopNavi()
return

MG_GetAction_RB_MB_:
	MG_ActionStr := "ナビの表示を停止するためだけのジェスチャー(←→のときは表示されないため統一)"
return



MG_Gesture_RB_LB_RLDRL_:
	;あ
	Send, {vkF2}
	Send, a
return

MG_GetAction_RB_LB_RLDRL_:
	MG_ActionStr := "あ"
return

MG_Gesture_RB_LB_DR_:
	;い
	Send, {vkF2}
	Send, i
return

MG_GetAction_RB_LB_DR_:
	MG_ActionStr := "い"
return

MG_Gesture_RB_LB_DUR_:
	;う
	Send, {vkF2}
	Send, u
return

MG_GetAction_RB_LB_DUR_:
	MG_ActionStr := "う"
return

MG_Gesture_RB_LB_RDRLR_:
	;え
	Send, {vkF2}
	Send, e
return

MG_GetAction_RB_LB_RDRLR_:
	MG_ActionStr := "え"
return

MG_Gesture_RB_LB_DRDUD_:
	;お
	Send, {vkF2}
	Send, o
return

MG_GetAction_RB_LB_DRDUD_:
	MG_ActionStr := "お"
return

MG_Gesture_RB_LB_DRDU_:
	;か
	Send, {vkF2}
	Send, ka
return

MG_GetAction_RB_LB_DRDU_:
	MG_ActionStr := "か"
return

MG_Gesture_RB_LB_RDRDU_:
	;き
	Send, {vkF2}
	Send, ki
return

MG_GetAction_RB_LB_RDRDU_:
	MG_ActionStr := "き"
return

MG_Gesture_RB_LB_DUDR_:
	;く
	Send, {vkF2}
	Send, ku
return

MG_GetAction_RB_LB_DUDR_:
	MG_ActionStr := "く"
return

MG_Gesture_RB_LB_RDRL_:
	;け
	Send, {vkF2}
	Send, ke
return

MG_GetAction_RB_LB_RDRL_:
	MG_ActionStr := "け"
return

MG_Gesture_RB_LB_RLRL_:
	;こ
	Send, {vkF2}
	Send, ko
return

MG_GetAction_RB_LB_RLRL_:
	MG_ActionStr := "こ"
return

MG_Gesture_RB_LB_RDRDR_:
	;さ
	Send, {vkF2}
	Send, sa
return

MG_GetAction_RB_LB_RDRDR_:
	MG_ActionStr := "さ"
return

MG_Gesture_RB_LB_RLDRD_:
	;し
	Send, {vkF2}
	Send, si
return

MG_GetAction_RB_LB_RLDRD_:
	MG_ActionStr := "し"
return

MG_Gesture_RB_LB_RLRDR_:
	;す
	Send, {vkF2}
	Send, su
return

MG_GetAction_RB_LB_RLRDR_:
	MG_ActionStr := "す"
return

MG_Gesture_RB_LB_DRLRDL_:
	;せ
	Send, {vkF2}
	Send, se
return

MG_GetAction_RB_LB_DRLRDL_:
	MG_ActionStr := "せ"
return

MG_Gesture_RB_LB_RLRD_:
	;そ
	Send, {vkF2}
	Send, so
return

MG_GetAction_RB_LB_RLRD_:
	MG_ActionStr := "そ"
return

MG_Gesture_RB_LB_RD_:
	;た
	Send, {vkF2}
	Send, ta
return

MG_GetAction_RB_LB_RD_:
	MG_ActionStr := "た"
return

MG_Gesture_RB_LB_DURD_:
	;ち
	Send, {vkF2}
	Send, ti
return

MG_GetAction_RB_LB_DURD_:
	MG_ActionStr := "ち"
return

MG_Gesture_RB_LB_DRLD_:
	;つ
	Send, {vkF2}
	Send, tu
return

MG_GetAction_RB_LB_DRLD_:
	MG_ActionStr := "つ"
return

MG_Gesture_RB_LB_DRDRL_:
	;て
	Send, {vkF2}
	Send, te
return

MG_GetAction_RB_LB_DRDRL_:
	MG_ActionStr := "て"
return

MG_Gesture_RB_LB_DURDU_:
	;と
	Send, {vkF2}
	Send, to
return

MG_GetAction_RB_LB_DURDU_:
	MG_ActionStr := "と"
return

MG_Gesture_RB_LB_DRD_:
	;な
	Send, {vkF2}
	Send, na
return

MG_GetAction_RB_LB_DRD_:
	MG_ActionStr := "な"
return

MG_Gesture_RB_LB_RDRD_:
	;に
	Send, {vkF2}
	Send, ni
return

MG_GetAction_RB_LB_RDRD_:
	MG_ActionStr := "に"
return

MG_Gesture_RB_LB_DUDU_:
	;ぬ
	Send, {vkF2}
	Send, nu
return

MG_GetAction_RB_LB_DUDU_:
	MG_ActionStr := "ぬ"
return

MG_Gesture_RB_LB_RLDR_:
	;ね
	Send, {vkF2}
	Send, ne
return

MG_GetAction_RB_LB_RLDR_:
	MG_ActionStr := "ね"
return

MG_Gesture_RB_LB_DURL_:
	;の
	Send, {vkF2}
	Send, no
return

MG_GetAction_RB_LB_DURL_:
	MG_ActionStr := "の"
return

MG_Gesture_RB_LB_RDUD_:
	;は
	Send, {vkF2}
	Send, ha
return

MG_GetAction_RB_LB_RDUD_:
	MG_ActionStr := "は"
return

MG_Gesture_RB_LB_RLDUR_:
	;ひ
	Send, {vkF2}
	Send, hi
return

MG_GetAction_RB_LB_RLDUR_:
	MG_ActionStr := "ひ"
return

MG_Gesture_RB_LB_RLDU_:
	;ふ
	Send, {vkF2}
	Send, hu
return

MG_GetAction_RB_LB_RLDU_:
	MG_ActionStr := "ふ"
return

MG_Gesture_RB_LB_D_:
	;へ
	Send, {vkF2}
	Send, he
return

MG_GetAction_RB_LB_D_:
	MG_ActionStr := "へ"
return

MG_Gesture_RB_LB_RDU_:
	;ほ
	Send, {vkF2}
	Send, ho
return

MG_GetAction_RB_LB_RDU_:
	MG_ActionStr := "ほ"
return

MG_Gesture_RB_LB_RDUR_:
	;ま
	Send, {vkF2}
	Send, ma
return

MG_GetAction_RB_LB_RDUR_:
	MG_ActionStr := "ま"
return

MG_Gesture_RB_LB_DURDR_:
	;み
	Send, {vkF2}
	Send, mi
return

MG_GetAction_RB_LB_DURDR_:
	MG_ActionStr := "み"
return

MG_Gesture_RB_LB_R_:
	;む
	Send, {vkF2}
	Send, mu
return

MG_GetAction_RB_LB_R_:
	MG_ActionStr := "む"
return

MG_Gesture_RB_LB_RDUDR_:
	;め
	Send, {vkF2}
	Send, me
return

MG_GetAction_RB_LB_RDUDR_:
	MG_ActionStr := "め"
return

MG_Gesture_RB_LB_RDURD_:
	;も
	Send, {vkF2}
	Send, mo
return

MG_GetAction_RB_LB_RDURD_:
	MG_ActionStr := "も"
return

MG_Gesture_RB_LB_DRL_:
	;や
	Send, {vkF2}
	Send, ya
return

MG_GetAction_RB_LB_DRL_:
	MG_ActionStr := "や"
return

MG_Gesture_RB_LB_RDURL_:
	;ゆ
	Send, {vkF2}
	Send, yu
return

MG_GetAction_RB_LB_RDURL_:
	MG_ActionStr := "ゆ"
return

MG_Gesture_RB_LB_RL_:
	;よ
	Send, {vkF2}
	Send, yo
return

MG_GetAction_RB_LB_RL_:
	MG_ActionStr := "よ"
return

MG_Gesture_RB_LB_DUD_:
	;ら
	Send, {vkF2}
	Send, ra
return

MG_GetAction_RB_LB_DUD_:
	MG_ActionStr := "ら"
return

MG_Gesture_RB_LB_RLD_:
	;り
	Send, {vkF2}
	Send, ri
return

MG_GetAction_RB_LB_RLD_:
	MG_ActionStr := "り"
return

MG_Gesture_RB_LB_RDRLD_:
	;る
	Send, {vkF2}
	Send, ru
return

MG_GetAction_RB_LB_RDRLD_:
	MG_ActionStr := "る"
return

MG_Gesture_RB_LB_RLR_:
	;れ
	Send, {vkF2}
	Send, re
return

MG_GetAction_RB_LB_RLR_:
	MG_ActionStr := "れ"
return

MG_Gesture_RB_LB_DRDR_:
	;ろ
	Send, {vkF2}
	Send, ro
return

MG_GetAction_RB_LB_DRDR_:
	MG_ActionStr := "ろ"
return

MG_Gesture_RB_LB_RDR_:
	;わ
	Send, {vkF2}
	Send, wa
return

MG_GetAction_RB_LB_RDR_:
	MG_ActionStr := "わ"
return

MG_Gesture_RB_LB_DRLR_:
	;を
	Send, {vkF2}
	Send, wo
return

MG_GetAction_RB_LB_DRLR_:
	MG_ActionStr := "を"
return

MG_Gesture_RB_LB_DRDRD_:
	;ん
	Send, {vkF2}
	Send, nn
return

MG_GetAction_RB_LB_DRDRD_:
	MG_ActionStr := "ん"
return


MG_Gesture_RB_LB_RUDRDU_:
	;が
	Send, {vkF2}
	Send, ga
return

MG_GetAction_RB_LB_RUDRDU_:
	MG_ActionStr := "が"
return

MG_Gesture_RB_LB_RURDRDU_:
	;ぎ
	Send, {vkF2}
	Send, gi
return

MG_GetAction_RB_LB_RURDRDU_:
	MG_ActionStr := "ぎ"
return

MG_Gesture_RB_LB_RUDUDR_:
	;ぐ
	Send, {vkF2}
	Send, gu
return

MG_GetAction_RB_LB_RUDUDR_:
	MG_ActionStr := "ぐ"
return

MG_Gesture_RB_LB_RURDRL_:
	;げ
	Send, {vkF2}
	Send, ge
return

MG_GetAction_RB_LB_RURDRL_:
	MG_ActionStr := "げ"
return

MG_Gesture_RB_LB_RURLRL_:
	;ご
	Send, {vkF2}
	Send, go
return

MG_GetAction_RB_LB_RURLRL_:
	MG_ActionStr := "ご"
return

MG_Gesture_RB_LB_RURDRDR_:
	;ざ
	Send, {vkF2}
	Send, za
return

MG_GetAction_RB_LB_RURDRDR_:
	MG_ActionStr := "ざ"
return

MG_Gesture_RB_LB_RURLDRD_:
	;じ
	Send, {vkF2}
	Send, zi
return

MG_GetAction_RB_LB_RURLDRD_:
	MG_ActionStr := "じ"
return

MG_Gesture_RB_LB_RURLRDR_:
	;ず
	Send, {vkF2}
	Send, zu
return

MG_GetAction_RB_LB_RURLRDR_:
	MG_ActionStr := "ず"
return

MG_Gesture_RB_LB_RUDRLRDL_:
	;ぜ
	Send, {vkF2}
	Send, ze
return

MG_GetAction_RB_LB_RUDRLRDL_:
	MG_ActionStr := "ぜ"
return

MG_Gesture_RB_LB_RURLRD_:
	;ぞ
	Send, {vkF2}
	Send, zo
return

MG_GetAction_RB_LB_RURLRD_:
	MG_ActionStr := "ぞ"
return

MG_Gesture_RB_LB_RURD_:
	;だ
	Send, {vkF2}
	Send, da
return

MG_GetAction_RB_LB_RURD_:
	MG_ActionStr := "だ"
return

MG_Gesture_RB_LB_RUDURD_:
	;ぢ
	Send, {vkF2}
	Send, di
return

MG_GetAction_RB_LB_RUDURD_:
	MG_ActionStr := "ぢ"
return

MG_Gesture_RB_LB_RUDRLD_:
	;づ
	Send, {vkF2}
	Send, du
return

MG_GetAction_RB_LB_RUDRLD_:
	MG_ActionStr := "づ"
return

MG_Gesture_RB_LB_RUDRDRL_:
	;で
	Send, {vkF2}
	Send, de
return

MG_GetAction_RB_LB_RUDRDRL_:
	MG_ActionStr := "で"
return

MG_Gesture_RB_LB_RUDURDU_:
	;ど
	Send, {vkF2}
	Send, do
return

MG_GetAction_RB_LB_RUDURDU_:
	MG_ActionStr := "ど"
return

MG_Gesture_RB_LB_RURDUD_:
	;ば
	Send, {vkF2}
	Send, ba
return

MG_GetAction_RB_LB_RURDUD_:
	MG_ActionStr := "ば"
return

MG_Gesture_RB_LB_RURLDUR_:
	;び
	Send, {vkF2}
	Send, bi
return

MG_GetAction_RB_LB_RURLDUR_:
	MG_ActionStr := "び"
return

MG_Gesture_RB_LB_RURLDU_:
	;ぶ
	Send, {vkF2}
	Send, bu
return

MG_GetAction_RB_LB_RURLDU_:
	MG_ActionStr := "ぶ"
return

MG_Gesture_RB_LB_RUD_:
	;べ
	Send, {vkF2}
	Send, be
return

MG_GetAction_RB_LB_RUD_:
	MG_ActionStr := "べ"
return

MG_Gesture_RB_LB_RURDU_:
	;ぼ
	Send, {vkF2}
	Send, bo
return

MG_GetAction_RB_LB_RURDU_:
	MG_ActionStr := "ぼ"
return


MG_Gesture_RB_LB_LDUR_:
	;0
	Send, 0
return

MG_GetAction_RB_LB_LDUR_:
	MG_ActionStr := "0"
return

MG_Gesture_RB_LB_LDRU_:
	;1
	Send, 1
return

MG_GetAction_RB_LB_LDRU_:
	MG_ActionStr := "1"
return

MG_Gesture_RB_LB_DLUR_:
	;2
	Send, 2
return

MG_GetAction_RB_LB_DLUR_:
	MG_ActionStr := "2"
return

MG_Gesture_RB_LB_DRUL_:
	;3
	Send, 3
return

MG_GetAction_RB_LB_DRUL_:
	MG_ActionStr := "3"
return

MG_Gesture_RB_LB_LURD_:
	;4
	Send, 4
return

MG_GetAction_RB_LB_LURD_:
	MG_ActionStr := "4"
return

MG_Gesture_RB_LB_RDUL_:
	;5
	Send, 5
return

MG_GetAction_RB_LB_RDUL_:
	MG_ActionStr := "5"
return

MG_Gesture_RB_LB_RDLU_:
	;5
	Send, 6
return

MG_GetAction_RB_LB_RDLU_:
	MG_ActionStr := "5"
return

MG_Gesture_RB_LB_ULDR_:
	;7
	Send, 7
return

MG_GetAction_RB_LB_ULDR_:
	MG_ActionStr := "7"
return

MG_Gesture_RB_LB_URDL_:
	;8
	Send, 8
return

MG_GetAction_RB_LB_URDL_:
	MG_ActionStr := "8"
return

MG_Gesture_RB_LB_RULD_:
	;9
	Send, 9
return

MG_GetAction_RB_LB_RULD_:
	MG_ActionStr := "9"
return


MG_Gesture_RB_LB_DLRDUD_:
	;ぱ
	Send, {vkF2}
	Send, pa
return

MG_GetAction_RB_LB_DLRDUD_:
	MG_ActionStr := "ぱ"
return

MG_Gesture_RB_LB_DLRLDUR_:
	;ぴ
	Send, {vkF2}
	Send, pi
return

MG_GetAction_RB_LB_DLRLDUR_:
	MG_ActionStr := "ぴ"
return

MG_Gesture_RB_LB_DLRLDU_:
	;ぷ
	Send, {vkF2}
	Send, pu
return

MG_GetAction_RB_LB_DLRLDU_:
	MG_ActionStr := "ぷ"
return

MG_Gesture_RB_LB_DLD_:
	;ぺ
	Send, {vkF2}
	Send, pe
return

MG_GetAction_RB_LB_DLD_:
	MG_ActionStr := "ぺ"
return

MG_Gesture_RB_LB_DLRDU_:
	;ぽ
	Send, {vkF2}
	Send, po
return

MG_GetAction_RB_LB_DLRDU_:
	MG_ActionStr := "ぽ"
return


MG_Gesture_RB_LB_DLRLDRL_:
	;ぁ
	Send, {vkF2}
	Send, la
return

MG_GetAction_RB_LB_DLRLDRL_:
	MG_ActionStr := "ぁ"
return

MG_Gesture_RB_LB_DLDR_:
	;ぃ
	Send, {vkF2}
	Send, li
return

MG_GetAction_RB_LB_DLDR_:
	MG_ActionStr := "ぃ"
return

MG_Gesture_RB_LB_DLDUR_:
	;ぅ
	Send, {vkF2}
	Send, lu
return

MG_GetAction_RB_LB_DLDUR_:
	MG_ActionStr := "ぅ"
return

MG_Gesture_RB_LB_DLRDRLR_:
	;ぇ
	Send, {vkF2}
	Send, le
return

MG_GetAction_RB_LB_DLRDRLR_:
	MG_ActionStr := "ぇ"
return

MG_Gesture_RB_LB_DLDRDUD_:
	;ぉ
	Send, {vkF2}
	Send, lo
return

MG_GetAction_RB_LB_DLDRDUD_:
	MG_ActionStr := "ぉ"
return

MG_Gesture_RB_LB_DLDRLD_:
	;っ
	Send, {vkF2}
	Send, ltu
return

MG_GetAction_RB_LB_DLDRLD_:
	MG_ActionStr := "っ"
return

MG_Gesture_RB_LB_DLDRL_:
	;ゃ
	Send, {vkF2}
	Send, lya
return

MG_GetAction_RB_LB_DLDRL_:
	MG_ActionStr := "ゃ"
return

MG_Gesture_RB_LB_DLRDURL_:
	;ゅ
	Send, {vkF2}
	Send, lyu
return

MG_GetAction_RB_LB_DLRDURL_:
	MG_ActionStr := "ゅ"
return

MG_Gesture_RB_LB_DLRL_:
	;ょ
	Send, {vkF2}
	Send, lyo
return

MG_GetAction_RB_LB_DLRL_:
	MG_ActionStr := "ょ"
return


MG_Config_end: