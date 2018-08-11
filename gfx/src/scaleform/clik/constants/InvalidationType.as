/**
    Definitions for the component invalidation types. These types are used to segment parts of invalidation (which primarily occurs draw()) to minimize unnecessary updates.
*/
intrinsic class scaleform.clik.constants.InvalidationType
{
	static public var ALL : String;
	static public var SIZE : String;
	static public var STATE : String;
	static public var DATA : String;
	static public var SETTINGS : String;
	static public var RENDERERS : String;
	static public var SCROLL_BAR : String;
	static public var SELECTED_INDEX : String;

}