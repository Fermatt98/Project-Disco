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
	private var _intervaloStart:Float = 0;
	private var _timeCamDir:Float;
	private var _recta:Bool;
	private var _positivo:Bool;
	private var _pega:Bool = true;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;
	private var tamanio:Int = 10;
	private var startX:Float;
	private var startY:Float;
	private var startVelocity:Float;
	
	public function new(?X:Float=0, ?Y:Float=0, ?recta:Bool=false, ?positivo:Bool=false, ?velocidad:Float=0, ?timeCamDir:Float=0, ?intervalo:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		startX = x;
		startY = y;
		timeStart = Reg.getTime;
		_timeCamDir = timeCamDir;
		_recta = recta;
		_intervalo = intervalo;
		_intervaloStart = intervalo;
		_positivo = positivo;
		startVelocity = velocidad;
		if (_recta == true)
		{
			makeGraphic(FlxG.width, tamanio);
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
			makeGraphic(tamanio, FlxG.height);
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
		if (Reg.getTime >= timeStart && Reg.getTime < endTime)
		{
			if (!visible)
			{
				set_visible(true);
				if (_recta == true)
				{
					if (_positivo == true)
					{
						velocity.y = startVelocity;
					}
					else
					{
						velocity.y = -startVelocity;
					}
					
				}
				else
				{
					if (_positivo == true)
					{
						velocity.x = startVelocity;
					}
					else
					{
						velocity.x = -startVelocity;
					}
				}
				_time = 0;
				_time2 = 0;
				x = startX;
				y = startY;
				
			}
			_time += elapsed;
			_time2 += elapsed;
			if (_time > _timeCamDir)
			{
				if (_recta)
				{
					velocity.y = velocity.y * -1;
					_time = 0;
				}
				else
				{
					velocity.x = velocity.x * -1;
					_time = 0;
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
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.pressedRight)
			{
				set_visible(false);
				endTime = Reg.getTime;
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.pressedMiddle)
			{
				destroy();
			}
		}
		else
		{
			set_visible(false);
		}
	}
	
	public function getVariable(list:List<Float>)
	{
		list.add(startX);
		list.add(startY);
		list.add(timeStart);
		list.add(endTime);
		list.add(_timeCamDir);
		list.add(_intervaloStart);
		if (_recta)
		{
			list.add(1);
		}
		else
		{
			list.add(0);
		}
		if (_positivo)
		{
			list.add(1);
		}
		else
		{
			list.add(0);
		}
		list.add(startVelocity);
	}
	
	public function setVariable(list:List<Float>)
	{
		x = list.pop();
		startX = x;
		y = list.pop();
		startY = y;
		timeStart = list.pop();
		endTime = list.pop();
		_timeCamDir = list.pop();
		_intervaloStart = list.pop();
		_intervalo = _intervaloStart;
		if (list.pop() == 1)
		{
			_recta = true;
		}
		else
		{
			_recta = false;
		}
		if (list.pop() == 1)
		{
			_positivo = true;
		}
		else
		{
			_positivo = false;
		}
		if (_recta == true)
		{
			loadGraphic("assets/images/Laser/laser.png");
			if (_positivo == true)
			{
				velocity.y = list.pop();
				startVelocity = velocity.y;
			}
			else
			{
				velocity.y = -list.pop();
				startVelocity = -velocity.y;
			}
			
		}
		else
		{
			makeGraphic(tamanio, FlxG.height);
			loadGraphic("assets/images/Laser/laserL.png");
			if (_positivo == true)
			{
				velocity.x = list.pop();
				startVelocity = velocity.x;
			}
			else
			{
				velocity.x = -list.pop();
				startVelocity = -velocity.x;
			}
		}
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_timeCamDir);
		list.add(_intervaloStart);
		if (_recta)
		{
			list.add(1);
		}
		else
		{
			list.add(0);
		}
		if (_positivo)
		{
			list.add(1);
		}
		else
		{
			list.add(0);
		}
		list.add(startVelocity);
	}
	
}