package sprites;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;


class EnemyShoot extends FlxSprite
{
	private var VELOCITY:Float = -150;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.moco__png, true, 8, 8);
		updateHitbox();
		animation.add("shoot", [0, 1], 15, true);
		animation.play("shoot");
		velocity.x = VELOCITY;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		 
		if (x < FlxG.camera.scroll.x || x >= FlxG.camera.scroll.x + FlxG.width)
		    destroy();
	}
	
}