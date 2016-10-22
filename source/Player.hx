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
	private var jumpCount:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioPlayerX, Reg.tamanioPlayerY);
		loadGraphic("assets/images/Player/player.png");
		y -= height;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		collision();
		movement();
		velocity.x = Reg.velPlayer;
		velocity.y = Reg.jumpVelPlayer;
	}
	
	private function movement():Void
	{
		if (FlxG.keys.pressed.LEFT)
		{
			Reg.velPlayer = -Reg.maxVelPlayer;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			Reg.velPlayer = Reg.maxVelPlayer;
		}
		else
		{
			Reg.velPlayer = 0;
		}
		if (FlxG.keys.justPressed.SPACE)
		{
			if (jumpCount < Reg.maxJump)
			{
				Reg.jumpVelPlayer = Reg.jumpMaxVelPlayer;
				jumpCount++;
			}
		}
		if (Reg.jumpVelPlayer < Reg.jumpMaxVelPlayer*-1)
		{
			Reg.jumpVelPlayer += Reg.jumpAccelerationPlayer;
		}
	}
	
	private function collision()
	{
		if (FlxG.overlap(Reg.player, Reg.piso))
		{
			Reg.jumpVelPlayer = 0;
			jumpCount = 0;
			y = Reg.piso.y - height;
		}
		if (FlxG.overlap(Reg.player, Reg.paredIzq))
		{
			Reg.velPlayer = 0;
			if (FlxG.keys.justPressed.SPACE)
			{
				Reg.jumpVelPlayer = Reg.jumpMaxVelPlayer;
				Reg.velPlayer = Reg.maxVelPlayer;
				jumpCount = 0;
			}
			x = Reg.paredIzq.x + Reg.paredIzq.width;
		}
		if (FlxG.overlap(Reg.player, Reg.paredDer))
		{
			Reg.velPlayer = 0;
			if (FlxG.keys.justPressed.SPACE)
			{
				Reg.jumpVelPlayer = Reg.jumpMaxVelPlayer;
				Reg.velPlayer = Reg.maxVelPlayer*-1;
				jumpCount = 0;
			}
			x = Reg.paredDer.x - width;

		}
		if (FlxG.overlap(Reg.player, Reg.techo))
		{
			Reg.jumpVelPlayer = 0;
			y = Reg.techo.y + Reg.techo.height;
		}
	}
}