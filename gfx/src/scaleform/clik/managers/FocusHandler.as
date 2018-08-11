import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.display.MovieClip;
import flash.display.Stage;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.utils.Dictionary;
import scaleform.gfx.FocusManager;
import scaleform.gfx.Extensions;
import scaleform.gfx.FocusEventEx;
import scaleform.gfx.SystemEx;
import scaleform.clik.constants.FocusMode;
import scaleform.clik.core.CLIK;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.InputEvent;
import scaleform.clik.events.FocusHandlerEvent;
import scaleform.clik.constants.InputValue;
import scaleform.clik.constants.NavigationCode;
import scaleform.clik.ui.InputDetails;
import scaleform.clik.utils.WeakRefDictionary;
/**
 * Manage focus between the components.  Intercept focus from the player, and hand it off to the "focused" component through the display-list hierarchy using a bubbling approach. Focus can be interupted or handled on every level.
 */
intrinsic class scaleform.clik.managers.FocusHandler
{
	static public var initialized : Boolean;
	static public var instance : FocusHandler;
	public var _stage : Stage;
	/** Dctionary of weak references to what holds focus within the CLIK FocusHandler framework. */
	public var currentFocusLookup : WeakRefDictionary;
	/** Dctionary of weak references to what the FocusHandler believes "stage.focus" currently references. */
	public var actualFocusLookup : WeakRefDictionary;
	/** Internal boolean for tracking whether to prevent the stage from changing its focus. */
	public var preventStageFocusChanges : Boolean;
	public var mouseDown : Boolean;

	public function set stage(value:Stage) : void;


	static public function getInstance() : FocusHandler;

	static public function init(stage:Stage, component:UIComponent) : void;

	public function FocusHandler();

	public function getFocus(index:uint) : DisplayObject;

	public function setFocus(focus:DisplayObject, focusGroupIdx:uint = 0, mouseChange:Boolean = false) : void;

	public function setSystemFocus(newFocus:InteractiveObject, controllerIdx:uint = 0) : void;

	public function getSystemFocus(controllerIdx:uint = 0) : InteractiveObject;

	public function clearFocusPrevention(e:Event) : void;

	public function input(details:InputDetails) : void;

	public function trackMouseDown(e:MouseEvent) : void;

	public function handleInput(event:InputEvent) : void;

	public function handleMouseFocusChange(event:FocusEvent) : void;

	public function handleFocusChange(oldFocus:InteractiveObject, newFocus:InteractiveObject, event:FocusEvent) : void;

	public function updateActualFocus(event:FocusEvent) : void;

	public function handleTextFieldInput(nav:String, controllerIdx:uint) : Boolean;

}