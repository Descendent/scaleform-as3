import flash.display.Sprite;
import flash.events.Event;
import scaleform.clik.interfaces.IDragSlot;
/**
 *  Event structure and defintions for the CLIK DragManager: 
 *  Valid types:
 *      DRAG_START - "dragStart"
 *      DRAG_END - "dragEnd"
 *      DROP - "drop"
 */
intrinsic class scaleform.clik.events.DragEvent extends Event
{
	public var dragData : Object;
	public var dragTarget : IDragSlot;
	public var dropTarget : IDragSlot;
	public var dragSprite : Sprite;
	static public var DROP : String;
	static public var DRAG_START : String;
	static public var DRAG_END : String;

	public function DragEvent(type:String, data:Object, drag:IDragSlot, drop:IDragSlot, sprite:Sprite, bubbles:Boolean = true, cancelable:Boolean = true);

}