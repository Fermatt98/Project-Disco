package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


/**
 * ...
 * @author ...
 */
class EdicionOn extends FlxSprite
{
	private var arma:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		this.color = 0xFF0000;
		FlxG.state.add(this);
	}
	public function cambio(prendido:Bool)
	{
		if (prendido == true)
		{
			this.color = 0xFF0000;
		}
		else if (prendido == false)
		{
			this.color = 0x2EFE2E;
		}
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.mouse.justPressed && arma == 1)
		{
			Reg.CajaDiscos[Reg.CantCajaDiscos] = new CajaDisco(FlxG.mouse.x, FlxG.mouse.y, Reg.CantDiscos,Reg.DelayDiscos,500);
			Reg.CantCajaDiscos += 1;
		}
		if (FlxG.mouse.justPressed && arma == 2)
		{
			Reg.CajaLuzes[Reg.CantCajaLuzes] = new CajaLuz(FlxG.mouse.x, FlxG.mouse.y, 0.5,1);
			Reg.CantCajaLuzes += 1;
		}
		if (FlxG.mouse.justPressed && arma == 3)
		{
			Reg.CajaLacer[Reg.CantCajaLacer] = new Laser(FlxG.mouse.x, FlxG.mouse.y, true,false, 100, 4, 3);
			Reg.CantCajaLacer += 1;
		}
		if (FlxG.mouse.justPressed && arma == 4)
		{
			Reg.CajaPixel[Reg.CantCajaPixel] = new PixelRain(FlxG.mouse.x, FlxG.mouse.y, 0.5);
			Reg.CantCajaPixel += 1;
		}
		
		if (FlxG.keys.justPressed.ONE)
		{
			if (arma == 1)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				arma = 1;
				cambio(false);
			}
		}
		if (FlxG.keys.justPressed.TWO)
		{
			if (arma == 2)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				arma = 2;
				cambio(false);
			}
		}
		if (FlxG.keys.justPressed.THREE)
		{
			if (arma == 3)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				arma = 3;
				cambio(false);
			}
		}
		if (FlxG.keys.justPressed.FOUR)
		{
			if (arma == 4)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				arma = 4;
				cambio(false);
			}
		}
	}
}