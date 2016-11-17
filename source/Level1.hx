package;
import flash.media.Sound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxSave;
import haxe.Serializer;
import haxe.Unserializer;

class Level1 extends FlxState
{

	private var pixelRain:PixelRain;
	private var level1:Array<Array<List<Float>>>;
	private var existsCounter:Int = 0;
	private var serializer:Serializer;
	private var unserializer:Unserializer;
	private var YouWin:Bool = false;
	private var YouWinSprite:FlxSprite;
	private var timer:Float = 0;
	private var godMode:Bool = false;
	private var deadTimer:Float = 0;
	private var deadSprite:FlxSprite;
	private var justDead:Bool = false;
	private var deadCount:Int = 0;
	private var siSprite:FlxSprite;
	private var noSprite:FlxSprite;
	private var siCount:Int = 0;
	private var noCount:Int = 0;
	
	override public function create():Void
	{
		super.create();
		level1 = new Array < Array<List<Float>> > ();
		Reg.stateString = "Level1";
		Reg.fondoo = new Fondo();
		Reg.getTime = 0;
		Reg.player = new Player(Reg.PosicionPlayerX, Reg.PosicionPlayerY);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(FlxG.width, 0);
		Reg.piso = new Piso(0, FlxG.height);
		Reg.techo = new Techo();
		//Reg.EdicionControl = new EdicionOn(Reg.posicionEdicionOn.x,Reg.posicionEdicionOn.y);
		Reg.CajaDiscos = new Array<CajaDisco>();
		Reg.CajaLuzes = new Array<CajaLuz>();
		Reg.CajaLacer = new Array<Laser>();
		Reg.CajaPixel = new Array<PixelRain>();
		Reg.CajaPantallas = new Array<CajaPantalla>();
		//Reg.Consol = new Array<Consola>();
		//Reg.BotonEditor = new Array<FlxSprite>();
		Reg.music = FlxG.sound.load(AssetPaths.Game__ogg);
		Reg.music.volume = 0;
		Reg.songLine = new SongLine(Reg.paredIzq.width, Reg.techo.height, 2*60+28);
		serializer = new Serializer();
		//FlxG.debugger.visible = true;2*60+28
		FlxG.cameras.bgColor = 0xffffffff;
		unserializer = new Unserializer(Reg.EntireLevel);
		level1 = unserializer.unserialize();
		trace(level1);
		for (k in 0...6)
			{
				switch (k)
				{
					case 0:
						for (i in 0...level1[k].length)
						{
							Reg.CajaDiscos[i] = new CajaDisco();
							Reg.CajaDiscos[i].setVariable(level1[k][i]);
							Reg.CantCajaDiscos++;
						}
					case 1:
						for (i in 0...level1[k].length)
						{
							Reg.CajaLuzes[i] = new CajaLuz();
							Reg.CajaLuzes[i].setVariable(level1[k][i]);
							Reg.CantCajaLuzes++;
						}
					case 2:
						for (i in 0...level1[k].length)
						{
							Reg.CajaPixel[i] = new PixelRain();
							Reg.CajaPixel[i].setVariable(level1[k][i]);
							Reg.CantCajaPixel++;
						}
					case 4:
						for (i in 0...level1[k].length)
						{
							Reg.CajaLacer[i] = new Laser();
							Reg.CajaLacer[i].setVariable(level1[k][i]);
							Reg.CantCajaLacer++;
						}
					case 5:
						for (i in 0...level1[k].length)
						{
							Reg.CajaPantallas[i] = new CajaPantalla();
							Reg.CajaPantallas[i].setVariable(level1[k][i]);
							Reg.CantCajaPantallas++;
						}
				}
			}
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.music.volume < 1)
		{
			Reg.music.volume += 0.1;
		}
		if (FlxG.keys.justPressed.G)
		{
			godMode = true;
		}
		if (!Reg.player.exists && !godMode && !justDead)
		{
			Reg.music.kill();
			deadTimer += elapsed;
			if (deadTimer > 3)
			{
				deadSprite = new FlxSprite();
				deadSprite.loadGraphic(AssetPaths.Perdiste__png);
				add(deadSprite);
				siSprite = new FlxSprite(815, 759);
				siSprite.loadGraphic(AssetPaths.SI1__png);
				add(siSprite);
				noSprite = new FlxSprite(201, 759);
				noSprite.loadGraphic(AssetPaths.SI1__png);
				add(noSprite);
				justDead = true;
				
			}
		}
		if (justDead)
		{
			deadCount++;
			switch(deadCount)
			{
				case 1:
					deadSprite.loadGraphic(AssetPaths.Perdiste__png);
				case 50:
					deadSprite.loadGraphic(AssetPaths.Perdiste2__png);
				case 60:
					deadCount = 0;
			}
			if (FlxG.mouse.overlaps(siSprite))
			{
				if (siCount < 7)
				{
					siCount++;
				}
				switch(siCount)
				{
					case 1:
						siSprite.loadGraphic(AssetPaths.SI1__png);
					case 2:
						siSprite.loadGraphic(AssetPaths.SI2__png);
					case 3:
						siSprite.loadGraphic(AssetPaths.SI3__png);
					case 4:
						siSprite.loadGraphic(AssetPaths.SI4__png);
					case 5:
						siSprite.loadGraphic(AssetPaths.si6__png);
					case 6:
						siSprite.loadGraphic(AssetPaths.SI5__png);
				}
				if (FlxG.mouse.justPressed)
				{
					FlxG.resetState();
				}
			}
			else
			{
				siCount = 0;
				noSprite.loadGraphic(AssetPaths.SI1__png);
			}
			if (FlxG.mouse.overlaps(noSprite))
			{
				if (noCount < 7)
				{
					noCount++;
				}
				switch(noCount)
				{
					case 1:
						noSprite.loadGraphic(AssetPaths.SI1__png);
					case 2:
						noSprite.loadGraphic(AssetPaths.NO2__png);
					case 3:
						noSprite.loadGraphic(AssetPaths.NO3__png);
					case 4:
						noSprite.loadGraphic(AssetPaths.NO4__png);
					case 5:
						noSprite.loadGraphic(AssetPaths.NO6__png);
					case 6:
						noSprite.loadGraphic(AssetPaths.NO5__png);
				}
				if (FlxG.mouse.justPressed)
				{
					FlxG.resetGame();
				}
			}
			else
			{
				noCount = 0;
				noSprite.loadGraphic(AssetPaths.SI1__png);
			}
		}
		if (Reg.getTime > 147 && !YouWin)
		{
			YouWin = true;
			YouWinSprite = new FlxSprite();
			YouWinSprite.loadGraphic(AssetPaths.Ganaste__png);
			add(YouWinSprite);
			Reg.music.stop();
		}
		if (YouWin)
		{
			timer += elapsed;
			if (timer > 5)
			{
				FlxG.resetGame();
			}
		}
	}
}