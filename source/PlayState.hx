package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var pixelRain:PixelRain;
	private var timer:Float = 0;

	private var BotonTiros:FlxSprite;
	private var BotonTirosMenos:FlxSprite;
	private var BotonDelay:FlxSprite;
	private var BotonDelayMenos:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		add(Reg.player);
		Reg.piso = new Piso(0, 580);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(780, 0);
		Reg.techo = new Techo();
		Reg.EdicionControl = new EdicionOn(50,50);
		Reg.CajaDiscos = new Array<CajaDisco>();
		Reg.CajaLuzes = new Array<CajaLuz>();
		Reg.CajaLacer = new Array<Laser>();
		Reg.CajaPixel = new Array<PixelRain>();
		Reg.Consol = new Array<Consola>();
		//------Botones-----//
		BotonTiros = new Boton(220, 103, true, "Tiros");
		BotonTirosMenos = new Boton(73, 103, false, "TirosMenos");
		BotonDelay = new Boton(310, 129, true, "Delay");
		BotonDelayMenos = new Boton(73, 129, false, "DelayMenos");
		//-----FinBotones---//
		Reg.Consol[0] = new Consola(100, 100, "Cantidad", Reg.CantDiscos);
		Reg.Consol[1] = new Consola(100,125,"Tiempo disparo", Reg.DelayDiscos);
		FlxG.sound.playMusic(AssetPaths.Game__wav);
		//FlxG.debugger.visible = true;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timer += elapsed;
	}
}
