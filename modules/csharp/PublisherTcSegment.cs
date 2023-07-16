// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class PublisherTcSegment : KaitaiStruct
    {
        public static PublisherTcSegment FromFile(string fileName)
        {
            return new PublisherTcSegment(new KaitaiStream(fileName));
        }

        public PublisherTcSegment(KaitaiStream p__io, KaitaiStruct p__parent = null, PublisherTcSegment p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _segmentType = m_io.ReadBitsIntBe(3);
            _pubPurposesConsent = new List<bool>();
            for (var i = 0; i < 24; i++)
            {
                _pubPurposesConsent.Add(m_io.ReadBitsIntBe(1) != 0);
            }
            _pubPurposesLiTransparency = new List<bool>();
            for (var i = 0; i < 24; i++)
            {
                _pubPurposesLiTransparency.Add(m_io.ReadBitsIntBe(1) != 0);
            }
            _numCustomPurposes = m_io.ReadBitsIntBe(6);
            if (NumCustomPurposes > 0) {
                _customPurposesConsent = new List<bool>();
                for (var i = 0; i < NumCustomPurposes; i++)
                {
                    _customPurposesConsent.Add(m_io.ReadBitsIntBe(1) != 0);
                }
            }
            if (NumCustomPurposes > 0) {
                _customPurposesLiTransparency = new List<bool>();
                for (var i = 0; i < NumCustomPurposes; i++)
                {
                    _customPurposesLiTransparency.Add(m_io.ReadBitsIntBe(1) != 0);
                }
            }
        }
        private ulong _segmentType;
        private List<bool> _pubPurposesConsent;
        private List<bool> _pubPurposesLiTransparency;
        private ulong _numCustomPurposes;
        private List<bool> _customPurposesConsent;
        private List<bool> _customPurposesLiTransparency;
        private PublisherTcSegment m_root;
        private KaitaiStruct m_parent;
        public ulong SegmentType { get { return _segmentType; } }
        public List<bool> PubPurposesConsent { get { return _pubPurposesConsent; } }
        public List<bool> PubPurposesLiTransparency { get { return _pubPurposesLiTransparency; } }
        public ulong NumCustomPurposes { get { return _numCustomPurposes; } }
        public List<bool> CustomPurposesConsent { get { return _customPurposesConsent; } }
        public List<bool> CustomPurposesLiTransparency { get { return _customPurposesLiTransparency; } }
        public PublisherTcSegment M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
