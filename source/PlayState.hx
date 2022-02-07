package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var OfficeSprite:FlxSprite;

	static inline var OfficeScroll:Int = 100;

	override public function create()
	{
		super.create();

		OfficeSprite = new FlxSprite();
		OfficeSprite.loadGraphic(FolderPaths.GetImagePath("office"));
		OfficeSprite.antialiasing = true;
		OfficeSprite.updateHitbox();
		OfficeSprite.screenCenter();
		add(OfficeSprite);
	}

	override public function update(elapsed:Float)
	{
		if (OfficeSprite != null)
		{
			if (FlxG.mouse.screenX > ((FlxG.width / 2) - OfficeScroll))
			{
				FlxG.camera.scroll.x += 4;
			}
			if (FlxG.mouse.screenX < ((FlxG.width / 2) + OfficeScroll))
			{
				FlxG.camera.scroll.x -= 4;
			}
			if (FlxG.camera.scroll.x >= 208)
			{
				FlxG.camera.scroll.x = 208;
			}
			if (FlxG.camera.scroll.x <= -208)
			{
				FlxG.camera.scroll.x = -208;
			}
		}
		super.update(elapsed);
	}
}
