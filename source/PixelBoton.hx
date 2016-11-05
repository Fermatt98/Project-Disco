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

	public function new(?X:Float=0, ?Y:Float=0, num:Int, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		_num = num;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedRight)
		{
			Reg.CajaPixel[_num].setVisible(false);
			Reg.CajaPixel[_num].setEndtime();
			for (i in 0...Reg.pixel.length)
			{
				Reg.pixel[i].destroy();
			}
			Reg.CajaPixel[_num].setPosition(0);
			set_visible(false);
		}
		if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedMiddle)
		{
			Reg.CajaPixel[_num].destroy();
			destroy();
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