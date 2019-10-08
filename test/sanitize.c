//============================================================================
// Name        : SQIFC
// Author      : Quoc-Sang Phan <dark2bright@gmail.com>
// Contributor : Tyler Westland <tylerofthewest@gmail.com>
// Version     : 0.1
// Copyright   : No
// Description : Symbolic Quantitative Information Flow Analysis for C
//============================================================================

typedef unsigned int size_t;

size_t nondet_uchar(); 

size_t func(){
  size_t H = nondet_uchar();
  size_t base = 8;
  size_t O;

  if (H < 16) {
    O = base + H;
  } else {
    O = base;
  }

  return O;
}
