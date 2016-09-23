package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;

/**
 * ...
 * @author ...
 */
class Disco extends FlxSprite
{
	private var cos:Float = 0;
	private var sin:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?velocidad:Int, ?angulo:Int, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(20, 20);
		angle = angulo;
		trace (angle);
		cos = FlxMath.fastCos(angle);
		trace(cos);
		sin = FlxMath.fastSin(angle);
		velocity.x = velocidad * cos;
		if (sin < 0)
		{
			sin *=-1;
		}
		velocity.y = velocidad * sin;
		trace(velocity.x);
		trace(velocity.y);
	}
	
}