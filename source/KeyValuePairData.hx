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

    //generate a string formatted like the following when given a map:
    //key:value
    //key2:value2
    //key3:value3
    //...
    static function generateStringFromMap(map:Map<String,String>):String
    {
        var str:String = "";

        for (key in map)
        {
            str += key + ":" + map[key] + "\n";
        }

        return str;
    }

    //remove duplicate lines from a given string
    static function removeDuplicateLines(str:String):String
    {
        var lines:Array<String> = str.split('\n');
        var uniqueLines:Array<String> = new Array<String>();

		for (i in 0...lines.length)
        {
            if (uniqueLines.indexOf(lines[i]) == -1)
            {
                uniqueLines.push(lines[i]);
            }
        }

        return uniqueLines.join('\n');
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