import flash.display.DisplayObject;
import flash.geom.Rectangle;
import flash.text.TextField;
/**************************************************************************

Filename    :   Extensions.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.gfx.Extensions
{
	static public var isGFxPlayer : Boolean;
	static public var CLIK_addedToStageCallback : Function;
	static public var gfxProcessSound : Function;
	static public var EDGEAA_INHERIT : uint;
	static public var EDGEAA_ON : uint;
	static public var EDGEAA_OFF : uint;
	static public var EDGEAA_DISABLE : uint;

	static public function get enabled() : Boolean;
	static public function set enabled(value:Boolean) : void;

	static public function get noInvisibleAdvance() : Boolean;
	static public function set noInvisibleAdvance(value:Boolean) : void;

	static public function get numControllers() : uint;

	static public function get visibleRect() : Rectangle;

	static public function get isScaleform() : Boolean;


	static public function getTopMostEntity(x:Number, y:Number, testAll:Boolean = true) : DisplayObject;

	static public function getMouseTopMostEntity(testAll:Boolean = true, mouseIndex:uint = 0) : DisplayObject;

	static public function setMouseCursorType(cursor:String, mouseIndex:uint = 0) : void;

	static public function getMouseCursorType(mouseIndex:uint = 0) : String;

	static public function getEdgeAAMode(dispObj:DisplayObject) : uint;

	static public function setEdgeAAMode(dispObj:DisplayObject, mode:uint) : void;

	static public function setIMEEnabled(textField:TextField, isEnabled:Boolean) : void;

}