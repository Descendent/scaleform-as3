import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.ComponentEvent;
/**************************************************************************

Filename    :   UILoader.as

Copyright   :   Copyright 2012 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.clik.controls.UILoader extends UIComponent
{
	public var bytesLoaded : int;
	public var bytesTotal : int;
	/** @private */
	public var _source : String;
	/** @private */
	public var _autoSize : Boolean;
	/** @private */
	public var _maintainAspectRatio : Boolean;
	/** @private */
	public var _loadOK : Boolean;
	/** @private */
	public var _sizeRetries : Number;
	/** @private */
	public var _visiblilityBeforeLoad : Boolean;
	/** @private */
	public var _isLoading : Boolean;
	/** @private */
	public var bg : DisplayObject;
	public var loader : Loader;

	public function get autoSize() : Boolean;
	public function set autoSize(value:Boolean) : void;

	public function get source() : String;
	public function set source(value:String) : void;

	public function get maintainAspectRatio() : Boolean;
	public function set maintainAspectRatio(value:Boolean) : void;

	/** 
         * A read-only property that returns the loaded content of the UILoader.
         */
	public function get content() : DisplayObject;

	/**
         * A read-only property that returns the percentage that the content is loaded. The percentage is normalized to a 0-100 range.
         */
	public function get percentLoaded() : Number;

	public function get visible() : Boolean;
	public function set visible(value:Boolean) : void;


	public function UILoader();

	/** Unload the currently loaded content, or stop any pending or active load. */
	public function unload() : void;

	/** @private */
	public function toString() : String;

	/** @private */
	public function configUI() : void;

	/** @private */
	public function load(url:String) : void;

	/** @private */
	public function draw() : void;

	/** @private */
	public function handleLoadIOError(ioe:Event) : void;

	/** @private */
	public function handleLoadOpen(e:Event) : void;

	/** @private */
	public function handleLoadInit(e:Event) : void;

	/** @private */
	public function handleLoadProgress(pe:ProgressEvent) : void;

	/** @private */
	public function handleLoadComplete(e:Event) : void;

}