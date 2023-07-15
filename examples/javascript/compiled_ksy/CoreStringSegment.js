// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.CoreStringSegment = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var CoreStringSegment = (function() {
  function CoreStringSegment(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  CoreStringSegment.prototype._read = function() {
    this.metadata = new Metadata(this._io, this, this._root);
    this.structure = new Structure(this._io, this, this._root);
  }

  var Alpha = CoreStringSegment.Alpha = (function() {
    function Alpha(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Alpha.prototype._read = function() {
      this.left = this._io.readBitsIntBe(6);
      this.right = this._io.readBitsIntBe(6);
    }

    return Alpha;
  })();

  /**
   * TC Consent Management Platform
   */

  var Metadata = CoreStringSegment.Metadata = (function() {
    function Metadata(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Metadata.prototype._read = function() {
      this.version = this._io.readBitsIntBe(6);
      this.created = this._io.readBitsIntBe(36);
      this.lastUpdated = this._io.readBitsIntBe(36);
      this._io.alignToByte();
      this.cmp = new Cmp(this._io, this, this._root);
      this.gvlVersion = this._io.readBitsIntBe(12);
    }

    /**
     * Consent Management Platform
     */

    var Cmp = Metadata.Cmp = (function() {
      function Cmp(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Cmp.prototype._read = function() {
        this.id = this._io.readBitsIntBe(12);
        this.version = this._io.readBitsIntBe(12);
        this.screen = this._io.readBitsIntBe(6);
        this._io.alignToByte();
        this.language = new Alpha(this._io, this, this._root);
      }

      /**
       * ISO 3166-1 alpha-2 code used identify a country or a language
       */

      return Cmp;
    })();

    /**
     * Supported version is above 2 (TCF 2.O)
     */

    /**
     * Timestamp
     */

    /**
     * Timestamp
     */

    /**
     * Global Vendor List version
     */

    return Metadata;
  })();

  var Structure = CoreStringSegment.Structure = (function() {
    function Structure(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Structure.prototype._read = function() {
      this.policyVersion = this._io.readBitsIntBe(6);
      this.isServiceSpecific = this._io.readBitsIntBe(1) != 0;
      this.useNonStandardTexts = this._io.readBitsIntBe(1) != 0;
      this.specialFeatureOptIns = [];
      for (var i = 0; i < 12; i++) {
        this.specialFeatureOptIns.push(this._io.readBitsIntBe(1) != 0);
      }
      this.purposesConsent = [];
      for (var i = 0; i < 24; i++) {
        this.purposesConsent.push(this._io.readBitsIntBe(1) != 0);
      }
      this.purposesLiTransparency = [];
      for (var i = 0; i < 24; i++) {
        this.purposesLiTransparency.push(this._io.readBitsIntBe(1) != 0);
      }
      this._io.alignToByte();
      this.sjDisclosures = new SjDisclosures(this._io, this, this._root);
      this.vendorConsent = new VendorSection(this._io, this, this._root);
      this.vendorLi = new VendorSection(this._io, this, this._root);
      this.pubRestrictions = new PubRestrictionsSection(this._io, this, this._root);
    }

    var PubRestrictionsSection = Structure.PubRestrictionsSection = (function() {
      function PubRestrictionsSection(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PubRestrictionsSection.prototype._read = function() {
        this.numPubRestrictions = this._io.readBitsIntBe(12);
        this._io.alignToByte();
        if (this.numPubRestrictions > 0) {
          this.pubRestrictionEntries = [];
          for (var i = 0; i < this.numPubRestrictions; i++) {
            this.pubRestrictionEntries.push(new PubRestrictionEntry(this._io, this, this._root));
          }
        }
      }

      var PubRestrictionEntry = PubRestrictionsSection.PubRestrictionEntry = (function() {
        function PubRestrictionEntry(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        PubRestrictionEntry.prototype._read = function() {
          this.purposeId = this._io.readBitsIntBe(6);
          this.restrictionType = this._io.readBitsIntBe(2);
          this._io.alignToByte();
          this.rangeSection = new RangeSection(this._io, this, this._root);
          this.numEntries = this._io.readBitsIntBe(12);
          this._io.alignToByte();
          this.rangeEntries = [];
          for (var i = 0; i < this.numEntries; i++) {
            this.rangeEntries.push(new RangeEntry(this._io, this, this._root));
          }
        }

        return PubRestrictionEntry;
      })();

      return PubRestrictionsSection;
    })();

    var VendorSection = Structure.VendorSection = (function() {
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

    var RangeSection = Structure.RangeSection = (function() {
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

    /**
     * Specific Jurisdiction Disclosures
     */

    var SjDisclosures = Structure.SjDisclosures = (function() {
      function SjDisclosures(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SjDisclosures.prototype._read = function() {
        this.purposeOneTreatment = this._io.readBitsIntBe(1) != 0;
        this._io.alignToByte();
        this.pubCountry = new Alpha(this._io, this, this._root);
      }

      /**
       * Publisher Country Code
       */

      return SjDisclosures;
    })();

    var RangeEntry = Structure.RangeEntry = (function() {
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

    /**
     * Specific Jurisdiction Disclosures
     */

    return Structure;
  })();

  return CoreStringSegment;
})();
return CoreStringSegment;
}));
