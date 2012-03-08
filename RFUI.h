/*!
 RFUI
*/

#ifndef RFUI_h
#define RFUI_h

#if !defined(RF_INLINE)
# if defined(CG_INLINE)
#  define RF_INLINE CG_INLINE
# elif defined(__cplusplus)
#  define RF_INLINE static inline
# elif defined(__GNUC__)
#  define RF_INLINE static __inline__
# else
#  define RF_INLINE static
# endif
#endif

typedef enum {
	RFUIOrientationHorizontal = 0,
	RFUIOrientationVertical,
} RFUIOrientation;

typedef struct {
	float top;
	float right;
	float bottom;
	float left;
} RFEdge;

typedef RFEdge RFMargin;
typedef RFEdge RFBorder;
typedef RFEdge RFPadding;

bool RFEdgeEqualToEdge (RFEdge a, RFEdge b);
RF_INLINE bool RFMarginEqualToMargin(RFMargin a, RFMargin b) {
	return RFEdgeEqualToEdge(a, b);
}
RF_INLINE bool RFPaddingEqualToPadding (RFBorder a, RFBorder b) {
	return RFEdgeEqualToEdge(a, b);
}
RF_INLINE bool RFBorderEqualToBorder (RFPadding a, RFPadding b) {
	return RFEdgeEqualToEdge(a, b);
}

RFEdge RFEdgeMake (float top, float right, float bottom, float left);
RF_INLINE RFMargin RFMarginMake (float top, float right, float bottom, float left) {
	return RFEdgeMake(top, right, bottom, left);
}
RF_INLINE RFBorder RFBorderMake (float top, float right, float bottom, float left) {
	return RFEdgeMake(top, right, bottom, left);
}
RF_INLINE RFPadding RFPaddingMake (float top, float right, float bottom, float left) {
	return RFEdgeMake(top, right, bottom, left);
}

RF_INLINE RFEdge RFEdgeMakeWithFloat (float edge) {
	return RFEdgeMake(edge, edge, edge, edge);
}
RF_INLINE RFMargin RFMarginMakeWithFloat (float edge) {
	return RFEdgeMake(edge, edge, edge, edge);
}
RF_INLINE RFBorder RFBorderMakeWithFloat (float edge) {
	return RFEdgeMake(edge, edge, edge, edge);
}
RF_INLINE RFPadding RFPaddingMakeWithFloat (float edge) {
	return RFEdgeMake(edge, edge, edge, edge);
}

#endif
