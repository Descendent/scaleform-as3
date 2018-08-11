import flash.events.Event;
import scaleform.clik.controls.Button;
/**
 *  Event structure and defintions for the CLIK ButtonBar: 
 *  Valid types:
 *      BUTTON_SELECT - "buttonSelect"
 */
intrinsic class scaleform.clik.events.ButtonBarEvent extends Event
{
	public var index : int;
	public var renderer : Button;
	static public var BUTTON_SELECT : String;

	public function ButtonBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true, index:int=-1, renderer:Button=null);

	public function clone() : Event;

	public function toString() : String;

}