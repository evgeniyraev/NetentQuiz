package Utils
{
	public class WheelItemUtil
	{
		/**
		 * this generates seauence of items wiht not duplacated itemss in
		 * specified range
		 */
		public static function randomSequence(
			lenght:uint,
			fromItems:Vector.<uint>,
			startWiht:Vector.<uint>,
			endsIn:Vector.<uint>,
			notDuplicateIn:uint = 3):Vector.<uint>
		{
			var i:int;
			var sequence:Vector.<uint> = startWiht.concat(endsIn);
			
			var available:Vector.<uint> = new Vector.<uint>
			
			for(i = 0; i<fromItems.length; i++)
			{
				if(endsIn.indexOf(fromItems[i]) == -1)
				{
					available.push(fromItems[i]);
				}
			}
			
			function getRandom():uint
			{
				var index:Number = Math.round(Math.random()*available.length) -1;
				
				return available.splice(index, 1)[0]
			}
			
			var atIndex:uint = startWiht.length;
			
			while(sequence.length < lenght)
			{
				sequence.splice(atIndex, 0, getRandom());
				
				if(sequence.length >= atIndex + notDuplicateIn)
				{
					var remain:uint = lenght - sequence.length;
					var item:uint = sequence[atIndex + notDuplicateIn];
					if(remain > atIndex)
					{
						available.push(item);
					}
					else if(startWiht.slice(atIndex - remain, remain).indexOf(item) == -1) 
					{
						available.push(item);
					}
				}
			}
			
			return sequence;
		}
		
		/**
		 * usable wiht previos method
		 */
		public static const epmpyVect:Vector.<uint> = new Vector.<uint>();
		
		public function WheelItemUtil()
		{
		}
	}
}