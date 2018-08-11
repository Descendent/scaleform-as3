import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.utils.getDefinitionByName;
import scaleform.gfx.Extensions;
import scaleform.clik.constants.ConstrainMode;
import scaleform.clik.constants.InputValue;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.constants.NavigationCode;
import scaleform.clik.controls.TextInput;
import scaleform.clik.events.ComponentEvent;
import scaleform.clik.events.InputEvent;
import scaleform.clik.interfaces.IScrollBar;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.utils.ConstrainedElement;
import scaleform.clik.utils.Constraints;
import scaleform.clik.utils.Padding;
/**
 * TextArea is an editable text field component that supports multi-line text and an optional ScrollBar. It is derived from the CLIK TextInput component and thus includes all of the functionality and properties of TextInput. TextArea also shares the same states as its parent component.
 
    <b>Inspectable Properties</b>
    The inspectable properties of the TextArea component are similar to TextInput with a couple of additions and the omission of the password property. The additions are related to the CLIK ScrollBar component:
    <ul>
        <li><i>text</i>: Sets the text of the textField.</li>
        <li><i>visible</i>: Hides the component if set to false.</li>
        <li><i>disabled</i>: Disables the component if set to true.</li>
        <li><i>editable</i>: Makes the TextInput non-editable if set to false.</li>
        <li><i>maxChars</i>: A number greater than zero limits the number of characters that can be entered in the textField.</li>
        <li><i>scrollBar</i>: Instance name of the CLIK ScrollBar component to use, or a linkage ID to the ScrollBar symbol – an instance will be created by the TextArea in this case.</li>
        <li><i>scrollPolicy</i>: When set to “auto” the scrollBar will only show if there is enough text to scroll. The ScrollBar will always display if set to “on”, and never display if set to “off”. This property only affects the component if a ScrollBar is assigned to it (see the scrollBar property).</li>
        <li><i>defaultText</i>: Text to display when the textField is empty. This text is formatted by the defaultTextFormat object, which is by default set to light gray and italics.</li>
        <li><i>actAsButton</i>: If true, then the TextArea will behave similar to a Button when not focused and support rollOver and rollOut states. Once focused via mouse press or tab, the TextArea reverts to its normal mode until focus is lost.</li>
        <li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li>
    </ul>

    <b>States</b>
    Like its parent, TextInput, the TextArea component supports three states based on its focused and disabled properties.
    <ul>
        <li>default or enabled state.</li>
        <li>focused state, typically a represented by a highlighted border around the textField.</li>
        <li>disabled state.</li>
    </ul>
*/
intrinsic class scaleform.clik.controls.TextArea extends TextInput
{
	public var _scrollPolicy : String;
	public var _position : int;
	public var _maxScroll : Number;
	public var _resetScrollPosition : Boolean;
	public var _scrollBarValue : Object;
	public var _autoScrollBar : Boolean;
	public var _thumbOffset : Object;
	public var _minThumbSize : uint;
	/** A reference to the IScrollBar associated with this TextArea. */
	public var _scrollBar : IScrollBar;
	/** A container within the TextArea that any auto-generated content will be attached to. */
	public var container : Sprite;

	public function get enabled() : Boolean;
	public function set enabled(value:Boolean) : void;

	/** The current scroll position of the TextArea. */
	public function get position() : int;
	public function set position(value:int) : void;

	public function get scrollBar() : Object;
	public function set scrollBar(value:Object) : void;

	public function get minThumbSize() : uint;
	public function set minThumbSize(value:uint) : void;

	public function get thumbOffset() : Object;
	public function set thumbOffset(value:Object) : void;

	/** The available width of the component, taking into account any auto-generated ScrollIndicators. */
	public function get availableWidth() : Number;

	/** The available height of the component. */
	public function get availableHeight() : Number;


	public function TextArea();

	public function preInitialize() : void;

	public function initialize() : void;

	/** @exclude */
	public function toString() : String;

	/** @exclude */
	public function handleInput(event:InputEvent) : void;

	/** 
         * Called to perform component configuration. configUI() is delayed one frame to allow sub-components to fully initialize, 
         * as some children may not have been initialized when this component’s constructor is called. Generally, any one-time 
         * configurations for this component or its children should occur here.
         */
	public function configUI() : void;

	/**
         * Draw the component after it has been invalidated.  Use this method to reflow component 
         * size and position, redraw data, etc. When appropriate, ensure that a call to 
         * {@code super.draw()} is made when extending a component and overriding this method.
         */
	public function draw() : void;

	/** Create the ScrollIndicator using _scrollBarValue, which may be a Class or a Instance Name. */
	public function createScrollBar() : void;

	/** Updates the position and size auto-generated ScrollIndicator based on the size of the TextArea component. */
	public function drawScrollBar() : void;

	/** Updates the scroll position and thumb size of the ScrollBar. */
	public function updateScrollBar() : void;

	public function updateText() : void;

	public function updateTextField() : void;

	public function handleScroll(event:Event) : void;

	public function blockMouseWheel(event:MouseEvent) : void;

	public function handleTextChange(event:Event) : void;

	public function onScroller(event:Event) : void;

}