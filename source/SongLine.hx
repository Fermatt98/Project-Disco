package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class SongLine extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, time:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(760, 32, 0x84438594);
		FlxG.state.add(this);
		Reg.time = time;
		Reg.pixelTime = Reg.time / (width - 8);
		Reg.timeline = new Timeline(x, y);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}