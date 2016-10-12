package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import sprites.Laser;

class SpaceShip extends FlxSprite
{
	private var velocidadY:Int = 120;
	private var velocidadX:Int = 120;
	public static var laser:sprites.Laser;
	private var timer:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);	
	}
	
	override public function update(elapsed:Float):Void
	{	
		super.update(elapsed);
		
		movePlayer();
	
		//disparo
		timer++;
		if ((FlxG.keys.pressed.SPACE || FlxG.keys.justPressed.SPACE) && timer >= 15)
		{
			laser = new sprites.Laser(x + width, y + height / 2 -4);
			timer = 0;
			FlxG.state.add(laser);
		}
	}
		
	private function movePlayer():Void { 
		velocity.x = 0;
		velocity.y = 0;
		if (x <= FlxG.camera.scroll.x)
		    velocity.x = 50;
        if (FlxG.keys.pressed.LEFT && x > FlxG.camera.scroll.x)         
		    velocity.x -= velocidadX;
        if (FlxG.keys.pressed.RIGHT && x < FlxG.camera.scroll.x + FlxG.width - width)         
		    velocity.x += velocidadY;
        if (FlxG.keys.pressed.UP && y > 0)        
		    velocity.y -= velocidadY;
		if (FlxG.keys.pressed.DOWN && y < FlxG.height - height)        
		    velocity.y += velocidadY;
	}
	
}