// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use std::option::Option;
use std::boxed::Box;
use std::io::Result;
use std::io::Cursor;
use std::vec::Vec;
use std::default::Default;
use kaitai_struct::KaitaiStream;
use kaitai_struct::KaitaiStruct;

#[derive(Default)]
pub struct DisclosedVendorsSegment {
    pub segmentType: u64,
    pub vendorConsent: Box<DisclosedVendorsSegment__VendorSection>,
}

impl KaitaiStruct for DisclosedVendorsSegment {
    fn new<S: KaitaiStream>(stream: &mut S,
                            _parent: &Option<Box<KaitaiStruct>>,
                            _root: &Option<Box<KaitaiStruct>>)
                            -> Result<Self>
        where Self: Sized {
        let mut s: Self = Default::default();

        s.stream = stream;
        s.read(stream, _parent, _root)?;

        Ok(s)
    }


    fn read<S: KaitaiStream>(&mut self,
                             stream: &mut S,
                             _parent: &Option<Box<KaitaiStruct>>,
                             _root: &Option<Box<KaitaiStruct>>)
                             -> Result<()>
        where Self: Sized {
        self.segmentType = self.stream.read_bits_int(3)?;
        self.stream.alignToByte();
        self.vendorConsent = Box::new(DisclosedVendorsSegment__VendorSection::new(self.stream, self, _root)?);
    }
}

impl DisclosedVendorsSegment {
}
#[derive(Default)]
pub struct DisclosedVendorsSegment__VendorSection {
    pub maxVendorId: u64,
    pub isRangeEncoding: bool,
    pub bitField: Vec<bool>,
    pub rangeSection: Box<DisclosedVendorsSegment__RangeSection>,
}

impl KaitaiStruct for DisclosedVendorsSegment__VendorSection {
    fn new<S: KaitaiStream>(stream: &mut S,
                            _parent: &Option<Box<KaitaiStruct>>,
                            _root: &Option<Box<KaitaiStruct>>)
                            -> Result<Self>
        where Self: Sized {
        let mut s: Self = Default::default();

        s.stream = stream;
        s.read(stream, _parent, _root)?;

        Ok(s)
    }


    fn read<S: KaitaiStream>(&mut self,
                             stream: &mut S,
                             _parent: &Option<Box<KaitaiStruct>>,
                             _root: &Option<Box<KaitaiStruct>>)
                             -> Result<()>
        where Self: Sized {
        self.maxVendorId = self.stream.read_bits_int(16)?;
        self.isRangeEncoding = self.stream.read_bits_int(1)? != 0;
        if !(self.is_range_encoding) {
            self.bitField = vec!();
            for i in 0..self.max_vendor_id {
                self.bitField.append(self.stream.read_bits_int(1)? != 0);
            }
        }
        self.stream.alignToByte();
        if self.is_range_encoding {
            self.rangeSection = Box::new(DisclosedVendorsSegment__RangeSection::new(self.stream, self, _root)?);
        }
    }
}

impl DisclosedVendorsSegment__VendorSection {
}
#[derive(Default)]
pub struct DisclosedVendorsSegment__RangeSection {
    pub numEntries: u64,
    pub rangeEntries: Vec<Box<DisclosedVendorsSegment__RangeEntry>>,
}

impl KaitaiStruct for DisclosedVendorsSegment__RangeSection {
    fn new<S: KaitaiStream>(stream: &mut S,
                            _parent: &Option<Box<KaitaiStruct>>,
                            _root: &Option<Box<KaitaiStruct>>)
                            -> Result<Self>
        where Self: Sized {
        let mut s: Self = Default::default();

        s.stream = stream;
        s.read(stream, _parent, _root)?;

        Ok(s)
    }


    fn read<S: KaitaiStream>(&mut self,
                             stream: &mut S,
                             _parent: &Option<Box<KaitaiStruct>>,
                             _root: &Option<Box<KaitaiStruct>>)
                             -> Result<()>
        where Self: Sized {
        self.numEntries = self.stream.read_bits_int(12)?;
        self.stream.alignToByte();
        self.rangeEntries = vec!();
        for i in 0..self.num_entries {
            self.rangeEntries.append(Box::new(DisclosedVendorsSegment__RangeEntry::new(self.stream, self, _root)?));
        }
    }
}

impl DisclosedVendorsSegment__RangeSection {
}
#[derive(Default)]
pub struct DisclosedVendorsSegment__RangeEntry {
    pub isARange: bool,
    pub startOrOnlyVendorId: u64,
    pub endVendorId: u64,
}

impl KaitaiStruct for DisclosedVendorsSegment__RangeEntry {
    fn new<S: KaitaiStream>(stream: &mut S,
                            _parent: &Option<Box<KaitaiStruct>>,
                            _root: &Option<Box<KaitaiStruct>>)
                            -> Result<Self>
        where Self: Sized {
        let mut s: Self = Default::default();

        s.stream = stream;
        s.read(stream, _parent, _root)?;

        Ok(s)
    }


    fn read<S: KaitaiStream>(&mut self,
                             stream: &mut S,
                             _parent: &Option<Box<KaitaiStruct>>,
                             _root: &Option<Box<KaitaiStruct>>)
                             -> Result<()>
        where Self: Sized {
        self.isARange = self.stream.read_bits_int(1)? != 0;
        self.startOrOnlyVendorId = self.stream.read_bits_int(16)?;
        if self.is_a_range {
            self.endVendorId = self.stream.read_bits_int(16)?;
        }
    }
}

impl DisclosedVendorsSegment__RangeEntry {
}
