﻿import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import scaleform.gfx.FocusEventEx;
import scaleform.gfx.MouseEventEx;
import scaleform.clik.constants.ConstrainMode;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.constants.ControllerType;
import scaleform.clik.constants.InputValue;
import scaleform.clik.constants.NavigationCode;
import scaleform.clik.core.UIComponent;
import scaleform.clik.data.DataProvider;
import scaleform.clik.events.InputEvent;
import scaleform.clik.events.ButtonEvent;
import scaleform.clik.events.ComponentEvent;
import scaleform.clik.events.IndexEvent;
import scaleform.clik.interfaces.IDataProvider;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.utils.Constraints;
import scaleform.clik.utils.ConstrainedElement;
/**
 *  The OptionStepper component, similar to the NumericStepper, displays a single value, but is capable of displaying 
    more than just numbers. It uses a DataProvider instance to query for the current value, therefore is able to support
    an arbitrary number of elements of different types. The dataProvider is assigned via code, as shown in the example 
    below:
    <i>optionStepper.dataProvider = [“item1”, “item2”, “item3”, “item4”, “item5”];</i>
    
    <b>Inspectable Properties</b>
    A MovieClip that derives from the OptionStepper component will have the following inspectable properties:
    <ul>
        <li><i>enabled</i>: Disables the component if set to false.</li>
        <li><i>focusable</i>: By default buttons receive focus for user interactions. Setting this property to false will disable focus acquisition.</li>
        <li><i>visible</i>: Hides the component if set to false.</li>
    </ul>
    
    <b>States</b>
    The OptionStepper component supports three states based on its focused and disabled properties.
    <ul>
        <li>default or enabled state.</li>
        <li>focused state, that highlights the textField area.</li>
        <li>disabled state.</li>
    </ul>
    
    <b>Events</b>
    All event callbacks receive a single Event parameter that contains relevant information about the event. The following properties are common to all events. <ul>
    <li><i>type</i>: The event type.</li>
    <li><i>target</i>: The target that generated the event.</li></ul>
        
    The events generated by the OptionStepper component are listed below. The properties listed next to the event are provided in addition to the common properties.
    <ul>
        <li><i>ComponentEvent.SHOW</i>: The visible property has been set to true at runtime.</li>
        <li><i>ComponentEvent.HIDE</i>: The visible property has been set to false at runtime.</li>
        <li><i>ComponentEvent.STATE_CHANGE</i>: The component's state has changed.</li>
        <li><i>FocusHandlerEvent.FOCUS_IN</i>: The component has received focus.</li>
        <li><i>FocusHandlerEvent.FOCUS_OUT</i>: The component has lost focus.</li>
        <li><i>IndexEvent.INDEX_CHANGE</i>: The OptionStepper's value has changed.</li>
    </ul>
 */
intrinsic class scaleform.clik.controls.OptionStepper extends UIComponent
{
	/** A reference to the currently selected item in the dataProvider. */
	public var selectedItem : Object;
	public var _dataProvider : IDataProvider;
	public var _selectedIndex : Number;
	public var _newSelectedIndex : int;
	public var _labelField : String;
	public var _labelFunction : Function;
	public var _state : String;
	public var _newFrame : String;
	public var _constraintsDisabled : Boolean;
	/** A reference to the textField instance used to display the selected item's label. Note that when state changes are made, the textField instance may change, so changes made to it externally may be lost. */
	public var textField : TextField;
	/** A reference to the next button instance used to increment the {@code selectedIndex}. */
	public var nextBtn : Button;
	/** A reference to the previous button instance used to decrement the {@code selectedIndex}. */
	public var prevBtn : Button;

	public function get enabled() : Boolean;
	public function set enabled(value:Boolean) : void;

	public function get focusable() : Boolean;
	public function set focusable(value:Boolean) : void;

	/**
         * The data model displayed in the component. The dataProvider can be an Array or any object exposing the 
         * appropriate API, defined in the {@code IDataProvider} interface. If an Array is set as the dataProvider, 
         * functionality will be mixed into it by the {@code DataProvider.initialize} method. When a new DataProvider 
         * is set, the {@code selectedIndex} property will be reset to 0.
         * @see DataProvider#initialize
         * @see IDataProvider
         */
	public function get dataProvider() : IDataProvider;
	public function set dataProvider(value:IDataProvider) : void;

	/**
         * The index of the item in the {@code dataProvider} that is selected in a single-selection list.
         */
	public function get selectedIndex() : int;
	public function set selectedIndex(value:int) : void;

	/**
         * The name of the field in the {@code dataProvider} model to be displayed as the label in the TextInput
         * field.  A {@code labelFunction} will be used over a {@code labelField} if it is defined.
         * @see #itemToLabel
         */
	public function get labelField() : String;
	public function set labelField(value:String) : void;

	/**
         * The function used to determine the label for an item. A {@code labelFunction} will override a 
         * {@code labelField} if it is defined.
         * @see #itemToLabel
         */
	public function get labelFunction() : Function;
	public function set labelFunction(value:Function) : void;


	public function OptionStepper();

	public function preInitialize() : void;

	public function initialize() : void;

	/**
         * Convert an item to a label string using the {@code labelField} and {@code labelFunction}.
         * @param item The item to convert to a label.
         * @returns The converted label string.
         * @see #labelField
         * @see #labelFunction
         */
	public function itemToLabel(item:Object) : String;

	/** Mark the selectedIndex as invalid and schedule a draw() on next Stage.INVALIDATE event. */
	public function invalidateSelectedIndex() : void;

	/** @exclude */
	public function handleInput(event:InputEvent) : void;

	/** @exclude */
	public function toString() : String;

	public function configUI() : void;

	public function draw() : void;

	public function changeFocus() : void;

	public function updateSelectedIndex() : void;

	public function refreshData() : void;

	public function handleDataChange(event:Event) : void;

	public function updateAfterStateChange() : void;

	public function updateLabel() : void;

	public function updateSelectedItem() : void;

	public function populateText(item:Object) : void;

	public function onNext(event:Object) : void;

	public function onPrev(event:Object) : void;

	public function setState(...states:Array) : void;

}