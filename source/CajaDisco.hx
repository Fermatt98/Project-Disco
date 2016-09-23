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
	
	public function new(?X:Float=0, ?Y:Float=0, cantDiscos:Int, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		discos = new Array<Disco>();
		for (a in 0...cantDiscos)
		{
			discos.push(new Disco(50,50,250,a * 10));
		}
		for ( a in 0...cantDiscos)
		{
			FlxG.state.add(discos[a]);
		}
	}
	
}