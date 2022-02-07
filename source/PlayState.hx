package;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var OfficeSprite:FlxSprite;

	override public function create()
	{
		super.create();

		// var text = new flixel.text.FlxText(0, 0, 0, "Hello World", 64);
		// text.screenCenter();
		OfficeSprite = new FlxSprite();
		OfficeSprite.loadGraphic("assets/images/main/office.png");
		OfficeSprite.screenCenter();
		add(OfficeSprite);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
