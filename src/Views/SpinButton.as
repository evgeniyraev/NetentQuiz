package Views
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
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
				createBackground(0));
		}
		
		private function makeGraphic(color:uint):DisplayObject
		{
			
			var graphic:Sprite = new Sprite();
			
			
			graphic.addChild(createBackground(color));
			
			
			graphic.addChild(
				createTextField(
					new Rectangle(
						0,
						0,
						graphic.width,
						graphic.height
					)
				)
			);
			
			return graphic;
		}
		
		private function createBackground(color:uint):Sprite
		{
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(color, 1);
			bg.graphics.drawRect(0,0,100, 50);
			
			return bg
		}
		
		private function createTextField(size:Rectangle):TextField
		{
			
			const textSize:uint = 20;
			var label:TextField = new TextField();
			label.textColor = 0xFFFFFF;
			label.text = "SPIN";
			label.width = size.width;
			label.height = textSize;
			
			var textFormat:TextFormat = new TextFormat(
				"Helvetica",
				textSize,
				0xFFFFFF,
				true,
				false,
				false,
				null,
				null,
				TextFormatAlign.CENTER);
			
			label.setTextFormat(textFormat);
			label.y = (size.height - textSize) >> 1;
			
			return label;
		}
	}
}