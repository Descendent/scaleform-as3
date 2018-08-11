import flash.events.Event;
/**
 *  Event structure and defintions for the CLIK Dialog: 
 *  Valid types:
 *      CLOSE - "dialogClose"
 *      SUBMIT - "dialogSubmit"
 */
intrinsic class scaleform.clik.events.DialogEvent extends Event
{
	static public var CLOSE : String;
	static public var SUBMIT : String;

	public function DialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true);

}