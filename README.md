# asmReflection
Loading a C# executable with Nim

### Compile
The binary will be added to the code at compile time, edit the line 72 for the binary of your choice that is in the current directory.
```
72 const b64 = slurp"Seatbelt.exe".encode()
```

Nim is cross compilation, compile according to your platform (e.g for Windows x64):
```
nim c -d:mingw -d:release --opt:size .\asmreflection.nim
```

### Instructions
Example Seatbelt
```
PS C:\Users\IEUser\Desktop> .\asmreflection.exe Antivirus
[+] 4MS1 disabled: true
[+] 3TW disabled: true
[+] Installed .NET versions
    [>] v4.0.30319
assembly = Seatbelt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
@["Antivirus"]


                        %&&@@@&&
                        &&&&&&&%%%,                       #&&@@@@@@%%%%%%###############%
                        &%&   %&%%                        &////(((&%%%%%#%################//((((###%%%%%%%%%%%%%%%
%%%%%%%%%%%######%%%#%%####%  &%%**#                      @////(((&%%%%%%######################(((((((((((((((((((
#%#%%%%%%%#######%#%%#######  %&%,,,,,,,,,,,,,,,,         @////(((&%%%%%#%#####################(((((((((((((((((((
#%#%%%%%%#####%%#%#%%#######  %%%,,,,,,  ,,.   ,,         @////(((&%%%%%%%######################(#(((#(#((((((((((
#####%%%####################  &%%......  ...   ..         @////(((&%%%%%%%###############%######((#(#(####((((((((
#######%##########%#########  %%%......  ...   ..         @////(((&%%%%%#########################(#(#######((#####
###%##%%####################  &%%...............          @////(((&%%%%%%%%##############%#######(#########((#####
#####%######################  %%%..                       @////(((&%%%%%%%################
                        &%&   %%%%%      Seatbelt         %////(((&%%%%%%%%#############*
                        &%%&&&%%%%%        v1.2.1         ,(((&%%%%%%%%%%%%%%%%%,
                         #%%%%##,


====== AntiVirus ======

  Engine                         : Windows Defender
  ProductEXE                     : windowsdefender://
  ReportingEXE                   : %ProgramFiles%\Windows Defender\MsMpeng.exe



[*] Completed collection in 0.111 seconds

```

### Inspired by
[Offensive Nim - dns_exfiltrate.nim](https://github.com/byt3bl33d3r/OffensiveNim/blob/master/src/dns_exfiltrate.nim)<br>
[Bypassing Windows protection mechanisms & Playing with OffensiveNim](https://s3cur3th1ssh1t.github.io/Playing-with-OffensiveNim/)
