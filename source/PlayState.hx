package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var OfficeSprite:FlxSprite;

	public var OfficeCamera:FlxCamera;

	static inline var OfficeScroll:Int = 100;

	override public function create()
	{
		super.create();

		// Create the Office itself
		OfficeSprite = new FlxSprite();
		OfficeSprite.loadGraphic(FolderPaths.GetImagePath("office"));
		OfficeSprite.antialiasing = true;
		OfficeSprite.updateHitbox();
		OfficeSprite.screenCenter();
		add(OfficeSprite);
		// Create the office Camera
		OfficeCamera = new FlxCamera(0, 0, 1280, 720, 1);
		FlxG.cameras.reset(OfficeCamera);
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
