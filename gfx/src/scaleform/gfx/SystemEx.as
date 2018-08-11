/**************************************************************************

Filename    :   System.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.SystemEx
{
	static public var REPORT_SHORT_FILE_NAMES : uint;
	static public var REPORT_NO_CIRCULAR_REFERENCES : uint;
	static public var REPORT_SUPPRESS_OVERALL_STATS : uint;
	static public var REPORT_ONLY_ANON_OBJ_ADDRESSES : uint;

	static public function get actionVerbose() : Boolean;
	static public function set actionVerbose(v:Boolean) : void;


	static public function setBackgroundAlpha(value:Number) : void;

	static public function getStackTrace() : String;

	static public function getCodeFileName() : String;

	static public function getCodeFileNames() : Array;

	static public function describeType(v:*) : String;

	static public function printObjectsReport(runGarbageCollector:Boolean = true, reportFlags:uint = 0xB, swfFilter:String = null) : void;

}