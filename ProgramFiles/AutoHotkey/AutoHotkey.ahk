/*無変換シリーズ-----------------------
---------------------------------------
---------------------------------------
*/


;英数キーを無変換に(都合により下の矢印キーで無変換を使うため)
	vkF0::vk1D
	Return


;無変換+SpaceでBackspace
	vk1D & Space::Send,{Backspace}
	Return


;無変換+変換でDelete
	vk1D & vk1C::Send,{Delete}
	Return


;無変換+カナ/かなキーで半角英数入力モード
	vk1D & vkF2::Send, {vkF2}{vkF3}
	Return


;無変換+ikjlで上下左右
	vk1D & j::
 	   if GetKeyState("shift", "P"){
	       Send, +{Left}
	    }else{
	        Send,{Left}
	    }
 	   Return

	vk1D & k::
 	   if GetKeyState("shift", "P"){
  	      Send, +{Down}
  	  }else{
  	      Send,{Down}
 	   }
 	   Return

	vk1D & i::
 	   If GetKeyState("shift", "P"){
   	     Send, +{Up}
  	  }else{
  	      Send,{Up}
   	 }
  	  Return

	vk1D & l::
 	   If GetKeyState("shift", "P"){
 	       Send, +{Right}
 	   }else{
 	       Send,{Right}
 	   }
 	   Return


;無変換+h;で[Home/End]
	vk1D & h::
		Send,{Home}
		Return

	vk1D & vkBB::
		Send,{End}
		Return


;無変換+↑↓→←で上下左右の矢印入力
	Send_byClip(in_text)
	{
	bak_clipboard := Clipboard
	Clipboard := in_text
	Sleep, 150 ;クリップボード送信までのウェイト
	send, ^{v}
	Clipboard := bak_clipboard
	}

	vk1D & Up::
		Send_byClip("↑")
		Return

	vk1D & Down::
		Send_byClip("↓")
		Return

	vk1D & Left::
		Send_byClip("←")
		Return

	vk1D & Right::
		Send_byClip("→")
		Return


;無変換+edsfでマウス上下左右移動
	vk1D & e::
		MouseMove, 0, -15, 0, R
	Return

	vk1D & d::
		MouseMove, 0, 15, 0, R
	Return

	vk1D & s::
		MouseMove, -15, 0, 0, R
	Return

	vk1D & f::
		MouseMove, 15, 0, 0, R
	Return


;無変換+3cagでマウス上下左右移動(大)
	vk1D & 3::
		MouseMove, 0, -100, 2, R
	Return

	vk1D & c::
		MouseMove, 0, 100, 2, R
	Return

	vk1D & a::
		MouseMove, -100, 0, 2, R
	Return

	vk1D & g::
		MouseMove, 100, 0, 2, R
	Return


;無変換wrで左右クリック
	vk1D & w::
		Send, {LButton}
	Return

	vk1d & r::
		Send, {RButton}
	Return


/*無変換シリーズここまで---------------
---------------------------------------
---------------------------------------
*/


;Shift+0で()を入力
	+0::Send,{vkF2}{vkF3}+8+9{Left}
	Return


;ScrollLockで電卓を開く
	ScrollLock::Run, calc.exe
	Return


;アプリケーションキー+上下左右で音量調整関連
	AppsKey::Send,{AppsKey}		;単体押下の動作指定

	AppsKey & Up::			;App + 上 = ボリュームを上げる
		Send,{Volume_Up 4}	;上げる量を増やしたい場合は数字を変更
	Return

	AppsKey & Down::		;App + 下 = ボリュームを下げる
		Send,{Volume_Down 4}	;下げる量を増やしたい場合は数字を変更
	Return

	AppsKey & Left::		;App + 右 = ミュート
		Send,{Volume_Mute}	;ミュートのON/OFF切り替え
	Return


; コピーしたらツールチップを表示
	OnClipboardChange:
		ToolTip コピーしました。
        	SetTimer, RemoveToolTip, 200
	Return

	RemoveToolTip:
		SetTimer, RemoveToolTip, Off
		ToolTip
	Return


/*墓場-----------------------------------------
-----------------------------------------------
-----------------------------------------------


;Win+Eでデスクトップフォルダを開く
	#e::Run, %A_Desktop%
	Return


;無変換+,｡･\;:｣p@｢でテンキーの代替
	vk1D & vkBC::
		Send,{Numpad0}
		Return
	vk1D & .:: 
		Send,{Numpad1}
		Return
	vk1D & /::
		Send,{Numpad2}
		Return
	vk1D & vkE2::
		Send,{Numpad3}
		Return
	vk1D & vkBB::
		Send,{Numpad4}
		Return
	vk1D & vkBA::
		Send,{Numpad5}
		Return
	vk1D & ]::
		Send,{Numpad6}
		Return
	vk1D & p::
		Send,{Numpad7}
		Return
	vk1D & @::
		Send,{Numpad8}
		Return
	vk1D & [::
		Send,{Numpad9}
		Return



;無変換+edsfで[Ctrl/][Home/End]
	vk1D & e::
		Send,^{Home}
		Return
	vk1D & d::
		Send,^{End}
		Return
	vk1D & s::
		Send,{Home}
		Return
	vk1D & f::
		Send,{End}
		Return


;NumLockをBackSpaceに置換
	NumLock::BackSpace
	Return



;BackSpace+Delで全消し(Ctrl+A→Del)
	Delete & Backspace:: 
		Send,^a 
		Send,{Backspace} 
	Return 

	Delete::Send,{Delete}
	Return
	Shift & Delete::
		Send,+{Delete}
	Return


;無変換+テンキーではない0で「」を入力
	vk1D & 0::Send,{vkF2}{[}{]}{Enter}{Left}
	Return


;無変換+cvbnfghrtyでテンキーの代替
	vk1D & c::
		Send,{Numpad0}
		Return
	vk1D & v:: 
		Send,{Numpad1}
		Return
	vk1D & b::
		Send,{Numpad2}
		Return
	vk1D & n::
		Send,{Numpad3}
		Return
	vk1D & f::
		Send,{Numpad4}
		Return
	vk1D & g::
		Send,{Numpad5}
		Return
	vk1D & h::
		Send,{Numpad6}
		Return
	vk1D & r::
		Send,{Numpad7}
		Return
	vk1D & t::
		Send,{Numpad8}
		Return
	vk1D & y::
		Send,{Numpad9}
		Return


/*墓場ここまで---------------------------------
-----------------------------------------------
-----------------------------------------------
*/