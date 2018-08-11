import flash.events.FocusEvent;
/**************************************************************************

Filename    :   FocusEventEx.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.FocusEventEx extends FocusEvent
{
	public var controllerIdx : uint;

	public function FocusEventEx(type:String);

}