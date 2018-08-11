import flash.events.MouseEvent;
/**************************************************************************

Filename    :   MouseEventEx.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.MouseEventEx extends MouseEvent
{
	public var mouseIdx : uint;
	public var nestingIdx : uint;
	public var buttonIdx : uint;
	static public var LEFT_BUTTON : uint;
	static public var RIGHT_BUTTON : uint;
	static public var MIDDLE_BUTTON : uint;

	public function MouseEventEx(type:String);

}