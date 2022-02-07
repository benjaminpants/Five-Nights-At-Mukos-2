package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;

class TitleState extends FlxState
{

	var playButton:FlxButton;


	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}

	override public function create()
	{
		super.create();

		var text = new flixel.text.FlxText(0, 0, 0, "Five Night's At Mukos 2\nElectric Boogaloo", 64);
		text.screenCenter();
		add(text); 

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.screenCenter();
		playButton.y += 100;
 		add(playButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
