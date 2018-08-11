import flash.events.Event;
import scaleform.clik.controls.Button;
import scaleform.clik.interfaces.IListItemRenderer;
/**
 *  Event structure and defintions for a generic "index has changed" event: 
 *  Valid types:
 *      INDEX_CHANGE - "indexChange"
 */
intrinsic class scaleform.clik.events.IndexEvent extends Event
{
	public var index : int;
	public var lastIndex : int;
	public var data : Object;
	static public var INDEX_CHANGE : String;

	public function IndexEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true, index:int=-1, lastIndex:int=-1, data=null);

	public function clone() : Event;

	public function toString() : String;

}