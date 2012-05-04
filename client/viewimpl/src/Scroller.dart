//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, May 03, 2012  1:06:33 PM
// Author: tomyeh

/**
 * A custom-scrolling handler.
 */
interface Scroller default _Tx3dScroller {
	Scroller(Element node);
		//FUTURE: to support non-touch browser, we can introduce factory
		//to use _owner.parent.style.overflow = "auto";
	/** Destroys the scroller.
	 * It shall be called to clean up the scroller, if it is no longer used.
	 */
	void destroy();

	/** The element that owns this scroller.
	 */
	Element get owner();
}

/** An implementation of [Scroller] that is based on CSS transform:translate3d.
 */
class _Tx3dScroller implements Scroller {
	final Element _owner;

	_Tx3dScroller(Element this._owner) {
	}
	Element get owner() => _owner;
	void destroy() {
	}
}
