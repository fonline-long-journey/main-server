@echo off

@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"

@: Environment
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v6.0A\Lib;%LIB%
@set LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Lib;%LIB%
@set LIB=.\;%LIB%
@set INCLUDE=.\;%INCLUDE%

@: Server
@del "./fonline_test.dll"
cl.exe /nologo /MT /W3 /O2 /Gd /D "__SERVER" /Fo"./fonline_test.obj" /FD /c "./fonline_test.cpp"
link.exe /nologo /dll /incremental:no /machine:I386 "./fonline_test.obj" /out:"./fonline_test.dll"

@: Client
@del "./fonline_test_client.dll"
cl.exe /nologo /MT /W3 /O2 /Gd /D "__CLIENT" /Fo"./fonline_test_client.obj" /FD /c "./fonline_test.cpp"
link.exe /nologo /dll /incremental:no /machine:I386 "./fonline_test_client.obj" /out:"./fonline_test_client.dll"

@: Delete unnecessary stuff
@del "./fonline_test.obj"
@del "./fonline_test.exp"
@del "./fonline_test.lib"
@del "./fonline_test_client.obj"
@del "./fonline_test_client.exp"
@del "./fonline_test_client.lib"
@del "./vc100.idb"

@pause