import flash.events.TextEvent;
/**************************************************************************

Filename    :   TextEventEx.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.TextEventEx extends TextEvent
{
	public var controllerIdx : uint;
	public var buttonIdx : uint;
	static public var LINK_MOUSE_OVER : String;
	static public var LINK_MOUSE_OUT : String;

	public function TextEventEx(type:String);

}