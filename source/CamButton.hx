package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class CamButton extends Button
{
    public var MyCamID:Int;

    public function Initialize(cam:Int)
    {
        super.InitButton();
		var state:PlayState = cast(FlxG.state, PlayState);
        MyCamID = cam;
		this.loadGraphic(FolderPaths.GetImagePath("cam_" + cam));
		this.cameras = [state.CamsCamera];
        this.scrollFactor.set();
    }

    public override function OnClicked()
    {
        super.OnClicked();
        var state:PlayState = cast(FlxG.state,PlayState);
        state.SwitchCamera(MyCamID);
    }
}