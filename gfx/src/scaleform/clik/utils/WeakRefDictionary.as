import flash.utils.Dictionary;
/**************************************************************************

Filename    :   WeakRefDictionary.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
intrinsic class scaleform.clik.utils.WeakRefDictionary
{
	public var _dictionary : Dictionary;

	public function WeakRefDictionary();

	public function setValue(key:Object, value:Object) : void;

	public function getValue(key:Object) : Object;

}