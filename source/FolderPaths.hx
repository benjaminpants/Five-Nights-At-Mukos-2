package;

import lime.graphics.cairo.CairoAntialias;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class FolderPaths
{
	public static function GetImagePath(assetName:String, path:String = "main")
	{
		return "assets/images/" + path + "/" + assetName + ".png";
	}

	public static function GetCharacterPath(characterName:String)
	{
		return "assets/data/characters/" + characterName + "/";
	}

	public static function GetCharacterData(characterName:String, file:String)
	{
		return GetCharacterPath(characterName) + file;
	}


}
