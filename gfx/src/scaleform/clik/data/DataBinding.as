import flash.external.ExternalInterface;
/** * Interface for the CLIK DataBinding framework. No standard CLIK component uses this class explicitly. See MMO UI Kit for example use-cases. */
intrinsic class scaleform.clik.data.DataBinding
{
	static public var createBindingImpl : Object;
	static public var deleteBindingImpl : Object;

	static public function initialize() : void;

	static public function createBinding(key:String, handler:Object, boundObj:Object = null) : void;

	static public function deleteBinding(key:String, handler:Object, boundObj:Object = null) : void;

}