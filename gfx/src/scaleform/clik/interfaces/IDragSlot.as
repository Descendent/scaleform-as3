import flash.display.Sprite;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.DragEvent;
/**
 * The public interface for all CLIK DragSlots and their subclasses.
 */
interface scaleform.clik.interfaces.IDragSlot extends IUIComponent
{
	public function get data() : Object;
	public function set data(value:Object) : void;

	public function get content() : Sprite;
	public function set content(value:Sprite) : void;


	public function handleDropEvent(e:DragEvent) : Boolean;

	public function handleDragStartEvent(e:DragEvent) : void;

	public function handleDragEndEvent(e:DragEvent, wasValidDrop:Boolean) : void;

}