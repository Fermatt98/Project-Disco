package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 32);
		y -= height;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.LEFT)
		{
			if (Reg.velPlayer > Reg.maxVelPlayer*-1)
			{
				Reg.velPlayer -= Reg.accelerationPlayer;
			}
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			if (velocity.x < Reg.maxVelPlayer)
			{
				Reg.velPlayer += Reg.accelerationPlayer;
			}
		}
		else
		{
			if (Reg.velPlayer < 0)
			{
				Reg.velPlayer += Reg.accelerationPlayer;
			}
			else if (velocity.x > 0)
			{
				Reg.velPlayer -= Reg.accelerationPlayer;
			}
		}
		if (FlxG.keys.justPressed.SPACE)
		{
			Reg.jumpVelPlayer = Reg.jumpMaxVelPlayer;
		}
		else if(y + height > FlxG.height)
		{
			Reg.jumpVelPlayer = 0;
		}
		else if (Reg.jumpVelPlayer < 600)
		{
			Reg.jumpVelPlayer += Reg.jumpAccelerationPlayer;
		}
		velocity.x = Reg.velPlayer;
		velocity.y = Reg.jumpVelPlayer;
	}
}