package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Timeline extends FlxSprite
{
	private var movement:Bool = false;
	private var oldTime:Float = 0;
	private var play:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioTimeLineX, Reg.tamanioTimeLineY);
		color = 0x24552564;
		FlxG.state.add(this);
		Reg.Consol[99] = new Consola(Reg.posicionTiempo.x, Reg.posicionTiempo.y, "Tiempo: ", Reg.getTime);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
		{
			if (play)
			{
				play = false;
				velocity.x = 0;
			}
			else
			{
				play = true;
			}
		}
		if (play)
		{
			velocity.x = Reg.songLine.width / Reg.time; 
		}
		if (FlxG.mouse.pressed && overlapsPoint(FlxG.mouse.getPosition()))
		{
			movement = true;
		}
		if (movement)
		{
			if (x < Reg.songLine.x)
			{
				x = Reg.songLine.x;
				movement = false;
			}
			else if (x > Reg.songLine.x + Reg.songLine.width-width+1)
			{
				x = Reg.songLine.x + Reg.songLine.width-width;
				movement = false;
			}
			else
			{
				x = FlxG.mouse.screenX;
			}
			if (!FlxG.mouse.pressed)
			{
				movement = false;
			}
		}
		Reg.getTime = (x-Reg.songLine.x) * Reg.pixelTime;
		if (Reg.getTime != oldTime)
		{
			Reg.Consol[99].destroy();
			Reg.Consol[99] = new Consola(Reg.posicionTiempo.x, Reg.posicionTiempo.y, "Tiempo: ", Reg.getTime);
			oldTime = Reg.getTime;
		}
		
	}
}