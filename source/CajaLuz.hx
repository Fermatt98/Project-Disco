package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;
import flixel.system.FlxSound;


/**
 * ...
 * @author ...
 */
class CajaLuz extends FlxSprite
{
	private var _luz:FlxSprite;
	private var _time:Float = 0;
	private var _delayLuz:Float = 0;
	private var _duracionLuz:Float = 0;
	private var _duracionTotalLuz:Float = 0;
	private var _luzBool:Bool = false;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;
	private var SFXStart:FlxSound;
	private var animationCounter = 0;
	private var _timer2:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?delayLuz:Float=0, ?duracionLuz:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		timeStart = Reg.getTime;
		loadGraphic("assets/images/CajaLuz/cajaLuz.png");
		_delayLuz = delayLuz;
		_duracionTotalLuz = duracionLuz;
		_duracionLuz = duracionLuz + delayLuz;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.getTime >= timeStart && Reg.getTime < endTime)
		{
			_time += elapsed;
			_timer2 += elapsed;
			if (_timer2 > 0.1 && animationCounter < 6)
			{
				animationCounter++;
				animacion();
				_timer2 = 0;
			}
			if (!visible)
			{
				set_visible(true);
			}
			if ( _time > _delayLuz && !_luzBool)
			{
				_luz = new Luz(x, y + height, _duracionTotalLuz);	
				_luzBool = true;
			}
			if( _time > _duracionLuz)
			{
				_time = 0;
				_luzBool = false;
				animationCounter = 0;
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
			//_luz.destroy();
		}
	}
	
	public function getVariable(list:List<Float>)
	{
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_delayLuz);
		list.add(_duracionTotalLuz);
		list.add(_duracionLuz);
	}
	
	public function setVariable(list:List<Float>)
	{
		x = list.pop();
		y = list.pop();
		timeStart = list.pop();
		endTime = list.pop();
		_delayLuz = list.pop();
		_duracionTotalLuz = list.pop();
		_duracionLuz = list.pop();
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_delayLuz);
		list.add(_duracionTotalLuz);
		list.add(_duracionLuz);
	}
	
	public function animacion()
	{
		switch(animationCounter)
		{
			case 0:
				loadGraphic(AssetPaths.cajaLuz__png);
			case 1:
				loadGraphic(AssetPaths.cajaLuz2__png);
			case 2:
				loadGraphic(AssetPaths.cajaLuz3__png);
			case 3:
				loadGraphic(AssetPaths.cajaLuz4__png);
			case 4:
				loadGraphic(AssetPaths.cajaLuz5__png);
			case 5:
				loadGraphic(AssetPaths.cajaLuz6__png);
			case 6:
				loadGraphic(AssetPaths.cajaLuz7__png);
		}
	}
}