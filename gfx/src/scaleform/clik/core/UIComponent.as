import flash.display.MovieClip;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.external.ExternalInterface;
import flash.system.Capabilities;
import flash.utils.getDefinitionByName;
import scaleform.gfx.FocusManager;
import scaleform.gfx.Extensions;
import scaleform.clik.core.CLIK;
import scaleform.clik.constants.InvalidationType;
import scaleform.clik.events.ComponentEvent;
import scaleform.clik.events.InputEvent;
import scaleform.clik.layout.Layout;
import scaleform.clik.layout.LayoutData;
import scaleform.clik.managers.FocusHandler;
import scaleform.clik.utils.Constraints;
/**
 *  The UIComponent is the basis for all components in the Scaleform framework. It contains functionality found in all components such as initialization, focus management, invalidation, sizing, and events.
 */
intrinsic class scaleform.clik.core.UIComponent extends MovieClip
{
	public var initialized : Boolean;
	public var _invalidHash : Object;
	public var _invalid : Boolean;
	public var _width : Number;
	public var _height : Number;
	public var _originalWidth : Number;
	public var _originalHeight : Number;
	public var _focusTarget : UIComponent;
	public var _focusable : Boolean;
	public var _focused : Number;
	public var _displayFocus : Boolean;
	public var _mouseWheelEnabled : Boolean;
	public var _inspector : Boolean;
	public var _labelHash : Object;
	public var _layoutData : LayoutData;
	public var _enableInitCallback : Boolean;
	public var constraints : Constraints;

	public function get componentInspectorSetting() : Boolean;
	public function set componentInspectorSetting(value:Boolean) : void;

	public function get width() : Number;
	public function set width(value:Number) : void;

	public function get height() : Number;
	public function set height(value:Number) : void;

	public function get scaleX() : Number;
	public function set scaleX(value:Number) : void;

	public function get scaleY() : Number;
	public function set scaleY(value:Number) : void;

	public function get enabled() : Boolean;
	public function set enabled(value:Boolean) : void;

	public function get visible() : Boolean;
	public function set visible(value:Boolean) : void;

	public function get hasFocus() : Boolean;

	/**
         * Enable/disable focus management for the component. Setting the focusable property to 
         * {@code focusable=false} will remove support for tab key, direction key and mouse
         * button based focus changes.
         */
	public function get focusable() : Boolean;
	public function set focusable(value:Boolean) : void;

	/**
         * Get and set the focus of the component.  This property is explicitly called by the FocusHandler 
         * when the stage or application focus is given to this component, but can also be set manually on 
         * the component to set or clear focus.  Currently, an application can have only a single focus. 
         * When the focus on a component changes, a "focusIn" or "focusOut" event is fired.
         */
	public function get focused() : Number;
	public function set focused(value:Number) : void;

	/**
         * Set the component to display itself as focused, even if it is not.  This property is used by container
         * components to make them appear focused.
         */
	public function get displayFocus() : Boolean;
	public function set displayFocus(value:Boolean) : void;

	public function get focusTarget() : UIComponent;
	public function set focusTarget(value:UIComponent) : void;

	public function get layoutData() : LayoutData;
	public function set layoutData(value:LayoutData) : void;

	public function get enableInitCallback() : Boolean;
	public function set enableInitCallback(value:Boolean) : void;

	public function get actualWidth() : Number;

	public function get actualHeight() : Number;

	public function get actualScaleX() : Number;

	public function get actualScaleY() : Number;


	public function UIComponent();

	public function preInitialize() : void;

	public function initialize() : void;

	static public function generateLabelHash(target:MovieClip) : Object;

	public function addedToStage(event:Event) : void;

	/**
         * Sets the width and height of the component at the same time using internal sizing mechanisms.
         * @param width The new width of the component.
         * @param height The new height of the component.
         */
	public function setSize(width:Number, height:Number) : void;

	public function setActualSize(newWidth:Number, newHeight:Number) : void;

	public function setActualScale(scaleX:Number, scaleY:Number) : void;

	/**
         * Handle input from the game, via controllers or keyboard. The default handleInput will handle standalone
         * and composite components.
         * @param event An {@code InputEvent} containing details about the interaction.
         * @see InputEvent
         * @see FocusHandler
         * @see InputDetails
         
         */
	public function handleInput(event:InputEvent) : void;

	public function dispatchEventToGame(event:Event) : void;

	/** @exclude */
	public function toString() : String;

	/**
         * Configure the interface when the component is initialized. Use this method to set up
         * sub-components, listeners, etc.
         */
	public function configUI() : void;

	/**
         * Draw the component after it has been invalidated.  Use this method to reflow component 
         * size and position, redraw data, etc. When appropriate, ensure that a call to 
         * {@code super.draw()} is made when extending a component and overriding this method.
         */
	public function draw() : void;

	/**
         * Called after focus has been given or taken from the component. 
         * Use this method to change the appearance or behavior of the component when the focus changes.
         */
	public function changeFocus() : void;

	public function beforeInspectorParams() : void;

	public function afterInspectorParams() : void;

	public function initSize() : void;

	/**
         * An internal property of the component has changed, requiring a redraw.  The invalidation 
         * mechanism lets components trigger multiple redraw commands at the same time, resulting in 
         * only a single redraw. the {@code invalidate()} method is public so that it can be called externally.
         */
	public function invalidate(...invalidTypes:Array) : void;

	/**
         * When the component has been invalidated, this method is called which validates the component,
         * and redraws the component immediately by calling {@code draw()}. The {@code validateNow()} 
         * method is public so that it can be called externally.
         */
	public function validateNow(event:Event = null) : void;

	public function isInvalid(...invalidTypes:Array) : Boolean;

	public function invalidateSize() : void;

	public function invalidateData() : void;

	public function invalidateState() : void;

	public function handleStageChange(event:Event) : void;

	public function handleEnterFrameValidation(event:Event) : void;

	public function getInvalid() : String;

	public function dispatchEventAndSound(event:Event) : Boolean;

}