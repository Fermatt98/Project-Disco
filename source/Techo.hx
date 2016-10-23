package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Techo extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Std.int(FlxG.width), Reg.tamanioPared);
		loadGraphic(AssetPaths.techo__psd);
		FlxG.state.add(this);
		color = 0x99999999;
	}
}