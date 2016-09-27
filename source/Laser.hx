package;

import flash.desktop.Clipboard;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Laser extends FlxSprite
{
	private var _time:Float = 0;
	private var _time2:Float = 0;
	private var _intervalo:Float = 0;
	private var _timeCamDir:Float;
	private var _recta:Bool;
	private var _positivo:Bool;
	private var _pega:Bool = true;
	
	public function new(?X:Float=0, ?Y:Float=0, ?recta:Bool, ?positivo:Bool, ?velocidad:Float, ?timeCamDir:Float, ?intervalo:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		_timeCamDir = timeCamDir;
		_recta = recta;
		_intervalo = intervalo;
		_positivo = positivo;
		if (_recta == true)
		{
			makeGraphic(800, 5);
			loadGraphic("assets/images/Laser/laser.png");
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
			loadGraphic("assets/images/Laser/laserL.png");
			if (_positivo == true)
			{
				velocity.x = velocidad;
			}
			else
			{
				velocity.x = -velocidad;
			}
		}
		
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_time += elapsed;
		_time2 += elapsed;
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
		if (_time2 > _intervalo && _pega == true)
		{
			_intervalo = _intervalo * 2;
			_pega = false;
			if (_recta == true)
			{
				loadGraphic("assets/images/Laser/laser_2.png");
			}
			else
			{
				loadGraphic("assets/images/Laser/laserL_2.png");
			}
			
		}
		if (_time2 > _intervalo && _pega == false)
		{
			_intervalo = _intervalo / 2;	
			_pega = true;
			_time2 = 0;
			if (_recta == true)
			{
				loadGraphic("assets/images/Laser/laser.png");
			}
			else
			{
				loadGraphic("assets/images/Laser/laserL.png");
			}
		}
		if (FlxG.overlap(Reg.player, this) && _pega == true)
		{
			Reg.player.kill();
		}	
	}
	
}