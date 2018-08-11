import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.display.Bitmap;
import flash.display.IBitmapDrawable;
import flash.display.BitmapData;
import scaleform.gfx.FocusManager;
import scaleform.clik.events.DragEvent;
import scaleform.clik.controls.DragSlot;
import scaleform.clik.interfaces.IDragSlot;
/**************************************************************************

Filename    :   DragManager.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.clik.managers.DragManager
{
	/** Reference to the Stage. */
	static public var _stage : Stage;
	/** Reference to the Sprite to which all dragged Sprites are attached while being dragged. */
	static public var _dragCanvas : Sprite;
	/** TRUE if the DragManager has been initialized using init(). FALSE if not. */
	static public var _initialized : Boolean;
	/** TRUE if the DragManager is currently dragging. FALSE if not. */
	static public var _inDrag : Boolean;
	/** The data behind the Sprite that is currently being dragged. */
	static public var _dragData : Object;
	/** Reference to the Sprite being dragged by the DragManager. */
	static public var _dragTarget : Sprite;
	/** Reference to the original DragSlot that initiated the current drag. */
	static public var _origDragSlot : IDragSlot;

	static public function init(stage:Stage) : void;

	static public function inDrag() : Boolean;

	static public function handleStartDragEvent(e:DragEvent) : void;

	static public function handleEndDragEvent(e:MouseEvent) : void;

	static public function handleStageAddedEvent(e:Event) : void;

	static public function findSpriteAncestorOf(obj:DisplayObject) : IDragSlot;

}