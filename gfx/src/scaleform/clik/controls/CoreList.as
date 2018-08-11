import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.utils.getDefinitionByName;
import scaleform.gfx.MouseEventEx;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.core.UIComponent;
import scaleform.clik.data.DataProvider;
import scaleform.clik.events.InputEvent;
import scaleform.clik.events.ListEvent;
import scaleform.clik.events.ButtonEvent;
import scaleform.clik.interfaces.IDataProvider;
import scaleform.clik.interfaces.IListItemRenderer;
/**
 * An abstract class used to display a list of data, and set a selectedIndex (or indices). This class only manages data, and instantiating itemRenderers, but the sub-class must request the renderers and arrange them. It is sub-classed by the ScrollingList and TileList components.
 */
intrinsic class scaleform.clik.controls.CoreList extends UIComponent
{
	public var _selectedIndex : int;
	public var _newSelectedIndex : int;
	public var _dataProvider : IDataProvider;
	public var _labelField : String;
	public var _labelFunction : Function;
	public var _itemRenderer : Class;
	public var _itemRendererName : String;
	public var _renderers : Vector.;
	public var _usingExternalRenderers : Boolean;
	public var _totalRenderers : uint;
	public var _state : String;
	public var _newFrame : String;
	public var container : Sprite;

	public function get focusable() : Boolean;
	public function set focusable(value:Boolean) : void;

	public function get itemRendererName() : String;
	public function set itemRendererName(value:String) : void;

	/** Set the itemRenderer class. */
	public function get itemRenderer() : Class;
	public function set itemRenderer(value:Class) : void;

	public function set itemRendererInstanceName(value:String) : void;

	/**
         * Set a list of external MovieClips to use as renderers, instead of auto-generating the renderers at run-time. 
         * The rendererInstance property uses this method to set the renderer list.
         */
	public function set itemRendererList(value:Vector.<IListItemRenderer>) : void;

	/**
         * The index of the item that is selected in a single-selection list.
         */
	public function get selectedIndex() : int;
	public function set selectedIndex(value:int) : void;

	public function get enabled() : Boolean;
	public function set enabled(value:Boolean) : void;

	/**
         * The data model displayed in the component. The dataProvider must implement the 
         * {@code IDataProvider} interface. When a new DataProvider is set, the {@code selectedIndex}
         * property will be reset to 0.
         * @see DataProvider
         * @see IDataProvider
         */
	public function get dataProvider() : IDataProvider;
	public function set dataProvider(value:IDataProvider) : void;

	/**
         * The name of the field in the {@code dataProvider} model to be displayed as the label for itemRenderers.  
         * A {@code labelFunction} will be used over a {@code labelField} if it is defined.
         * @see #itemToLabel
         */
	public function get labelField() : String;
	public function set labelField(value:String) : void;

	/**
         * The function used to determine the label for itemRenderers. A {@code labelFunction} will override a 
         * {@code labelField} if it is defined.
         * @see #itemToLabel
         */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : void;

	/**
         * The amount of the component's width that can be used for renderers.
         * This can be overridden to accommodate padding or ScrollBars.
         */
	public function get availableWidth() : Number;

	/**
         * The amount of the component's height that can be used for renderers. 
         * This can be overridden to accommodate padding or ScrollBars
         */
	public function get availableHeight() : Number;


	public function CoreList();

	public function initialize() : void;

	public function scrollToIndex(index:uint) : void;

	public function scrollToSelected() : void;

	public function itemToLabel(item:Object) : String;

	/** 
         * Retrieve a reference to an IListItemRenderer of the List.
         * @param index The index of the renderer.
         * @param offset An offset from the original scrollPosition (normally, the scrollPosition itself).
         */
	public function getRendererAt(index:uint, offset:int=0) : IListItemRenderer;

	/** Mark the item renderers as invalid and schedule a draw() on next Stage.INVALIDATE event. */
	public function invalidateRenderers() : void;

	/** Mark the selectedIndex as invalid and schedule a draw() on next Stage.INVALIDATE event. */
	public function invalidateSelectedIndex() : void;

	/** @exclude */
	public function toString() : String;

	public function configUI() : void;

	public function draw() : void;

	public function changeFocus() : void;

	public function refreshData() : void;

	public function updateSelectedIndex() : void;

	public function calculateRendererTotal(width:Number, height:Number) : uint;

	public function drawLayout() : void;

	public function drawRenderers(total:Number) : void;

	public function createRenderer(index:uint) : IListItemRenderer;

	public function setupRenderer(renderer:IListItemRenderer) : void;

	public function cleanUpRenderer(renderer:IListItemRenderer) : void;

	public function dispatchItemEvent(event:Event) : Boolean;

	public function handleDataChange(event:Event) : void;

	public function handleItemClick(event:ButtonEvent) : void;

	public function handleMouseWheel(event:MouseEvent) : void;

	public function scrollList(delta:int) : void;

	public function setState(...states:Array) : void;

}