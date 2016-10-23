package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Grisha extends FlxSprite
{
	private var _time:Float = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(1600,1200);
		loadGraphic(AssetPaths.grisha__png);
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		if (FlxG.keys.justPressed.G && Reg.GrishaBool == false && _time > 0.4)
		{
			Reg.GrishaBool = true;
			destroy();
		}
	}
}