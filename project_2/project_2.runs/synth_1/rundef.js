//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "D:/ISE/14.7/ISE_DS/EDK/bin/nt;D:/ISE/14.7/ISE_DS/EDK/lib/nt;D:/ISE/14.7/ISE_DS/ISE/bin/nt;D:/ISE/14.7/ISE_DS/ISE/lib/nt;D:/ISE/14.7/ISE_DS/common/bin/nt;D:/ISE/14.7/ISE_DS/common/lib/nt;D:/ISE/14.7/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "D:/ISE/14.7/ISE_DS/EDK/bin/nt;D:/ISE/14.7/ISE_DS/EDK/lib/nt;D:/ISE/14.7/ISE_DS/ISE/bin/nt;D:/ISE/14.7/ISE_DS/ISE/lib/nt;D:/ISE/14.7/ISE_DS/common/bin/nt;D:/ISE/14.7/ISE_DS/common/lib/nt;D:/ISE/14.7/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "xst",
         "-ifn \"CPUTOP.xst\" -ofn \"CPUTOP.srp\" -intstyle ise" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}