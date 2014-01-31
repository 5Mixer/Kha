package kha.flash;

class Music extends kha.Music {
	private var music: flash.media.Sound;
	private var channel: flash.media.SoundChannel;
	
	public function new(music: flash.media.Sound) {
		super();
		this.music = music;
	}
	
	public override function play(loop: Bool = false): Void {
		if (channel != null) channel.stop();
		channel = music.play(0, loop ? 1000 * 1000 * 100 : 1);
	}
	
	public override function stop(): Void {
		if (channel != null) channel.stop();
	}
}
