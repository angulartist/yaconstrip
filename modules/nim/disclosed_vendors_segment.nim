import kaitai_struct_nim_runtime
import options

type
  DisclosedVendorsSegment* = ref object of KaitaiStruct
    `segmentType`*: uint64
    `vendorConsent`*: DisclosedVendorsSegment_VendorSection
    `parent`*: KaitaiStruct
  DisclosedVendorsSegment_VendorSection* = ref object of KaitaiStruct
    `maxVendorId`*: uint64
    `isRangeEncoding`*: bool
    `bitField`*: seq[bool]
    `rangeSection`*: DisclosedVendorsSegment_RangeSection
    `parent`*: DisclosedVendorsSegment
  DisclosedVendorsSegment_RangeSection* = ref object of KaitaiStruct
    `numEntries`*: uint64
    `rangeEntries`*: seq[DisclosedVendorsSegment_RangeEntry]
    `parent`*: DisclosedVendorsSegment_VendorSection
  DisclosedVendorsSegment_RangeEntry* = ref object of KaitaiStruct
    `isARange`*: bool
    `startOrOnlyVendorId`*: uint64
    `endVendorId`*: uint64
    `parent`*: DisclosedVendorsSegment_RangeSection

proc read*(_: typedesc[DisclosedVendorsSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DisclosedVendorsSegment
proc read*(_: typedesc[DisclosedVendorsSegment_VendorSection], io: KaitaiStream, root: KaitaiStruct, parent: DisclosedVendorsSegment): DisclosedVendorsSegment_VendorSection
proc read*(_: typedesc[DisclosedVendorsSegment_RangeSection], io: KaitaiStream, root: KaitaiStruct, parent: DisclosedVendorsSegment_VendorSection): DisclosedVendorsSegment_RangeSection
proc read*(_: typedesc[DisclosedVendorsSegment_RangeEntry], io: KaitaiStream, root: KaitaiStruct, parent: DisclosedVendorsSegment_RangeSection): DisclosedVendorsSegment_RangeEntry


proc read*(_: typedesc[DisclosedVendorsSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DisclosedVendorsSegment =
  template this: untyped = result
  this = new(DisclosedVendorsSegment)
  let root = if root == nil: cast[DisclosedVendorsSegment](this) else: cast[DisclosedVendorsSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let segmentTypeExpr = this.io.readBitsIntBe(3)
  this.segmentType = segmentTypeExpr
  alignToByte(this.io)
  let vendorConsentExpr = DisclosedVendorsSegment_VendorSection.read(this.io, this.root, this)
  this.vendorConsent = vendorConsentExpr

proc fromFile*(_: typedesc[DisclosedVendorsSegment], filename: string): DisclosedVendorsSegment =
  DisclosedVendorsSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DisclosedVendorsSegment_VendorSection], io: KaitaiStream, root: KaitaiStruct, parent: DisclosedVendorsSegment): DisclosedVendorsSegment_VendorSection =
  template this: untyped = result
  this = new(DisclosedVendorsSegment_VendorSection)
  let root = if root == nil: cast[DisclosedVendorsSegment](this) else: cast[DisclosedVendorsSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let maxVendorIdExpr = this.io.readBitsIntBe(16)
  this.maxVendorId = maxVendorIdExpr
  let isRangeEncodingExpr = this.io.readBitsIntBe(1) != 0
  this.isRangeEncoding = isRangeEncodingExpr
  if not(this.isRangeEncoding):
    for i in 0 ..< int(this.maxVendorId):
      let it = this.io.readBitsIntBe(1) != 0
      this.bitField.add(it)
  alignToByte(this.io)
  if this.isRangeEncoding:
    let rangeSectionExpr = DisclosedVendorsSegment_RangeSection.read(this.io, this.root, this)
    this.rangeSection = rangeSectionExpr

proc fromFile*(_: typedesc[DisclosedVendorsSegment_VendorSection], filename: string): DisclosedVendorsSegment_VendorSection =
  DisclosedVendorsSegment_VendorSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DisclosedVendorsSegment_RangeSection], io: KaitaiStream, root: KaitaiStruct, parent: DisclosedVendorsSegment_VendorSection): DisclosedVendorsSegment_RangeSection =
  template this: untyped = result
  this = new(DisclosedVendorsSegment_RangeSection)
  let root = if root == nil: cast[DisclosedVendorsSegment](this) else: cast[DisclosedVendorsSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numEntriesExpr = this.io.readBitsIntBe(12)
  this.numEntries = numEntriesExpr
  alignToByte(this.io)
  for i in 0 ..< int(this.numEntries):
    let it = DisclosedVendorsSegment_RangeEntry.read(this.io, this.root, this)
    this.rangeEntries.add(it)

proc fromFile*(_: typedesc[DisclosedVendorsSegment_RangeSection], filename: string): DisclosedVendorsSegment_RangeSection =
  DisclosedVendorsSegment_RangeSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DisclosedVendorsSegment_RangeEntry], io: KaitaiStream, root: KaitaiStruct, parent: DisclosedVendorsSegment_RangeSection): DisclosedVendorsSegment_RangeEntry =
  template this: untyped = result
  this = new(DisclosedVendorsSegment_RangeEntry)
  let root = if root == nil: cast[DisclosedVendorsSegment](this) else: cast[DisclosedVendorsSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let isARangeExpr = this.io.readBitsIntBe(1) != 0
  this.isARange = isARangeExpr
  let startOrOnlyVendorIdExpr = this.io.readBitsIntBe(16)
  this.startOrOnlyVendorId = startOrOnlyVendorIdExpr
  if this.isARange:
    let endVendorIdExpr = this.io.readBitsIntBe(16)
    this.endVendorId = endVendorIdExpr

proc fromFile*(_: typedesc[DisclosedVendorsSegment_RangeEntry], filename: string): DisclosedVendorsSegment_RangeEntry =
  DisclosedVendorsSegment_RangeEntry.read(newKaitaiFileStream(filename), nil, nil)

