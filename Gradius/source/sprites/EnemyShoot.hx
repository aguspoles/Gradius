package sprites;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;


class EnemyShoot extends FlxSprite
{
	private var VELOCITY:Float = -350;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(4, 4);
		velocity.x = VELOCITY;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		 
		if (x < FlxG.camera.scroll.x || x >= FlxG.camera.scroll.x + FlxG.width)
		    destroy();
		
	}
	
}