package Views
{
	import flash.display.Sprite;
	
	import Utils.WheelItemUtil;
	
	public class Wheel extends Sprite
	{
		private static const buffer:uint = 10;
		
		private var _numVisibleItems:uint = 3;
		private var views:Vector.<WheelItem>;
		private var _items:Vector.<uint>;
		
		public function Wheel(numVisibleItems:uint = 3)
		{
			super();
			
			_numVisibleItems = numVisibleItems;
			
			views = new Vector.<WheelItem>();
			
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
				views.push(view);
				
				view.y = WheelItem.itemSize.height * i + buffer;
				
				addChild(view);
			}
		}
		
		
		
	}
}