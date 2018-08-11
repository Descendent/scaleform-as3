import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.utils.getDefinitionByName;
import scaleform.clik.constants.DirectionMode;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.constants.InputValue;
import scaleform.clik.constants.NavigationCode;
import scaleform.clik.constants.WrappingMode;
import scaleform.clik.controls.ScrollBar;
import scaleform.clik.data.ListData;
import scaleform.clik.events.InputEvent;
import scaleform.clik.interfaces.IScrollBar;
import scaleform.clik.interfaces.IListItemRenderer;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.utils.Padding;
intrinsic class scaleform.clik.controls.TileList extends CoreList
{
	public var wrapping : String;
	/** ScrollIndicator thumb offset for top and bottom. Passed through to ScrollIndicator. This property has no effect if the list does not automatically create a scrollbar instance. */
	public var thumbOffset : Object;
	/** Page size factor for the scrollbar thumb. A value greater than 1.0 will increase the thumb size by the given factor. This positive value has no effect if a scrollbar is not attached to the list. */
	public var thumbSizeFactor : Number;
	public var externalColumnCount : Number;
	public var _rowHeight : Number;
	public var _autoRowHeight : Number;
	public var _totalRows : Number;
	public var _columnWidth : Number;
	public var _autoColumnWidth : Number;
	public var _totalColumns : uint;
	public var _scrollPosition : uint;
	public var _autoScrollBar : Boolean;
	public var _scrollBarValue : Object;
	public var _margin : Number;
	public var _padding : Padding;
	public var _direction : String;
	public var _siWidth : Number;
	public var _scrollBar : IScrollBar;

	public function get scrollBar() : Object;
	public function set scrollBar(value:Object) : void;

	public function get rowHeight() : Number;
	public function set rowHeight(value:Number) : void;

	public function get columnWidth() : Number;
	public function set columnWidth(value:Number) : void;

	/**
         * The amount of visible rows.  Setting this property will immediately change the height of the component
         * to accomodate the specified amount of rows. The {@code rowCount} property is not stored or maintained.
         */
	public function get rowCount() : uint;
	public function set rowCount(value:uint) : void;

	/**
         * Set the width of the component to accommodate the number of columns specified.
         */
	public function get columnCount() : uint;
	public function set columnCount(value:uint) : void;

	public function get direction() : String;
	public function set direction(value:String) : void;

	/**
         * The selected index of the {@code dataProvider}.  The {@code itemRenderer} at the {@code selectedIndex}
         * will be set to {@code selected=true}.
         */
	public function set selectedIndex(value:int) : void;

	public function get margin() : Number;
	public function set margin(value:Number) : void;

	/** 
         * Extra padding at the top, bottom, left, and right for the list items. Also affects any automatically generated ScrollBars.
         * This value has no effect if the rendererInstanceName property is set. 
         */
	public function get padding() : Padding;
	public function set padding(value:Padding) : void;

	public function set inspectablePadding(value:Object) : void;

	/** Retireve the available width of the component. */
	public function get availableWidth() : Number;

	/** Retrieve the available height of the component. */
	public function get availableHeight() : Number;

	/** The scroll position of the list. */
	public function get scrollPosition() : Number;
	public function set scrollPosition(value:Number) : void;


	public function TileList();

	public function initialize() : void;

	/** 
         * Retrieve a reference to an IListItemRenderer of the List.
         * @param index The index of the renderer.
         * @param offset An offset from the original scrollPosition (normally, the scrollPosition itself).
         */
	public function getRendererAt(index:uint, offset:int=0) : IListItemRenderer;

	/**
         * Scroll the list to the specified index.  If the index is currently visible, the position will not change. The scroll position will only change the minimum amount it has to to display the item at the specified index.
         * @param index The index to scroll to.
         */
	public function scrollToIndex(index:uint) : void;

	/** @exclude */
	public function handleInput(event:InputEvent) : void;

	/** @exclude */
	public function toString() : String;

	public function configUI() : void;

	public function draw() : void;

	public function createScrollBar() : void;

	public function calculateRendererTotal(width:Number, height:Number) : uint;

	public function updateSelectedIndex() : void;

	public function refreshData() : void;

	public function drawLayout() : void;

	public function changeFocus() : void;

	public function populateData(data:Array) : void;

	public function drawScrollBar() : void;

	public function updateScrollBar() : void;

	public function handleScroll(event:Event) : void;

	public function scrollList(delta:int) : void;

	public function blockMouseWheel(event:MouseEvent) : void;

}