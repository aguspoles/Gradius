package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Laser extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(4,4);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	    velocity.x = 350;
		 
		if (x > FlxG.width)
		    destroy();
	}
	
}