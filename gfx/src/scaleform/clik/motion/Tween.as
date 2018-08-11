import flash.display.Shape;
import flash.events.Event;
import flash.utils.getTimer;
import flash.display.DisplayObject;
import flash.geom.Matrix;
import flash.geom.Transform;
/**
 * Light-weight tween class specifically designed for use with GFx and CLIK.
 * 
 * Usage:
 * var tween1:Tween = new Tween(1000, myObject, {x:250, y:250, alpha:0}, {paused:false, ease:Strong.easeOut, onComplete:handleTweenComplete, loop:true});
 */
intrinsic class scaleform.clik.motion.Tween
{
	static public var ticker : Shape;
	static public var workingMatrix : Matrix;
	static public var firstTween : Tween;
	static public var lastTime : uint;
	static public var degToRad : Number;
	static public var propsDO : Object;
	public var target : Object;
	public var duration : Number;
	public var ease : Function;
	public var easeParam : Object;
	public var onComplete : Function;
	public var onChange : Function;
	public var data : Object;
	public var nextTween : Tween;
	public var frameBased : Boolean;
	public var delay : Number;
	public var loop : Boolean;
	public var fastTransform : Boolean;
	public var invalid : Boolean;
	public var next : Tween;
	public var prev : Tween;
	public var _position : Number;
	public var _paused : Boolean;
	public var startMatrix : Matrix;
	public var deltaMatrix : Matrix;
	public var transform : Transform;
	public var targetDO : DisplayObject;
	public var firstProp : Prop;
	public var props : Object;
	public var next : Prop;
	public var prev : Prop;
	public var name : String;
	public var start : Number;
	public var delta : Number;

	public function get position() : Number;
	public function set position(value:Number) : void;

	public function get paused() : Boolean;
	public function set paused(value:Boolean) : void;


	static public function tick(evt:Event) : void;

	/** Removes a particular tween from the list of tweens being executed. */
	static public function removeTween(tween:Tween) : void;

	/** Removes all tweens from the list and stops execution. */
	static public function removeAllTweens() : void;

	/**
         * Create a new Tween.
         * @param duration The duration of the tween in milliseconds.
         * @param target The DisplayObject to be tweened.
         * @param props An Object containing the properties and values that should be tweened to.
         * @param quickSet An Object containing properties for the tween including paused, ease, onComplete, loop, delay, and nextTween.
         */
	public function Tween(duration:Number, target:Object=null, props:Object=null, quickSet:Object=null);

	public function reset() : void;

	public function quickSet(props:Object) : void;

	public function constructProp(name:String) : Prop;

	public function init() : void;

	public function updatePosition(value:Number) : void;

}