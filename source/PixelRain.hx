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
	private var fin:Int = 1600;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;
	
	public function new(?inicioX, ?inicioY, ?Spawn:Float=1, ?direccionX:Float=0, ?direccionY:Float=0, ?distancia:Float = 230, ?velocidad:Float=10) 
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
			if (!visible)
			{
				posicion = 0;
				set_visible(true);
			}
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
		}
		else
		{
			set_visible(false);
		}
	}
	
	public function setVisible(bool:Bool):Void
	{
		set_visible(bool);
	}
	
	public function setEndtime():Void
	{
		endTime = Reg.getTime;
	}
	
	public function setPosition(int:Int)
	{
		posicion = int;
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