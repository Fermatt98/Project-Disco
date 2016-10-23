package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Piso extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Std.int(FlxG.width), Reg.tamanioPiso);
		loadGraphic(AssetPaths.Piso__png);
		y -= height;
		FlxG.state.add(this);
	}
	
}