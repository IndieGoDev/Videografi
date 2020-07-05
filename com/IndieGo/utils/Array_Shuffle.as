package com.IndieGo.utils {

	import com.IndieGo.utils.Math_Rand;

	public function Array_Shuffle( arr:Array ): void {

		arr.forEach( function( val:*, i:uint, arr:Array ) {

			var r:int = Math_Rand( 0, i );
			
			arr[ i ] = arr[ r ];
			
			arr[ r ] = val;

		});
		
	}

}