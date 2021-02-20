;===============================================================================
;
;		MouseGestureL.ahk用 タスクバー拡張プラグイン TaskbarExtension.ahk v1.0
;
;		・スタートボタン上のホイール回転ですべて最小化/すべて元に戻す
;		・タスクバーボタン上のホイール回転で最小化/元に戻す
;		・タスクバーボタンを中央クリックで閉じる
;		・通知領域上のホイール回転でボリューム変更
;		・通知領域上の中央クリックでミュートON/OFF
;
;		＊ボリューム変更は
;		  「TaskVol.ahk」http://ux.getuploader.com/autohotkeyl/download/29/TaskVol12.zip
;		  から拝借
;		＊タスクボタン上の操作はウィンドウタイトルでの判定で、
;		  同タイトルのウィンドウを区別できないため、
;		  複数ある場合は動作しないようにしています
;
;===============================================================================

;-------------------------------------------------------------------------------
; 各機能のオン・オフ（false：OFF、true：ON） 
;-------------------------------------------------------------------------------
TE_StartButton	:= true			;スタートボタン上の操作
TE_TaskButton	:= true			;タスクボタン上の操作
TE_TaskTray		:= true			;タスクトレイ上の操作


;-------------------------------------------------------------------------------
; ボリューム変更の各種設定値 (お好みで変更してください)
;-------------------------------------------------------------------------------
TE_VolumeStep	:= 1			; １回のボリュームの変化量
TE_SoundPlay	:= false		; 変更時にサウンドを鳴らす
TE_VolColor		:= 0x00ff00		; ボリューム表示色 (0xRRGGBB)
TE_MuteColor	:= 0xff0000		; ミュート時のボリューム表示色 (0xRRGGBB)
TE_VolTrans		:= 200			; ボリューム表示の不透明度 (透明:0～不透明:255)
TE_BarBaseColor	:= 0x00ff00		; ボリュームバーの背景色 (0xRRGGBB)
TE_MuteBaseColor:= 0xff0000		; ミュート時のボリュームバー背景色 (0xRRGGBB)
TE_BarBaseTrans	:= 80			; ボリュームバー背景の不透明度 (透明:0～不透明:255)
TE_BarSizeW		:= 250			; ボリュームバーの横幅
TE_BarSizeH		:= 30			; ボリュームバーの高さ
TE_BarMarginX	:= 10			; スクリーン右端からボリュームバー右端までの距離
TE_BarMarginY	:= 50			; スクリーン下端からボリュームバー下端までの距離
TE_VolFont		:= "メイリオ"	; ボリューム表示のフォント名
TE_VolFontSize	:= 24			; ボリューム表示のフォントサイズ
TE_VolDispTime	:= 2000			; ボリューム表示時間 (ミリ秒)
;-------------------------------------------------------------------------------



#WinActivateForce
TE_CreateWindow()

Goto, TaskbarExtension_End

;-------------------------------------------------------------------------------
; ホットキー登録
;-------------------------------------------------------------------------------
;スタートボタン上の操作
#If (TE_StartButton && TE_MouseOnStart())
WheelUp::
	TE_RestoreAll()
return

WheelDown::
	Send, #m
return

;タスクボタン上の操作
#If (TE_TaskButton && TE_MouseOnTaskbar("MSTaskListWClass1"))
WheelUp::
	wID := TE_GetTaskID()
	WinGet, v, MinMax, ahk_id %wID%
	if (v = -1)
		WinRestore, ahk_id %wID%
	WinActivate, ahk_id %wID%
return

WheelDown::
	WinMinimize, % "ahk_id " TE_GetTaskID()
return

MButton::
	;WinClose, % "ahk_id " TE_GetTaskID()
	PostMessage, 0x112, 0xF060,,, % "ahk_id " TE_GetTaskID()
return

;タスクトレイ上の操作
#If (TE_TaskTray && TE_MouseOnTaskbar("ToolbarWindow321,TrayClockWClass1"))
WheelUp::
	TE_Change("+" . TE_VolumeStep)
return

WheelDown::
	TE_Change("-" . TE_VolumeStep)
return

MButton::
	TE_Mute()
return
#if


;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
TE_MouseOnTaskbar(szCtrl="")
{
	global mouseX, mouseY
	CoordMode, Mouse, Screen
	MouseGetPos, mouseX, mouseY, hWnd, ClassNN, 1
	if (hWnd != WinExist("ahk_class Shell_TrayWnd"))
		return false
	if (szCtrl)
	{
		if ClassNN not in %szCtrl%
			return false
	}
	return true
}

TE_MouseOnStart()
{
	MouseGetPos,,, win
	WinGetTitle, ti, ahk_id %win%
	WinGetClass, cl, ahk_id %win%
	if (cl = "Button" && ti = "スタート")
		return true
	else
		return false
}

TE_GetTaskID()
{
	global mouseX, mouseY
	WinID :=
	flag := 0
	
	WinGetPos,,, taskbarW, taskbarH, ahk_class Shell_TrayWnd
	ControlGet, hWnd, Hwnd,, MSTaskListWClass1, ahk_class Shell_TrayWnd
	TaskList:= TE_AccessibleObjectFromWindow(hWnd)
	Loop, % TaskList.accChildCount
	{
		wTitle := TaskList.accName(A_Index)
		TaskList.accLocation(ComObjParameter(0x4003, &L:=0), ComObjParameter(0x4003, &T:=0)
			, ComObjParameter(0x4003, &W:=0), ComObjParameter(0x4003, &H:=0)
			, A_Index) 
		
		bL := NumGet(L), bT := NumGet(T), bW := NumGet(W), bH := NumGet(H)
		if (taskbarW > taskbarH) {
			S := bL
			E := bL + bW
			P := mouseX
		}
		else {
			S := bT
			E := bT + bH
			P := mouseY
		}
		if (S < P && P < E) {
			SetTitleMatchMode, 3
			WinGet, list, List, % wTitle
			Loop, %list%
			{
				wID := list%A_Index%
				WinGet, uStyle, Style, ahk_id %wID%
				if (!(uStyle&0x08000000)
				&& (!(uStyle&0x80000000) || ((uStyle&0x30000000)=0x30000000) || (uStyle&0x80) || (uStyle&0x00C00000)))
				{
					WinID := wID
					flag++
				}
			}
			if (flag)
				break
		}
		
	}
	
	if (flag = 1)
		return WinID
	else
		return 
}

TE_RestoreAll()
{
	WinGet, list, List,,, !!!sonzaishinaititle!!!
	Loop, %list%
	{
		hWnd := list%A_Index%
		IfWinExist, ahk_id %hWnd%
		{
			WinGet, uStyle, Style
			if (!(uStyle&0x08000000)
			&& (!(uStyle&0x80000000) || ((uStyle&0x30000000)=0x30000000) || (uStyle&0x80) || (uStyle&0x00C00000)))
			{
				WinActivate
			}
		}
	}

}


TE_AccessibleObjectFromWindow(Hwnd) 
{ 
	global 
	VarSetCapacity(IID, 16) 
	NumPut(0x11CF3C3D618736E0, IID, 0, "Int64") 
	NumPut(0x719B3800AA000C81, IID, 8, "Int64") 
	DllCall("LoadLibrary","Str","Oleacc") 
	DllCall("Oleacc\AccessibleObjectFromWindow", "Ptr", Hwnd, "UInt", -4, "Ptr", &IID, "Ptr*", ppvObject)
	Return, ComObjEnwrap(ppvObject) 
}


TE_Change(vol)
{
	Critical
	SoundSet, vol
	TE_DispVolume(false)
	Critical Off
}

TE_Mute()
{
	SoundSet, +1, , MUTE
	TE_DispVolume(true)
}

TE_SoundGet(fMute=false)
{
	if (fMute) {
		SoundGet, szMute,, MUTE
		StringUpper, szMute, szMute
		return szMute
	} else {
		SoundGet, vol
		return Round(vol)
	}
}

TE_CreateWindow()
{
	local clrF, clrB
	TE_Mute := TE_GetColor(clrF, clrB)
	Gui, TE_BaseWin:+HwndTE_hBaseWin -Caption +ToolWindow +AlwaysOnTop +LastFound
	WinSet, Transparent, %TE_BarBaseTrans%
	Gui, TE_BaseWin:Color, %clrB%

	Gui, TE_BarWin:+HwndTE_hBarWin -Caption +ToolWindow +AlwaysOnTop +LastFound
	WinSet, Transparent, %TE_VolTrans%
	Gui, TE_BarWin:Color, %clrF%

	local w, h
	SysGet, w, 0
	SysGet, h, 1
	TE_BarPosX := w - TE_BarMarginX - TE_BarSizeW
	TE_BarPosY := h - TE_BarMarginY - TE_BarSizeH
	TE_CreateNumberWindow(clrF)
}

TE_CreateNumberWindow(color)
{
	global
	Gui, TE_NumWin:+HwndTE_hNumWin -Caption +ToolWindow +AlwaysOnTop +LastFound
	local clrT := TE_MakeTransColor(color)
	WinSet, TransColor, % clrT . " " . TE_VolTrans
	Gui, TE_NumWin:Color, %clrT%
	Gui, TE_NumWin:Font, c%color% s%TE_VolFontSize% w600 q5, %TE_VolFont%
	Gui, TE_NumWin:Add, Text, vTE_VolVal Right, ミュートOFF
	Gui, TE_NumWin:Show, AutoSize Hide

	local x, y, w, h
	WinGetPos,,, w, h
	x := TE_BarPosX - w + 20
	y := TE_BarPosY + (TE_BarSizeH - h)/2 + 2
	Gui, TE_NumWin:Show, x%x% y%y% Hide
}

TE_GetColor(ByRef clrF, ByRef clrB)
{
	local szMute := TE_SoundGet(true)
	clrF := (szMute = "ON") ? TE_MuteColor : TE_VolColor
	clrB := (szMute = "ON") ? TE_MuteBaseColor : TE_BarBaseColor
	return szMute
}

TE_MakeTransColor(color)
{
	r := (color >> 16) & 0xff
	g := (color >> 8) & 0xff
	b := color & 0xff
	r += (r>0) ? -1 : 1
	g += (g>0) ? -1 : 1
	b += (b>0) ? -1 : 1
	SetFormat, IntegerFast, H
	color := (r<<16) + (g<<8) + b
	color := RegExReplace(color, "^0x")
	SetFormat, IntegerFast, D
	Loop, % (6 - StrLen(color))
	{
		color := "0" . color
	}
	return color
}

TE_DispVolume(fMute=false)
{
	global
	SetTimer, TE_HideTimer, Off
	local szMute, clrF, clrB
	szMute := TE_GetColor(clrF, clrB)
	if (fMute || (TE_Mute != szMute))
	{
		TE_Mute := szMute
		Gui, TE_BaseWin:Color, %clrB%
		Gui, TE_BarWin:Color, %clrF%
		Gui, TE_NumWin:Destroy
		TE_CreateNumberWindow(clrF)
	}
	if (!WinExist("ahk_id" . TE_hBaseWin)) {
		Gui, TE_BaseWin:Show, x%TE_BarPosX% y%TE_BarPosY% w%TE_BarSizeW% h%TE_BarSizeH% NA
	}
	local vol := TE_SoundGet()
	local w := TE_BarSizeW * vol // 100
	if (w > 0) {
		Gui, TE_BarWin:Show, x%TE_BarPosX% y%TE_BarPosY% w%w% h%TE_BarSizeH% NA
	} else {
		Gui, TE_BarWin:Hide
	}

	if (fMute){
		GuiControl, TE_NumWin:, TE_VolVal, ミュート%szMute%
	} else {
		GuiControl, TE_NumWin:, TE_VolVal, %vol%
	}
	if (!WinExist("ahk_id" . TE_hNumWin)) {
		Gui, TE_NumWin:Show, NA
	}

	if (TE_SoundPlay)
		SoundPlay, *-1

	SetTimer, TE_HideTimer, -%TE_VolDispTime%
}

TE_HideTimer:
	Gui, TE_BaseWin:Hide
	Gui, TE_BarWin:Hide
	Gui, TE_NumWin:Hide
return


TaskbarExtension_End: