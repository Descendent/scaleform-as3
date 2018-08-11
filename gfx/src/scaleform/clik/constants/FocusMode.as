/**
    Definitions for the available "focus modes" that FocusHandler should use when moving focus.
*/
intrinsic class scaleform.clik.constants.FocusMode
{
	/** If LOOP is used, FocusHandler will search for avaiable focus targets in the target direction until it reaches the end of the document. If no valid target is found before the end of the document, it will begin a new search from the opposite side of the document and repeat the process. */
	static public var LOOP : String;
	/** If DEFAULT is used, FocusHandler will search for available focus targets in the target direction until it reaches the end of the document. If no valid target is found before the end of the document, the search will end there. */
	static public var DEFAULT : String;
	static public var VERTICAL : String;
	static public var HORIZONTAL : String;

}