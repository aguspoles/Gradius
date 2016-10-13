package states;

import flixel.FlxG;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.FlxObject;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;//para cargar el nivel de ogmo
import flixel.tile.FlxTilemap;//para usarlo
import flixel.FlxObject;
import sprites.Missile;
import sprites.Ovni;
import sprites.SpaceShip;

class PlayState extends FlxState
{
	private var spaceShip:sprites.SpaceShip;
	private var tilemap:FlxTilemap;
	private var loader:FlxOgmoLoader;
	private var ovni:sprites.Ovni;
	private var cameraGuide:FlxSprite;
	private var enemys:FlxTypedGroup<Ovni>;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = 0xff0078f8;
		enemys = new FlxTypedGroup<Ovni>();
		
		//	Cargo el nivel de OGMO a un Tilemap
		loader = new FlxOgmoLoader(AssetPaths.nivel__oel);
		tilemap = loader.loadTilemap(AssetPaths.rocas__png, 16, 16, "tilesets");
		
		//	Seteo reglas para las colisiones
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.ANY);
		tilemap.setTileProperties(3, FlxObject.ANY);
		tilemap.setTileProperties(4, FlxObject.ANY);
		tilemap.setTileProperties(5, FlxObject.NONE);
		
		//	Cargo cada entidad del nivel de OGMO y inicializo sus cosillas
		loader.loadEntities(entityCreator, "entities");
		
		//	Seteo los límites de scrolleo para la cámara, y para las colisiones en el mundo
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		
		//	Seteo el guía de la cámara, a quien ésta sigue
		cameraGuide = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		cameraGuide.makeGraphic(1, 1, 0x00000000);
		cameraGuide.velocity.x = 50;
		FlxG.camera.follow(cameraGuide);
		spaceShip.velocity.x = cameraGuide.velocity.x;
		
		//	Agrego todo al FlxState
		add(cameraGuide);
		add(tilemap);
		add(spaceShip);
		add(enemys);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		if (FlxG.collide(tilemap, spaceShip))
		    spaceShip.death();
			
		spaceShip.interact(enemys);
	}
	
	private function entityCreator(entityName:String, entityData:Xml):Void
	{
		//	Parseo la X y la Y de cada entidad en el nivel de OGMO
		var entityStartX:Float = Std.parseFloat(entityData.get("x"));
		var entityStartY:Float = Std.parseFloat(entityData.get("y"));
		
		//	Me fijo qué tipo de entidad tengo que inicializar...
		switch(entityName)
		{
			//	...y creo la entidad y seteo sus cosillas.
			case "player":
				spaceShip = new sprites.SpaceShip(entityStartX, entityStartY);
			case "Ovni":
				    enemys.add(new Ovni(entityStartX, entityStartY));
		}

	}
}
