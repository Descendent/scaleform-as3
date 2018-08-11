/**
 * A data structure that defines padding for the top, bottom, left, and right of a component. Use of the Padding class is at the discretion of the component.
 */
intrinsic class scaleform.clik.utils.Padding
{
	public var top : Number;
	public var bottom : Number;
	public var left : Number;
	public var right : Number;

	public function get vertical() : Number;

	public function get horizontal() : Number;


	public function Padding(...args:Array);

	public function toString() : String;

}