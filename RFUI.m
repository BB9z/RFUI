#import "RFUI.h"

bool RFEdgeEqualToEdge(RFEdge a, RFEdge b) {
	if (a.top == b.top && a.right == b.right &&
		a.bottom == b.bottom && a.left == b.left) {
		return true;
	}
	return false;
}

RFEdge RFEdgeMake (float top, float right, float bottom, float left) {
	RFEdge tmp;
	tmp.top = top;
	tmp.right = right;
	tmp.bottom = bottom;
	tmp.left = left;
	return tmp;
}