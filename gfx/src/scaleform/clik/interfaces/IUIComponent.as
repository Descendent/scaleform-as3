import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.geom.Rectangle;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.InputEvent;
/**
 * The public interface for a UIComponent, the core of all CLIK components.
 */
interface scaleform.clik.interfaces.IUIComponent extends IEventDispatcher
{
	public function get x() : Number;
	public function set x(value:Number) : void;

	public function get y() : Number;
	public function set y(value:Number) : void;

	public function get width() : Number;
	public function set width(value:Number) : void;

	public function get height() : Number;
	public function set height(value:Number) : void;

	public function get enabled() : Boolean;
	public function set enabled(value:Boolean) : void;

	public function get tabEnabled() : Boolean;
	public function set tabEnabled(value:Boolean) : void;

	public function get scale9Grid() : Rectangle;
	public function set scale9Grid(value:Rectangle) : void;

	public function get alpha() : Number;
	public function set alpha(value:Number) : void;

	public function get doubleClickEnabled() : Boolean;
	public function set doubleClickEnabled(value:Boolean) : void;

	public function get focusTarget() : UIComponent;
	public function set focusTarget(value:UIComponent) : void;


	public function validateNow(event:Event=null) : void;

	public function handleInput(event:InputEvent) : void;

}