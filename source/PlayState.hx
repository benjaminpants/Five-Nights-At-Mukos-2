package;

import flixel.text.FlxText;
import flixel.system.debug.watch.Watch;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

class PlayState extends FlxState
{
	public var OfficeSprite:FlxSprite;

	public var CameraButton:FlxSprite;

	public var OfficeCamera:FlxCamera;

	public var HudCamera:FlxCamera;

	public var CamsCamera:FlxCamera;

	public var CamsUp:Bool = false;

	public var CurrentCamera:Int = 0;

	public var ElapsedTime:Float = 0;

	public var CanOpenCams:Bool = true;

	static inline var OfficeScroll:Int = 100;

	public static var CamLocations:Array<String> = ["diner", "lounge", "stage", "kitchen"];
	
	public var Power:Float = 100;

	public var PowerConsumption:Int = 1;

	public function AddHudElement(thing:FlxSprite)
	{
		add(thing);
		thing.cameras = [HudCamera];
	}

	public function CreateCameraGraphics()
	{
		var i:Int = 0;
		for (camlocal in CamLocations)
		{
			var curcamesprite:FlxSprite = new FlxSprite();
			curcamesprite.loadGraphic(FolderPaths.GetImagePath(camlocal, "cameras"));
			curcamesprite.antialiasing = true;
			curcamesprite.updateHitbox();
			curcamesprite.screenCenter();
			curcamesprite.x += i * (1702 + 10);
			curcamesprite.cameras = [CamsCamera];
			add(curcamesprite);

			i++;
		}
		i = 0;
		for (camlocal in CamLocations) 
		{
			var cambut:CamButton = new CamButton();
			cambut.Initialize(i);
			cambut.screenCenter();
			cambut.y += 100;
			cambut.x += (i - (CamLocations.length - 1)) * (cambut.width + 10);
			add(cambut);
			i++;
		}
	}

	public function SetCameraState(setto:Bool)
	{
		//this was generated by github copilot, optimize it later
		if (CamsUp == true && setto == false)
		{
			PowerConsumption -= 1;
		}
		else if (CamsUp == false && setto == true)
		{
			PowerConsumption += 1;
		}
		CamsUp = setto;
		CamsCamera.visible = setto;
	}

	public function SwitchCamera(cam:Int)
	{
		CurrentCamera = cam;
	}

	override public function create()
	{
		super.create();
		// Create the cameras
		OfficeCamera = new FlxCamera(0, 0, 1280, 720, 1);
		HudCamera = new FlxCamera(0, 0, 1280, 720, 1);
		CamsCamera = new FlxCamera(0, 0, 1280, 720, 1);
		CamsCamera.visible = false;
		HudCamera.bgColor.alpha = 0;
		FlxG.cameras.reset(OfficeCamera);
		FlxG.cameras.add(CamsCamera);
		FlxG.cameras.add(HudCamera);
		CreateCameraGraphics();
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
		CameraButton.flipY = true;
		AddHudElement(CameraButton);


	}

	override public function update(elapsed:Float)
	{
		ElapsedTime += elapsed;
		super.update(elapsed);
		
		CamsCamera.scroll.x = (CurrentCamera * (1702 + 10)) + (Math.sin(ElapsedTime) * 208);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new PlayState());
		}

		if (!CamsUp)
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


		if (CameraButton.pixelsOverlapPoint(FlxG.mouse.getScreenPosition(), 0x01, HudCamera) && CanOpenCams) // figure out a better to do hover detection
		{
			CanOpenCams = false;
			SetCameraState(!CamsUp);
			CameraButton.flipY = !CamsUp;
		}
		if (!CameraButton.pixelsOverlapPoint(FlxG.mouse.getScreenPosition(), 0x01, HudCamera) && !CanOpenCams)
		{
			CanOpenCams = true;
		}
	}
}
