import flash.events.Event;
import scaleform.clik.ui.InputDetails;
/**
 *  Event structure and defintions for a CLIK InputEvent: 
 *  Valid types:
 *      INPUT - "input"
 */
intrinsic class scaleform.clik.events.InputEvent extends Event
{
	public var details : InputDetails;
	static public var INPUT : String;

	public function get handled() : Boolean;
	public function set handled(value:Boolean) : void;


	public function InputEvent(type:String, details:InputDetails);

	public function clone() : Event;

	public function toString() : String;

}