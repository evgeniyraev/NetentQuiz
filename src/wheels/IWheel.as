package wheels
{
	public interface IWheel
	{
		function getVisibleElements(offset:uint):Vector.<IWheelItem>;
		
		function get index():int;
		
		function set index(value:int):void;
		
		function getIndexWithDelta(delta:uint):int;
		
		/**
		 * length of how many elements you have to pass to get to desire
		 * index form given indes
		 */
		function spin(toIndex:uint, numberOfSpins:uint):uint
	}
}