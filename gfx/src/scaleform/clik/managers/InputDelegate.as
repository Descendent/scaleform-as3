import flash.display.Stage;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import scaleform.clik.events.InputEvent;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.constants.InputValue;
import scaleform.clik.constants.NavigationCode;
import scaleform.gfx.KeyboardEventEx;
/**************************************************************************

Filename    :   InputDelegate.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.clik.managers.InputDelegate extends EventDispatcher
{
	static private var instance : InputDelegate;
	public var stage : Stage;
	public var externalInputHandler : Function;
	public var keyHash : Array;
	static public var MAX_KEY_CODES : uint;
	static public var KEY_PRESSED : uint;
	static public var KEY_SUPRESSED : uint;

	static public function getInstance() : InputDelegate;

	public function InputDelegate();

	public function initialize(stage:Stage) : void;

	public function setKeyRepeat(code:Number, repeat:Boolean, controllerIndex:uint=0) : void;

	public function inputToNav(type:String, code:Number, shiftKey:Boolean = false, value:*=null) : String;

	public function readInput(type:String, code:int, callBack:Function) : Object;

	public function handleKeyDown(event:KeyboardEvent) : void;

	public function handleKeyUp(event:KeyboardEvent) : void;

	public function handleKeyPress(type:String, code:Number, controllerIdx:Number, ctrl:Boolean, alt:Boolean, shift:Boolean) : void;

}