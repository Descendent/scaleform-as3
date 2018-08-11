import flash.display.DisplayObject;
/**
 * Wrapper and data structure for a DisplayObject under CLIK Constraints. 
 */
intrinsic class scaleform.clik.utils.ConstrainedElement
{
	public var clip : DisplayObject;
	public var edges : uint;
	public var left : Number;
	public var top : Number;
	public var right : Number;
	public var bottom : Number;
	public var scaleX : Number;
	public var scaleY : Number;

	public function ConstrainedElement(clip:DisplayObject, edges:uint, left:Number, top:Number, right:Number, bottom:Number, scaleX:Number, scaleY:Number);

	public function toString() : String;

}