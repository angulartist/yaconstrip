// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.PublisherTcSegment = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var PublisherTcSegment = (function() {
  function PublisherTcSegment(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PublisherTcSegment.prototype._read = function() {
    this.segmentType = this._io.readBitsIntBe(3);
    this.pubPurposesConsent = [];
    for (var i = 0; i < 24; i++) {
      this.pubPurposesConsent.push(this._io.readBitsIntBe(1) != 0);
    }
    this.pubPurposesLiTransparency = [];
    for (var i = 0; i < 24; i++) {
      this.pubPurposesLiTransparency.push(this._io.readBitsIntBe(1) != 0);
    }
    this.numCustomPurposes = this._io.readBitsIntBe(6);
    if (this.numCustomPurposes > 0) {
      this.customPurposesConsent = [];
      for (var i = 0; i < this.numCustomPurposes; i++) {
        this.customPurposesConsent.push(this._io.readBitsIntBe(1) != 0);
      }
    }
    if (this.numCustomPurposes > 0) {
      this.customPurposesLiTransparency = [];
      for (var i = 0; i < this.numCustomPurposes; i++) {
        this.customPurposesLiTransparency.push(this._io.readBitsIntBe(1) != 0);
      }
    }
  }

  return PublisherTcSegment;
})();
return PublisherTcSegment;
}));
