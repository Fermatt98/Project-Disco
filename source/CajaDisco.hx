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
	private var velAngle:Float = 0;
	private var _angle:Float = 0;
	private var _defaultAngle = 180;
	private var _anguloSuma:Float;

	public function new(?X:Float=0, ?Y:Float=0, ?cantDiscos:Float=5, ?delayTime:Float=1, ?velocidadDisco:Float=1, ?anguloSuma:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		timeStart = Reg.getTime;
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		loadGraphic("assets/images/CajaDisco/cajaDisco.png");
		_delayTime = delayTime;
		_velocidadDisco = velocidadDisco;
		cantDiscUp = cantDiscos;
		_anguloSuma = FlxAngle.asRadians(anguloSuma);
		Reg.discos = new Array<Disco>();
		_anguloDisco = FlxAngle.asRadians(_defaultAngle / (cantDiscos - 1));
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
				velAngle+= _anguloSuma;
				if (velAngle > FlxAngle.asRadians(_defaultAngle))
				{
					velAngle = 0;
				}
				for (a in 0...Std.int(cantDiscUp))
				{
					_angle = (a * _anguloDisco) + velAngle;
					if (_angle > FlxAngle.asRadians(_defaultAngle))
					{
						_angle -= FlxAngle.asRadians(_defaultAngle);
					}
					Reg.discos.push(new Disco(x + width / 2, y + height / 2, _velocidadDisco, _angle));
				}
				timer = 0;
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
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_delayTime);
		list.add(_velocidadDisco);
		list.add(cantDiscUp);
		list.add(_anguloDisco);
		list.add(_anguloSuma);
	}
	
	public function setVariable(list:List<Float>)
	{
		x = list.pop();
		y = list.pop();
		timeStart = list.pop();
		endTime = list.pop();
		_delayTime = list.pop();
		_velocidadDisco = list.pop();
		cantDiscUp = list.pop();
		_anguloDisco = list.pop();
		_anguloSuma = list.pop();
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_delayTime);
		list.add(_velocidadDisco);
		list.add(cantDiscUp);
		list.add(_anguloDisco);
		list.add(_anguloSuma);
	}
}