package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */
class Disco extends FlxSprite
{
	private var cos:Float = 0;
	private var sin:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?velocidad:Int, ?angulo:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(5, 5);
		angle = angulo;
		trace (angle);
		cos = FlxMath.fastCos(FlxAngle.asRadians(angulo));
		trace(cos);
		sin = FlxMath.fastSin(FlxAngle.asRadians(angle));
		cos = FlxMath.fastCos(angle);
		trace(cos);
		sin = FlxMath.fastSin(angle);
		velocity.x = velocidad * cos;
		velocity.y = velocidad * sin;
		trace(velocity.x);
		trace(velocity.y);
	}
	
}