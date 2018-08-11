import flash.events.Event;
/**************************************************************************

Filename    :   GamePadAnalogEvent.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.GamePadAnalogEvent extends Event
{
	public var code : uint;
	public var controllerIdx : uint;
	public var xvalue : Number;
	public var yvalue : Number;
	static public var CHANGE : String;

	public function GamePadAnalogEvent(bubbles:Boolean, cancelable:Boolean, code:uint, controllerIdx:uint = 0, xvalue:Number = 0, yvalue:Number = 0);

}