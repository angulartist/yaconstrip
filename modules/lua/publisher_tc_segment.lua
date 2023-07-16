-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

PublisherTcSegment = class.class(KaitaiStruct)

function PublisherTcSegment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PublisherTcSegment:_read()
  self.segment_type = self._io:read_bits_int_be(3)
  self.pub_purposes_consent = {}
  for i = 0, 24 - 1 do
    self.pub_purposes_consent[i + 1] = self._io:read_bits_int_be(1) ~= 0
  end
  self.pub_purposes_li_transparency = {}
  for i = 0, 24 - 1 do
    self.pub_purposes_li_transparency[i + 1] = self._io:read_bits_int_be(1) ~= 0
  end
  self.num_custom_purposes = self._io:read_bits_int_be(6)
  if self.num_custom_purposes > 0 then
    self.custom_purposes_consent = {}
    for i = 0, self.num_custom_purposes - 1 do
      self.custom_purposes_consent[i + 1] = self._io:read_bits_int_be(1) ~= 0
    end
  end
  if self.num_custom_purposes > 0 then
    self.custom_purposes_li_transparency = {}
    for i = 0, self.num_custom_purposes - 1 do
      self.custom_purposes_li_transparency[i + 1] = self._io:read_bits_int_be(1) ~= 0
    end
  end
end


