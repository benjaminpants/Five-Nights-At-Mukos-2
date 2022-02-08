package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class Button extends FlxSprite //THIS IS AWFUL
{


	public static function PressButton(but:Button)
	{
		if (but.cameras[0].visible)
		{
			but.OnClicked();
        }
	}



    public function InitButton()
    {
		FlxMouseEventManager.add(this, PressButton);
    }

    public function OnClicked()
    {
        trace("I've been clicked!");
    }
}