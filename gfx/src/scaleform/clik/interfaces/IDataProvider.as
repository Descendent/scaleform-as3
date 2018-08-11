import flash.events.IEventDispatcher;
import flash.events.Event;
/** 
 * Interface for a CLIK DataProvider.
 */
interface scaleform.clik.interfaces.IDataProvider
{
	public function get length() : uint;


	public function requestItemAt(index:uint, callBack:Function=null) : Object;

	public function requestItemRange(startIndex:int, endIndex:int, callBack:Function=null) : Array;

	public function indexOf(item:Object, callBack:Function=null) : int;

	public function cleanUp() : void;

	public function invalidate(length:uint=0) : void;

	public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false) : void;

	public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false) : void;

	public function dispatchEvent(event:Event) : Boolean;

	public function hasEventListener(type:String) : Boolean;

	public function willTrigger(type:String) : Boolean;

}