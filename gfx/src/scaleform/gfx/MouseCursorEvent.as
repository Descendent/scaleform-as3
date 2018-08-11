import flash.events.Event;
/**************************************************************************

Filename    :   MouseCursorEvent.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.MouseCursorEvent extends Event
{
	public var cursor : String;
	public var mouseIdx : uint;
	static public var CURSOR_CHANGE : String;

	public function MouseCursorEvent();

}