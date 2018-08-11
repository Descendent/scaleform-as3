/**
 *  Definitions for the available wrapping modes which affect list input.
*/
intrinsic class scaleform.clik.constants.WrappingMode
{
	/** Focus can leave the component from all edges of the component using arrow keys. */
	static public var NORMAL : String;
	/** Focus wil be unable to leave the component from all edges of the component using arrow keys. */
	static public var STICK : String;
	/** When selection reaches the last item in row/column, the next move will cause it to wrap to the beginning. Focus will remain in the component. */
	static public var WRAP : String;

}