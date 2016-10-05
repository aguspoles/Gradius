package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class SpaceShip extends FlxSprite
{
	private var velocidadY:Int = 4;
	private var velocidadX:Int = 4;
	private var key_right:Bool;
	private var key_left:Bool;
	private var key_up:Bool;
	private var key_down:Bool;
	private var moveX:Int;
	private var moveY:Int;
	public static var laser:Laser;
	private var timer:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32);	
	}
	
	override public function update(elapsed:Float):Void
	{	
		super.update(elapsed);
			
		/*//movimiento
		key_right = FlxG.keys.pressed.RIGHT;
		key_left = FlxG.keys.pressed.LEFT;
		key_up = FlxG.keys.pressed.UP;
		key_down = FlxG.keys.pressed.DOWN;
			
		if(key_right && !key_left && x < FlxG.camera.scroll.x + FlxG.width - width)
		   moveX = 1;
	    else if (!key_right && key_left && x > 0)
			    moveX = -1;
		else
				moveX = 0;
				
		if(key_up && !key_down && y > 0)
		   moveY = -1;
		else if (!key_up && key_down && y < FlxG.height - height)
				moveY = 1;
		else
			moveY = 0;
			
		x += moveX * velocidadX;
		y += moveY * velocidadY;*/
			   
		//disparo
		timer++;
		if ((FlxG.keys.pressed.SPACE || FlxG.keys.justPressed.SPACE) && timer >= 15)
		{
			laser = new Laser(x + width, y + height / 2 -8);
			timer = 0;
			FlxG.state.add(laser);
		}
		}
	
}