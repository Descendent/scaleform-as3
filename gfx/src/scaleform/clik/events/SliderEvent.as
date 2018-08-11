import flash.events.Event;
import scaleform.clik.controls.Button;
/**
 *  Event structure and defintions for the CLIK Slider. 
 *  Valid types:
 *      VALUE_CHANGE - "valueChange"
 */
intrinsic class scaleform.clik.events.SliderEvent extends Event
{
	public var value : Number;
	static public var VALUE_CHANGE : String;

	public function SliderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=true, value:Number=-1);

	public function clone() : Event;

	public function toString() : String;

}