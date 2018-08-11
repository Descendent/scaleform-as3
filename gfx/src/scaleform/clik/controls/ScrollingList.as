import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.utils.getDefinitionByName;
import scaleform.clik.constants.WrappingMode;
import scaleform.clik.controls.ScrollBar;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.data.ListData;
import scaleform.clik.events.InputEvent;
import scaleform.clik.interfaces.IScrollBar;
import scaleform.clik.interfaces.IListItemRenderer;
import scaleform.clik.constants.InputValue;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.constants.NavigationCode;
import scaleform.clik.utils.Padding;
/**
    The ScrollingList is a list component that can scroll its elements. It can instantiate list items by itself 
    or use existing list items on the stage. A ScrollIndicator or ScrollBar component can also be attached to this
    list component to provide scoll feedback and control. This component is populated via a DataProvider. The 
    dataProvider is assigned via code, as shown in the example below:
    <i>scrollingList.dataProvider = ["item1", "item2", "item3", "item4", ];</i>

    <b>Inspectable Properties</b>
    A MovieClip that derives from the ScrollingList component will have the following inspectable properties:
    <ul>
        <li><i>enabled</i>: Disables the component if set to false. This disables both the attached scrollbar and the list items (both internally created and external renderers).</li>
        <li><i>focusable</i>: By default, ScrollingList can receive focus for user interactions. Setting this property to false will disable focus acquisition.</li>
        <li><i>itemRenderer</i>: The symbol name of the ListItemRenderer. Used to create list item instances internally. Has no effect if the rendererInstanceName property is set.</li>
        <li><i>rendererInstanceName</i>: Prefix of the external list item renderers to use with this ScrollingList component. The list item instances on the stage must be prefixed with this property value. If this property is set to the value ‘r’, then all list item instances to be used with this component must have the following values: ‘r1’, ‘r2’, ‘r3’,… The first item should have the number 1.</li>
        <li><i>margin</i>: The margin between the boundary of the list component and the list items created internally. This value has no effect if the rendererInstanceName property is set. This margin also affects the automatically generated scrollbar.</li>
        <li><i>rowHeight</i>: The height of list item instances created internally. This value has no effect if the rendererInstanceName property is set.</li>
        <li><i>padding:</i> Extra padding at the top, bottom, left, and right for the list items. This value has no effect if the rendererInstanceName property is set. Does not affect the automatically generated scrollbar.</li>
        <li><i>thumbOffset:</i> ScrollIndicator thumb offset for top and bottom. Passed through to ScrollIndicator. This property has no effect if the list does not automatically create a scrollbar instance.</li>
        <li><i>thumbSizeFactor:</i> Page size factor for the scrollbar thumb. A value greater than 1.0 will increase the thumb size by the given factor. This positive value has no effect if a scrollbar is not attached to the list.</li>
        <li><i>scrollBar</i>: Instance name of a ScrollBar component on the stage or a symbol name. If an instance name is specified, then the ScrollingList will hook into that instance. If a symbol name is specified, an instance of the symbol will be created by the ScrollingList.</li>
        <li><i>visible</i>: Hides the component if set to false. This does not hide the attached scrollbar or any external list item renderers.</li>
    </ul>
    
    <b>States</b>
    The ScrollingList component supports three states based on its focused and disabled properties.
    <ul>
        <li>default or enabled state.</li>
        <li>focused state, that typically highlights the component’s border area.</li>
        <li>disabled state.</li>
    </ul>
    
    <b>Events</b>
    All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
    <li><i>type</i>: The event type.</li>
    <li><i>target</i>: The target that generated the event.</li></ul>
    
    <ul>
        <li><i>ComponentEvent.SHOW</i>: The visible property has been set to true at runtime.</li>
        <li><i>ComponentEvent.HIDE</i>: The visible property has been set to false at runtime.</li>
        <li><i>FocusHandlerEvent.FOCUS_IN</i>: The button has received focus.</li>
        <li><i>FocusHandlerEvent.FOCUS_OUT</i>: The button has lost focus.</li>
        <li><i>ComponentEvent.STATE_CHANGE</i>: The button's state has changed.</li>
        <li><i>ListEvent.ITEM_PRESS</i>: A list item has been pressed down.</li>
        <li><i>ListEvent.ITEM_CLICK</i>: A list item has been clicked.</li>
        <li><i>ListEvent.ITEM_ROLL_OVER</i>: The mouse cursor has rolled over a list item.</li>
        <li><i>ListEvent.ITEM_ROLL_OUT</i>: The mouse cursor has rolled out of a list item.</li>
        <li><i>ListEvent.ITEM_DOUBLE_CLICK</i>: The mouse cursor has been double clicked on a list item.</li>
        <li><i>ListEvent.INDEX_CHANGE</i>: The selected index has changed.</li>
    </ul>
 */
intrinsic class scaleform.clik.controls.ScrollingList extends CoreList
{
	public var wrapping : String;
	/** ScrollIndicator thumb offset for top and bottom. Passed through to ScrollIndicator. This property has no effect if the list does not automatically create a scrollbar instance. */
	public var thumbOffset : Object;
	/** Page size factor for the scrollbar thumb. A value greater than 1.0 will increase the thumb size by the given factor. This positive value has no effect if a scrollbar is not attached to the list. */
	public var thumbSizeFactor : Number;
	public var _rowHeight : Number;
	public var _autoRowHeight : Number;
	public var _rowCount : Number;
	public var _scrollPosition : uint;
	public var _autoScrollBar : Boolean;
	public var _scrollBarValue : Object;
	public var _margin : Number;
	public var _padding : Padding;
	public var _scrollBar : IScrollBar;

	public function get margin() : Number;
	public function set margin(value:Number) : void;

	/** 
         * Extra padding at the top, bottom, left, and right for the list items. Does not affect the automatically generated scrollbar. 
         */
	public function get padding() : Padding;
	public function set padding(value:Padding) : void;

	public function set inspectablePadding(value:Object) : void;

	public function get scrollBar() : Object;
	public function set scrollBar(value:Object) : void;

	/**
         * The vertical scroll position of the list.
         */
	public function get scrollPosition() : Number;
	public function set scrollPosition(value:Number) : void;

	/**
         * The selected index of the {@code dataProvider}.  The {@code itemRenderer} at the {@code selectedIndex}
         * will be set to {@code selected=true}.
         */
	public function set selectedIndex(value:int) : void;

	/**
         * The amount of visible rows.  Setting this property will immediately change the height of the component
         * to accomodate the specified amount of rows. The {@code rowCount} property is not stored or maintained.
         */
	public function get rowCount() : uint;
	public function set rowCount(value:uint) : void;

	public function get rowHeight() : Number;
	public function set rowHeight(value:Number) : void;

	/** Retireve the available width of the component. */
	public function get availableWidth() : Number;

	/** Retrieve the available height of the component (internal height - margin). */
	public function get availableHeight() : Number;


	public function ScrollingList();

	public function initialize() : void;

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

	public function drawLayout() : void;

	public function createScrollBar() : void;

	public function drawScrollBar() : void;

	public function updateScrollBar() : void;

	public function changeFocus() : void;

	public function refreshData() : void;

	public function updateSelectedIndex() : void;

	public function calculateRendererTotal(width:Number, height:Number) : uint;

	public function handleScroll(event:Event) : void;

	public function populateData(data:Array) : void;

	public function scrollList(delta:int) : void;

	public function blockMouseWheel(event:MouseEvent) : void;

}