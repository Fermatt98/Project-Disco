package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class CajaDisco extends FlxSprite
{
	private var discos:Array<Disco>;
	private var timer:Float = 0;
	private var cantDiscUp:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, cantDiscos:Int, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		cantDiscUp = cantDiscos;
		discos = new Array<Disco>();
		Reg.anguloDisco = 180/cantDiscos;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		
		if (timer > Reg.spawnDisco)
		{
			for (a in 0...cantDiscUp)
			{
				discos.push(new Disco(x, y, Reg.velocidadDisco, a * Reg.anguloDisco));
				FlxG.state.add(discos[discos.length-1]);
			}
			timer = 0;
			/*if (Reg.anguloDisco == 20)
			{
				Reg.anguloDisco = 15;
			}
			else
			{
				Reg.anguloDisco = 20;
			}*/
		}
		for (i in 0...discos.length)
		{
			if (!discos[i].isOnScreen())
			{
				discos[i].kill();
			}
		}
	}
}