package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxState;

/**
 * ...
 * @author ...
 */
class SongLine extends FlxSprite
{
	
	public function new(?X:Float=0, ?Y:Float=0, time:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Std.int(FlxG.width - Reg.paredIzq.width - Reg.paredDer.width), Reg.tamanioSongLine, 0x84438594);
		FlxG.state.add(this);
		Reg.time = time;
		Reg.pixelTime = Reg.time / (width - Reg.tamanioTimeLineX);
		Reg.timeline = new Timeline(x, y);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (Reg.stateString == "Level1")
		{
			set_visible(false);
		}
		else
		{
			set_visible(true);
		}
	}
	
}