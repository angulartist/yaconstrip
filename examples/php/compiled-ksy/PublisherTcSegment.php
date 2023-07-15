<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class PublisherTcSegment extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PublisherTcSegment $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_segmentType = $this->_io->readBitsIntBe(3);
            $this->_m_pubPurposesConsent = [];
            $n = 24;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_pubPurposesConsent[] = $this->_io->readBitsIntBe(1) != 0;
            }
            $this->_m_pubPurposesLiTransparency = [];
            $n = 24;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_pubPurposesLiTransparency[] = $this->_io->readBitsIntBe(1) != 0;
            }
            $this->_m_numCustomPurposes = $this->_io->readBitsIntBe(6);
            if ($this->numCustomPurposes() > 0) {
                $this->_m_customPurposesConsent = [];
                $n = $this->numCustomPurposes();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_customPurposesConsent[] = $this->_io->readBitsIntBe(1) != 0;
                }
            }
            if ($this->numCustomPurposes() > 0) {
                $this->_m_customPurposesLiTransparency = [];
                $n = $this->numCustomPurposes();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_customPurposesLiTransparency[] = $this->_io->readBitsIntBe(1) != 0;
                }
            }
        }
        protected $_m_segmentType;
        protected $_m_pubPurposesConsent;
        protected $_m_pubPurposesLiTransparency;
        protected $_m_numCustomPurposes;
        protected $_m_customPurposesConsent;
        protected $_m_customPurposesLiTransparency;
        public function segmentType() { return $this->_m_segmentType; }
        public function pubPurposesConsent() { return $this->_m_pubPurposesConsent; }
        public function pubPurposesLiTransparency() { return $this->_m_pubPurposesLiTransparency; }
        public function numCustomPurposes() { return $this->_m_numCustomPurposes; }
        public function customPurposesConsent() { return $this->_m_customPurposesConsent; }
        public function customPurposesLiTransparency() { return $this->_m_customPurposesLiTransparency; }
    }
}
