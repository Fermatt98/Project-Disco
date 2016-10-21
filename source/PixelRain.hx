package;

import flixel.FlxBasic;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class PixelRain extends FlxBasic
{
	private var timer:Float = 0;
	private var spawn:Float = 0;
	private var posicion:Int = 0;
	private var _distancia:Float = 30;
	private var _inicioX:Float = 0;
	private var _inicioY:Float = 0;
	private var _velocidad:Float;
	private var _direccionY:Float;
	private var _direccionX:Float;
	private var fin:Int = 800;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;
	
	public function new(?inicioX, ?inicioY, ?Spawn:Float, ?direccionX:Float, ?direccionY:Float, ?distancia:Float = 30, ?velocidad:Float) 
	{
		super();
		_inicioX = inicioX;
		_inicioY = inicioY;
		spawn = Spawn;
		_distancia = distancia;
		_velocidad = velocidad;
		_direccionX = direccionX;
		_direccionY = direccionY;
		Reg.pixel = new Array<Pixel>();
		timeStart = Reg.getTime;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (Reg.getTime >= timeStart && Reg.getTime < endTime)
		{
			timer += elapsed;
			if (timer > spawn)
			{
				Reg.pixel.push(new Pixel(((_distancia *_direccionX) * posicion) + _inicioX, _inicioY, null, _direccionX, _direccionY, _velocidad));
				timer = 0;
				posicion++;
				if (_distancia * posicion > fin)
				{
					posicion = 0;
				}
			}
			if (FlxG.mouse.justPressedRight)
			{
				set_visible(false);
				endTime = Reg.getTime;
				for (i in 0...Reg.pixel.length)
				{
					Reg.pixel[i].destroy();
					posicion = 0;
				}
			}
			if (FlxG.mouse.justPressedMiddle)
			{
				destroy();
			}
		}
		else
		{
			set_visible(false);
			for (i in 0...Reg.pixel.length)
			{
				Reg.pixel[i].destroy();
				posicion = 0;
			}
		}
	}
	
	public function getVariable(list:List<Float>)
	{
		list.add(_inicioX);
		list.add(_inicioY);
		list.add(timeStart);
		list.add(endTime);
		list.add(spawn);
		list.add(_distancia);
		list.add(_velocidad);
		list.add(_direccionX);
		list.add(_direccionY);
		
	}
	
	public function setVariable(list:List<Float>)
	{
		_inicioX = list.pop();
		_inicioY = list.pop();
		timeStart = list.pop();
		endTime = list.pop();
		spawn = list.pop();
		_distancia = list.pop();
		_velocidad = list.pop();
		_direccionX = list.pop();
		_direccionY = list.pop();
		list.add(_inicioX);
		list.add(_inicioY);
		list.add(timeStart);
		list.add(endTime);
		list.add(spawn);
		list.add(_distancia);
		list.add(_velocidad);
		list.add(_direccionX);
		list.add(_direccionY);
	}
}