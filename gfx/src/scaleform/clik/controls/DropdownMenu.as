import flash.display.MovieClip;
import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;
import flash.system.ApplicationDomain;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.constants.InputValue;
import scaleform.clik.constants.NavigationCode;
import scaleform.clik.constants.WrappingMode;
import scaleform.clik.controls.Button;
import scaleform.clik.data.DataProvider;
import scaleform.clik.events.InputEvent;
import scaleform.clik.events.ListEvent;
import scaleform.clik.interfaces.IDataProvider;
import scaleform.clik.managers.PopUpManager;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.utils.Padding;
/**
 * The DropdownMenu wraps the behavior of a button and a list. Clicking on this component opens a list that contains the elements to be selected. The DropdownMenu displays only the selected element in its idle state. It can be configured to use either the ScrollingList or the TileList, to which either a ScrollBar or ScrollIndicator can be paired with. The list is populated via an installed DataProvider. The DropdownMenu’s list element is populated via a DataProvider. The dataProvider is assigned via code, as shown in the example below:
    <i>dropdownMenu.dataProvider = ["item1", "item2", "item3", "item4"];</i>

    <b>Inspectable Properties</b>
    The inspectable properties of the DropdownMenu component are:<ul>
    <li><i>autoSize</i>: Determines if the button will scale to fit the text that it contains and which direction to align the resized button. Setting the autoSize property to {@code autoSize="none"} will leave its current size unchanged.</li>
    <li><i>dropdown</i>: Symbol name of the list component (ScrollingList or TileList) to use with the DropdownMenu component.</li>
    <li><i>enabled</i>: Disables the button if set to false.</li>
    <li><i>focusable</i>: By default buttons receive focus for user interactions. Setting this property to false will disable focus acquisition.</li>
    <li><i>menuDirection:</i>The list open direction. Valid values are "up" and "down".</li>
    <li><i>menuMargin</i>: The margin between the boundary of the list component and the list items created internally. This margin also affects the automatically generated scrollbar.</li>
    <li><i>menuOffset</i>: Horizontal and vertical offsets of the dropdown list from the dropdown button position. A positive horizontal value moves the list to the right of the dropdown button horizontal position. A positive vertical value moves the list away from the button.</li>
    <li><i>menuPadding</i>: Extra padding at the top, bottom, left, and right for the list items. Does not affect the automatically generated scrollbar.</li>
    <li><i>menuRowCount</i>: The number of rows that the list should display.</li>
    <li><i>menuWidth</i>: If set, this number will be enforced as the width of the menu.</li> 
    <li><i>thumbOffset</i>: Scrollbar thumb top and bottom offsets. This property has no effect if the list does not automatically create a scrollbar instance.</li>
    <li><i>scrollBar</i>: Symbol name of the dropdown list’s scroll bar. Created by the dropdown list instance. If value is empty, then the dropdown list will have no scroll bar.</li>
    <li><i>visible</i>: Hides the component if set to false.</li>
    
    <b>States</b>
    The DropdownMenu is toggled when opened, and therefore needs the same states as a ToggleButton or CheckBox that denote the selected state. These states include <ul>
    <li>an up or default state.</li>
    <li>an over state when the mouse cursor is over the component, or when it is focused.</li>
    <li>a down state when the button is pressed.</li>
    <li>a disabled state.</li>
    <li>a selected_up or default state.</li>
    <li>a selected_over state when the mouse cursor is over the component, or when it is focused.</li>
    <li>a selected_down state when the button is pressed.</li>
    <li>a selected_disabled state.</li></ul>
    
    <b>Events</b>
    All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
    <li><i>type</i>: The event type.</li>
    <li><i>target</i>: The target that generated the event.</li></ul>
    
    <ul>
        <li><i>ComponentEvent.SHOW</i>: The visible property has been set to true at runtime.</li>
        <li><i>ComponentEvent.HIDE</i>: The visible property has been set to false at runtime.</li>
        <li><i>FocusHandlerEvent.FOCUS_IN</i>: The component has received focus.</li>
        <li><i>FocusHandlerEvent.FOCUS_OUT</i>: The component has lost focus.</li>
        <li><i>Event.SELECT</i>: The selected property has changed.</li>
        <li><i>ButtonEvent.PRESS</i>: The button has been pressed.</li>
        <li><i>ButtonEvent.CLICK</i>: The button has been clicked.</li>
        <li><i>ButtonEvent.DRAG_OVER</i>: The mouse cursor has been dragged over the button (while the left mouse button is pressed).</li>
        <li><i>ButtonEvent.DRAG_OUT</i>: The mouse cursor has been dragged out of the button (while the left mouse button is pressed).</li>
        <li><i>ButtonEvent.RELEASE_OUTSIDE</i>: The mouse cursor has been dragged out of the button and the left mouse button has been released.</li>
        <li><i>ListEvent.INDEX_CHANGE</i>: The selected index has changed.</li>
    </ul>
 */
intrinsic class scaleform.clik.controls.DropdownMenu extends Button
{
	public var dropdown : Object;
	public var itemRenderer : Object;
	public var scrollBar : Object;
	public var menuWrapping : String;
	public var menuDirection : String;
	public var menuWidth : Number;
	public var menuMargin : Number;
	public var menuRowCount : Number;
	public var menuRowsFixed : Boolean;
	public var menuPadding : Padding;
	public var menuOffset : Padding;
	public var thumbOffsetTop : Number;
	public var thumbOffsetBottom : Number;
	public var _selectedIndex : int;
	public var _dataProvider : IDataProvider;
	public var _labelField : String;
	public var _labelFunction : Function;
	public var _popup : MovieClip;
	private var _dropdownRef : MovieClip;

	public function get autoRepeat() : Boolean;
	public function set autoRepeat(value:Boolean) : void;

	public function get data() : Object;
	public function set data(value:Object) : void;

	public function get label() : String;
	public function set label(value:String) : void;

	public function get selected() : Boolean;
	public function set selected(value:Boolean) : void;

	public function get toggle() : Boolean;
	public function set toggle(value:Boolean) : void;

	public function set inspectableMenuPadding(value:Object) : void;

	public function set inspectableMenuOffset(value:Object) : void;

	public function set inspectableThumbOffset(value:Object) : void;

	public function get focusable() : Boolean;
	public function set focusable(value:Boolean) : void;

	/**
         * The index of the item that is selected in a single-selection list. The DropdownMenu will always have 
         * a {@code selectedIndex} of 0 or greater, unless there is no data.
         */
	public function get selectedIndex() : int;
	public function set selectedIndex(value:int) : void;

	/**
         * The data model displayed in the component. The dataProvider can be an Array or any object exposing the 
         * appropriate API, defined in the {@code IDataProvider} interface. If an Array is set as the 
         * {@code dataProvider}, functionality will be mixed into it by the {@code DataProvider.initialize} method. 
         * When a new DataProvider is set, the {@code selectedIndex} property will be reset to 0.
         * @see DataProvider
         * @see IDataProvider
         */
	public function get dataProvider() : IDataProvider;
	public function set dataProvider(value:IDataProvider) : void;

	/**
         * The name of the field in the {@code dataProvider} to be displayed as the label for the TextInput field.
         * A {@code labelFunction}  will be used over a {@code labelField} if it is defined.
         * @see #itemToLabel()
         */
	public function get labelField() : String;
	public function set labelField(value:String) : void;

	/**
         * The function used to determine the label for an item. A {@code labelFunction} will override a 
         * {@code labelField} if it is defined.
         * @see #itemToLabel()
         */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : void;


	/**
         * The constructor is called when a DropdownMenu or a sub-class of DropdownMenu is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend DropdownMenu, ensure that a {@code super()} call is made first in the constructor.
         */
	public function DropdownMenu();

	public function initialize() : void;

	/**
         * Convert an item to a label string using the {@code labelField} and {@code labelFunction}.
         * @param item The item to convert to a label.
         * @returns The converted label string.
         * @see #labelField
         * @see #labelFunction
         */
	public function itemToLabel(item:Object) : String;

	/**
         * Open the dropdown list. The {@code selected} and {@code isOpen} properties of the DropdownMenu are 
         * set to {@code true} when open. Input will be passed to the dropdown when it is open before it is 
         * handled by the DropdownMenu.
         */
	public function open() : void;

	/**
         * Close the dropdown list. The list is not destroyed, the {@code visible} property is set to {@code false}. 
         * The {@code selected} property of the DropdownMenu is set to {@code false} when closed.
         */
	public function close() : void;

	/** Mark the selectedIndex as invalid and schedule a draw() on next Stage.INVALIDATE event. */
	public function invalidateSelectedIndex() : void;

	/** @exclude */
	public function handleInput(event:InputEvent) : void;

	/** @exclude */
	public function toString() : String;

	public function draw() : void;

	public function changeFocus() : void;

	public function handleClick(controllerIndex:uint = 0) : void;

	public function handleDataChange(event:Event) : void;

	public function populateText(item:Object) : void;

	public function updateLabel(item:Object) : void;

	public function handleStageClick(event:MouseEvent) : void;

	public function showDropdown() : void;

	public function hideDropdown() : void;

	public function handleMenuItemClick(e:ListEvent) : void;

}