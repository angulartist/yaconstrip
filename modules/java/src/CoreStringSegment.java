// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class CoreStringSegment extends KaitaiStruct {
    public static CoreStringSegment fromFile(String fileName) throws IOException {
        return new CoreStringSegment(new ByteBufferKaitaiStream(fileName));
    }

    public CoreStringSegment(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CoreStringSegment(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public CoreStringSegment(KaitaiStream _io, KaitaiStruct _parent, CoreStringSegment _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.metadata = new Metadata(this._io, this, _root);
        this.structure = new Structure(this._io, this, _root);
    }
    public static class Alpha extends KaitaiStruct {
        public static Alpha fromFile(String fileName) throws IOException {
            return new Alpha(new ByteBufferKaitaiStream(fileName));
        }

        public Alpha(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alpha(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Alpha(KaitaiStream _io, KaitaiStruct _parent, CoreStringSegment _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.left = this._io.readBitsIntBe(6);
            this.right = this._io.readBitsIntBe(6);
        }
        private long left;
        private long right;
        private CoreStringSegment _root;
        private KaitaiStruct _parent;
        public long left() { return left; }
        public long right() { return right; }
        public CoreStringSegment _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * TC Consent Management Platform
     */
    public static class Metadata extends KaitaiStruct {
        public static Metadata fromFile(String fileName) throws IOException {
            return new Metadata(new ByteBufferKaitaiStream(fileName));
        }

        public Metadata(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Metadata(KaitaiStream _io, CoreStringSegment _parent) {
            this(_io, _parent, null);
        }

        public Metadata(KaitaiStream _io, CoreStringSegment _parent, CoreStringSegment _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readBitsIntBe(6);
            this.created = this._io.readBitsIntBe(32);
            this.createdOverflow = this._io.readBitsIntBe(4);
            this.lastUpdated = this._io.readBitsIntBe(32);
            this.lastUpdatedOverflow = this._io.readBitsIntBe(4);
            this._io.alignToByte();
            this.cmp = new Cmp(this._io, this, _root);
            this.gvlVersion = this._io.readBitsIntBe(12);
        }

        /**
         * Consent Management Platform
         */
        public static class Cmp extends KaitaiStruct {
            public static Cmp fromFile(String fileName) throws IOException {
                return new Cmp(new ByteBufferKaitaiStream(fileName));
            }

            public Cmp(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Cmp(KaitaiStream _io, CoreStringSegment.Metadata _parent) {
                this(_io, _parent, null);
            }

            public Cmp(KaitaiStream _io, CoreStringSegment.Metadata _parent, CoreStringSegment _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.id = this._io.readBitsIntBe(12);
                this.version = this._io.readBitsIntBe(12);
                this.screen = this._io.readBitsIntBe(6);
                this._io.alignToByte();
                this.language = new Alpha(this._io, this, _root);
            }
            private long id;
            private long version;
            private long screen;
            private Alpha language;
            private CoreStringSegment _root;
            private CoreStringSegment.Metadata _parent;
            public long id() { return id; }
            public long version() { return version; }
            public long screen() { return screen; }

            /**
             * ISO 3166-1 alpha-2 code used identify a country or a language
             */
            public Alpha language() { return language; }
            public CoreStringSegment _root() { return _root; }
            public CoreStringSegment.Metadata _parent() { return _parent; }
        }
        private long version;
        private long created;
        private long createdOverflow;
        private long lastUpdated;
        private long lastUpdatedOverflow;
        private Cmp cmp;
        private long gvlVersion;
        private CoreStringSegment _root;
        private CoreStringSegment _parent;

        /**
         * Supported version is above 2 (TCF 2.O)
         */
        public long version() { return version; }

        /**
         * Timestamp
         */
        public long created() { return created; }

        /**
         * Timestamp
         */
        public long createdOverflow() { return createdOverflow; }

        /**
         * Timestamp
         */
        public long lastUpdated() { return lastUpdated; }

        /**
         * Timestamp
         */
        public long lastUpdatedOverflow() { return lastUpdatedOverflow; }
        public Cmp cmp() { return cmp; }

        /**
         * Global Vendor List version
         */
        public long gvlVersion() { return gvlVersion; }
        public CoreStringSegment _root() { return _root; }
        public CoreStringSegment _parent() { return _parent; }
    }
    public static class Structure extends KaitaiStruct {
        public static Structure fromFile(String fileName) throws IOException {
            return new Structure(new ByteBufferKaitaiStream(fileName));
        }

        public Structure(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Structure(KaitaiStream _io, CoreStringSegment _parent) {
            this(_io, _parent, null);
        }

        public Structure(KaitaiStream _io, CoreStringSegment _parent, CoreStringSegment _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.policyVersion = this._io.readBitsIntBe(6);
            this.isServiceSpecific = this._io.readBitsIntBe(1) != 0;
            this.useNonStandardTexts = this._io.readBitsIntBe(1) != 0;
            this.specialFeatureOptIns = new ArrayList<Boolean>();
            for (int i = 0; i < 12; i++) {
                this.specialFeatureOptIns.add(this._io.readBitsIntBe(1) != 0);
            }
            this.purposesConsent = new ArrayList<Boolean>();
            for (int i = 0; i < 24; i++) {
                this.purposesConsent.add(this._io.readBitsIntBe(1) != 0);
            }
            this.purposesLiTransparency = new ArrayList<Boolean>();
            for (int i = 0; i < 24; i++) {
                this.purposesLiTransparency.add(this._io.readBitsIntBe(1) != 0);
            }
            this._io.alignToByte();
            this.sjDisclosures = new SjDisclosures(this._io, this, _root);
            this.vendorConsent = new VendorSection(this._io, this, _root);
            this.vendorLi = new VendorSection(this._io, this, _root);
            this.pubRestrictions = new PubRestrictionsSection(this._io, this, _root);
        }
        public static class PubRestrictionsSection extends KaitaiStruct {
            public static PubRestrictionsSection fromFile(String fileName) throws IOException {
                return new PubRestrictionsSection(new ByteBufferKaitaiStream(fileName));
            }

            public PubRestrictionsSection(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PubRestrictionsSection(KaitaiStream _io, CoreStringSegment.Structure _parent) {
                this(_io, _parent, null);
            }

            public PubRestrictionsSection(KaitaiStream _io, CoreStringSegment.Structure _parent, CoreStringSegment _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.numPubRestrictions = this._io.readBitsIntBe(12);
                this._io.alignToByte();
                if (numPubRestrictions() > 0) {
                    this.pubRestrictionEntries = new ArrayList<PubRestrictionEntry>();
                    for (int i = 0; i < numPubRestrictions(); i++) {
                        this.pubRestrictionEntries.add(new PubRestrictionEntry(this._io, this, _root));
                    }
                }
            }
            public static class PubRestrictionEntry extends KaitaiStruct {
                public static PubRestrictionEntry fromFile(String fileName) throws IOException {
                    return new PubRestrictionEntry(new ByteBufferKaitaiStream(fileName));
                }

                public PubRestrictionEntry(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public PubRestrictionEntry(KaitaiStream _io, CoreStringSegment.Structure.PubRestrictionsSection _parent) {
                    this(_io, _parent, null);
                }

                public PubRestrictionEntry(KaitaiStream _io, CoreStringSegment.Structure.PubRestrictionsSection _parent, CoreStringSegment _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.purposeId = this._io.readBitsIntBe(6);
                    this.restrictionType = this._io.readBitsIntBe(2);
                    this._io.alignToByte();
                    this.rangeSection = new RangeSection(this._io, this, _root);
                    this.numEntries = this._io.readBitsIntBe(12);
                    this._io.alignToByte();
                    this.rangeEntries = new ArrayList<RangeEntry>();
                    for (int i = 0; i < numEntries(); i++) {
                        this.rangeEntries.add(new RangeEntry(this._io, this, _root));
                    }
                }
                private long purposeId;
                private long restrictionType;
                private RangeSection rangeSection;
                private long numEntries;
                private ArrayList<RangeEntry> rangeEntries;
                private CoreStringSegment _root;
                private CoreStringSegment.Structure.PubRestrictionsSection _parent;
                public long purposeId() { return purposeId; }
                public long restrictionType() { return restrictionType; }
                public RangeSection rangeSection() { return rangeSection; }
                public long numEntries() { return numEntries; }
                public ArrayList<RangeEntry> rangeEntries() { return rangeEntries; }
                public CoreStringSegment _root() { return _root; }
                public CoreStringSegment.Structure.PubRestrictionsSection _parent() { return _parent; }
            }
            private long numPubRestrictions;
            private ArrayList<PubRestrictionEntry> pubRestrictionEntries;
            private CoreStringSegment _root;
            private CoreStringSegment.Structure _parent;
            public long numPubRestrictions() { return numPubRestrictions; }
            public ArrayList<PubRestrictionEntry> pubRestrictionEntries() { return pubRestrictionEntries; }
            public CoreStringSegment _root() { return _root; }
            public CoreStringSegment.Structure _parent() { return _parent; }
        }
        public static class VendorSection extends KaitaiStruct {
            public static VendorSection fromFile(String fileName) throws IOException {
                return new VendorSection(new ByteBufferKaitaiStream(fileName));
            }

            public VendorSection(KaitaiStream _io) {
                this(_io, null, null);
            }

            public VendorSection(KaitaiStream _io, CoreStringSegment.Structure _parent) {
                this(_io, _parent, null);
            }

            public VendorSection(KaitaiStream _io, CoreStringSegment.Structure _parent, CoreStringSegment _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.maxVendorId = this._io.readBitsIntBe(16);
                this.isRangeEncoding = this._io.readBitsIntBe(1) != 0;
                if (!(isRangeEncoding())) {
                    this.bitField = new ArrayList<Boolean>();
                    for (int i = 0; i < maxVendorId(); i++) {
                        this.bitField.add(this._io.readBitsIntBe(1) != 0);
                    }
                }
                this._io.alignToByte();
                if (isRangeEncoding()) {
                    this.rangeSection = new RangeSection(this._io, this, _root);
                }
            }
            private long maxVendorId;
            private boolean isRangeEncoding;
            private ArrayList<Boolean> bitField;
            private RangeSection rangeSection;
            private CoreStringSegment _root;
            private CoreStringSegment.Structure _parent;
            public long maxVendorId() { return maxVendorId; }
            public boolean isRangeEncoding() { return isRangeEncoding; }
            public ArrayList<Boolean> bitField() { return bitField; }
            public RangeSection rangeSection() { return rangeSection; }
            public CoreStringSegment _root() { return _root; }
            public CoreStringSegment.Structure _parent() { return _parent; }
        }
        public static class RangeSection extends KaitaiStruct {
            public static RangeSection fromFile(String fileName) throws IOException {
                return new RangeSection(new ByteBufferKaitaiStream(fileName));
            }

            public RangeSection(KaitaiStream _io) {
                this(_io, null, null);
            }

            public RangeSection(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public RangeSection(KaitaiStream _io, KaitaiStruct _parent, CoreStringSegment _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.numEntries = this._io.readBitsIntBe(12);
                this._io.alignToByte();
                this.rangeEntries = new ArrayList<RangeEntry>();
                for (int i = 0; i < numEntries(); i++) {
                    this.rangeEntries.add(new RangeEntry(this._io, this, _root));
                }
            }
            private long numEntries;
            private ArrayList<RangeEntry> rangeEntries;
            private CoreStringSegment _root;
            private KaitaiStruct _parent;
            public long numEntries() { return numEntries; }
            public ArrayList<RangeEntry> rangeEntries() { return rangeEntries; }
            public CoreStringSegment _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }

        /**
         * Specific Jurisdiction Disclosures
         */
        public static class SjDisclosures extends KaitaiStruct {
            public static SjDisclosures fromFile(String fileName) throws IOException {
                return new SjDisclosures(new ByteBufferKaitaiStream(fileName));
            }

            public SjDisclosures(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SjDisclosures(KaitaiStream _io, CoreStringSegment.Structure _parent) {
                this(_io, _parent, null);
            }

            public SjDisclosures(KaitaiStream _io, CoreStringSegment.Structure _parent, CoreStringSegment _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.purposeOneTreatment = this._io.readBitsIntBe(1) != 0;
                this._io.alignToByte();
                this.pubCountry = new Alpha(this._io, this, _root);
            }
            private boolean purposeOneTreatment;
            private Alpha pubCountry;
            private CoreStringSegment _root;
            private CoreStringSegment.Structure _parent;
            public boolean purposeOneTreatment() { return purposeOneTreatment; }

            /**
             * Publisher Country Code
             */
            public Alpha pubCountry() { return pubCountry; }
            public CoreStringSegment _root() { return _root; }
            public CoreStringSegment.Structure _parent() { return _parent; }
        }
        public static class RangeEntry extends KaitaiStruct {
            public static RangeEntry fromFile(String fileName) throws IOException {
                return new RangeEntry(new ByteBufferKaitaiStream(fileName));
            }

            public RangeEntry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public RangeEntry(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public RangeEntry(KaitaiStream _io, KaitaiStruct _parent, CoreStringSegment _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.isARange = this._io.readBitsIntBe(1) != 0;
                this.startOrOnlyVendorId = this._io.readBitsIntBe(16);
                if (isARange()) {
                    this.endVendorId = this._io.readBitsIntBe(16);
                }
            }
            private boolean isARange;
            private long startOrOnlyVendorId;
            private Long endVendorId;
            private CoreStringSegment _root;
            private KaitaiStruct _parent;
            public boolean isARange() { return isARange; }
            public long startOrOnlyVendorId() { return startOrOnlyVendorId; }
            public Long endVendorId() { return endVendorId; }
            public CoreStringSegment _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        private long policyVersion;
        private boolean isServiceSpecific;
        private boolean useNonStandardTexts;
        private ArrayList<Boolean> specialFeatureOptIns;
        private ArrayList<Boolean> purposesConsent;
        private ArrayList<Boolean> purposesLiTransparency;
        private SjDisclosures sjDisclosures;
        private VendorSection vendorConsent;
        private VendorSection vendorLi;
        private PubRestrictionsSection pubRestrictions;
        private CoreStringSegment _root;
        private CoreStringSegment _parent;
        public long policyVersion() { return policyVersion; }
        public boolean isServiceSpecific() { return isServiceSpecific; }
        public boolean useNonStandardTexts() { return useNonStandardTexts; }
        public ArrayList<Boolean> specialFeatureOptIns() { return specialFeatureOptIns; }
        public ArrayList<Boolean> purposesConsent() { return purposesConsent; }
        public ArrayList<Boolean> purposesLiTransparency() { return purposesLiTransparency; }

        /**
         * Specific Jurisdiction Disclosures
         */
        public SjDisclosures sjDisclosures() { return sjDisclosures; }
        public VendorSection vendorConsent() { return vendorConsent; }
        public VendorSection vendorLi() { return vendorLi; }
        public PubRestrictionsSection pubRestrictions() { return pubRestrictions; }
        public CoreStringSegment _root() { return _root; }
        public CoreStringSegment _parent() { return _parent; }
    }
    private Metadata metadata;
    private Structure structure;
    private CoreStringSegment _root;
    private KaitaiStruct _parent;
    public Metadata metadata() { return metadata; }
    public Structure structure() { return structure; }
    public CoreStringSegment _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
