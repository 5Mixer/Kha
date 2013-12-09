package kha.pss;

import haxe.io.Bytes;
import kha.loader.Asset;

class Loader extends kha.Loader {
	@:functionBody('
		xmls.set(asset.name, Xml.parse(System.IO.File.ReadAllText("/Application/resources/" + asset.file)));
		--numberOfFiles;
		checkComplete();
	')
	override function loadXml(asset: Asset): Void {
		Xml.parse("");
	}

	override function loadMusic(asset: Asset): Void {
		musics.set(asset.name, new Music(asset.file));
		--numberOfFiles;
		checkComplete();
	}

	override function loadSound(asset: Asset): Void {
		sounds.set(asset.name, new Sound(asset.file));
		--numberOfFiles;
		checkComplete();
	}

	override function loadImage(asset: Asset): Void {
		images.set(asset.name, new Image(asset.file));
		--numberOfFiles;
		checkComplete();
	}

	@:functionBody('
		byte[] bytes = System.IO.File.ReadAllBytes("/Application/resources/" + asset.file);
		blobs.set(asset.name, new Blob(new haxe.io.Bytes(bytes.Length, bytes)));
		--numberOfFiles;
		checkComplete();
	')
	override function loadBlob(asset: Asset): Void {
		
	}

	override public function loadFont(name: String, style: FontStyle, size: Int): kha.Font {
		return null; //new Font(name, style, size);
	}
}