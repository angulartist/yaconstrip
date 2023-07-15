# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class PublisherTcSegment(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.segment_type = self._io.read_bits_int_be(3)
        self.pub_purposes_consent = []
        for i in range(24):
            self.pub_purposes_consent.append(self._io.read_bits_int_be(1) != 0)

        self.pub_purposes_li_transparency = []
        for i in range(24):
            self.pub_purposes_li_transparency.append(self._io.read_bits_int_be(1) != 0)

        self.num_custom_purposes = self._io.read_bits_int_be(6)
        if self.num_custom_purposes > 0:
            self.custom_purposes_consent = []
            for i in range(self.num_custom_purposes):
                self.custom_purposes_consent.append(self._io.read_bits_int_be(1) != 0)


        if self.num_custom_purposes > 0:
            self.custom_purposes_li_transparency = []
            for i in range(self.num_custom_purposes):
                self.custom_purposes_li_transparency.append(self._io.read_bits_int_be(1) != 0)




