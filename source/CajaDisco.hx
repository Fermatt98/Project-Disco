package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */
class CajaDisco extends FlxSprite
{
	private var timer:Float = 0;
	private var cantDiscUp:Float = 0;
	private var _delayTime:Float = 0;
	private var _anguloDisco:Float = 0;
	private var _velocidadDisco:Float = 0;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;

	public function new(?X:Float=0, ?Y:Float=0, ?cantDiscos:Float=5, ?delayTime:Float=1, ?velocidadDisco:Float=1, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		timeStart = Reg.getTime;
		makeGraphic(30, 30);
		loadGraphic("assets/images/CajaDisco/cajaDisco.png");
		_delayTime = delayTime;
		_velocidadDisco = velocidadDisco;
		cantDiscUp = cantDiscos;
		Reg.discos = new Array<Disco>();
		_anguloDisco = FlxAngle.asRadians(180 / (cantDiscos - 1));
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
				set_visible(true);
			}
			if (timer > _delayTime)
			{
				for (a in 0...Std.int(cantDiscUp))
				{
					Reg.discos.push(new Disco(x + width / 2, y + height / 2, _velocidadDisco, a * _anguloDisco));
				}
				timer = 0;
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedRight)
			{
				set_visible(false);
				endTime = Reg.getTime;
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedMiddle)
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
		list.push(x);
		list.push(y);
		list.push(timeStart);
		list.push(endTime);
		list.push(_delayTime);
		list.push(_velocidadDisco);
		list.push(cantDiscUp);
		list.push(_anguloDisco);
	}
	
	public function setVariable(list:List<Float>)
	{
		_anguloDisco = list.pop();
		cantDiscUp = list.pop();
		_velocidadDisco = list.pop();
		_delayTime = list.pop();
		endTime = list.pop();
		timeStart = list.pop();
		y = list.pop();
		x = list.pop();
		/*
		x = list.pop();
		y = list.pop();
		timeStart = list.pop();
		endTime = list.pop();
		_delayTime = list.pop();
		_velocidadDisco = list.pop();
		cantDiscUp = list.pop();
		_anguloDisco = list.pop();
		*/
	}
}