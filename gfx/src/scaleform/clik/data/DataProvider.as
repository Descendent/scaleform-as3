import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.Event;
import scaleform.clik.interfaces.IDataProvider;
/**
 * A data provider for many of the CLIK components, often generated from an Array of data. Provides extra functionality and events for data changes.
 */
intrinsic dynamic class scaleform.clik.data.DataProvider extends Array implements IDataProvider, IEventDispatcher
{
	public var dispatcher : EventDispatcher;

	public function DataProvider(source:Array = null);

	public function setSource(source:Array) : void;

	public function testFunc1() : void;

	public function testFunc2(param:Object) : void;

	public function indexOf(item:Object, callBack:Function=null) : int;

	public function requestItemAt(index:uint, callBack:Function=null) : Object;

	public function requestItemRange(startPosition:int, endPosition:int, callBack:Function=null) : Array;

	public function cleanUp() : void;

	public function invalidate(length:uint=0) : void;

	public function toString() : String;

	public function parseSource(source:Array) : void;

	public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false) : void;

	public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false) : void;

	public function dispatchEvent(event:Event) : Boolean;

	public function hasEventListener(type:String) : Boolean;

	public function willTrigger(type:String) : Boolean;

}