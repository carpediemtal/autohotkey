#Requires AutoHotkey v2.0.11+                               ; Always have a version requirment

boolEnabled := true
^+CapsLock::toggle_feature()                                ; Ctrl + Shift + CapsLock to enable/disable

#HotIf boolEnabled
*CapsLock::return                                           ; Disable single click CapsLock
#HotIf

#HotIf boolEnabled && GetKeyState('CapsLock', 'P')          ; Following hotkeys are enabled when caps is held
h::Left
j::Down
k::Up
l::Right

; u::PgUp
; o::PgDn
; 
; a::Shift
; s::Control
; d::Alt
; 
; .::End
; ,::Home
; 
; `;::Delete
; '::BackSpace 
#HotIf                                                      ; Always reset #HotIf directive when done

toggle_feature() {
    global boolEnabled := !boolEnabled
    MsgBox "caps feature: " (boolEnabled ? "enable" : "disable")
}
