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

class PlayEditor extends FlxState
{
	private var pixelRain:PixelRain;
	private var _gameSave:FlxSave;
	private var level1:Array<Array<List<Float>>>;
	private var existsCounter:Int = 0;
	private var salir:FlxSprite;
	private var guardar:FlxSprite;
	private var tacho:FlxSprite;
	private var reviver:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		level1 = new Array < Array<List<Float>> > ();
		Reg.fondoo = new Fondo();
		Reg.getTime = 0;
		Reg.player = new Player(Reg.PosicionPlayerX, Reg.PosicionPlayerY);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(FlxG.width, 0);
		Reg.piso = new Piso(0, FlxG.height);
		Reg.techo = new Techo();
		Reg.EdicionControl = new EdicionOn(Reg.posicionEdicionOn.x,Reg.posicionEdicionOn.y);
		Reg.CajaDiscos = new Array<CajaDisco>();
		Reg.CajaLuzes = new Array<CajaLuz>();
		Reg.CajaLacer = new Array<Laser>();
		Reg.CajaPixel = new Array<PixelRain>();
		Reg.CajaPixelBoton = new Array<PixelBoton>();
		Reg.CajaPantallas = new Array<CajaPantalla>();
		Reg.Consol = new Array<Consola>();
		Reg.BotonEditor = new Array<FlxSprite>();
		Reg.music = FlxG.sound.load(AssetPaths.Game__ogg);
		Reg.songLine = new SongLine(Reg.paredIzq.width, Reg.techo.height, 2 * 60 + 28);
		salir = new FlxSprite(1226, 910);
		guardar = new FlxSprite(1171, 910);
		tacho = new FlxSprite(1121, 910);
		reviver = new FlxSprite(1058, 910);
		
		trace(Reg.music.length);
		trace(Reg.music.length/1000);
		//FlxG.debugger.visible = true;2*60+28
		_gameSave = new FlxSave();
		if (Reg.stateString == "Create1")
		{
			_gameSave.bind("Create1");
			level1 = _gameSave.data.Create1;
		}
		if (Reg.stateString == "Create2")
		{
			_gameSave.bind("Create2");
			level1 = _gameSave.data.Create2;
		}
		if (Reg.stateString == "Create3")
		{
			_gameSave.bind("Create3");
			level1 = _gameSave.data.Create3;
		}
		if (Reg.stateString == "Create4")
		{
			_gameSave.bind("Create4");
			level1 = _gameSave.data.Create4;
		}
		if (Reg.stateString == "Create5")
		{
			_gameSave.bind("Create5");
			level1 = _gameSave.data.Create5;
		}
		if (Reg.stateString == "Create6")
		{
			_gameSave.bind("Create6");
			level1 = _gameSave.data.Create6;
		}
		FlxG.cameras.bgColor = 0xffffffff;
		
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
					case 3:
						for (i in 0...level1[k].length)
						{
							Reg.CajaPixelBoton[i] = new PixelBoton();
							Reg.CajaPixelBoton[i].setVariable(level1[k][i]);
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
		if (FlxG.mouse.overlaps(salir) && FlxG.mouse.justPressed)
		{
			FlxG.resetGame();
		}
		if (FlxG.mouse.overlaps(tacho) && FlxG.mouse.justPressed)
		{
			for (i in 0...Reg.CajaDiscos.length)
			{
				Reg.CajaDiscos[i].destroy();
				Reg.CantCajaDiscos = 0;
			}
			for (i in 0...Reg.CajaLuzes.length)
			{
				Reg.CajaLuzes[i].destroy();
				Reg.CantCajaLuzes = 0;
			}
			for (i in 0...Reg.CajaPixel.length)
			{
				Reg.CajaPixel[i].destroy();
				Reg.CajaPixelBoton[i].destroy();
				Reg.CantCajaPixel = 0;
			}
			for (i in 0...Reg.CajaLacer.length)
			{
				Reg.CajaLacer[i].destroy();
				Reg.CantCajaLacer = 0;
			}
			for (i in 0...Reg.CajaPantallas.length)
			{
				Reg.CajaPantallas[i].destroy();
				Reg.CantCajaPantallas = 0;
			}
		}
		if (FlxG.mouse.overlaps(reviver) && FlxG.mouse.justPressed)
		{
			if (!Reg.player.exists)
			{
				Reg.player.revive();
			}
		}
		if (FlxG.mouse.overlaps(guardar) && FlxG.mouse.justPressed)
		{
			_gameSave.erase();
			if (Reg.stateString == "Create1")
			{
				_gameSave.bind("Create1");
			}
			if (Reg.stateString == "Create2")
			{
				_gameSave.bind("Create2");
			}
			if (Reg.stateString == "Create3")
			{
				_gameSave.bind("Create3");
			}
			if (Reg.stateString == "Create4")
			{
				_gameSave.bind("Create4");
			}
			if (Reg.stateString == "Create5")
			{
				_gameSave.bind("Create5");
			}
			if (Reg.stateString == "Create6")
			{
				_gameSave.bind("Create6");
			}
			for (k in 0...Reg.cantArmas)
			{
				level1[k] = new Array < List<Float> > ();
				switch (k)
				{
					case 0:
						existsCounter = 0;
						for (i in 0...Reg.CantCajaDiscos)
						{
							if (Reg.CajaDiscos[i].exists)
							{
								level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaDiscos[i].getVariable(level1[k][i-existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
					case 1:
						existsCounter = 0;
						for (i in 0...Reg.CantCajaLuzes)
						{
							if (Reg.CajaLuzes[i].exists)
							{
								level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaLuzes[i].getVariable(level1[k][i-existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
					case 2:
						existsCounter = 0;
						for (i in 0...Reg.CantCajaPixel)
						{
							if (Reg.CajaPixel[i].exists)
							{
								level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaPixel[i].getVariable(level1[k][i - existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
					case 3:
						existsCounter = 0;
						for (i in 0...Reg.CantCajaPixel)
						{
							if (Reg.CajaPixelBoton[i].exists)
							{
								level1[k][i - existsCounter] = new List<Float>();
								Reg.CajaPixelBoton[i].getVariable(level1[k][i - existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
						
					case 4:
						existsCounter = 0;
						for (i in 0...Reg.CantCajaLacer)
						{
							if (Reg.CajaLacer[i].exists)
							{
								level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaLacer[i].getVariable(level1[k][i-existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
					case 5:
						existsCounter = 0;
						for(i in 0...Reg.CantCajaPantallas)
						{
							if (Reg.CajaPantallas[i].exists)
							{
								level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaPantallas[i].getVariable(level1[k][i-existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
				}
			}
			if (Reg.stateString == "Create1")
			{
				_gameSave.data.Create1 = level1;
			}
			if (Reg.stateString == "Create2")
			{
				_gameSave.data.Create2 = level1;
			}
			if (Reg.stateString == "Create3")
			{
				_gameSave.data.Create3 = level1;
			}
			if (Reg.stateString == "Create4")
			{
				_gameSave.data.Create4 = level1;
			}
			if (Reg.stateString == "Create5")
			{
				_gameSave.data.Create5 = level1;
			}
			if (Reg.stateString == "Create6")
			{
				_gameSave.data.Create6 = level1;
			}
			_gameSave.flush();
		}
	}
}
