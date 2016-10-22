package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Disco extends FlxSprite
{
	private var cos:Float = 0;
	private var sin:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?velocidad:Float, ?angulo:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		loadGraphic("assets/images/Disco/disco.png");
		angle = angulo;
		velocity.x = velocidad * FlxMath.fastCos(angle);
		velocity.y = velocidad * FlxMath.fastSin(angle);
		FlxG.state.add(this);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			destroy();
		}
		if (FlxG.overlap(Reg.player, this))
		{
			Reg.player.kill();
		}
	}
	
}