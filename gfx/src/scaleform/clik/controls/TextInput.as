import flash.display.InteractiveObject;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldType;
import scaleform.gfx.FocusManager;
import scaleform.gfx.MouseEventEx;
import scaleform.gfx.Extensions;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.constants.InputValue;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.ComponentEvent;
import scaleform.clik.events.InputEvent;
import scaleform.clik.managers.FocusHandler;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.utils.Constraints;
import scaleform.clik.constants.ConstrainMode;
/**
 *  TextInput is an editable text field component used to capture textual user input. Similar to the Label, this component is merely a wrapper for a standard textField, and therefore supports the same capabilities of the textField such as password mode, maximum number of characters and HTML text. Only a handful of these properties are exposed by the component itself, while the rest can be modified by directly accessing the TextInput’s textField instance.
    
    The TextInput component should be used for input, since noneditable text can be displayed using the Label. Similar to the Label, developers may substitute standard textFields for TextInput components based on their requirements. However, when developing sophisticated UIs, especially for PC applications, the TextInput component provides valuable extended capabilities over the standard textField.
   
    For starters, TextInput supports the focused and disabled state, which are not easily achieved with the standard textField. Due to the separated focus state, TextInput can support custom focus indicators, which are not included with the standard textField. Complex AS2 code is required to change the visual style of a standard textField, while the TextInput visual style can be configured easily on the timeline. The TextInput inspectable properties provide an easy workflow for designers and programmers who are not familiar with Flash Studio. Developers can also easily listen for events fired by the TextInput to create custom behaviors. 
    
    The TextInput also supports the standard selection and cut, copy, and paste functionality provided by the textField, including multi paragraph HTML formatted text. By default, the keyboard commands are select (Shift+Arrows), cut (Shift+Delete), copy (Ctrl+Insert), and paste (Shift+Insert).
    
     <b>Inspectable Properties</b>
    The inspectable properties of the TextInput component are:
    <ul>
        <li><i>text</i>: Sets the text of the textField.</li>
        <li><i>enabled</i>: Disables the component if set to false.</li>
        <li><i>focusable</i>: By default buttons receive focus for user interactions. Setting this property to false will disable focus acquisition.</li>
        <li><i>editable</i>: Makes the TextInput non-editable if set to false.</li>
        <li><i>maxChars</i>: A number greater than zero limits the number of characters that can be entered in the textField.</li>
        <li><i>password</i>: If true, sets the textField to display '*' characters instead of the real characters. The value of the textField will be the real characters entered by the user – returned by the text property.</li>
        <li><i>defaultText</i>: Text to display when the textField is empty. This text is formatted by the defaultTextFormat object, which is by default set to light gray and italics.</li>
        <li><i>actAsButton</i>: If true, then the TextInput will behave similar to a Button when not focused and support rollOver and rollOut states. Once focused via mouse press or tab, the TextInput reverts to its normal mode until focus is lost.</li>
        <li><i>visible</i>: Hides the component if set to false.</li>
    </ul>
        
    <b>States</b>
    The CLIK TextInput component supports three states based on its focused and disabled properties. <ul>
    <li>default or enabled state.</li>
    <li>focused state, typically a represented by a highlighted border around the textField.</li>
    <li>disabled state.</li></ul>
 */
intrinsic class scaleform.clik.controls.TextInput extends UIComponent
{
	/** The text format used to display the default text. By default it is set to color:0xAAAAAA and italic:true. */
	public var defaultTextFormat : TextFormat;
	/** True if constraints are disabled for the component. Setting the disableConstraintsproperty to {@code disableConstraints=true} will remove constraints from the textfield. This is useful for components with timeline based textfield size tweens, since constraints break them due to a Flash quirk. */
	public var constraintsDisabled : Boolean;
	public var _text : String;
	public var _displayAsPassword : Boolean;
	public var _maxChars : uint;
	public var _editable : Boolean;
	public var _actAsButton : Boolean;
	public var _alwaysShowSelection : Boolean;
	public var _isHtml : Boolean;
	public var _state : String;
	public var _newFrame : String;
	public var _textFormat : TextFormat;
	public var _usingDefaultTextFormat : Boolean;
	public var _defaultText : String;
	private var hscroll : Number;
	public var textField : TextField;

	public function get enabled() : Boolean;
	public function set enabled(value:Boolean) : void;

	public function get focusable() : Boolean;
	public function set focusable(value:Boolean) : void;

	public function get text() : String;
	public function set text(value:String) : void;

	/**
         * The html text to be displayed by the label component.  This property assumes that localization has 
         * been handled externally.
         * @see #text For plain text use {@code text} property.
         */
	public function get htmlText() : String;
	public function set htmlText(value:String) : void;

	public function get defaultText() : String;
	public function set defaultText(value:String) : void;

	public function get displayAsPassword() : Boolean;
	public function set displayAsPassword(value:Boolean) : void;

	public function get maxChars() : uint;
	public function set maxChars(value:uint) : void;

	public function get editable() : Boolean;
	public function set editable(value:Boolean) : void;

	/** 
         * Override for .tabEnabled property to prevent users from changing the tabEnabled of the TextInput itself
         * and instead passes the change on to the textField. TextInput.tabEnabled must always be false for focus reasons.
         */
	public function get tabEnabled() : Boolean;
	public function set tabEnabled(value:Boolean) : void;

	/** 
         * Override for .tabIndex property to prevent users from changing the tabIndex of the TextInput itself 
         * and instead passes the change on to the textField. TextInput.tabIndex must always be -1 for focus reasons.
         */
	public function get tabIndex() : int;
	public function set tabIndex(value:int) : void;

	public function get actAsButton() : Boolean;
	public function set actAsButton(value:Boolean) : void;

	/**
         * When set to true and the text field is not in focus, the textField highlights the selection in the text 
         * field in gray
         */
	public function get alwaysShowSelection() : Boolean;
	public function set alwaysShowSelection(value:Boolean) : void;

	/**
         * The length of the text in the textField.
         */
	public function get length() : uint;

	public function get defaultState() : String;


	public function TextInput();

	public function preInitialize() : void;

	public function initialize() : void;

	/**
         * Append a new string to the existing text. The textField will be set to non-html rendering when this
         * method is invoked.
         */
	public function appendText(value:String) : void;

	/** 
         * Append a new html string to the existing text. The textField will be set to html rendering when this
         * method is invoked.
         */
	public function appendHtml(value:String) : void;

	/** @exclude */
	public function handleInput(event:InputEvent) : void;

	/** @exclude */
	public function toString() : String;

	public function configUI() : void;

	public function draw() : void;

	public function changeFocus() : void;

	public function updateTextField() : void;

	public function handleTextFieldFocusIn(e:FocusEvent) : void;

	public function updateText() : void;

	public function setState(...states:Array) : void;

	public function updateAfterStateChange() : void;

	public function handleRollOver(event:MouseEvent) : void;

	public function handleRollOut(event:MouseEvent) : void;

	public function handleMouseDown(event:MouseEvent) : void;

	public function handleTextChange(event:Event) : void;

}