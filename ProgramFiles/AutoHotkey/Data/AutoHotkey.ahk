/*���ϊ��V���[�Y-----------------------
---------------------------------------
---------------------------------------
*/


;�p���L�[�𖳕ϊ���(�s���ɂ�艺�̖��L�[�Ŗ��ϊ����g������)
	vkF0::vk1D
	Return


;���ϊ�+Space��Backspace
	vk1D & Space::Send,{Backspace}
	Return


;���ϊ�+�ϊ���Delete
	vk1D & vk1C::Send,{Delete}
	Return


;���ϊ�+�J�i/���ȃL�[�Ŕ��p�p�����̓��[�h
	vk1D & vkF2::Send, {vkF2}{vkF3}
	Return


;���ϊ�+ikjl�ŏ㉺���E
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


;���ϊ�+h;��[Home/End]
	vk1D & h::
		Send,{Home}
		Return

	vk1D & vkBB::
		Send,{End}
		Return


;���ϊ�+���������ŏ㉺���E�̖�����
	Send_byClip(in_text)
	{
	bak_clipboard := Clipboard
	Clipboard := in_text
	Sleep, 150 ;�N���b�v�{�[�h���M�܂ł̃E�F�C�g
	send, ^{v}
	Clipboard := bak_clipboard
	}

	vk1D & Up::
		Send_byClip("��")
		Return

	vk1D & Down::
		Send_byClip("��")
		Return

	vk1D & Left::
		Send_byClip("��")
		Return

	vk1D & Right::
		Send_byClip("��")
		Return


;���ϊ�+edsf�Ń}�E�X�㉺���E�ړ�
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


;���ϊ�+3cag�Ń}�E�X�㉺���E�ړ�(��)
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


;���ϊ�wr�ō��E�N���b�N
	vk1D & w::
		Send, {LButton}
	Return

	vk1d & r::
		Send, {RButton}
	Return


/*���ϊ��V���[�Y�����܂�---------------
---------------------------------------
---------------------------------------
*/


;Shift+0��()�����
	+0::Send,{vkF2}{vkF3}+8+9{Left}
	Return


;ScrollLock�œd����J��
	ScrollLock::Run, calc.exe
	Return


;�A�v���P�[�V�����L�[+�㉺���E�ŉ��ʒ����֘A
	AppsKey::Send,{AppsKey}		;�P�̉����̓���w��

	AppsKey & Up::			;App + �� = �{�����[�����グ��
		Send,{Volume_Up 4}	;�グ��ʂ𑝂₵�����ꍇ�͐�����ύX
	Return

	AppsKey & Down::		;App + �� = �{�����[����������
		Send,{Volume_Down 4}	;������ʂ𑝂₵�����ꍇ�͐�����ύX
	Return

	AppsKey & Left::		;App + �E = �~���[�g
		Send,{Volume_Mute}	;�~���[�g��ON/OFF�؂�ւ�
	Return


; �R�s�[������c�[���`�b�v��\��
	OnClipboardChange:
		ToolTip �R�s�[���܂����B
        	SetTimer, RemoveToolTip, 200
	Return

	RemoveToolTip:
		SetTimer, RemoveToolTip, Off
		ToolTip
	Return


/*���-----------------------------------------
-----------------------------------------------
-----------------------------------------------


;Win+E�Ńf�X�N�g�b�v�t�H���_���J��
	#e::Run, %A_Desktop%
	Return


;���ϊ�+,��\;:�p@��Ńe���L�[�̑��
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



;���ϊ�+edsf��[Ctrl/][Home/End]
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


;NumLock��BackSpace�ɒu��
	NumLock::BackSpace
	Return



;BackSpace+Del�őS����(Ctrl+A��Del)
	Delete & Backspace:: 
		Send,^a 
		Send,{Backspace} 
	Return 

	Delete::Send,{Delete}
	Return
	Shift & Delete::
		Send,+{Delete}
	Return


;���ϊ�+�e���L�[�ł͂Ȃ�0�Łu�v�����
	vk1D & 0::Send,{vkF2}{[}{]}{Enter}{Left}
	Return


;���ϊ�+cvbnfghrty�Ńe���L�[�̑��
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


/*��ꂱ���܂�---------------------------------
-----------------------------------------------
-----------------------------------------------
*/