package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class PixelBoton extends FlxSprite 
{
	private var _num:Int;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;

	public function new(?X:Float=0, ?Y:Float=0, num:Int, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		_num = num;
		timeStart = Reg.getTime;
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
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedRight)
			{
				Reg.CajaPixel[_num].setVisible(false);
				Reg.CajaPixel[_num].setEndtime();
				Reg.CajaPixel[_num].setPosition(0);
				set_visible(false);
				endTime = Reg.getTime;
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedMiddle)
			{
				Reg.CajaPixel[_num].destroy();
				destroy();
			}
		}
		else
		{
			set_visible(false);
		}
	}
	/*
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
	*/
}