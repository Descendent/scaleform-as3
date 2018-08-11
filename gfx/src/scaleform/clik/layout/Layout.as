import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.events.Event;
import flash.geom.Rectangle;
import scaleform.gfx.Extensions;
import scaleform.clik.constants.LayoutMode;
import scaleform.clik.core.UIComponent;
import scaleform.clik.events.ResizeEvent;
import scaleform.clik.layout.LayoutData;
/**
    Layout is a component that can be used to layout elements within a context that may change in size and/or scale.
    Layouts can only manage Sprites (and any sub-class thereof) that exist within the same parent. That is, no element
    should be placed within a Layout instance itself, but rather at the same level of that Layout instance. For example,
    having two children at the same level (myWindow.myMovieClip and myWindow.layoutInstance) would allow the layoutInstance
    to manage myMovieClip.

    Layout only manages Sprites that have defined the .layoutData property with an instance of the LayoutData class.
    Multiple Layouts may exist within the same parent, provided that each has a unique .identifier property set and that
    all the LayoutData within same-level Sprites also define their .layoutIdentifier property.

    NOTE: All managed Sprites must have their registration point in the top left or the Layout's calculations will be incorrect.

    More information on the Layout system can be found in the CLIK AS3 User Guide.

    <br>
    <br>

    <b>Inspectable Properties</b>
    A class that derives from Layout will have the following inspectable properties:
    <ul>
        <li><i>tiedToStageSize</i>: true if this Layout's size should always be updated to match the stage size; false otherwise. </li>
        <li><i>tiedToParent</i>: true if this Layout's size should always be updated to match its parent's size; false otherwise. </li>
        <li><i>hidden</i>:  true if this Layout should be hidden at runtime; false otherwise. Allows for the Layout to have a visible background or placeholder image that will be set to visible = false; immediately at runtime. </li>
    </ul>

    <br>
    <br>

    <b>States</b>
    The Layout component does not support any states.

    <br>
    <br>

    <b>Events</b>
    The Layout component does not dispatch any Events.
  */
intrinsic class scaleform.clik.layout.Layout extends Sprite
{
	/**
         * A unique identifer for this Layout to allow multiple Layouts to coexist in the same parent.
         * LayoutData can be tied to a particular Layout using the Layout's identifier.
         */
	public var identifier : String;
	public var _rect : Rectangle;
	public var _tiedToStageSize : Boolean;
	public var _tiedToParent : Boolean;
	public var _hidden : Boolean;
	public var _parent : Sprite;
	public var _managedSprites : Vector.;
	public var _aspectRatio : String;
	static public var STAGE_ALIGN_CENTER : String;

	/**
         * The "size" of the layout. Elements within will be laid out according to the x, y, width, and height of this property.
         * If the Layout's width != 0 (tied to a Symbol and placed on Stage), it will use the MovieClip's x, y, width, and height.
         * If the Layout's width == 0 (addChild() without a backing Symbol), it will use the parent's x, y, width, and height.
         * You can also assign a custom Rectangle using the .rect property.
         */
	public function get rect() : Rectangle;
	public function set rect(value:Rectangle) : void;

	public function get tiedToStageSize() : Boolean;
	public function set tiedToStageSize(value:Boolean) : void;

	public function get tiedToParent() : Boolean;
	public function set tiedToParent(value:Boolean) : void;

	public function get hidden() : Boolean;
	public function set hidden(value:Boolean) : void;

	/** @exclude */
	public function get width() : Number;
	public function set width(value:Number) : void;

	/** @exclude */
	public function get height() : Number;
	public function set height(value:Number) : void;

	/** @exclude */
	public function get scaleX() : Number;
	public function set scaleX(value:Number) : void;

	/** @exclude */
	public function get scaleY() : Number;
	public function set scaleY(value:Number) : void;


	public function Layout();

	public function initialize() : void;

	/** Update the layout by reflowing the managed Sprites */
	public function reflow() : void;

	/**
         * Resets the Layout by clearing its list of managed Sprites, searching for new Sprites with LayoutData
         * and recaculating offsets / reflowing those new Sprites from scratch.
         */
	public function reset() : void;

	/**
         * Sorts the managed Sprite list by their layoutData.layoutIndex property which defines the order in which
         * the layout is applied. This should be called if any layoutIndex is changed after the initial setup
         * of the Layout.
         */
	public function resortManagedSprites() : void;

	public function invalidate() : void;

	public function handleStageInvalidation(e:Event) : void;

	public function handleAddedToStage(e:Event) : void;

	public function configUI() : void;

	public function handleFirstEnterFrame(e:Event) : void;

	public function analyzeSpritesOnStage() : void;

	public function handleSpriteAddedToParent(e:Event) : void;

	public function handleSpriteRemovedFromParent(e:Event) : void;

	public function handleParentResize(e:Event) : void;

	public function handleStageResize(e:Event) : void;

	public function updateAspectRatio() : void;

	public function evaluateLayoutForSprite(spr:Sprite) : void;

	public function insertIntoSortedVector(spr:Sprite, list:Vector.<Sprite>) : void;

	public function calculateOffsets(spr:Sprite) : void;

}