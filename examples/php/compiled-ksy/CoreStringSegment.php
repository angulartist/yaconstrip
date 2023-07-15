<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class CoreStringSegment extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_metadata = new \CoreStringSegment\Metadata($this->_io, $this, $this->_root);
            $this->_m_structure = new \CoreStringSegment\Structure($this->_io, $this, $this->_root);
        }
        protected $_m_metadata;
        protected $_m_structure;
        public function metadata() { return $this->_m_metadata; }
        public function structure() { return $this->_m_structure; }
    }
}

namespace CoreStringSegment {
    class Alpha extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_left = $this->_io->readBitsIntBe(6);
            $this->_m_right = $this->_io->readBitsIntBe(6);
        }
        protected $_m_left;
        protected $_m_right;
        public function left() { return $this->_m_left; }
        public function right() { return $this->_m_right; }
    }
}

/**
 * TC Consent Management Platform
 */

namespace CoreStringSegment {
    class Metadata extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readBitsIntBe(6);
            $this->_m_created = $this->_io->readBitsIntBe(32);
            $this->_m_createdOverflow = $this->_io->readBitsIntBe(4);
            $this->_m_lastUpdated = $this->_io->readBitsIntBe(32);
            $this->_m_lastUpdatedOverflow = $this->_io->readBitsIntBe(4);
            $this->_io->alignToByte();
            $this->_m_cmp = new \CoreStringSegment\Metadata\Cmp($this->_io, $this, $this->_root);
            $this->_m_gvlVersion = $this->_io->readBitsIntBe(12);
        }
        protected $_m_version;
        protected $_m_created;
        protected $_m_createdOverflow;
        protected $_m_lastUpdated;
        protected $_m_lastUpdatedOverflow;
        protected $_m_cmp;
        protected $_m_gvlVersion;

        /**
         * Supported version is above 2 (TCF 2.O)
         */
        public function version() { return $this->_m_version; }

        /**
         * Timestamp
         */
        public function created() { return $this->_m_created; }

        /**
         * Timestamp
         */
        public function createdOverflow() { return $this->_m_createdOverflow; }

        /**
         * Timestamp
         */
        public function lastUpdated() { return $this->_m_lastUpdated; }

        /**
         * Timestamp
         */
        public function lastUpdatedOverflow() { return $this->_m_lastUpdatedOverflow; }
        public function cmp() { return $this->_m_cmp; }

        /**
         * Global Vendor List version
         */
        public function gvlVersion() { return $this->_m_gvlVersion; }
    }
}

/**
 * Consent Management Platform
 */

namespace CoreStringSegment\Metadata {
    class Cmp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment\Metadata $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = $this->_io->readBitsIntBe(12);
            $this->_m_version = $this->_io->readBitsIntBe(12);
            $this->_m_screen = $this->_io->readBitsIntBe(6);
            $this->_io->alignToByte();
            $this->_m_language = new \CoreStringSegment\Alpha($this->_io, $this, $this->_root);
        }
        protected $_m_id;
        protected $_m_version;
        protected $_m_screen;
        protected $_m_language;
        public function id() { return $this->_m_id; }
        public function version() { return $this->_m_version; }
        public function screen() { return $this->_m_screen; }

        /**
         * ISO 3166-1 alpha-2 code used identify a country or a language
         */
        public function language() { return $this->_m_language; }
    }
}

namespace CoreStringSegment {
    class Structure extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_policyVersion = $this->_io->readBitsIntBe(6);
            $this->_m_isServiceSpecific = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_useNonStandardTexts = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_specialFeatureOptIns = [];
            $n = 12;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_specialFeatureOptIns[] = $this->_io->readBitsIntBe(1) != 0;
            }
            $this->_m_purposesConsent = [];
            $n = 24;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_purposesConsent[] = $this->_io->readBitsIntBe(1) != 0;
            }
            $this->_m_purposesLiTransparency = [];
            $n = 24;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_purposesLiTransparency[] = $this->_io->readBitsIntBe(1) != 0;
            }
            $this->_io->alignToByte();
            $this->_m_sjDisclosures = new \CoreStringSegment\Structure\SjDisclosures($this->_io, $this, $this->_root);
            $this->_m_vendorConsent = new \CoreStringSegment\Structure\VendorSection($this->_io, $this, $this->_root);
            $this->_m_vendorLi = new \CoreStringSegment\Structure\VendorSection($this->_io, $this, $this->_root);
            $this->_m_pubRestrictions = new \CoreStringSegment\Structure\PubRestrictionsSection($this->_io, $this, $this->_root);
        }
        protected $_m_policyVersion;
        protected $_m_isServiceSpecific;
        protected $_m_useNonStandardTexts;
        protected $_m_specialFeatureOptIns;
        protected $_m_purposesConsent;
        protected $_m_purposesLiTransparency;
        protected $_m_sjDisclosures;
        protected $_m_vendorConsent;
        protected $_m_vendorLi;
        protected $_m_pubRestrictions;
        public function policyVersion() { return $this->_m_policyVersion; }
        public function isServiceSpecific() { return $this->_m_isServiceSpecific; }
        public function useNonStandardTexts() { return $this->_m_useNonStandardTexts; }
        public function specialFeatureOptIns() { return $this->_m_specialFeatureOptIns; }
        public function purposesConsent() { return $this->_m_purposesConsent; }
        public function purposesLiTransparency() { return $this->_m_purposesLiTransparency; }

        /**
         * Specific Jurisdiction Disclosures
         */
        public function sjDisclosures() { return $this->_m_sjDisclosures; }
        public function vendorConsent() { return $this->_m_vendorConsent; }
        public function vendorLi() { return $this->_m_vendorLi; }
        public function pubRestrictions() { return $this->_m_pubRestrictions; }
    }
}

namespace CoreStringSegment\Structure {
    class PubRestrictionsSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment\Structure $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numPubRestrictions = $this->_io->readBitsIntBe(12);
            $this->_io->alignToByte();
            if ($this->numPubRestrictions() > 0) {
                $this->_m_pubRestrictionEntries = [];
                $n = $this->numPubRestrictions();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_pubRestrictionEntries[] = new \CoreStringSegment\Structure\PubRestrictionsSection\PubRestrictionEntry($this->_io, $this, $this->_root);
                }
            }
        }
        protected $_m_numPubRestrictions;
        protected $_m_pubRestrictionEntries;
        public function numPubRestrictions() { return $this->_m_numPubRestrictions; }
        public function pubRestrictionEntries() { return $this->_m_pubRestrictionEntries; }
    }
}

namespace CoreStringSegment\Structure\PubRestrictionsSection {
    class PubRestrictionEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment\Structure\PubRestrictionsSection $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_purposeId = $this->_io->readBitsIntBe(6);
            $this->_m_restrictionType = $this->_io->readBitsIntBe(2);
            $this->_io->alignToByte();
            $this->_m_rangeSection = new \CoreStringSegment\Structure\RangeSection($this->_io, $this, $this->_root);
            $this->_m_numEntries = $this->_io->readBitsIntBe(12);
            $this->_io->alignToByte();
            $this->_m_rangeEntries = [];
            $n = $this->numEntries();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_rangeEntries[] = new \CoreStringSegment\Structure\RangeEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_purposeId;
        protected $_m_restrictionType;
        protected $_m_rangeSection;
        protected $_m_numEntries;
        protected $_m_rangeEntries;
        public function purposeId() { return $this->_m_purposeId; }
        public function restrictionType() { return $this->_m_restrictionType; }
        public function rangeSection() { return $this->_m_rangeSection; }
        public function numEntries() { return $this->_m_numEntries; }
        public function rangeEntries() { return $this->_m_rangeEntries; }
    }
}

namespace CoreStringSegment\Structure {
    class VendorSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment\Structure $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_maxVendorId = $this->_io->readBitsIntBe(16);
            $this->_m_isRangeEncoding = $this->_io->readBitsIntBe(1) != 0;
            if (!($this->isRangeEncoding())) {
                $this->_m_bitField = [];
                $n = $this->maxVendorId();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_bitField[] = $this->_io->readBitsIntBe(1) != 0;
                }
            }
            $this->_io->alignToByte();
            if ($this->isRangeEncoding()) {
                $this->_m_rangeSection = new \CoreStringSegment\Structure\RangeSection($this->_io, $this, $this->_root);
            }
        }
        protected $_m_maxVendorId;
        protected $_m_isRangeEncoding;
        protected $_m_bitField;
        protected $_m_rangeSection;
        public function maxVendorId() { return $this->_m_maxVendorId; }
        public function isRangeEncoding() { return $this->_m_isRangeEncoding; }
        public function bitField() { return $this->_m_bitField; }
        public function rangeSection() { return $this->_m_rangeSection; }
    }
}

namespace CoreStringSegment\Structure {
    class RangeSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numEntries = $this->_io->readBitsIntBe(12);
            $this->_io->alignToByte();
            $this->_m_rangeEntries = [];
            $n = $this->numEntries();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_rangeEntries[] = new \CoreStringSegment\Structure\RangeEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numEntries;
        protected $_m_rangeEntries;
        public function numEntries() { return $this->_m_numEntries; }
        public function rangeEntries() { return $this->_m_rangeEntries; }
    }
}

/**
 * Specific Jurisdiction Disclosures
 */

namespace CoreStringSegment\Structure {
    class SjDisclosures extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \CoreStringSegment\Structure $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_purposeOneTreatment = $this->_io->readBitsIntBe(1) != 0;
            $this->_io->alignToByte();
            $this->_m_pubCountry = new \CoreStringSegment\Alpha($this->_io, $this, $this->_root);
        }
        protected $_m_purposeOneTreatment;
        protected $_m_pubCountry;
        public function purposeOneTreatment() { return $this->_m_purposeOneTreatment; }

        /**
         * Publisher Country Code
         */
        public function pubCountry() { return $this->_m_pubCountry; }
    }
}

namespace CoreStringSegment\Structure {
    class RangeEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \CoreStringSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_isARange = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_startOrOnlyVendorId = $this->_io->readBitsIntBe(16);
            if ($this->isARange()) {
                $this->_m_endVendorId = $this->_io->readBitsIntBe(16);
            }
        }
        protected $_m_isARange;
        protected $_m_startOrOnlyVendorId;
        protected $_m_endVendorId;
        public function isARange() { return $this->_m_isARange; }
        public function startOrOnlyVendorId() { return $this->_m_startOrOnlyVendorId; }
        public function endVendorId() { return $this->_m_endVendorId; }
    }
}
