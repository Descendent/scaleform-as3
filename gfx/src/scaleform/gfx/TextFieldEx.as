import flash.text.TextField;
/**************************************************************************

Filename    :   TextFieldEx.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.TextFieldEx
{
	static public var VALIGN_NONE : String;
	static public var VALIGN_TOP : String;
	static public var VALIGN_CENTER : String;
	static public var VALIGN_BOTTOM : String;
	static public var TEXTAUTOSZ_NONE : String;
	static public var TEXTAUTOSZ_SHRINK : String;
	static public var TEXTAUTOSZ_FIT : String;

	static public function appendHtml(textField:TextField, newHtml:String) : void;

	static public function setIMEEnabled(textField:TextField, isEnabled:Boolean) : void;

	static public function setVerticalAlign(textField:TextField, valign:String) : void;

	static public function getVerticalAlign(textField:TextField) : String;

	static public function setTextAutoSize(textField:TextField, autoSz:String) : void;

	static public function getTextAutoSize(textField:TextField) : String;

}