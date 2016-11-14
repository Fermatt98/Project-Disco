package;

import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.system.FlxSound;
class Reg
{
	static public var velPlayer:Int = 0;
	static public var jumpVelPlayer:Int = 0;
	inline static public var accelerationPlayer:Int = 100;
	inline static public var maxVelPlayer:Int = 400;
	inline static public var jumpAccelerationPlayer:Int = 20;
	inline static public var jumpMaxVelPlayer:Int = -600;
	inline static public var maxJump:Int = 2;
	inline static public var pixelVel:Int = 800;
	inline static public var cantArmas:Int = 6;
	static public var music:FlxSound;
	//------Posiciones-----//
	static public var posicionEdicionOn:FlxPoint = new FlxPoint(100, 100);
	static public var posicionTiempo:FlxPoint = new FlxPoint(100, 450);
	//------Tamaño------//
	inline static public var tamanioPlayerX:Int = 64;
	inline static public var tamanioPlayerY:Int = 64;
	inline static public var tamanioPared:Int = 64;
	inline static public var tamanioPiso:Int = 64;
	inline static public var tamanioCajas:Int = 64;
	inline static public var tamanioBoton:Int = 36;
	inline static public var tamanioDisco:Int = 24;
	inline static public var tamanioSongLine:Int = 64;
	inline static public var tamanioTimeLineX:Int = 16;
	inline static public var tamanioTimeLineY:Int = 64;
	
	//-----Editor----//
	static public var Consol:Array<Consola>;
	static public var ConsolTexto:ConsolaTexto;
	static public var BotonEditor:Array<FlxSprite>;
	static public var EdicionControl:EdicionOn;
	//--------FLXSPRITES------------//
	static public var player:FlxSprite;
	//-------Escenario-------//
	static public var piso:FlxSprite;
	static public var paredIzq:FlxSprite;
	static public var paredDer:FlxSprite;
	static public var techo:FlxSprite;
	static public var fondo:FlxSprite;
	//-------Armas------//
		//-------Discos-----//
		static public var CajaDiscos:Array<CajaDisco>;
		static public var CantCajaDiscos:Int = 0;
		static public var CantDiscos:Int = 0;
		static public var DelayDiscos:Float = 1;
		static public var VelDiscos:Float = 300;
		static public var velocidadDisco:Int = 250;
		static public var anguloDisco:Float = 0;
		static public var discos:Array<Disco>;
		static public var velAngulo:Float = 0;
		//-------DiscosFin----//
		//--------Luz-------//
		static public var DelayLuz:Float = 1;
		static public var DuracionLuz:Float = 2;
		//-------LuzFin----//
		//-------PixelRain------//
		static public var PixelSpawn:Float = 1;
		static public var PixelDireccionX:Float = 1;
		static public var PixelDireccionY:Float = 1;
		static public var PixelDistancia:Float = 120;
		static public var PixelVelocidad:Float = 150;
		//-------PixelRainFin---//
		//-------Lacer------//
		static public var LacerVertical:Bool = false;
		static public var LacerVerticalN:Float = 0;
		static public var LacerDireccion:Bool = false;
		static public var LacerDireccionN:Float = 0;
		static public var LacerVelocidad:Float = 0;
		static public var LacerCambio:Float = 0;
		static public var LacerIntervalo:Float = 0;
		//-----FinLacer----//
		//-----Pantalla----//
		static public var PantallaIntervalo:Float = 0;
		static public var PantallaDuracion:Float = 0;
		static public var PantallaColor:String = "NEGRO";
		//----finPantalla--//
		static public var CajaLuzes:Array<CajaLuz>;
		static public var CantCajaLuzes:Int = 0;
		static public var CajaLacer:Array<Laser>;
		static public var CantCajaLacer:Int = 0;
		static public var CajaPixel:Array<PixelRain>;
		static public var CantCajaPixel:Int = 0;
		static public var CajaPixelBoton:Array<PixelBoton>;
		static public var pixel:Array<Pixel>;
		static public var CajaPantallas:Array<CajaPantalla>;
		static public var CantCajaPantallas:Int = 0;
	//-------Editor------//
		static public var timeline:FlxSprite;
		static public var songLine:FlxSprite;
		static public var pixelTime:Float;
		static public var getTime:Float;
		static public var time:Float;
		static public var grishaUno:FlxSprite;
		static public var GrishaBool:Bool = true;
		
		
	//-----------------LOAD LEVEL-------------------//
		inline static public var EntireLevel:String = "aald576d64d0d11.4941242694264d1d300i10d0.349065850398866d0hld128d64d6.81126760563379d11.4941242694264d1d300i10d0.349065850398866d0.0872664625997165hld1088d64d6.81126760563379d11.4941242694264d1d300i10d0.349065850398866d0.0872664625997165hhahali64i64d12.4819823704134d13.2291415157615d0.1d180d600d1d1hhald64d64d12.4819823704134d13.2291415157615i11hhahahh";
		//inline static public var CajaDiscoLevel:String = 
}