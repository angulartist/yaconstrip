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
pub struct CoreStringSegment {
    pub metadata: Box<CoreStringSegment__Metadata>,
    pub structure: Box<CoreStringSegment__Structure>,
}

impl KaitaiStruct for CoreStringSegment {
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
        self.metadata = Box::new(CoreStringSegment__Metadata::new(self.stream, self, _root)?);
        self.structure = Box::new(CoreStringSegment__Structure::new(self.stream, self, _root)?);
    }
}

impl CoreStringSegment {
}
#[derive(Default)]
pub struct CoreStringSegment__Alpha {
    pub left: u64,
    pub right: u64,
}

impl KaitaiStruct for CoreStringSegment__Alpha {
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
        self.left = self.stream.read_bits_int(6)?;
        self.right = self.stream.read_bits_int(6)?;
    }
}

impl CoreStringSegment__Alpha {
}

/*
 * TC Consent Management Platform
 */
#[derive(Default)]
pub struct CoreStringSegment__Metadata {
    pub version: u64,
    pub created: u64,
    pub createdOverflow: u64,
    pub lastUpdated: u64,
    pub lastUpdatedOverflow: u64,
    pub cmp: Box<CoreStringSegment__Metadata__Cmp>,
    pub gvlVersion: u64,
}

impl KaitaiStruct for CoreStringSegment__Metadata {
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
        self.version = self.stream.read_bits_int(6)?;
        self.created = self.stream.read_bits_int(32)?;
        self.createdOverflow = self.stream.read_bits_int(4)?;
        self.lastUpdated = self.stream.read_bits_int(32)?;
        self.lastUpdatedOverflow = self.stream.read_bits_int(4)?;
        self.stream.alignToByte();
        self.cmp = Box::new(CoreStringSegment__Metadata__Cmp::new(self.stream, self, _root)?);
        self.gvlVersion = self.stream.read_bits_int(12)?;
    }
}

impl CoreStringSegment__Metadata {

    /*
     * Supported version is above 2 (TCF 2.O)
     */

    /*
     * Timestamp
     */

    /*
     * Timestamp
     */

    /*
     * Timestamp
     */

    /*
     * Timestamp
     */

    /*
     * Global Vendor List version
     */
}

/*
 * Consent Management Platform
 */
#[derive(Default)]
pub struct CoreStringSegment__Metadata__Cmp {
    pub id: u64,
    pub version: u64,
    pub screen: u64,
    pub language: Box<CoreStringSegment__Alpha>,
}

impl KaitaiStruct for CoreStringSegment__Metadata__Cmp {
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
        self.id = self.stream.read_bits_int(12)?;
        self.version = self.stream.read_bits_int(12)?;
        self.screen = self.stream.read_bits_int(6)?;
        self.stream.alignToByte();
        self.language = Box::new(CoreStringSegment__Alpha::new(self.stream, self, _root)?);
    }
}

impl CoreStringSegment__Metadata__Cmp {

    /*
     * ISO 3166-1 alpha-2 code used identify a country or a language
     */
}
#[derive(Default)]
pub struct CoreStringSegment__Structure {
    pub policyVersion: u64,
    pub isServiceSpecific: bool,
    pub useNonStandardTexts: bool,
    pub specialFeatureOptIns: Vec<bool>,
    pub purposesConsent: Vec<bool>,
    pub purposesLiTransparency: Vec<bool>,
    pub sjDisclosures: Box<CoreStringSegment__Structure__SjDisclosures>,
    pub vendorConsent: Box<CoreStringSegment__Structure__VendorSection>,
    pub vendorLi: Box<CoreStringSegment__Structure__VendorSection>,
    pub pubRestrictions: Box<CoreStringSegment__Structure__PubRestrictionsSection>,
}

impl KaitaiStruct for CoreStringSegment__Structure {
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
        self.policyVersion = self.stream.read_bits_int(6)?;
        self.isServiceSpecific = self.stream.read_bits_int(1)? != 0;
        self.useNonStandardTexts = self.stream.read_bits_int(1)? != 0;
        self.specialFeatureOptIns = vec!();
        for i in 0..12 {
            self.specialFeatureOptIns.append(self.stream.read_bits_int(1)? != 0);
        }
        self.purposesConsent = vec!();
        for i in 0..24 {
            self.purposesConsent.append(self.stream.read_bits_int(1)? != 0);
        }
        self.purposesLiTransparency = vec!();
        for i in 0..24 {
            self.purposesLiTransparency.append(self.stream.read_bits_int(1)? != 0);
        }
        self.stream.alignToByte();
        self.sjDisclosures = Box::new(CoreStringSegment__Structure__SjDisclosures::new(self.stream, self, _root)?);
        self.vendorConsent = Box::new(CoreStringSegment__Structure__VendorSection::new(self.stream, self, _root)?);
        self.vendorLi = Box::new(CoreStringSegment__Structure__VendorSection::new(self.stream, self, _root)?);
        self.pubRestrictions = Box::new(CoreStringSegment__Structure__PubRestrictionsSection::new(self.stream, self, _root)?);
    }
}

impl CoreStringSegment__Structure {

    /*
     * Specific Jurisdiction Disclosures
     */
}
#[derive(Default)]
pub struct CoreStringSegment__Structure__PubRestrictionsSection {
    pub numPubRestrictions: u64,
    pub pubRestrictionEntries: Vec<Box<CoreStringSegment__Structure__PubRestrictionsSection__PubRestrictionEntry>>,
}

impl KaitaiStruct for CoreStringSegment__Structure__PubRestrictionsSection {
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
        self.numPubRestrictions = self.stream.read_bits_int(12)?;
        self.stream.alignToByte();
        if self.num_pub_restrictions > 0 {
            self.pubRestrictionEntries = vec!();
            for i in 0..self.num_pub_restrictions {
                self.pubRestrictionEntries.append(Box::new(CoreStringSegment__Structure__PubRestrictionsSection__PubRestrictionEntry::new(self.stream, self, _root)?));
            }
        }
    }
}

impl CoreStringSegment__Structure__PubRestrictionsSection {
}
#[derive(Default)]
pub struct CoreStringSegment__Structure__PubRestrictionsSection__PubRestrictionEntry {
    pub purposeId: u64,
    pub restrictionType: u64,
    pub rangeSection: Box<CoreStringSegment__Structure__RangeSection>,
    pub numEntries: u64,
    pub rangeEntries: Vec<Box<CoreStringSegment__Structure__RangeEntry>>,
}

impl KaitaiStruct for CoreStringSegment__Structure__PubRestrictionsSection__PubRestrictionEntry {
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
        self.purposeId = self.stream.read_bits_int(6)?;
        self.restrictionType = self.stream.read_bits_int(2)?;
        self.stream.alignToByte();
        self.rangeSection = Box::new(CoreStringSegment__Structure__RangeSection::new(self.stream, self, _root)?);
        self.numEntries = self.stream.read_bits_int(12)?;
        self.stream.alignToByte();
        self.rangeEntries = vec!();
        for i in 0..self.num_entries {
            self.rangeEntries.append(Box::new(CoreStringSegment__Structure__RangeEntry::new(self.stream, self, _root)?));
        }
    }
}

impl CoreStringSegment__Structure__PubRestrictionsSection__PubRestrictionEntry {
}
#[derive(Default)]
pub struct CoreStringSegment__Structure__VendorSection {
    pub maxVendorId: u64,
    pub isRangeEncoding: bool,
    pub bitField: Vec<bool>,
    pub rangeSection: Box<CoreStringSegment__Structure__RangeSection>,
}

impl KaitaiStruct for CoreStringSegment__Structure__VendorSection {
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
            self.rangeSection = Box::new(CoreStringSegment__Structure__RangeSection::new(self.stream, self, _root)?);
        }
    }
}

impl CoreStringSegment__Structure__VendorSection {
}
#[derive(Default)]
pub struct CoreStringSegment__Structure__RangeSection {
    pub numEntries: u64,
    pub rangeEntries: Vec<Box<CoreStringSegment__Structure__RangeEntry>>,
}

impl KaitaiStruct for CoreStringSegment__Structure__RangeSection {
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
            self.rangeEntries.append(Box::new(CoreStringSegment__Structure__RangeEntry::new(self.stream, self, _root)?));
        }
    }
}

impl CoreStringSegment__Structure__RangeSection {
}

/*
 * Specific Jurisdiction Disclosures
 */
#[derive(Default)]
pub struct CoreStringSegment__Structure__SjDisclosures {
    pub purposeOneTreatment: bool,
    pub pubCountry: Box<CoreStringSegment__Alpha>,
}

impl KaitaiStruct for CoreStringSegment__Structure__SjDisclosures {
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
        self.purposeOneTreatment = self.stream.read_bits_int(1)? != 0;
        self.stream.alignToByte();
        self.pubCountry = Box::new(CoreStringSegment__Alpha::new(self.stream, self, _root)?);
    }
}

impl CoreStringSegment__Structure__SjDisclosures {

    /*
     * Publisher Country Code
     */
}
#[derive(Default)]
pub struct CoreStringSegment__Structure__RangeEntry {
    pub isARange: bool,
    pub startOrOnlyVendorId: u64,
    pub endVendorId: u64,
}

impl KaitaiStruct for CoreStringSegment__Structure__RangeEntry {
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

impl CoreStringSegment__Structure__RangeEntry {
}
