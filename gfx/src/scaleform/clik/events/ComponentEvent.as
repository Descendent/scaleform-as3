import flash.events.Event;
/**
 *  Event structure and defintions for all CLIK components: 
 *  Valid types:
 *      STATE_CHANGE - "stateChange"
 *      SHOW - "show"
 *      HIDE - "hide"
 */
intrinsic class scaleform.clik.events.ComponentEvent extends Event
{
	static public var STATE_CHANGE : String;
	static public var SHOW : String;
	static public var HIDE : String;

	public function ComponentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true);

}