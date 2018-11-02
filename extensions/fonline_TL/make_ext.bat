@echo off

@: Environment
@set PATH=C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE;%PATH%
@set PATH=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\BIN;%PATH%
@set LIB=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\LIB;%LIB%
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\Lib;%LIB%
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Lib;%LIB%
@set LIB=.;%LIB%
@set INCLUDE=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\include;%INCLUDE%
@set INCLUDE=.\Fonline;%INCLUDE%
@set INCLUDE=.\3rdParty\AngelScript\Include;%INCLUDE%

@: Server
@del "./fonline_ext.dll"
cl.exe /nologo /MT /W3 /O2 /Gd /D "__SERVER" /Fo"./fonline_ext.obj" /FD /c "./fonline_ext.cpp"
link.exe /nologo /dll /incremental:no /machine:I386 "./fonline_ext.obj" /out:"./Release/fonline_ext.dll"

@: Client
@del "./fonline_ext_client.dll"
cl.exe /nologo /MT /W3 /O2 /Gd /D "__CLIENT" /Fo"./fonline_ext_client.obj" /Fd"./" /FD /c "./fonline_ext.cpp"
link.exe /nologo /dll /incremental:no /machine:I386 "./fonline_ext_client.obj" /out:"./Release/fonline_ext_client.dll"

@: Delete unnecessary stuff
@del "./fonline_ext.obj"
@del "./Release\fonline_ext.exp"
@del "./Release\fonline_ext.lib"
@del "./fonline_ext_client.obj"
@del "./Release\fonline_ext_client.exp"
@del "./Release\fonline_ext_client.lib"
@del "./vc100.idb"

@pause