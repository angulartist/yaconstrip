// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class PublisherTcSegment extends KaitaiStruct {
    public static PublisherTcSegment fromFile(String fileName) throws IOException {
        return new PublisherTcSegment(new ByteBufferKaitaiStream(fileName));
    }

    public PublisherTcSegment(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PublisherTcSegment(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PublisherTcSegment(KaitaiStream _io, KaitaiStruct _parent, PublisherTcSegment _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.segmentType = this._io.readBitsIntBe(3);
        this.pubPurposesConsent = new ArrayList<Boolean>();
        for (int i = 0; i < 24; i++) {
            this.pubPurposesConsent.add(this._io.readBitsIntBe(1) != 0);
        }
        this.pubPurposesLiTransparency = new ArrayList<Boolean>();
        for (int i = 0; i < 24; i++) {
            this.pubPurposesLiTransparency.add(this._io.readBitsIntBe(1) != 0);
        }
        this.numCustomPurposes = this._io.readBitsIntBe(6);
        if (numCustomPurposes() > 0) {
            this.customPurposesConsent = new ArrayList<Boolean>();
            for (int i = 0; i < numCustomPurposes(); i++) {
                this.customPurposesConsent.add(this._io.readBitsIntBe(1) != 0);
            }
        }
        if (numCustomPurposes() > 0) {
            this.customPurposesLiTransparency = new ArrayList<Boolean>();
            for (int i = 0; i < numCustomPurposes(); i++) {
                this.customPurposesLiTransparency.add(this._io.readBitsIntBe(1) != 0);
            }
        }
    }
    private long segmentType;
    private ArrayList<Boolean> pubPurposesConsent;
    private ArrayList<Boolean> pubPurposesLiTransparency;
    private long numCustomPurposes;
    private ArrayList<Boolean> customPurposesConsent;
    private ArrayList<Boolean> customPurposesLiTransparency;
    private PublisherTcSegment _root;
    private KaitaiStruct _parent;
    public long segmentType() { return segmentType; }
    public ArrayList<Boolean> pubPurposesConsent() { return pubPurposesConsent; }
    public ArrayList<Boolean> pubPurposesLiTransparency() { return pubPurposesLiTransparency; }
    public long numCustomPurposes() { return numCustomPurposes; }
    public ArrayList<Boolean> customPurposesConsent() { return customPurposesConsent; }
    public ArrayList<Boolean> customPurposesLiTransparency() { return customPurposesLiTransparency; }
    public PublisherTcSegment _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
