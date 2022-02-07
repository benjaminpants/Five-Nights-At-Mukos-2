package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var OfficeSprite:FlxSprite;

	public var CameraButton:FlxSprite;

	public var OfficeCamera:FlxCamera;

	public var HudCamera:FlxCamera;

	static inline var OfficeScroll:Int = 100;

	public function AddHudElement(thing:FlxSprite)
	{
		add(thing);
		thing.cameras = [HudCamera];
	}

	override public function create()
	{
		super.create();
		// Create the office cameras
		OfficeCamera = new FlxCamera(0, 0, 1280, 720, 1);
		HudCamera = new FlxCamera(0, 0, 1280, 720, 1);
		HudCamera.bgColor.alpha = 0;
		FlxG.cameras.reset(OfficeCamera);
		FlxG.cameras.add(HudCamera);

		// Create the Office itself
		OfficeSprite = new FlxSprite();
		OfficeSprite.loadGraphic(FolderPaths.GetImagePath("office"));
		OfficeSprite.antialiasing = true;
		OfficeSprite.updateHitbox();
		OfficeSprite.screenCenter();
		add(OfficeSprite);
		OfficeSprite.cameras = [OfficeCamera];
		// Create Camera Button
		CameraButton = new FlxSprite();
		CameraButton.loadGraphic(FolderPaths.GetImagePath("camera_button"));
		CameraButton.antialiasing = true;
		CameraButton.updateHitbox();
		CameraButton.screenCenter();
		CameraButton.y = FlxG.height - (CameraButton.height + 10);
		AddHudElement(CameraButton);
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
