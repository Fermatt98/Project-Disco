package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Lase extends FlxSprite
{
	private var _time:Float = 0;
	private var _timeCamDir:Float;
	private var _recta:Bool;
	private var _positivo:Bool;
	
	public function new(?X:Float=0, ?Y:Float=0, ?recta:Bool, ?positivo:Bool, ?velocidad:Float, ?timeCamDir:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		_timeCamDir = timeCamDir;
		_recta = recta;
		_positivo = positivo;
		if (_recta == true)
		{
			makeGraphic(800, 5);
			if (_positivo == true)
			{
				velocity.y = velocidad;
			}
			else
			{
				velocity.y = -velocidad;
			}
			
		}
		else
		{
			makeGraphic(5, 600);
			if (_positivo == true)
			{
				velocity.x = velocidad;
			}
			else
			{
				velocity.x = -velocidad;
			}
		}
		color = 0x00FFFF00;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_time += elapsed;
		if (_time > _timeCamDir)
		{
			if (_recta == true)
			{
				if (_positivo == true)
				{
					velocity.y = velocity.y * -1;
					_time = 0;
				}
				else
				{
					velocity.y = velocity.y * -1;
					_time = 0;
				}		
			}
			else
			{
				if (_positivo == true)
				{
					velocity.x = velocity.x * -1;
					_time = 0;
				}
				else
				{
					velocity.x = velocity.x * -1;
					_time = 0;
				}
			}
		}
		if (FlxG.overlap(Reg.player, this))
		{
			Reg.player.kill();
		}	
	}
	
}