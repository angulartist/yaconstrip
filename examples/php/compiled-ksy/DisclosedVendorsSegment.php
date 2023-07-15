<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class DisclosedVendorsSegment extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \DisclosedVendorsSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_segmentType = $this->_io->readBitsIntBe(3);
            $this->_io->alignToByte();
            $this->_m_vendorConsent = new \DisclosedVendorsSegment\VendorSection($this->_io, $this, $this->_root);
        }
        protected $_m_segmentType;
        protected $_m_vendorConsent;
        public function segmentType() { return $this->_m_segmentType; }
        public function vendorConsent() { return $this->_m_vendorConsent; }
    }
}

namespace DisclosedVendorsSegment {
    class VendorSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \DisclosedVendorsSegment $_parent = null, \DisclosedVendorsSegment $_root = null) {
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
                $this->_m_rangeSection = new \DisclosedVendorsSegment\RangeSection($this->_io, $this, $this->_root);
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

namespace DisclosedVendorsSegment {
    class RangeSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \DisclosedVendorsSegment\VendorSection $_parent = null, \DisclosedVendorsSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numEntries = $this->_io->readBitsIntBe(12);
            $this->_io->alignToByte();
            $this->_m_rangeEntries = [];
            $n = $this->numEntries();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_rangeEntries[] = new \DisclosedVendorsSegment\RangeEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numEntries;
        protected $_m_rangeEntries;
        public function numEntries() { return $this->_m_numEntries; }
        public function rangeEntries() { return $this->_m_rangeEntries; }
    }
}

namespace DisclosedVendorsSegment {
    class RangeEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \DisclosedVendorsSegment\RangeSection $_parent = null, \DisclosedVendorsSegment $_root = null) {
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
