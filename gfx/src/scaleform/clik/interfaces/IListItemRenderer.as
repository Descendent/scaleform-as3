import flash.display.Sprite;
import scaleform.clik.core.UIComponent;
import scaleform.clik.data.ListData;
/**
 * The public interface that all item renderers must expose to be used in a list-type component, such as ScrollingList, TileList, etc. Note that this interface is not implemented in the existing components, and does not need to be implemented, it is just a reference.
 */
interface scaleform.clik.interfaces.IListItemRenderer extends IUIComponent
{
	public function get index() : uint;
	public function set index(value:uint) : void;

	public function get owner() : UIComponent;
	public function set owner(value:UIComponent) : void;

	public function get selectable() : Boolean;
	public function set selectable(value:Boolean) : void;

	public function get selected() : Boolean;
	public function set selected(value:Boolean) : void;

	public function get displayFocus() : Boolean;
	public function set displayFocus(value:Boolean) : void;


	public function setListData(listData:ListData) : void;

	public function setData(data:Object) : void;

}