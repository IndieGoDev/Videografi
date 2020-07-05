package com.IndieGo.utils {

	public function Math_Rand( start:int, end:int ): int {

		return Math.floor( Math.random() * ( end - start + 1 ) ) + start;
		
	}

}