package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class PixelBoton extends FlxSprite 
{
	private var _num:Float;
	private var timeStart:Float = 0;
	private var endTime:Float = Reg.time;

	public function new(?X:Float=0, ?Y:Float=0, ?num:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas, FlxColor.RED);
		_num = num;
		timeStart = Reg.getTime;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (Reg.getTime >= timeStart && Reg.getTime < endTime)
		{
			if (Reg.stateString == "Level1")
			{
				set_visible(false);
			}
			else if (!visible)
			{
				set_visible(true);
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedRight)
			{
				Reg.CajaPixel[Std.int(_num)].setVisible(false);
				Reg.CajaPixel[Std.int(_num)].setEndtime();
				Reg.CajaPixel[Std.int(_num)].setPosition(0);
				set_visible(false);
				endTime = Reg.getTime;
			}
			if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedMiddle)
			{
				Reg.CajaPixel[Std.int(_num)].destroy();
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
		list.add(_num);
		
	}
	
	public function setVariable(list:List<Float>)
	{
		x = list.pop();
		y = list.pop();
		timeStart = list.pop();
		endTime = list.pop();
		_num = list.pop();
		list.add(x);
		list.add(y);
		list.add(timeStart);
		list.add(endTime);
		list.add(_num);
	}
	
}