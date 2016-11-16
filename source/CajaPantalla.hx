package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxState;

/**
 * ...
 * @author ...
 */
class CajaPantalla extends FlxSprite
{
	private var _pantalla:FlxSprite;
	private var _intervalo:Float;
	private var _duracion:Float;
	private var timer:Float = 0;
	private var timer2:Float = 0;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;
	private var _color:String;
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?intervalo:Float = 0, ?duracion:Float = 0, ?color:String = "NEGRO", ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		timeStart = Reg.getTime;
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		FlxG.state.add(this);
		_intervalo = intervalo;
		_duracion = duracion;
		_pantalla = new FlxSprite();
		if (color == "NEGRO")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		}
		else if (color == "BLANCO")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.WHITE);
		}
		else if (color == "AZUL")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.BLUE);
		}
		else if (color == "ROJO")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.RED);
		}
		else if (color == "VERDE")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.GREEN);
		}
		_color = color;
		_pantalla.alpha = 0;
		FlxG.state.add(_pantalla);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (Reg.stateString == "Level1")
		{
			set_visible(false);
		}
		else
		{
			set_visible(true);
		}
		if (Reg.getTime >= timeStart && Reg.getTime < endTime)
		{
			timer += elapsed;
			if (!visible)
			{
				set_visible(true);
			}
			if (timer > _duracion)
			{
				timer2 += elapsed;
				if (timer2 <= _intervalo)
				{
					_pantalla.alpha = 0.9;
				}
				if (timer2 > _intervalo)
				{
					_pantalla.alpha = 0;
					timer = 0;
					timer2 = 0;
				}
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
			_pantalla.alpha = 0;
			timer = 0;
			timer2 = 0;
		}
		
	}
	
	public function getVariable(list:List<Float>)
	{
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_intervalo);
		list.add(_duracion);
		if (_color == "NEGRO")
		{
			list.add(0);
		}
		else if (_color == "BLANCO")
		{
			list.add(1);
		}
		else if (_color == "AZUL")
		{
			list.add(2);
		}
		else if (_color == "ROJO")
		{
			list.add(3);
		}
		else if (_color == "VERDE")
		{
			list.add(4);
		}
	}
	
	public function setVariable(list:List<Float>)
	{
		x = list.pop();
		y = list.pop();
		timeStart = list.pop();
		endTime = list.pop();
		_intervalo = list.pop();
		_duracion = list.pop();
		switch(list.pop())
		{
			case 0:
				_color = "NEGRO";
				_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
			case 1:
				_color = "BLANCO";
				_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
			case 2:
				_color = "AZUL";
				_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);
			case 3:
				_color = "ROJO";
				_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
			case 4:
				_color = "VERDE";
				_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.GREEN);
		}
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_intervalo);
		list.add(_duracion);
		if (_color == "NEGRO")
		{
			list.add(0);
		}
		else if (_color == "BLANCO")
		{
			list.add(1);
		}
		else if (_color == "AZUL")
		{
			list.add(2);
		}
		else if (_color == "ROJO")
		{
			list.add(3);
		}
		else if (_color == "VERDE")
		{
			list.add(4);
		}
	}
	
	override public function destroy():Void 
	{
		super.destroy();
		_pantalla.destroy();
	}
	
}