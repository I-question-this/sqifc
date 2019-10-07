//============================================================================
// Name        : SQIFC
// Author      : Quoc-Sang Phan <dark2bright@gmail.com>
// Contributor : Tyler Westland <tylerofthewest@gmail.com>
// Version     : 0.1
// Copyright   : No
// Description : Symbolic Quantitative Information Flow Analysis for C
//============================================================================

#include <assert.h>
//#includeTest


int main(void)
{
	int K = 32;
	
	int output = func();
	
	int bv[K];
	for(int i = 0; i < K; i++)
		bv[i] = (output >> i) & 1;

	assert (bv[0] == 0);
	return 0;
}
