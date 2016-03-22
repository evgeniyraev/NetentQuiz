package wheels
{
	public class Wheel implements IWheel
	{
		private static const BLUR_CONST:Number = 5; 
		
		private var _elements:Vector.<IWheelItem>;
		private var _speed:Number = 0;
		private var _index:int = 0;
		
		public function Wheel(elements:Vector.<IWheelItem>)
		{
			_elements = elements
		}
		
		public function get index():int
		{
			return _index % _elements.length;
		}

		public function set index(value:int):void
		{
			var length:uint = _elements.length;
			_index = (value + length) % length
		}
		
		public function getIndexWithDelta(delta:uint):int
		{
			var lengh:uint = _elements.length;
			return (index + delta + length) % length;
		}
		
		public function getVisibleElements(offset:uint):Vector.<IWheelItem>
		{
			var visibleElement:Vector.<IWheelItem> = new Vector.<IWheelItem>();
			for(var i:int = -offset; i <= offset; i++)
			{
				visibleElement.push(_elements[getIndexWithDelta(i)]);
			}
			return visibleElement;
		}
		
		
		public function spin(toIndex:uint, numberOfSpins:uint):uint
		{
			var length:uint = _elements.length;
			if(index < toIndex)
			{
				return index - toIndex + length  * numberOfSpins 
			}
			else
			{
				return length - toIndex + index + length * numberOfSpins 
			}
		}
		
	}
}