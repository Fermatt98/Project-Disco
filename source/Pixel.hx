package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Pixel extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		color = 0x00FE2E9A;
		velocity.y = Reg.pixelVel;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			destroy();
		}
	}
}