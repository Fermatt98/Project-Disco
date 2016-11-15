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

class PlayState extends FlxState
{
	private var pixelRain:PixelRain;
	private var _gameSave:FlxSave;
	private var Level1:Array<Array<List<Float>>>;
	private var existsCounter:Int = 0;
	private var serializer:Serializer;
	private var unserializer:Unserializer;
	
	override public function create():Void
	{
		super.create();
		Level1 = new Array < Array<List<Float>> > ();
		Reg.fondo = new FlxSprite();
		//Reg.fondo.loadGraphic(AssetPaths.fondo3__jpg);
		add(Reg.fondo);
		Reg.getTime = 0;
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
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
		Reg.music = FlxG.sound.load(AssetPaths.Game__wav);
		Reg.songLine = new SongLine(Reg.paredIzq.width, Reg.techo.height, Reg.music.length / 1000);
		serializer = new Serializer();
		//FlxG.debugger.visible = true;2*60+28
		_gameSave = new FlxSave();
		_gameSave.bind("Level1");
		FlxG.cameras.bgColor = 0xffffffff;

		unserializer = new Unserializer(Reg.EntireLevel);
		Level1 = unserializer.unserialize();
		trace(Level1);
		
		for (k in 0...6)
			{
				switch (k)
				{
					case 0:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaDiscos[i] = new CajaDisco();
							Reg.CajaDiscos[i].setVariable(Level1[k][i]);
							Reg.CantCajaDiscos++;
						}
					case 1:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaLuzes[i] = new CajaLuz();
							Reg.CajaLuzes[i].setVariable(Level1[k][i]);
							Reg.CantCajaLuzes++;
						}
					case 2:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPixel[i] = new PixelRain();
							Reg.CajaPixel[i].setVariable(Level1[k][i]);
							Reg.CantCajaPixel++;
						}
					case 3:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPixelBoton[i] = new PixelBoton();
							Reg.CajaPixelBoton[i].setVariable(Level1[k][i]);
						}
					case 4:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaLacer[i] = new Laser();
							Reg.CajaLacer[i].setVariable(Level1[k][i]);
							Reg.CantCajaLacer++;
						}
					case 5:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPantallas[i] = new CajaPantalla();
							Reg.CajaPantallas[i].setVariable(Level1[k][i]);
							Reg.CantCajaPantallas++;
						}
				}
			}
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.E)
		{
			for (i in 0...Reg.CajaDiscos.length)
			{
				Reg.CajaDiscos[i].destroy();
			}
			for (i in 0...Reg.CajaLuzes.length)
			{
				Reg.CajaLuzes[i].destroy();
			}
			for (i in 0...Reg.CajaPixel.length)
			{
				Reg.CajaPixel[i].destroy();
				Reg.CajaPixelBoton[i].destroy();
			}
			for (i in 0...Reg.CajaLacer.length)
			{
				Reg.CajaLacer[i].destroy();
			}
			for (i in 0...Reg.CajaPantallas.length)
			{
				Reg.CajaPantallas[i].destroy();
			}
		}
		if (FlxG.keys.justPressed.R)
		{
			if (!Reg.player.exists)
			{
				Reg.player.revive();
			}
		}
		if (FlxG.keys.justPressed.S)
		{
			_gameSave.erase();
			_gameSave.bind("Level1");
			for (k in 0...Reg.cantArmas)
			{
				Level1[k] = new Array < List<Float> > ();
				switch (k)
				{
					case 0:
						existsCounter = 0;
						for (i in 0...Reg.CantCajaDiscos)
						{
							if (Reg.CajaDiscos[i].exists)
							{
								Level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaDiscos[i].getVariable(Level1[k][i-existsCounter]);
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
								Level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaLuzes[i].getVariable(Level1[k][i-existsCounter]);
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
								Level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaPixel[i].getVariable(Level1[k][i - existsCounter]);
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
								Level1[k][i - existsCounter] = new List<Float>();
								Reg.CajaPixelBoton[i].getVariable(Level1[k][i - existsCounter]);
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
								Level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaLacer[i].getVariable(Level1[k][i-existsCounter]);
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
								Level1[k][i-existsCounter] = new List<Float>();
								Reg.CajaPantallas[i].getVariable(Level1[k][i-existsCounter]);
							}
							else
							{
								existsCounter++;
							}
						}
				}
			}
			_gameSave.data.Level1 = Level1;
			_gameSave.flush();
			for (i in 0...Reg.cantArmas)
			{
				serializer = new Serializer();
				serializer.serialize(Level1[i]);
				trace(serializer);
			}
			serializer = new Serializer();
			serializer.serialize(Level1);
			trace(serializer);
		}
		if (FlxG.keys.justPressed.L)
		{
			Level1 = _gameSave.data.Level1;
			for (i in 0...Reg.CajaDiscos.length)
			{
				Reg.CajaDiscos[i].destroy();
			}
			for (i in 0...Reg.CajaLuzes.length)
			{
				Reg.CajaLuzes[i].destroy();
			}
			for (i in 0...Reg.CajaPixel.length)
			{
				Reg.CajaPixel[i].destroy();
				Reg.CajaPixelBoton[i].destroy();
			}
			for (i in 0...Reg.CajaLacer.length)
			{
				Reg.CajaLacer[i].destroy();
			}
			for (i in 0...Reg.CajaPantallas.length)
			{
				Reg.CajaPantallas[i].destroy();
			}
			for (k in 0...Level1.length)
			{
				switch (k)
				{
					case 0:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaDiscos[i] = new CajaDisco();
							Reg.CajaDiscos[i].setVariable(Level1[k][i]);
							Reg.CantCajaDiscos++;
						}
					case 1:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaLuzes[i] = new CajaLuz();
							Reg.CajaLuzes[i].setVariable(Level1[k][i]);
							Reg.CantCajaLuzes++;
						}
					case 2:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPixel[i] = new PixelRain();
							Reg.CajaPixel[i].setVariable(Level1[k][i]);
							Reg.CantCajaPixel++;
						}
					case 3:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPixelBoton[i] = new PixelBoton();
							Reg.CajaPixelBoton[i].setVariable(Level1[k][i]);
						}
					case 4:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaLacer[i] = new Laser();
							Reg.CajaLacer[i].setVariable(Level1[k][i]);
							Reg.CantCajaLacer++;
						}
					case 5:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPantallas[i] = new CajaPantalla();
							Reg.CajaPantallas[i].setVariable(Level1[k][i]);
							Reg.CantCajaPantallas++;
						}
				}
			}
		}
	}
}
