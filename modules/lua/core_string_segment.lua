-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

CoreStringSegment = class.class(KaitaiStruct)

function CoreStringSegment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment:_read()
  self.metadata = CoreStringSegment.Metadata(self._io, self, self._root)
  self.structure = CoreStringSegment.Structure(self._io, self, self._root)
end


CoreStringSegment.Alpha = class.class(KaitaiStruct)

function CoreStringSegment.Alpha:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Alpha:_read()
  self.left = self._io:read_bits_int_be(6)
  self.right = self._io:read_bits_int_be(6)
end


-- 
-- TC Consent Management Platform.
CoreStringSegment.Metadata = class.class(KaitaiStruct)

function CoreStringSegment.Metadata:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Metadata:_read()
  self.version = self._io:read_bits_int_be(6)
  self.created = self._io:read_bits_int_be(32)
  self.created_overflow = self._io:read_bits_int_be(4)
  self.last_updated = self._io:read_bits_int_be(32)
  self.last_updated_overflow = self._io:read_bits_int_be(4)
  self._io:align_to_byte()
  self.cmp = CoreStringSegment.Metadata.Cmp(self._io, self, self._root)
  self.gvl_version = self._io:read_bits_int_be(12)
end

-- 
-- Supported version is above 2 (TCF 2.O).
-- 
-- Timestamp.
-- 
-- Timestamp.
-- 
-- Timestamp.
-- 
-- Timestamp.
-- 
-- Global Vendor List version.

-- 
-- Consent Management Platform.
CoreStringSegment.Metadata.Cmp = class.class(KaitaiStruct)

function CoreStringSegment.Metadata.Cmp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Metadata.Cmp:_read()
  self.id = self._io:read_bits_int_be(12)
  self.version = self._io:read_bits_int_be(12)
  self.screen = self._io:read_bits_int_be(6)
  self._io:align_to_byte()
  self.language = CoreStringSegment.Alpha(self._io, self, self._root)
end

-- 
-- ISO 3166-1 alpha-2 code used identify a country or a language.

CoreStringSegment.Structure = class.class(KaitaiStruct)

function CoreStringSegment.Structure:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure:_read()
  self.policy_version = self._io:read_bits_int_be(6)
  self.is_service_specific = self._io:read_bits_int_be(1) ~= 0
  self.use_non_standard_texts = self._io:read_bits_int_be(1) ~= 0
  self.special_feature_opt_ins = {}
  for i = 0, 12 - 1 do
    self.special_feature_opt_ins[i + 1] = self._io:read_bits_int_be(1) ~= 0
  end
  self.purposes_consent = {}
  for i = 0, 24 - 1 do
    self.purposes_consent[i + 1] = self._io:read_bits_int_be(1) ~= 0
  end
  self.purposes_li_transparency = {}
  for i = 0, 24 - 1 do
    self.purposes_li_transparency[i + 1] = self._io:read_bits_int_be(1) ~= 0
  end
  self._io:align_to_byte()
  self.sj_disclosures = CoreStringSegment.Structure.SjDisclosures(self._io, self, self._root)
  self.vendor_consent = CoreStringSegment.Structure.VendorSection(self._io, self, self._root)
  self.vendor_li = CoreStringSegment.Structure.VendorSection(self._io, self, self._root)
  self.pub_restrictions = CoreStringSegment.Structure.PubRestrictionsSection(self._io, self, self._root)
end

-- 
-- Specific Jurisdiction Disclosures.

CoreStringSegment.Structure.PubRestrictionsSection = class.class(KaitaiStruct)

function CoreStringSegment.Structure.PubRestrictionsSection:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure.PubRestrictionsSection:_read()
  self.num_pub_restrictions = self._io:read_bits_int_be(12)
  self._io:align_to_byte()
  if self.num_pub_restrictions > 0 then
    self.pub_restriction_entries = {}
    for i = 0, self.num_pub_restrictions - 1 do
      self.pub_restriction_entries[i + 1] = CoreStringSegment.Structure.PubRestrictionsSection.PubRestrictionEntry(self._io, self, self._root)
    end
  end
end


CoreStringSegment.Structure.PubRestrictionsSection.PubRestrictionEntry = class.class(KaitaiStruct)

function CoreStringSegment.Structure.PubRestrictionsSection.PubRestrictionEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure.PubRestrictionsSection.PubRestrictionEntry:_read()
  self.purpose_id = self._io:read_bits_int_be(6)
  self.restriction_type = self._io:read_bits_int_be(2)
  self._io:align_to_byte()
  self.range_section = CoreStringSegment.Structure.RangeSection(self._io, self, self._root)
  self.num_entries = self._io:read_bits_int_be(12)
  self._io:align_to_byte()
  self.range_entries = {}
  for i = 0, self.num_entries - 1 do
    self.range_entries[i + 1] = CoreStringSegment.Structure.RangeEntry(self._io, self, self._root)
  end
end


CoreStringSegment.Structure.VendorSection = class.class(KaitaiStruct)

function CoreStringSegment.Structure.VendorSection:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure.VendorSection:_read()
  self.max_vendor_id = self._io:read_bits_int_be(16)
  self.is_range_encoding = self._io:read_bits_int_be(1) ~= 0
  if not(self.is_range_encoding) then
    self.bit_field = {}
    for i = 0, self.max_vendor_id - 1 do
      self.bit_field[i + 1] = self._io:read_bits_int_be(1) ~= 0
    end
  end
  self._io:align_to_byte()
  if self.is_range_encoding then
    self.range_section = CoreStringSegment.Structure.RangeSection(self._io, self, self._root)
  end
end


CoreStringSegment.Structure.RangeSection = class.class(KaitaiStruct)

function CoreStringSegment.Structure.RangeSection:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure.RangeSection:_read()
  self.num_entries = self._io:read_bits_int_be(12)
  self._io:align_to_byte()
  self.range_entries = {}
  for i = 0, self.num_entries - 1 do
    self.range_entries[i + 1] = CoreStringSegment.Structure.RangeEntry(self._io, self, self._root)
  end
end


-- 
-- Specific Jurisdiction Disclosures.
CoreStringSegment.Structure.SjDisclosures = class.class(KaitaiStruct)

function CoreStringSegment.Structure.SjDisclosures:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure.SjDisclosures:_read()
  self.purpose_one_treatment = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  self.pub_country = CoreStringSegment.Alpha(self._io, self, self._root)
end

-- 
-- Publisher Country Code.

CoreStringSegment.Structure.RangeEntry = class.class(KaitaiStruct)

function CoreStringSegment.Structure.RangeEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CoreStringSegment.Structure.RangeEntry:_read()
  self.is_a_range = self._io:read_bits_int_be(1) ~= 0
  self.start_or_only_vendor_id = self._io:read_bits_int_be(16)
  if self.is_a_range then
    self.end_vendor_id = self._io:read_bits_int_be(16)
  end
end


