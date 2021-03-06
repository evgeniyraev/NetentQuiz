package
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import Utils.WheelItemUtil;
	
	import Views.SpinButton;
	import Views.Wheel;
	
	[SWF(width="800", height="600")]
	public class NetentQuiz extends Sprite
	{
		private var textFields:Vector.<TextField>;
		private var wheels:Vector.<Wheel>;
		private var button:SimpleButton;
		private var numWheelCompletedSpining:uint = 0;
		
		public function NetentQuiz()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			setupView();
		}
		
		private function setupView():void
		{
			placeWheels();
			placeTextFields();
			placeButton();
		}
		
		private function placeWheels():void
		{
			const place:Point = new Point(50, 50);
			const padding:uint = 70;
			
			wheels = new Vector.<Wheel>();
			
			var i:int;
			var wheel:Wheel;
			for(i = 0; i < 3; i++)
			{
				wheel = new Wheel();
				wheel.x = place.x + i * padding;
				wheel.y = place.y;
				wheel.completeListener = onComplete;
				addChild(wheel);
				wheels.push(wheel);
			}
		}
		
		private function placeTextFields():void
		{
			const place:Point = new Point(400, 200);
			
			//x,y is padding
			//width, height is size of field
			const size:Rectangle = new Rectangle(10,10, 70, 30);
			
			textFields = new Vector.<TextField>();
			
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
				textFields.push(textField);
			}
		}
		
		private function placeButton():void
		{
			const place:Point = new Point(600, 400);
			
			button = new SpinButton();
			button.x = place.x;
			button.y = place.y;
			
			button.addEventListener(MouseEvent.CLICK, onButtonClick);
			
			addChild(button)
		}
		
		protected function onButtonClick(event:MouseEvent):void
		{
			if(button.enabled == false)
				return;
			
			var i:int, index:int;
			var len:int;
			var endItems:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>;
			for(i=0; i< 3; i++)
			{
				endItems.push(new Vector.<uint>);
			}
			
			var haveErrors:Boolean = false;
			for(i = 0, len = textFields.length; i < len; i++)
			{
				index = WheelItemUtil.nameToIndex(textFields[i].text);
				if(index == 0)
				{
					textFields[i].borderColor = 0xFF0000;
					haveErrors = true;
				}
				else
				{
					textFields[i].borderColor = 0xCCCCCC;
					endItems[i%3].push(index);
				}
			}
			
			if(haveErrors)
			{
				return;
			}
			
			var firstSpin:Number = 2;
			var nextSping:Number = 0.7;
			
			
			for(i = 0, len = wheels.length; i < len; i++)
			{
				wheels[i].spinTo(endItems[i], firstSpin + nextSping*i, 3 + i);
				
			}
			button.enabled = false;
			numWheelCompletedSpining = 0;
		}
		
		protected function onComplete():void{
			numWheelCompletedSpining += 1;
			if (numWheelCompletedSpining == wheels.length)
			{
				button.enabled = true
			}
		}
	}
}