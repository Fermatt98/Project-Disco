package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	private var _animacion:Bool = false;
	private var _animacionCorrer:Bool = false;
	private var _time:Float = 0;
	private var jumpCount:Int = 0;
	private var bodyslam:Bool = false;
	private var bodyslamTimer:Float = 0;
	private var SFXJump:FlxSound;
	private var SFXDead:FlxSound;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioPlayerX, Reg.tamanioPlayerY);
		loadGraphic("assets/images/Player/player.png");
		width = 44;
		height = 56;
		offset.set(10, 8);
		y -= height;
		SFXJump = FlxG.sound.load(AssetPaths.Jump__wav);
		SFXDead = FlxG.sound.load(AssetPaths.Explosion__wav);
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		if (_animacion == true && _time > 0.1)
		{
			if (_animacionCorrer == false)
			{
				loadGraphic("assets/images/Player/player.png");
				width = 44;
				height = 56;
				offset.set(10, 8);
				_animacionCorrer = true;
			}
			else
			{
				loadGraphic("assets/images/Player/player_2.png");
				width = 44;
				height = 56;
				offset.set(10, 8);
				_animacionCorrer = false;
			}
			_time = 0;
		}
		collision();
		if (bodyslam)
		{
			bodyslamTimer += elapsed;
			Reg.velPlayer = 0;
			if (bodyslamTimer > 0.2)
			{
				Reg.jumpVelPlayer = -Reg.jumpMaxVelPlayer * 2;
			}
			else
			{
				Reg.jumpVelPlayer = 0;
			}
		}
		else
		{
			movement();
		}
		velocity.x = Reg.velPlayer;
		velocity.y = Reg.jumpVelPlayer;
	}
	
	private function movement():Void
	{
		if (FlxG.keys.pressed.LEFT)
		{
			_animacion = true;
			flipX = true;
			if (Reg.velPlayer > -Reg.maxVelPlayer)
			{
				Reg.velPlayer -= Reg.accelerationPlayer;
			}
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			_animacion = true;
			flipX = false;
			if (Reg.velPlayer < Reg.maxVelPlayer)
			{
				Reg.velPlayer += Reg.accelerationPlayer;
			}
		}
		else
		{
			if (Reg.velPlayer > 0)
			{
				Reg.velPlayer -= Reg.accelerationPlayer;
			}
			else if (Reg.velPlayer < 0)
			{
				Reg.velPlayer += Reg.accelerationPlayer;
			}
			else
			{
				Reg.velPlayer = 0;
				_animacion = false;
			}
		}
		if (FlxG.keys.justPressed.SPACE)
		{
			if (jumpCount < Reg.maxJump)
			{
				Reg.jumpVelPlayer = Reg.jumpMaxVelPlayer;
				jumpCount++;
				SFXJump.play();
			}
		}
		if (Reg.jumpVelPlayer < Reg.jumpMaxVelPlayer*-1)
		{
			Reg.jumpVelPlayer += Reg.jumpAccelerationPlayer;
		}
		if (FlxG.keys.justPressed.DOWN)
		{
			bodyslam = true;
		}
	}
	
	private function collision()
	{
		if (FlxG.overlap(Reg.player, Reg.piso))
		{
			bodyslam = false;
			bodyslamTimer = 0;
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
				SFXJump.play();
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
				SFXJump.play();
			}
			x = Reg.paredDer.x - width;

		}
		if (FlxG.overlap(Reg.player, Reg.techo))
		{
			Reg.jumpVelPlayer = 0;
			y = Reg.techo.y + Reg.techo.height;
		}
	}
	
	override public function kill():Void 
	{
		super.kill();
		SFXDead.play();
	}
}