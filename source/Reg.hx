package;

import flixel.FlxSprite;

class Reg
{
	static public var velPlayer:Int = 0;
	static public var jumpVelPlayer:Int = 0;
	inline static public var maxVelPlayer:Int = 400;
	inline static public var accelerationPlayer:Int = 30;
	inline static public var jumpAccelerationPlayer:Int = 20;
	inline static public var jumpMaxVelPlayer:Int = -600;
	inline static public var maxJump:Int = 2;
	inline static public var pixelVel:Int = 800;
	
	//------ DISCO -----//
	static public var velocidadDisco:Int = 250;
	static public var anguloDisco:Float = 0;
		static public var discos:Array<Disco>;
	//--------FLXSPRITES------------//
	static public var player:FlxSprite;
	//-------Escenario-------//
	static public var piso:FlxSprite;
	static public var paredIzq:FlxSprite;
	static public var paredDer:FlxSprite;
	static public var techo:FlxSprite;
	//-------Armas------//
	static public var TrampaDisco:FlxSprite;
	static public var TrampaDisco2:FlxSprite;
	static public var TrampaDisco3:FlxSprite;
	static public var Luz1:FlxSprite;
	static public var Luz2:FlxSprite;
	static public var Luz3:FlxSprite;
	static public var Luz4:FlxSprite;
	static public var Laser1:FlxSprite;
	static public var Laser2:FlxSprite;
	static public var Laser3:FlxSprite;
	static public var Laser4:FlxSprite;
	static public var pixel:Array<Pixel>;
}