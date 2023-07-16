// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class DisclosedVendorsSegment : KaitaiStruct
    {
        public static DisclosedVendorsSegment FromFile(string fileName)
        {
            return new DisclosedVendorsSegment(new KaitaiStream(fileName));
        }

        public DisclosedVendorsSegment(KaitaiStream p__io, KaitaiStruct p__parent = null, DisclosedVendorsSegment p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _segmentType = m_io.ReadBitsIntBe(3);
            m_io.AlignToByte();
            _vendorConsent = new VendorSection(m_io, this, m_root);
        }
        public partial class VendorSection : KaitaiStruct
        {
            public static VendorSection FromFile(string fileName)
            {
                return new VendorSection(new KaitaiStream(fileName));
            }

            public VendorSection(KaitaiStream p__io, DisclosedVendorsSegment p__parent = null, DisclosedVendorsSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _maxVendorId = m_io.ReadBitsIntBe(16);
                _isRangeEncoding = m_io.ReadBitsIntBe(1) != 0;
                if (!(IsRangeEncoding)) {
                    _bitField = new List<bool>();
                    for (var i = 0; i < MaxVendorId; i++)
                    {
                        _bitField.Add(m_io.ReadBitsIntBe(1) != 0);
                    }
                }
                m_io.AlignToByte();
                if (IsRangeEncoding) {
                    _rangeSection = new RangeSection(m_io, this, m_root);
                }
            }
            private ulong _maxVendorId;
            private bool _isRangeEncoding;
            private List<bool> _bitField;
            private RangeSection _rangeSection;
            private DisclosedVendorsSegment m_root;
            private DisclosedVendorsSegment m_parent;
            public ulong MaxVendorId { get { return _maxVendorId; } }
            public bool IsRangeEncoding { get { return _isRangeEncoding; } }
            public List<bool> BitField { get { return _bitField; } }
            public RangeSection RangeSection { get { return _rangeSection; } }
            public DisclosedVendorsSegment M_Root { get { return m_root; } }
            public DisclosedVendorsSegment M_Parent { get { return m_parent; } }
        }
        public partial class RangeSection : KaitaiStruct
        {
            public static RangeSection FromFile(string fileName)
            {
                return new RangeSection(new KaitaiStream(fileName));
            }

            public RangeSection(KaitaiStream p__io, DisclosedVendorsSegment.VendorSection p__parent = null, DisclosedVendorsSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numEntries = m_io.ReadBitsIntBe(12);
                m_io.AlignToByte();
                _rangeEntries = new List<RangeEntry>();
                for (var i = 0; i < NumEntries; i++)
                {
                    _rangeEntries.Add(new RangeEntry(m_io, this, m_root));
                }
            }
            private ulong _numEntries;
            private List<RangeEntry> _rangeEntries;
            private DisclosedVendorsSegment m_root;
            private DisclosedVendorsSegment.VendorSection m_parent;
            public ulong NumEntries { get { return _numEntries; } }
            public List<RangeEntry> RangeEntries { get { return _rangeEntries; } }
            public DisclosedVendorsSegment M_Root { get { return m_root; } }
            public DisclosedVendorsSegment.VendorSection M_Parent { get { return m_parent; } }
        }
        public partial class RangeEntry : KaitaiStruct
        {
            public static RangeEntry FromFile(string fileName)
            {
                return new RangeEntry(new KaitaiStream(fileName));
            }

            public RangeEntry(KaitaiStream p__io, DisclosedVendorsSegment.RangeSection p__parent = null, DisclosedVendorsSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _isARange = m_io.ReadBitsIntBe(1) != 0;
                _startOrOnlyVendorId = m_io.ReadBitsIntBe(16);
                if (IsARange) {
                    _endVendorId = m_io.ReadBitsIntBe(16);
                }
            }
            private bool _isARange;
            private ulong _startOrOnlyVendorId;
            private ulong? _endVendorId;
            private DisclosedVendorsSegment m_root;
            private DisclosedVendorsSegment.RangeSection m_parent;
            public bool IsARange { get { return _isARange; } }
            public ulong StartOrOnlyVendorId { get { return _startOrOnlyVendorId; } }
            public ulong? EndVendorId { get { return _endVendorId; } }
            public DisclosedVendorsSegment M_Root { get { return m_root; } }
            public DisclosedVendorsSegment.RangeSection M_Parent { get { return m_parent; } }
        }
        private ulong _segmentType;
        private VendorSection _vendorConsent;
        private DisclosedVendorsSegment m_root;
        private KaitaiStruct m_parent;
        public ulong SegmentType { get { return _segmentType; } }
        public VendorSection VendorConsent { get { return _vendorConsent; } }
        public DisclosedVendorsSegment M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
