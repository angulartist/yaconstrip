# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class DisclosedVendorsSegment(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.segment_type = self._io.read_bits_int_be(3)
        self._io.align_to_byte()
        self.vendor_consent = DisclosedVendorsSegment.VendorSection(self._io, self, self._root)

    class VendorSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.max_vendor_id = self._io.read_bits_int_be(16)
            self.is_range_encoding = self._io.read_bits_int_be(1) != 0
            if not (self.is_range_encoding):
                self.bit_field = []
                for i in range(self.max_vendor_id):
                    self.bit_field.append(self._io.read_bits_int_be(1) != 0)


            self._io.align_to_byte()
            if self.is_range_encoding:
                self.range_section = DisclosedVendorsSegment.RangeSection(self._io, self, self._root)



    class RangeSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.num_entries = self._io.read_bits_int_be(12)
            self._io.align_to_byte()
            self.range_entries = []
            for i in range(self.num_entries):
                self.range_entries.append(DisclosedVendorsSegment.RangeEntry(self._io, self, self._root))



    class RangeEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.is_a_range = self._io.read_bits_int_be(1) != 0
            self.start_or_only_vendor_id = self._io.read_bits_int_be(16)
            if self.is_a_range:
                self.end_vendor_id = self._io.read_bits_int_be(16)




