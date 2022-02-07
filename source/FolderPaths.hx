package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class FolderPaths
{
	public static function GetImagePath(assetName:String, path:String = "main")
	{
		return FlxSprite.loadGraphic("assets/images/" + path + "/" + assetName + ".png");
	}
}
