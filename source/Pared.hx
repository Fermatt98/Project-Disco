package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Pared extends FlxSprite
{
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioPared, Std.int(FlxG.height));
		if (x != 0)
		{
			x -= width;
		}
		FlxG.state.add(this);
		color = 0x99999999;
	}
	
}