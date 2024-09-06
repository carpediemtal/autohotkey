#Requires AutoHotkey v2.0.11+                               ; Always have a version requirment

boolEnabled := true
^+CapsLock::toggle_feature()                                ; Ctrl + Shift + CapsLock to enable/disable

#HotIf boolEnabled
*CapsLock::double_tap_caps()                                ; Double tap to use caps
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

double_tap_caps() {
    static last := 0                                        ; Last time caps was tapped
        , threshold := 200                                  ; Speed of a double tap in ms
    if (A_TickCount - last < threshold)                     ; If time since last press is within double tap threshold
        toggle_caps()                                       ;   Toggle caps state
        ,last := 0                                          ;   Reset last to 0 (prevent triple tap from activating it again)
    else last := A_TickCount                                ; Else not a double tap, update last tap time
    return
    
    toggle_caps() {
        state := GetKeyState('CapsLock', 'T')               ; Get current caps toggle state
        SetCapsLockState(!state)                            ; Set it to the opposite
    }
}

toggle_feature() {
    global boolEnabled := !boolEnabled
    MsgBox "caps feature: " (boolEnabled ? "enable" : "disable")
}
