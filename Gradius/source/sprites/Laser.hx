package sprites;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.editors.tiled.TiledMap;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;


class Laser extends FlxSprite
{
	private var VELOCITY:Float = 350;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.laser__png, true, 8, 8);
		updateHitbox();
		animation.add("shoot", [0, 1], 2, true);
		animation.play("shoot");
		
		velocity.x = VELOCITY;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		 
		if (x > FlxG.camera.scroll.x + FlxG.width || x < FlxG.camera.scroll.x)
		    {
				destroy();
				trace ("LASER DESTRUIDO");
			}
	}
	public function interact(tilemap:FlxTilemap):Void
	{
		if (FlxG.collide(this, tilemap))
		    {
				destroy();
				trace("LASER DESTRUIDO");
			}
	}
}