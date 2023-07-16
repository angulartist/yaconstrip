-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

DisclosedVendorsSegment = class.class(KaitaiStruct)

function DisclosedVendorsSegment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DisclosedVendorsSegment:_read()
  self.segment_type = self._io:read_bits_int_be(3)
  self._io:align_to_byte()
  self.vendor_consent = DisclosedVendorsSegment.VendorSection(self._io, self, self._root)
end


DisclosedVendorsSegment.VendorSection = class.class(KaitaiStruct)

function DisclosedVendorsSegment.VendorSection:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DisclosedVendorsSegment.VendorSection:_read()
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
    self.range_section = DisclosedVendorsSegment.RangeSection(self._io, self, self._root)
  end
end


DisclosedVendorsSegment.RangeSection = class.class(KaitaiStruct)

function DisclosedVendorsSegment.RangeSection:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DisclosedVendorsSegment.RangeSection:_read()
  self.num_entries = self._io:read_bits_int_be(12)
  self._io:align_to_byte()
  self.range_entries = {}
  for i = 0, self.num_entries - 1 do
    self.range_entries[i + 1] = DisclosedVendorsSegment.RangeEntry(self._io, self, self._root)
  end
end


DisclosedVendorsSegment.RangeEntry = class.class(KaitaiStruct)

function DisclosedVendorsSegment.RangeEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DisclosedVendorsSegment.RangeEntry:_read()
  self.is_a_range = self._io:read_bits_int_be(1) ~= 0
  self.start_or_only_vendor_id = self._io:read_bits_int_be(16)
  if self.is_a_range then
    self.end_vendor_id = self._io:read_bits_int_be(16)
  end
end


