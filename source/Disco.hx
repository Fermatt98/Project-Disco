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
		velocity.x = velocidad * FlxMath.fastCos(angle);
		velocity.y = velocidad * FlxMath.fastSin(angle);
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