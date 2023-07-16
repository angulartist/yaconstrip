// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class DisclosedVendorsSegment extends KaitaiStruct {
    public static DisclosedVendorsSegment fromFile(String fileName) throws IOException {
        return new DisclosedVendorsSegment(new ByteBufferKaitaiStream(fileName));
    }

    public DisclosedVendorsSegment(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DisclosedVendorsSegment(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DisclosedVendorsSegment(KaitaiStream _io, KaitaiStruct _parent, DisclosedVendorsSegment _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.segmentType = this._io.readBitsIntBe(3);
        this._io.alignToByte();
        this.vendorConsent = new VendorSection(this._io, this, _root);
    }
    public static class VendorSection extends KaitaiStruct {
        public static VendorSection fromFile(String fileName) throws IOException {
            return new VendorSection(new ByteBufferKaitaiStream(fileName));
        }

        public VendorSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VendorSection(KaitaiStream _io, DisclosedVendorsSegment _parent) {
            this(_io, _parent, null);
        }

        public VendorSection(KaitaiStream _io, DisclosedVendorsSegment _parent, DisclosedVendorsSegment _root) {
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
        private DisclosedVendorsSegment _root;
        private DisclosedVendorsSegment _parent;
        public long maxVendorId() { return maxVendorId; }
        public boolean isRangeEncoding() { return isRangeEncoding; }
        public ArrayList<Boolean> bitField() { return bitField; }
        public RangeSection rangeSection() { return rangeSection; }
        public DisclosedVendorsSegment _root() { return _root; }
        public DisclosedVendorsSegment _parent() { return _parent; }
    }
    public static class RangeSection extends KaitaiStruct {
        public static RangeSection fromFile(String fileName) throws IOException {
            return new RangeSection(new ByteBufferKaitaiStream(fileName));
        }

        public RangeSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RangeSection(KaitaiStream _io, DisclosedVendorsSegment.VendorSection _parent) {
            this(_io, _parent, null);
        }

        public RangeSection(KaitaiStream _io, DisclosedVendorsSegment.VendorSection _parent, DisclosedVendorsSegment _root) {
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
        private DisclosedVendorsSegment _root;
        private DisclosedVendorsSegment.VendorSection _parent;
        public long numEntries() { return numEntries; }
        public ArrayList<RangeEntry> rangeEntries() { return rangeEntries; }
        public DisclosedVendorsSegment _root() { return _root; }
        public DisclosedVendorsSegment.VendorSection _parent() { return _parent; }
    }
    public static class RangeEntry extends KaitaiStruct {
        public static RangeEntry fromFile(String fileName) throws IOException {
            return new RangeEntry(new ByteBufferKaitaiStream(fileName));
        }

        public RangeEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RangeEntry(KaitaiStream _io, DisclosedVendorsSegment.RangeSection _parent) {
            this(_io, _parent, null);
        }

        public RangeEntry(KaitaiStream _io, DisclosedVendorsSegment.RangeSection _parent, DisclosedVendorsSegment _root) {
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
        private DisclosedVendorsSegment _root;
        private DisclosedVendorsSegment.RangeSection _parent;
        public boolean isARange() { return isARange; }
        public long startOrOnlyVendorId() { return startOrOnlyVendorId; }
        public Long endVendorId() { return endVendorId; }
        public DisclosedVendorsSegment _root() { return _root; }
        public DisclosedVendorsSegment.RangeSection _parent() { return _parent; }
    }
    private long segmentType;
    private VendorSection vendorConsent;
    private DisclosedVendorsSegment _root;
    private KaitaiStruct _parent;
    public long segmentType() { return segmentType; }
    public VendorSection vendorConsent() { return vendorConsent; }
    public DisclosedVendorsSegment _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
