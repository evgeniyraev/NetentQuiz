package
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class SpinButton extends SimpleButton
	{
		public function SpinButton()
		{
			super(makeGraphic(0xFF9900),
				makeGraphic(0xFFAA00),
				makeGraphic(0xFF7000),
				makeGraphic(0xFF7000));
		}
		
		private function makeGraphic(color:uint):DisplayObject
		{
			var graphic:Sprite = new Sprite();
			
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(color, 1);
			bg.graphics.drawRect(0,0,100, 50);
			graphic.addChild(bg);
			
			var label:TextField = new TextField();
			label.textColor = 0xFFFFFF;
			label.text = "spin";
			label.width = 80;
			label.height = 30;
			
			var textFormat:TextFormat = new TextFormat(
				"Helvetica",
				20,
				0xFFFFFF,
				true,
				false,
				false,
				null,
				null,
				TextFormatAlign.CENTER);
			
			label.setTextFormat(textFormat)
			
			label.x = (bg.width - label.width) >> 1;
			label.y = (bg.height - label.height) >> 1;
			graphic.addChild(label);
			
			return graphic;
		}
	}
}