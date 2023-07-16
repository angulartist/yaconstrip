// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class CoreStringSegment : KaitaiStruct
    {
        public static CoreStringSegment FromFile(string fileName)
        {
            return new CoreStringSegment(new KaitaiStream(fileName));
        }

        public CoreStringSegment(KaitaiStream p__io, KaitaiStruct p__parent = null, CoreStringSegment p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _metadata = new Metadata(m_io, this, m_root);
            _structure = new Structure(m_io, this, m_root);
        }
        public partial class Alpha : KaitaiStruct
        {
            public static Alpha FromFile(string fileName)
            {
                return new Alpha(new KaitaiStream(fileName));
            }

            public Alpha(KaitaiStream p__io, KaitaiStruct p__parent = null, CoreStringSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _left = m_io.ReadBitsIntBe(6);
                _right = m_io.ReadBitsIntBe(6);
            }
            private ulong _left;
            private ulong _right;
            private CoreStringSegment m_root;
            private KaitaiStruct m_parent;
            public ulong Left { get { return _left; } }
            public ulong Right { get { return _right; } }
            public CoreStringSegment M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// TC Consent Management Platform
        /// </summary>
        public partial class Metadata : KaitaiStruct
        {
            public static Metadata FromFile(string fileName)
            {
                return new Metadata(new KaitaiStream(fileName));
            }

            public Metadata(KaitaiStream p__io, CoreStringSegment p__parent = null, CoreStringSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadBitsIntBe(6);
                _created = m_io.ReadBitsIntBe(32);
                _createdOverflow = m_io.ReadBitsIntBe(4);
                _lastUpdated = m_io.ReadBitsIntBe(32);
                _lastUpdatedOverflow = m_io.ReadBitsIntBe(4);
                m_io.AlignToByte();
                _cmp = new Cmp(m_io, this, m_root);
                _gvlVersion = m_io.ReadBitsIntBe(12);
            }

            /// <summary>
            /// Consent Management Platform
            /// </summary>
            public partial class Cmp : KaitaiStruct
            {
                public static Cmp FromFile(string fileName)
                {
                    return new Cmp(new KaitaiStream(fileName));
                }

                public Cmp(KaitaiStream p__io, CoreStringSegment.Metadata p__parent = null, CoreStringSegment p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _id = m_io.ReadBitsIntBe(12);
                    _version = m_io.ReadBitsIntBe(12);
                    _screen = m_io.ReadBitsIntBe(6);
                    m_io.AlignToByte();
                    _language = new Alpha(m_io, this, m_root);
                }
                private ulong _id;
                private ulong _version;
                private ulong _screen;
                private Alpha _language;
                private CoreStringSegment m_root;
                private CoreStringSegment.Metadata m_parent;
                public ulong Id { get { return _id; } }
                public ulong Version { get { return _version; } }
                public ulong Screen { get { return _screen; } }

                /// <summary>
                /// ISO 3166-1 alpha-2 code used identify a country or a language
                /// </summary>
                public Alpha Language { get { return _language; } }
                public CoreStringSegment M_Root { get { return m_root; } }
                public CoreStringSegment.Metadata M_Parent { get { return m_parent; } }
            }
            private ulong _version;
            private ulong _created;
            private ulong _createdOverflow;
            private ulong _lastUpdated;
            private ulong _lastUpdatedOverflow;
            private Cmp _cmp;
            private ulong _gvlVersion;
            private CoreStringSegment m_root;
            private CoreStringSegment m_parent;

            /// <summary>
            /// Supported version is above 2 (TCF 2.O)
            /// </summary>
            public ulong Version { get { return _version; } }

            /// <summary>
            /// Timestamp
            /// </summary>
            public ulong Created { get { return _created; } }

            /// <summary>
            /// Timestamp
            /// </summary>
            public ulong CreatedOverflow { get { return _createdOverflow; } }

            /// <summary>
            /// Timestamp
            /// </summary>
            public ulong LastUpdated { get { return _lastUpdated; } }

            /// <summary>
            /// Timestamp
            /// </summary>
            public ulong LastUpdatedOverflow { get { return _lastUpdatedOverflow; } }
            public Cmp Cmp { get { return _cmp; } }

            /// <summary>
            /// Global Vendor List version
            /// </summary>
            public ulong GvlVersion { get { return _gvlVersion; } }
            public CoreStringSegment M_Root { get { return m_root; } }
            public CoreStringSegment M_Parent { get { return m_parent; } }
        }
        public partial class Structure : KaitaiStruct
        {
            public static Structure FromFile(string fileName)
            {
                return new Structure(new KaitaiStream(fileName));
            }

            public Structure(KaitaiStream p__io, CoreStringSegment p__parent = null, CoreStringSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _policyVersion = m_io.ReadBitsIntBe(6);
                _isServiceSpecific = m_io.ReadBitsIntBe(1) != 0;
                _useNonStandardTexts = m_io.ReadBitsIntBe(1) != 0;
                _specialFeatureOptIns = new List<bool>();
                for (var i = 0; i < 12; i++)
                {
                    _specialFeatureOptIns.Add(m_io.ReadBitsIntBe(1) != 0);
                }
                _purposesConsent = new List<bool>();
                for (var i = 0; i < 24; i++)
                {
                    _purposesConsent.Add(m_io.ReadBitsIntBe(1) != 0);
                }
                _purposesLiTransparency = new List<bool>();
                for (var i = 0; i < 24; i++)
                {
                    _purposesLiTransparency.Add(m_io.ReadBitsIntBe(1) != 0);
                }
                m_io.AlignToByte();
                _sjDisclosures = new SjDisclosures(m_io, this, m_root);
                _vendorConsent = new VendorSection(m_io, this, m_root);
                _vendorLi = new VendorSection(m_io, this, m_root);
                _pubRestrictions = new PubRestrictionsSection(m_io, this, m_root);
            }
            public partial class PubRestrictionsSection : KaitaiStruct
            {
                public static PubRestrictionsSection FromFile(string fileName)
                {
                    return new PubRestrictionsSection(new KaitaiStream(fileName));
                }

                public PubRestrictionsSection(KaitaiStream p__io, CoreStringSegment.Structure p__parent = null, CoreStringSegment p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _numPubRestrictions = m_io.ReadBitsIntBe(12);
                    m_io.AlignToByte();
                    if (NumPubRestrictions > 0) {
                        _pubRestrictionEntries = new List<PubRestrictionEntry>();
                        for (var i = 0; i < NumPubRestrictions; i++)
                        {
                            _pubRestrictionEntries.Add(new PubRestrictionEntry(m_io, this, m_root));
                        }
                    }
                }
                public partial class PubRestrictionEntry : KaitaiStruct
                {
                    public static PubRestrictionEntry FromFile(string fileName)
                    {
                        return new PubRestrictionEntry(new KaitaiStream(fileName));
                    }

                    public PubRestrictionEntry(KaitaiStream p__io, CoreStringSegment.Structure.PubRestrictionsSection p__parent = null, CoreStringSegment p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _purposeId = m_io.ReadBitsIntBe(6);
                        _restrictionType = m_io.ReadBitsIntBe(2);
                        m_io.AlignToByte();
                        _rangeSection = new RangeSection(m_io, this, m_root);
                        _numEntries = m_io.ReadBitsIntBe(12);
                        m_io.AlignToByte();
                        _rangeEntries = new List<RangeEntry>();
                        for (var i = 0; i < NumEntries; i++)
                        {
                            _rangeEntries.Add(new RangeEntry(m_io, this, m_root));
                        }
                    }
                    private ulong _purposeId;
                    private ulong _restrictionType;
                    private RangeSection _rangeSection;
                    private ulong _numEntries;
                    private List<RangeEntry> _rangeEntries;
                    private CoreStringSegment m_root;
                    private CoreStringSegment.Structure.PubRestrictionsSection m_parent;
                    public ulong PurposeId { get { return _purposeId; } }
                    public ulong RestrictionType { get { return _restrictionType; } }
                    public RangeSection RangeSection { get { return _rangeSection; } }
                    public ulong NumEntries { get { return _numEntries; } }
                    public List<RangeEntry> RangeEntries { get { return _rangeEntries; } }
                    public CoreStringSegment M_Root { get { return m_root; } }
                    public CoreStringSegment.Structure.PubRestrictionsSection M_Parent { get { return m_parent; } }
                }
                private ulong _numPubRestrictions;
                private List<PubRestrictionEntry> _pubRestrictionEntries;
                private CoreStringSegment m_root;
                private CoreStringSegment.Structure m_parent;
                public ulong NumPubRestrictions { get { return _numPubRestrictions; } }
                public List<PubRestrictionEntry> PubRestrictionEntries { get { return _pubRestrictionEntries; } }
                public CoreStringSegment M_Root { get { return m_root; } }
                public CoreStringSegment.Structure M_Parent { get { return m_parent; } }
            }
            public partial class VendorSection : KaitaiStruct
            {
                public static VendorSection FromFile(string fileName)
                {
                    return new VendorSection(new KaitaiStream(fileName));
                }

                public VendorSection(KaitaiStream p__io, CoreStringSegment.Structure p__parent = null, CoreStringSegment p__root = null) : base(p__io)
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
                private CoreStringSegment m_root;
                private CoreStringSegment.Structure m_parent;
                public ulong MaxVendorId { get { return _maxVendorId; } }
                public bool IsRangeEncoding { get { return _isRangeEncoding; } }
                public List<bool> BitField { get { return _bitField; } }
                public RangeSection RangeSection { get { return _rangeSection; } }
                public CoreStringSegment M_Root { get { return m_root; } }
                public CoreStringSegment.Structure M_Parent { get { return m_parent; } }
            }
            public partial class RangeSection : KaitaiStruct
            {
                public static RangeSection FromFile(string fileName)
                {
                    return new RangeSection(new KaitaiStream(fileName));
                }

                public RangeSection(KaitaiStream p__io, KaitaiStruct p__parent = null, CoreStringSegment p__root = null) : base(p__io)
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
                private CoreStringSegment m_root;
                private KaitaiStruct m_parent;
                public ulong NumEntries { get { return _numEntries; } }
                public List<RangeEntry> RangeEntries { get { return _rangeEntries; } }
                public CoreStringSegment M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Specific Jurisdiction Disclosures
            /// </summary>
            public partial class SjDisclosures : KaitaiStruct
            {
                public static SjDisclosures FromFile(string fileName)
                {
                    return new SjDisclosures(new KaitaiStream(fileName));
                }

                public SjDisclosures(KaitaiStream p__io, CoreStringSegment.Structure p__parent = null, CoreStringSegment p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _purposeOneTreatment = m_io.ReadBitsIntBe(1) != 0;
                    m_io.AlignToByte();
                    _pubCountry = new Alpha(m_io, this, m_root);
                }
                private bool _purposeOneTreatment;
                private Alpha _pubCountry;
                private CoreStringSegment m_root;
                private CoreStringSegment.Structure m_parent;
                public bool PurposeOneTreatment { get { return _purposeOneTreatment; } }

                /// <summary>
                /// Publisher Country Code
                /// </summary>
                public Alpha PubCountry { get { return _pubCountry; } }
                public CoreStringSegment M_Root { get { return m_root; } }
                public CoreStringSegment.Structure M_Parent { get { return m_parent; } }
            }
            public partial class RangeEntry : KaitaiStruct
            {
                public static RangeEntry FromFile(string fileName)
                {
                    return new RangeEntry(new KaitaiStream(fileName));
                }

                public RangeEntry(KaitaiStream p__io, KaitaiStruct p__parent = null, CoreStringSegment p__root = null) : base(p__io)
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
                private CoreStringSegment m_root;
                private KaitaiStruct m_parent;
                public bool IsARange { get { return _isARange; } }
                public ulong StartOrOnlyVendorId { get { return _startOrOnlyVendorId; } }
                public ulong? EndVendorId { get { return _endVendorId; } }
                public CoreStringSegment M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            private ulong _policyVersion;
            private bool _isServiceSpecific;
            private bool _useNonStandardTexts;
            private List<bool> _specialFeatureOptIns;
            private List<bool> _purposesConsent;
            private List<bool> _purposesLiTransparency;
            private SjDisclosures _sjDisclosures;
            private VendorSection _vendorConsent;
            private VendorSection _vendorLi;
            private PubRestrictionsSection _pubRestrictions;
            private CoreStringSegment m_root;
            private CoreStringSegment m_parent;
            public ulong PolicyVersion { get { return _policyVersion; } }
            public bool IsServiceSpecific { get { return _isServiceSpecific; } }
            public bool UseNonStandardTexts { get { return _useNonStandardTexts; } }
            public List<bool> SpecialFeatureOptIns { get { return _specialFeatureOptIns; } }
            public List<bool> PurposesConsent { get { return _purposesConsent; } }
            public List<bool> PurposesLiTransparency { get { return _purposesLiTransparency; } }

            /// <summary>
            /// Specific Jurisdiction Disclosures
            /// </summary>
            public SjDisclosures SjDisclosures { get { return _sjDisclosures; } }
            public VendorSection VendorConsent { get { return _vendorConsent; } }
            public VendorSection VendorLi { get { return _vendorLi; } }
            public PubRestrictionsSection PubRestrictions { get { return _pubRestrictions; } }
            public CoreStringSegment M_Root { get { return m_root; } }
            public CoreStringSegment M_Parent { get { return m_parent; } }
        }
        private Metadata _metadata;
        private Structure _structure;
        private CoreStringSegment m_root;
        private KaitaiStruct m_parent;
        public Metadata Metadata { get { return _metadata; } }
        public Structure Structure { get { return _structure; } }
        public CoreStringSegment M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
