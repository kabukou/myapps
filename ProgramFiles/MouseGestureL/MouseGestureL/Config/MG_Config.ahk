MG_IniFileVersion=1.30
MG_8Dir=0
MG_ActiveAsTarget=0
MG_Interval=20
MG_Threshold=30
MG_LongThresholdX=800
MG_LongThresholdY=500
MG_LongThreshold=700
MG_TimeoutThreshold=12
MG_Timeout=400
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
MG_MaxLength=9
MG_Triggers=RB_MB_X4B_X5B
MG_SubTriggers=WU_WD


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
	return (0)
}

MG_IsTarget1(){
	global
	return ((MG_Exe="iexplore.exe") || (MG_Exe="chrome.exe") || (MG_Exe="firefox.exe"))
}

MG_IsTarget2(){
	global
	return ((MG_WClass="CabinetWClass") || (MG_WClass="ExploreWClass") || (MG_WClass="Progman") || (MG_WClass="WorkerW"))
}

MG_IsTarget3(){
	global
	return (MG_IsTarget2() && ((MG_TreeListHitTest())))
}

MG_Gesture_MB_WU_:
	;左6行水平スクロール
	MG_Scroll2("H", -6, 0)
return

MG_GetAction_MB_WU_:
	MG_ActionStr := "左6行水平スクロール"
return

MG_Gesture_MB_WD_:
	;右6行水平スクロール
	MG_Scroll2("H", 6, 0)
return

MG_GetAction_MB_WD_:
	MG_ActionStr := "右6行水平スクロール"
return

MG_Gesture_X4B__:
	;アクティブ化,ペースト
	
	;アクティブ化
	IfWinNotActive
	{
		WinActivate
	}
	
	;ペースト
	Send, ^v
return

MG_GetAction_X4B__:
	MG_ActionStr := "アクティブ化,ペースト"
return

MG_Gesture_X4B_U_:
	;↑
	Send, {Up}
return

MG_GetAction_X4B_U_:
	MG_ActionStr := "↑"
return

MG_Gesture_X4B_D_:
	;↓
	Send, {Down}
return

MG_GetAction_X4B_D_:
	MG_ActionStr := "↓"
return

MG_Gesture_X4B_L_:
	;←
	Send, {Left}
return

MG_GetAction_X4B_L_:
	MG_ActionStr := "←"
return

MG_Gesture_X4B_R_:
	;→
	Send, {Right}
return

MG_GetAction_X4B_R_:
	MG_ActionStr := "→"
return

MG_Gesture_X4B_UD_:
	;最大サイズウィンドウを隣のモニターで最大化
	Send, #{Left}#{Left}#{Up}
return

MG_GetAction_X4B_UD_:
	MG_ActionStr := "最大サイズウィンドウを隣のモニターで最大化"
return

MG_Gesture_X4B_DU_:
	;Space
	Send, {Space}
return

MG_GetAction_X4B_DU_:
	MG_ActionStr := "Space"
return

MG_Gesture_X5B__:
	;アクティブ化,コピー
	
	;アクティブ化
	IfWinNotActive
	{
		WinActivate
	}
	
	;コピー
	Send, ^c
return

MG_GetAction_X5B__:
	MG_ActionStr := "アクティブ化,コピー"
return

MG_Gesture_X5B_U:
	;下にドラッグスクロール
	if (MG_While()) {
	    MG_DragScroll2(1, 0, 40, 40)
	}
return

MG_GetAction_X5B_U:
	MG_ActionStr := "下にドラッグスクロール"
return

MG_Gesture_X5B_D:
	;上にドラッグスクロール
	if (MG_While()) {
	    MG_DragScroll2(1, 0, 40, 40)
	}
return

MG_GetAction_X5B_D:
	MG_ActionStr := "上にドラッグスクロール"
return

MG_Gesture_X5B_L:
	;右にドラッグスクロール
	if (MG_While()) {
	    MG_DragScroll2(1, 0, 40, 40)
	}
return

MG_GetAction_X5B_L:
	MG_ActionStr := "右にドラッグスクロール"
return

MG_Gesture_X5B_R:
	;左にドラッグスクロール
	if (MG_While()) {
	    MG_DragScroll2(-1, 0, 40, 40)
	}
return

MG_GetAction_X5B_R:
	MG_ActionStr := "左にドラッグスクロール"
return

MG_Gesture_RB_WU_:
	;音量+
	Send,{Volume_Up 1}	;上げる量を増やしたい場合は数字を変更
return

MG_GetAction_RB_WU_:
	MG_ActionStr := "音量+"
return

MG_Gesture_RB_WD_:
	;音量-
	Send,{Volume_Down 1}	;下げる量を増やしたい場合は数字を変更
return

MG_GetAction_RB_WD_:
	MG_ActionStr := "音量-"
return

MG_Gesture_RB_:
	if(MG_IsTarget3()){
		;ジェスチャーキャンセル
		MG_Abort()
	}else{
		;アクティブ化
		IfWinNotActive
		{
			WinActivate
		}
	}
return

MG_GetAction_RB_:
	if(MG_IsTarget3()){
		MG_ActionStr := "ジェスチャーキャンセル"
	}else{
		MG_ActionStr := "アクティブ化"
	}
return

MG_Gesture_RB_R_:
	;進む
	Send, !{Right}
return

MG_GetAction_RB_R_:
	MG_ActionStr := "進む"
return

MG_Gesture_RB_U_:
	;上へ1ページスクロール
	MG_Scroll2("V", -1, 1)
return

MG_GetAction_RB_U_:
	MG_ActionStr := "上へ1ページスクロール"
return

MG_Gesture_RB_L_:
	;戻る
	Send, !{Left}
return

MG_GetAction_RB_L_:
	MG_ActionStr := "戻る"
return

MG_Gesture_RB_D_:
	;下へ1ページスクロール
	MG_Scroll2("V", 1, 1)
return

MG_GetAction_RB_D_:
	MG_ActionStr := "下へ1ページスクロール"
return

MG_Gesture_RB_UD_:
	;更新
	Send, {F5}
return

MG_GetAction_RB_UD_:
	MG_ActionStr := "更新"
return

MG_Gesture_RB_UL_:
	;前のタブ
	Send, +^{Tab}
return

MG_GetAction_RB_UL_:
	MG_ActionStr := "前のタブ"
return

MG_Gesture_RB_UR_:
	;次のタブ
	Send, ^{Tab}
return

MG_GetAction_RB_UR_:
	MG_ActionStr := "次のタブ"
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
	;タブを閉じる
	Send, ^w
return

MG_GetAction_RB_DR_:
	MG_ActionStr := "タブを閉じる"
return

MG_Gesture_RB_LU_:
	if(MG_IsTarget2()){
		;Ctrl+N(ウィンドウを複製)
		Send, ^n
	}else{
		MG_Cancel()
	}
return

MG_GetAction_RB_LU_:
	if(MG_IsTarget2()){
		MG_ActionStr := "Ctrl+N(ウィンドウを複製)"
	}else{
		MG_ActionStr := ""
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
	;アンドゥ
	Send, ^z
return

MG_GetAction_RB_LR_:
	MG_ActionStr := "アンドゥ"
return

MG_Gesture_RB_RU_:
	;上端スクロール(10000行に設定)
	MG_Scroll2("V", -10000, 0)
return

MG_GetAction_RB_RU_:
	MG_ActionStr := "上端スクロール(10000行に設定)"
return

MG_Gesture_RB_RD_:
	;下端スクロール(10000行に設定)
	MG_Scroll2("V", 10000, 0)
return

MG_GetAction_RB_RD_:
	MG_ActionStr := "下端スクロール(10000行に設定)"
return

MG_Gesture_RB_RL_:
	;リドゥ
	Send, ^y
return

MG_GetAction_RB_RL_:
	MG_ActionStr := "リドゥ"
return

MG_Gesture_RB_UDU_:
	;最大化
	WinMaximize
return

MG_GetAction_RB_UDU_:
	MG_ActionStr := "最大化"
return

MG_Gesture_RB_UDR_:
	;ウィンドウを閉じる
	Send, !{F4}
return

MG_GetAction_RB_UDR_:
	MG_ActionStr := "ウィンドウを閉じる"
return

MG_Gesture_RB_URD_:
	;全選択
	Send, ^a
return

MG_GetAction_RB_URD_:
	MG_ActionStr := "全選択"
return

MG_Gesture_RB_DUD_:
	;ウィンドウを最小化
	WinMinimize
return

MG_GetAction_RB_DUD_:
	MG_ActionStr := "ウィンドウを最小化"
return

MG_Gesture_RB_DLD_:
	;英字モード(Ctrl+ひらがな)
	Send, ^{vkF2}
return

MG_GetAction_RB_DLD_:
	MG_ActionStr := "英字モード(Ctrl+ひらがな)"
return

MG_Gesture_RB_DRD_:
	;Ctrl+Alt+S
	Send, ^!s
return

MG_GetAction_RB_DRD_:
	MG_ActionStr := "Ctrl+Alt+S"
return

MG_Gesture_RB_DRU_:
	;ペースト
	Send, ^v
return

MG_GetAction_RB_DRU_:
	MG_ActionStr := "ペースト"
return

MG_Gesture_RB_LDL_:
	;Ctrl+Alt+F(CliborFIFO)
	Send, ^!f
return

MG_GetAction_RB_LDL_:
	MG_ActionStr := "Ctrl+Alt+F(CliborFIFO)"
return

MG_Gesture_RB_LDR_:
	;コピー
	Send, ^c
return

MG_GetAction_RB_LDR_:
	MG_ActionStr := "コピー"
return

MG_Gesture_RB_LRU_:
	;タスクマネージャー起動
	Send, +^{Escape}
return

MG_GetAction_RB_LRU_:
	MG_ActionStr := "タスクマネージャー起動"
return

MG_Gesture_RB_LRL_:
	;デスクトップフォルダを開く
	Run, %A_Desktop%
return

MG_GetAction_RB_LRL_:
	MG_ActionStr := "デスクトップフォルダを開く"
return

MG_Gesture_RB_RLR_:
	;Enter
	Send, {Enter}
return

MG_GetAction_RB_RLR_:
	MG_ActionStr := "Enter"
return

MG_Gesture_RB_RDL_:
	;削除
	Send, {Delete}
return

MG_GetAction_RB_RDL_:
	MG_ActionStr := "削除"
return

MG_Gesture_RB_RDR_:
	;カット
	Send, ^x
return

MG_GetAction_RB_RDR_:
	MG_ActionStr := "カット"
return

MG_Gesture_RB_RLD_:
	;キー操作を発生させる
	Send, ^t
return

MG_GetAction_RB_RLD_:
	MG_ActionStr := "キー操作を発生させる"
return

MG_Gesture_RB_LDRDL_:
	;自動ログイン(Ctrl+Space)
	Send, ^{vkF2} ;英字入力モードにする
	Send, ^{Space}
return

MG_GetAction_RB_LDRDL_:
	MG_ActionStr := "自動ログイン(Ctrl+Space)"
return


MG_Config_end: