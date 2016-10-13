package sprites;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;


class Speed extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, FlxColor.CYAN);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (x < FlxG.camera.scroll.x)
		    destroy();
	}
	
}