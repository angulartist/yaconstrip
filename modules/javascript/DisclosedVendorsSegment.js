// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DisclosedVendorsSegment = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var DisclosedVendorsSegment = (function() {
  function DisclosedVendorsSegment(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DisclosedVendorsSegment.prototype._read = function() {
    this.segmentType = this._io.readBitsIntBe(3);
    this._io.alignToByte();
    this.vendorConsent = new VendorSection(this._io, this, this._root);
  }

  var VendorSection = DisclosedVendorsSegment.VendorSection = (function() {
    function VendorSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    VendorSection.prototype._read = function() {
      this.maxVendorId = this._io.readBitsIntBe(16);
      this.isRangeEncoding = this._io.readBitsIntBe(1) != 0;
      if (!(this.isRangeEncoding)) {
        this.bitField = [];
        for (var i = 0; i < this.maxVendorId; i++) {
          this.bitField.push(this._io.readBitsIntBe(1) != 0);
        }
      }
      this._io.alignToByte();
      if (this.isRangeEncoding) {
        this.rangeSection = new RangeSection(this._io, this, this._root);
      }
    }

    return VendorSection;
  })();

  var RangeSection = DisclosedVendorsSegment.RangeSection = (function() {
    function RangeSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RangeSection.prototype._read = function() {
      this.numEntries = this._io.readBitsIntBe(12);
      this._io.alignToByte();
      this.rangeEntries = [];
      for (var i = 0; i < this.numEntries; i++) {
        this.rangeEntries.push(new RangeEntry(this._io, this, this._root));
      }
    }

    return RangeSection;
  })();

  var RangeEntry = DisclosedVendorsSegment.RangeEntry = (function() {
    function RangeEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RangeEntry.prototype._read = function() {
      this.isARange = this._io.readBitsIntBe(1) != 0;
      this.startOrOnlyVendorId = this._io.readBitsIntBe(16);
      if (this.isARange) {
        this.endVendorId = this._io.readBitsIntBe(16);
      }
    }

    return RangeEntry;
  })();

  return DisclosedVendorsSegment;
})();
return DisclosedVendorsSegment;
}));
