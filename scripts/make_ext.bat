@echo off

@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"

@: Environment
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\Lib;%LIB%
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Lib;%LIB%
@set LIB=.;%LIB%
@set INCLUDE=.;%INCLUDE%

@: Server
@del "./fonline_ext.dll"
cl.exe /nologo /MT /W3 /O2 /Gd /D "__SERVER" /Fo"./fonline_ext.obj" /FD /c "./fonline_ext.cpp"
link.exe /nologo /dll /incremental:no /machine:I386 "./fonline_ext.obj" /out:"./fonline_ext.dll"

@: Client
@del "./fonline_ext_client.dll"
cl.exe /nologo /MT /W3 /O2 /Gd /D "__CLIENT" /Fo"./fonline_ext_client.obj" /Fd"./" /FD /c "./fonline_ext.cpp"
link.exe /nologo /dll /incremental:no /machine:I386 "./fonline_ext_client.obj" /out:"./fonline_ext_client.dll"

@: Delete unnecessary stuff
@del "./fonline_ext.obj"
@del "./fonline_ext.exp"
@del "./fonline_ext.lib"
@del "./fonline_ext_client.obj"
@del "./fonline_ext_client.exp"
@del "./fonline_ext_client.lib"
@del "./vc100.idb"

@pause