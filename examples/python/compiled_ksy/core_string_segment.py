# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class CoreStringSegment(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.metadata = CoreStringSegment.Metadata(self._io, self, self._root)
        self.structure = CoreStringSegment.Structure(self._io, self, self._root)

    class Alpha(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.left = self._io.read_bits_int_be(6)
            self.right = self._io.read_bits_int_be(6)


    class Metadata(KaitaiStruct):
        """TC Consent Management Platform."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_bits_int_be(6)
            self.created = self._io.read_bits_int_be(32)
            self.created_overflow = self._io.read_bits_int_be(4)
            self.last_updated = self._io.read_bits_int_be(32)
            self.last_updated_overflow = self._io.read_bits_int_be(4)
            self._io.align_to_byte()
            self.cmp = CoreStringSegment.Metadata.Cmp(self._io, self, self._root)
            self.gvl_version = self._io.read_bits_int_be(12)

        class Cmp(KaitaiStruct):
            """Consent Management Platform."""
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.id = self._io.read_bits_int_be(12)
                self.version = self._io.read_bits_int_be(12)
                self.screen = self._io.read_bits_int_be(6)
                self._io.align_to_byte()
                self.language = CoreStringSegment.Alpha(self._io, self, self._root)



    class Structure(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.policy_version = self._io.read_bits_int_be(6)
            self.is_service_specific = self._io.read_bits_int_be(1) != 0
            self.use_non_standard_texts = self._io.read_bits_int_be(1) != 0
            self.special_feature_opt_ins = []
            for i in range(12):
                self.special_feature_opt_ins.append(self._io.read_bits_int_be(1) != 0)

            self.purposes_consent = []
            for i in range(24):
                self.purposes_consent.append(self._io.read_bits_int_be(1) != 0)

            self.purposes_li_transparency = []
            for i in range(24):
                self.purposes_li_transparency.append(self._io.read_bits_int_be(1) != 0)

            self._io.align_to_byte()
            self.sj_disclosures = CoreStringSegment.Structure.SjDisclosures(self._io, self, self._root)
            self.vendor_consent = CoreStringSegment.Structure.VendorSection(self._io, self, self._root)
            self.vendor_li = CoreStringSegment.Structure.VendorSection(self._io, self, self._root)
            self.pub_restrictions = CoreStringSegment.Structure.PubRestrictionsSection(self._io, self, self._root)

        class PubRestrictionsSection(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.num_pub_restrictions = self._io.read_bits_int_be(12)
                self._io.align_to_byte()
                if self.num_pub_restrictions > 0:
                    self.pub_restriction_entries = []
                    for i in range(self.num_pub_restrictions):
                        self.pub_restriction_entries.append(CoreStringSegment.Structure.PubRestrictionsSection.PubRestrictionEntry(self._io, self, self._root))



            class PubRestrictionEntry(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.purpose_id = self._io.read_bits_int_be(6)
                    self.restriction_type = self._io.read_bits_int_be(2)
                    self._io.align_to_byte()
                    self.range_section = CoreStringSegment.Structure.RangeSection(self._io, self, self._root)
                    self.num_entries = self._io.read_bits_int_be(12)
                    self._io.align_to_byte()
                    self.range_entries = []
                    for i in range(self.num_entries):
                        self.range_entries.append(CoreStringSegment.Structure.RangeEntry(self._io, self, self._root))




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
                    self.range_section = CoreStringSegment.Structure.RangeSection(self._io, self, self._root)



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
                    self.range_entries.append(CoreStringSegment.Structure.RangeEntry(self._io, self, self._root))



        class SjDisclosures(KaitaiStruct):
            """Specific Jurisdiction Disclosures."""
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.purpose_one_treatment = self._io.read_bits_int_be(1) != 0
                self._io.align_to_byte()
                self.pub_country = CoreStringSegment.Alpha(self._io, self, self._root)


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





