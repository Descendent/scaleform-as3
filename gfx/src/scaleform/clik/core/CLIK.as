import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventPhase;
import flash.utils.Dictionary;
import scaleform.clik.managers.FocusHandler;
import scaleform.clik.managers.PopUpManager;
import scaleform.gfx.Extensions;
/**
 * A global singleton for the CLIK framework that initializes the various CLIK subsystems (PopUpManager, FocusHandler, etc...).
 */
intrinsic dynamic class scaleform.clik.core.CLIK
{
	/** Reference to the Stage since this static class is not part of the Display List. */
	static public var stage : Stage;
	/** true if this class has been initialized; false otherwise. */
	static public var initialized : Boolean;
	/** true if CLIK FocusHandler should never set focus to null or Stage. false to follow the default Flash focus behavior. */
	static public var disableNullFocusMoves : Boolean;
	/** true if CLIK FocusHandler should never set focus to "dynamic" TextFields. false to follow the default Flash focus behavior. */
	static public var disableDynamicTextFieldFocus : Boolean;
	/** true if prevent focus moves from TextField -> null. false to allow TextField -> null focus moves. */
	static public var disableTextFieldToNullFocusMoves : Boolean;
	/** False by default. True if UIComponent initCallbacks should be fired immediately as they are received. False if each callback should be queued til the end of the frame and then fired in reverse order. */
	static public var useImmediateCallbacks : Boolean;
	/** Whether the fireInitCallback listener is active (optimization). */
	static public var isInitListenerActive : Boolean;
	/** 
         * Whether fireInitCallback() is currently running. Used to avoid multiple fireInitCallback() calls occuring simulatenously
         * which will corrupt the Dictionaries they're sharing.
         */
	static public var firingInitCallbacks : Boolean;
	/** 
         * A dictionary of dictionaries so that we can use weak references and order the queue by number of parents.
         * initQueue[ number of parents ] = weak ref dictionary of objects with number of parents[ weak reference to an object as key ] = path to object.
         */
	static public var initQueue : Dictionary;
	static public var validDictIndices : Vector.;

	static public function initialize(stage:Stage, component:UIComponent);

	static public function getTargetPathFor(clip:DisplayObjectContainer) : String;

	static public function queueInitCallback(ref:UIComponent) : void;

	static public function fireInitCallback(e:Event) : void;

	/** Removes all of the references to the Dictionaries used to track callbacks. */
	static public function clearQueue() : void;

	/** Basic sorting function for the validDictIndices Vector. */
	static public function sortFunc(a:uint, b:uint) : Number;

	static public function getTargetPathImpl(clip:DisplayObjectContainer, targetPath:String = "") : String;

}