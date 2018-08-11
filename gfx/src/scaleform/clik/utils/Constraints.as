import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.text.TextField;
import scaleform.clik.constants.ConstrainMode;
import scaleform.clik.controls.ScrollBar;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.ResizeEvent;
/**
 * The Constraints utility helps symbols scale and align the assets contained within them. Elements can be added to a Constraints instance, and they will be reflowed when the {@code update(width,height)} method is called.
 *
 * This utility supports both re-scaling and counter-scaling methods.  Rescaling occurs when the component is scaled back to 100%, and the assets are reflowed and scaled to look correct. Counter-scaling occurs when the component is left at its transformed size, and the assets are scaled inversely to the parent clip.
 */
intrinsic class scaleform.clik.utils.Constraints extends EventDispatcher
{
	static public var ALL : uint;
	/**
         * The component that owns the constraints, and which is the direct parent to the display objects
         * getting constrained.
         */
	public var scope : DisplayObject;
	/**
         * Determines how the component scales its children.
         */
	public var scaleMode : String;
	/**
         * The x scale factor of the parent, which is a composite scale that originates from the stage, factoring
         * in all components or clips above it that use a constraints. This value does not include the current scope
         * scale value.
         * @default 1
         */
	public var parentXAdjust : Number;
	public var parentYAdjust : Number;
	public var elements : Object;
	public var elementCount : int;
	/**
         * A reference to the constraints that belong to the first container above the scope that specifies
         * a Constraints of its own. This is found by calling {@code addToParentConstraints()}.
         */
	public var parentConstraints : Constraints;
	/**
         * The last width set on this constraints by the scope. This value is stored off in order to preserve
         * it if the parent constraints updates its scale value. The component needs to be updated with its last
         * known width and the new scale value.
         */
	public var lastWidth : Number;
	public var lastHeight : Number;
	static public var LEFT : uint;
	static public var RIGHT : uint;
	static public var TOP : uint;
	static public var BOTTOM : uint;
	static public var CENTER_H : uint;
	static public var CENTER_V : uint;

	/**
         * Create a new Constraints instance to assist in the positioning and scaling of an asset inside a component.
         * Note that it is VERY important that constraints instances in components are created before the super() call
         * to ensure parent constraints are initialized.
         * @param scope The component scope which contains the constrained asset.
         * @param scaleMode Determines how the component scales its elements. The default is counter-scaling.
         */
	public function Constraints(scope:Sprite, scaleMode:String="counterScale");

	public function addElement(name:String, clip:DisplayObject, edges:uint) : void;

	public function removeElement(name:String) : void;

	public function removeAllElements() : void;

	/**
         * Get the contraints rules for a given object.
         * @param clip A reference to the DisplayObject (Sprite or TextField) the contraints apply to.
         * @returns the constraints rules object for the specified clip
         */
	public function getElement(name:String) : ConstrainedElement;

	/**
         * Update the reference to a display object. This is required if the component exists on multiple
         * frames, as Flash will re-assign the reference, but not update external references, such as 
         * the {@code ConstrainedElement}.
         * @param name The name of the clip in the ConstrainedElement
         * @param clip The new reference to the display object.
         */
	public function updateElement(name:String, clip:DisplayObject) : void;

	/**
         * Determine the x scale adjustment factoring in the parent scale and the scope scale. Used internally
         * but is also requested by child constraints when determining their own scale.
         */
	public function getXAdjust() : Number;

	public function getYAdjust() : Number;

	/**
         * Change the width/height and x/y of each registered component based on the scope's updated size and the constraint rules.
         * This is usually called by the scope when its size changes, but may also be called when a parent constraints changes its
         * scale value.
         * @param width The new width of the scope component.
         * @param height The new height of the scope component.
         */
	public function update(width:Number, height:Number) : void;

	/** @exclude */
	public function toString() : String;

	public function handleScopeAddedToStage(event:Event) : void;

	public function addToParentConstraints() : void;

	public function handleParentConstraintsResize(event:ResizeEvent) : void;

}