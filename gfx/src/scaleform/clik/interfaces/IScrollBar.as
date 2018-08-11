import flash.geom.Rectangle;
/**
 * The public interface that all ScrollBars must expose to be used with other CLIK components.
 */
interface scaleform.clik.interfaces.IScrollBar extends IUIComponent
{
	public function get position() : Number;
	public function set position(value:Number) : void;


}