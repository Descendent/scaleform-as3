import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.geom.Point;
import scaleform.gfx.FocusManager;
/**************************************************************************

Filename    :   PopUpManager.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.clik.managers.PopUpManager
{
	static public var initialized : Boolean;
	static public var _stage : Stage;
	static public var _defaultPopupCanvas : MovieClip;
	static public var _modalMc : Sprite;
	static public var _modalBg : Sprite;

	static public function init(stage:Stage) : void;

	static public function show(mc:DisplayObject, x:Number = 0, y:Number = 0, scope:DisplayObjectContainer = null) : void;

	static public function showModal(mc:Sprite, mcX:Number = 0, mcY:Number = 0, bg:Sprite = null, controllerIdx:uint = 0, newFocus:Sprite = null) : void;

	static public function handleStageAddedEvent(e:Event) : void;

	static public function handleRemovePopup(e:Event) : void;

	static public function handleRemoveModalMc(e:Event) : void;

	static public function removeAddedToStageListener() : void;

}