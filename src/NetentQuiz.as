package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	[SWF(width="800", height="600")]
	public class NetentQuiz extends Sprite
	{
		public function NetentQuiz()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			setupView();
		}
		
		private function setupView():void
		{
			placeTextFields();
		}
		
		private function placeTextFields():void
		{
			const place:Point = new Point(400, 200);
			
			//x,y is padding
			//width, height is size of field
			const size:Rectangle = new Rectangle(10,10, 70, 30);
			
			var i:uint = 0;
			var textField:TextField;
			
			for (i = 0; i < 9; i++)
			{
				textField = new TextField();
				textField.type = TextFieldType.INPUT;
				
				textField.border = true;
				textField.borderColor = 0xCCCCCC;
				
				textField.width = size.width;
				textField.height = size.height;
				
				textField.x = place.x + i%3*(size.x + size.width);
				textField.y = place.y + int(i/3)*(size.y + size.height);
				
				addChild(textField);
			}
		}
	}
}