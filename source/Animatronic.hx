package;

import flixel.system.debug.watch.Watch;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

class Animatronic extends FlxSprite
{

    public var name:String;

    public static function CreateFromCharacterData(name:String)
    {
        var animat:Animatronic = new Animatronic();

		var data:Map<String, String> = KeyValuePairData.MapFromFile(FolderPaths.GetCharacterData(name, "info.kvp")); //load the animatronic data from a file

        animat.name = data.get("name");

    }

}





