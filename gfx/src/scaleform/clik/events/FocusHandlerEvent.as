import flash.events.Event;
/**
 *  Event structure and defintions for the CLIK DragManager: 
 *  Valid types:
 *      FOCUS_IN - "CLIK_focusIn"
 *      FOCUS_OUT - "CLIK_focusOut"
 */
intrinsic class scaleform.clik.events.FocusHandlerEvent extends Event
{
	public var controllerIdx : uint;
	static public var FOCUS_IN : String;
	static public var FOCUS_OUT : String;

	public function FocusHandlerEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false, controllerIdx:uint = 0);

	public function clone() : Event;

	public function toString() : String;

}