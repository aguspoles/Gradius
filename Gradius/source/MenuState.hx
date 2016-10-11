package;

import flixel.FlxG;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;//para cargar el nivel de ogmo
import flixel.tile.FlxTilemap;//para usarlo

class MenuState extends FlxState
{
	private var spaceShip:SpaceShip;
	private var tileMap:FlxTilemap;
	private var loader:FlxOgmoLoader;
	
	override public function create():Void
	{
		spaceShip = new SpaceShip(32,32);

		loader = new FlxOgmoLoader(AssetPaths.nivel__oel);
		tileMap = loader.loadTilemap(AssetPaths.rocas__png, 16, 16, "tilesets");
		
		add(tileMap);
		add(spaceShip);
		
		FlxG.camera.follow(spaceShip, FlxCameraFollowStyle.PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, tileMap.width, tileMap.height, true);
	
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
