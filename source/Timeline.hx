package;

import flixel.FlxSprite;
import flixel.FlxState;
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
		if (Reg.stateString != "Level1")
		{
			Reg.Consol[99] = new Consola(Reg.posicionTiempo.x, Reg.posicionTiempo.y, "Tiempo: ", Reg.getTime);
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (Reg.stateString == "Level1")
		{
			set_visible(false);
			play = true;
			Reg.music.play(true, Reg.getTime*1000);
		}
		else
		{
			set_visible(true);
		}
		if (FlxG.keys.justPressed.ENTER)
		{
			if (play)
			{
				play = false;
				Reg.music.stop();
				velocity.x = 0;
			}
			else
			{
				play = true;
				Reg.music.play(true, Reg.getTime*1000);
			}
		}
		if (play)
		{
			velocity.x = Reg.songLine.width / Reg.time; 
			if (x > Reg.songLine.x + Reg.songLine.width-width+1)
			{
				x = Reg.songLine.x + Reg.songLine.width-width;
				play = false;
				Reg.music.stop();
				velocity.x = 0;
			}
		}
		if (FlxG.mouse.pressed && overlapsPoint(FlxG.mouse.getPosition()))
		{
			movement = true;
			play = false;
			Reg.music.stop();
			velocity.x = 0;
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
		Reg.getTime = (x - Reg.songLine.x) * Reg.pixelTime;
		if (Reg.stateString != "Level1")
		{
			if (Reg.getTime != oldTime)
			{
				Reg.Consol[99].destroy();
				Reg.Consol[99] = new Consola(Reg.posicionTiempo.x, Reg.posicionTiempo.y, "Tiempo: ", Reg.getTime);
				oldTime = Reg.getTime;
			}
		}
		
	}
}