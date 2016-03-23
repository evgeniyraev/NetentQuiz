package Views
{
	import flash.display.Sprite;
	
	import Utils.WheelItemUtil;
	
	public class Wheel extends Sprite
	{
		private static const buffer:uint = 10;
		
		private var _numVisibleItems:uint = 3;
		private var _views:Vector.<WheelItem>;
		private var _items:Vector.<uint>;
		private var _angle:Number = 0;
		
		public function get items():Vector.<uint>
		{
			return _items;
		}

		public function set items(value:Vector.<uint>):void
		{
			_items = value;
		}

		/**
		 * the angle that the wheel is rotated
		 * see updateView()
		 */
		public function set angle(value:Number):void
		{
			_angle = value;
			
			updateView();
		}
		
		public function get angle():Number
		{
			return _angle;
		}
		
		public function Wheel(numVisibleItems:uint = 3)
		{
			super();
			
			_numVisibleItems = numVisibleItems;
			
			_views = new Vector.<WheelItem>();
			
			_items = WheelItemUtil.randomSequence(
				numVisibleItems + 1,
				WheelItem.availableTypes,
				WheelItemUtil.epmpyVect,
				WheelItemUtil.epmpyVect,
				numVisibleItems);
			
			setupView();
		}
		
		private function setupView():void
		{
			var view:Sprite;

			for(var i:int = 0; i < _items.length; i++)
			{
				view = WheelItem.getItem(_items[i])
				_views.push(view);
				
				view.y = WheelItem.itemSize.height * (i -1) + buffer;
				
				addChild(view);
			}
			
			var maskSprite:Sprite = new Sprite();
			maskSprite.graphics.beginFill(0xFF0000);
			maskSprite.graphics.drawRect(
				0,
				0,
				WheelItem.itemSize.width,
				WheelItem.itemSize.height*_numVisibleItems);
			maskSprite.graphics.endFill();
			
			this.mask = maskSprite;
			
		}
		/**
		 * all items are full cicle so 2π
		 * visible section is 2π * (numVisibleItems/allItems.lenght)
		 * one wheel item section is 2π * (1/allItems.lenght)
		 */
		private function updateView():void
		{
			var oneWheelItemSection:Number = Math.PI * 2 / (1 / _items.length);
			var workingAngle:Number = _angle % (Math.PI * 2);
			var firstItemIndex:uint = int(workingAngle / oneWheelItemSection);
			var offset:Number = workingAngle % oneWheelItemSection;
			var itemHeigh:Number = WheelItem.itemSize.height + buffer;
			
			var view:WheelItem;
			for(var i:uint = 0, len:uint = _views.length; i < len; i++)
			{
				view = _views[i];
				removeChild(view);
				WheelItem.returnItem(view);
				view = WheelItem.getItem(_items[firstItemIndex + i]);
				addChild(view);
				
				view.y = (i + offset - 1) * itemHeigh;
			}
		}
	}
}