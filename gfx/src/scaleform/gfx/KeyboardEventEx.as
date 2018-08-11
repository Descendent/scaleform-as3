import flash.events.KeyboardEvent;
/**************************************************************************

Filename    :   KeyboardEventEx.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.KeyboardEventEx extends KeyboardEvent
{
	public var controllerIdx : uint;

	public function KeyboardEventEx(type:String);

}