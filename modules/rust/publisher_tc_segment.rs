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
pub struct PublisherTcSegment {
    pub segmentType: u64,
    pub pubPurposesConsent: Vec<bool>,
    pub pubPurposesLiTransparency: Vec<bool>,
    pub numCustomPurposes: u64,
    pub customPurposesConsent: Vec<bool>,
    pub customPurposesLiTransparency: Vec<bool>,
}

impl KaitaiStruct for PublisherTcSegment {
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
        self.pubPurposesConsent = vec!();
        for i in 0..24 {
            self.pubPurposesConsent.append(self.stream.read_bits_int(1)? != 0);
        }
        self.pubPurposesLiTransparency = vec!();
        for i in 0..24 {
            self.pubPurposesLiTransparency.append(self.stream.read_bits_int(1)? != 0);
        }
        self.numCustomPurposes = self.stream.read_bits_int(6)?;
        if self.num_custom_purposes > 0 {
            self.customPurposesConsent = vec!();
            for i in 0..self.num_custom_purposes {
                self.customPurposesConsent.append(self.stream.read_bits_int(1)? != 0);
            }
        }
        if self.num_custom_purposes > 0 {
            self.customPurposesLiTransparency = vec!();
            for i in 0..self.num_custom_purposes {
                self.customPurposesLiTransparency.append(self.stream.read_bits_int(1)? != 0);
            }
        }
    }
}

impl PublisherTcSegment {
}
