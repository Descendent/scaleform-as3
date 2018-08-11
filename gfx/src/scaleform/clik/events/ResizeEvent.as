import flash.events.Event;
/**
 *  Event structure and defintions for a generic resize event for all CLIK components. 
 *  Valid types:
 *      RESIZE - "resize"
 *      SCOPE_ORIGINALS_UPDATE - "scopeOriginalsUpdate"
 */
intrinsic class scaleform.clik.events.ResizeEvent extends Event
{
	public var scaleX : Number;
	public var scaleY : Number;
	static public var RESIZE : String;
	static public var SCOPE_ORIGINALS_UPDATE : String;

	public function ResizeEvent(type:String, scaleX:Number, scaleY:Number);

	public function toString() : String;

	public function clone() : Event;

}