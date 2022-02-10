package;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import lime.utils.Assets;

using StringTools;


class KeyValuePairData
{
	static function readText(path:String):Array<String> //copied from friday night fucking ninjamuffin please dont get mad at me!!!!!
	{
		var list:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...list.length)
		{
			list[i] = list[i].trim();
		}

		return list;
	}

    public static function MapFromFile(path)
    {
		var list:Array<String> = readText(path);
        var map:Map<String,String> = new Map<String,String>();


        for (i in 0...list.length)
        {
			var val:Array<String> = list[i].trim().split(':');
            if (val.length != 2)
            {
                trace("Invalid value at line " + i + "!");
            }
            else
            {
                map.set(val[0],val[1]);
            }
        }

        return map;

    }
}