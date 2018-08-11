/**************************************************************************

Filename    :   ListData.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.clik.data.ListData
{
	public var index : uint;
	public var label : String;
	public var selected : Boolean;

	public function ListData(index:uint, label:String="Empty", selected:Boolean=false);

	public function toString() : String;

}