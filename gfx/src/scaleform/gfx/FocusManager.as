import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.display.Sprite;
/**************************************************************************

Filename    :   FocusManager.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.FocusManager
{
	static public function get alwaysEnableArrowKeys() : Boolean;
	static public function set alwaysEnableArrowKeys(enable:Boolean) : void;

	static public function get disableFocusKeys() : Boolean;
	static public function set disableFocusKeys(disable:Boolean) : void;

	static public function get numFocusGroups() : uint;


	static public function moveFocus(keyToSimulate:String, startFromMovie:InteractiveObject = null, includeFocusEnabledChars:Boolean = false, controllerIdx:uint = 0) : InteractiveObject;

	static public function findFocus(keyToSimulate:String, parentMovie:DisplayObjectContainer = null, loop:Boolean = false, startFromMovie:InteractiveObject = null, includeFocusEnabledChars:Boolean = false, controllerIdx:uint = 0) : InteractiveObject;

	static public function setFocus(obj:InteractiveObject, controllerIdx:uint = 0) : void;

	static public function getFocus(controllerIdx:uint = 0) : InteractiveObject;

	static public function setFocusGroupMask(obj:InteractiveObject, mask:uint) : void;

	static public function getFocusGroupMask(obj:InteractiveObject) : uint;

	static public function setControllerFocusGroup(controllerIdx:uint, focusGroupIdx:uint) : Boolean;

	static public function getControllerFocusGroup(controllerIdx:uint) : uint;

	static public function getControllerMaskByFocusGroup(focusGroupIdx:uint) : uint;

	static public function getModalClip(controllerIdx:uint = 0) : Sprite;

	static public function setModalClip(mc:Sprite, controllerIdx:uint = 0) : void;

}