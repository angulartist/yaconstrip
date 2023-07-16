import kaitai_struct_nim_runtime
import options

type
  CoreStringSegment* = ref object of KaitaiStruct
    `metadata`*: CoreStringSegment_Metadata
    `structure`*: CoreStringSegment_Structure
    `parent`*: KaitaiStruct
  CoreStringSegment_Alpha* = ref object of KaitaiStruct
    `left`*: uint64
    `right`*: uint64
    `parent`*: KaitaiStruct
  CoreStringSegment_Metadata* = ref object of KaitaiStruct
    `version`*: uint64
    `created`*: uint64
    `createdOverflow`*: uint64
    `lastUpdated`*: uint64
    `lastUpdatedOverflow`*: uint64
    `cmp`*: CoreStringSegment_Metadata_Cmp
    `gvlVersion`*: uint64
    `parent`*: CoreStringSegment
  CoreStringSegment_Metadata_Cmp* = ref object of KaitaiStruct
    `id`*: uint64
    `version`*: uint64
    `screen`*: uint64
    `language`*: CoreStringSegment_Alpha
    `parent`*: CoreStringSegment_Metadata
  CoreStringSegment_Structure* = ref object of KaitaiStruct
    `policyVersion`*: uint64
    `isServiceSpecific`*: bool
    `useNonStandardTexts`*: bool
    `specialFeatureOptIns`*: seq[bool]
    `purposesConsent`*: seq[bool]
    `purposesLiTransparency`*: seq[bool]
    `sjDisclosures`*: CoreStringSegment_Structure_SjDisclosures
    `vendorConsent`*: CoreStringSegment_Structure_VendorSection
    `vendorLi`*: CoreStringSegment_Structure_VendorSection
    `pubRestrictions`*: CoreStringSegment_Structure_PubRestrictionsSection
    `parent`*: CoreStringSegment
  CoreStringSegment_Structure_PubRestrictionsSection* = ref object of KaitaiStruct
    `numPubRestrictions`*: uint64
    `pubRestrictionEntries`*: seq[CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry]
    `parent`*: CoreStringSegment_Structure
  CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry* = ref object of KaitaiStruct
    `purposeId`*: uint64
    `restrictionType`*: uint64
    `rangeSection`*: CoreStringSegment_Structure_RangeSection
    `numEntries`*: uint64
    `rangeEntries`*: seq[CoreStringSegment_Structure_RangeEntry]
    `parent`*: CoreStringSegment_Structure_PubRestrictionsSection
  CoreStringSegment_Structure_VendorSection* = ref object of KaitaiStruct
    `maxVendorId`*: uint64
    `isRangeEncoding`*: bool
    `bitField`*: seq[bool]
    `rangeSection`*: CoreStringSegment_Structure_RangeSection
    `parent`*: CoreStringSegment_Structure
  CoreStringSegment_Structure_RangeSection* = ref object of KaitaiStruct
    `numEntries`*: uint64
    `rangeEntries`*: seq[CoreStringSegment_Structure_RangeEntry]
    `parent`*: KaitaiStruct
  CoreStringSegment_Structure_SjDisclosures* = ref object of KaitaiStruct
    `purposeOneTreatment`*: bool
    `pubCountry`*: CoreStringSegment_Alpha
    `parent`*: CoreStringSegment_Structure
  CoreStringSegment_Structure_RangeEntry* = ref object of KaitaiStruct
    `isARange`*: bool
    `startOrOnlyVendorId`*: uint64
    `endVendorId`*: uint64
    `parent`*: KaitaiStruct

proc read*(_: typedesc[CoreStringSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment
proc read*(_: typedesc[CoreStringSegment_Alpha], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment_Alpha
proc read*(_: typedesc[CoreStringSegment_Metadata], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment): CoreStringSegment_Metadata
proc read*(_: typedesc[CoreStringSegment_Metadata_Cmp], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Metadata): CoreStringSegment_Metadata_Cmp
proc read*(_: typedesc[CoreStringSegment_Structure], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment): CoreStringSegment_Structure
proc read*(_: typedesc[CoreStringSegment_Structure_PubRestrictionsSection], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure): CoreStringSegment_Structure_PubRestrictionsSection
proc read*(_: typedesc[CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure_PubRestrictionsSection): CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry
proc read*(_: typedesc[CoreStringSegment_Structure_VendorSection], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure): CoreStringSegment_Structure_VendorSection
proc read*(_: typedesc[CoreStringSegment_Structure_RangeSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment_Structure_RangeSection
proc read*(_: typedesc[CoreStringSegment_Structure_SjDisclosures], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure): CoreStringSegment_Structure_SjDisclosures
proc read*(_: typedesc[CoreStringSegment_Structure_RangeEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment_Structure_RangeEntry


proc read*(_: typedesc[CoreStringSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment =
  template this: untyped = result
  this = new(CoreStringSegment)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let metadataExpr = CoreStringSegment_Metadata.read(this.io, this.root, this)
  this.metadata = metadataExpr
  let structureExpr = CoreStringSegment_Structure.read(this.io, this.root, this)
  this.structure = structureExpr

proc fromFile*(_: typedesc[CoreStringSegment], filename: string): CoreStringSegment =
  CoreStringSegment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Alpha], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment_Alpha =
  template this: untyped = result
  this = new(CoreStringSegment_Alpha)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftExpr = this.io.readBitsIntBe(6)
  this.left = leftExpr
  let rightExpr = this.io.readBitsIntBe(6)
  this.right = rightExpr

proc fromFile*(_: typedesc[CoreStringSegment_Alpha], filename: string): CoreStringSegment_Alpha =
  CoreStringSegment_Alpha.read(newKaitaiFileStream(filename), nil, nil)


##[
TC Consent Management Platform
]##
proc read*(_: typedesc[CoreStringSegment_Metadata], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment): CoreStringSegment_Metadata =
  template this: untyped = result
  this = new(CoreStringSegment_Metadata)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Supported version is above 2 (TCF 2.O)
  ]##
  let versionExpr = this.io.readBitsIntBe(6)
  this.version = versionExpr

  ##[
  Timestamp
  ]##
  let createdExpr = this.io.readBitsIntBe(32)
  this.created = createdExpr

  ##[
  Timestamp
  ]##
  let createdOverflowExpr = this.io.readBitsIntBe(4)
  this.createdOverflow = createdOverflowExpr

  ##[
  Timestamp
  ]##
  let lastUpdatedExpr = this.io.readBitsIntBe(32)
  this.lastUpdated = lastUpdatedExpr

  ##[
  Timestamp
  ]##
  let lastUpdatedOverflowExpr = this.io.readBitsIntBe(4)
  this.lastUpdatedOverflow = lastUpdatedOverflowExpr
  alignToByte(this.io)
  let cmpExpr = CoreStringSegment_Metadata_Cmp.read(this.io, this.root, this)
  this.cmp = cmpExpr

  ##[
  Global Vendor List version
  ]##
  let gvlVersionExpr = this.io.readBitsIntBe(12)
  this.gvlVersion = gvlVersionExpr

proc fromFile*(_: typedesc[CoreStringSegment_Metadata], filename: string): CoreStringSegment_Metadata =
  CoreStringSegment_Metadata.read(newKaitaiFileStream(filename), nil, nil)


##[
Consent Management Platform
]##
proc read*(_: typedesc[CoreStringSegment_Metadata_Cmp], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Metadata): CoreStringSegment_Metadata_Cmp =
  template this: untyped = result
  this = new(CoreStringSegment_Metadata_Cmp)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readBitsIntBe(12)
  this.id = idExpr
  let versionExpr = this.io.readBitsIntBe(12)
  this.version = versionExpr
  let screenExpr = this.io.readBitsIntBe(6)
  this.screen = screenExpr
  alignToByte(this.io)

  ##[
  ISO 3166-1 alpha-2 code used identify a country or a language
  ]##
  let languageExpr = CoreStringSegment_Alpha.read(this.io, this.root, this)
  this.language = languageExpr

proc fromFile*(_: typedesc[CoreStringSegment_Metadata_Cmp], filename: string): CoreStringSegment_Metadata_Cmp =
  CoreStringSegment_Metadata_Cmp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Structure], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment): CoreStringSegment_Structure =
  template this: untyped = result
  this = new(CoreStringSegment_Structure)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let policyVersionExpr = this.io.readBitsIntBe(6)
  this.policyVersion = policyVersionExpr
  let isServiceSpecificExpr = this.io.readBitsIntBe(1) != 0
  this.isServiceSpecific = isServiceSpecificExpr
  let useNonStandardTextsExpr = this.io.readBitsIntBe(1) != 0
  this.useNonStandardTexts = useNonStandardTextsExpr
  for i in 0 ..< int(12):
    let it = this.io.readBitsIntBe(1) != 0
    this.specialFeatureOptIns.add(it)
  for i in 0 ..< int(24):
    let it = this.io.readBitsIntBe(1) != 0
    this.purposesConsent.add(it)
  for i in 0 ..< int(24):
    let it = this.io.readBitsIntBe(1) != 0
    this.purposesLiTransparency.add(it)
  alignToByte(this.io)

  ##[
  Specific Jurisdiction Disclosures
  ]##
  let sjDisclosuresExpr = CoreStringSegment_Structure_SjDisclosures.read(this.io, this.root, this)
  this.sjDisclosures = sjDisclosuresExpr
  let vendorConsentExpr = CoreStringSegment_Structure_VendorSection.read(this.io, this.root, this)
  this.vendorConsent = vendorConsentExpr
  let vendorLiExpr = CoreStringSegment_Structure_VendorSection.read(this.io, this.root, this)
  this.vendorLi = vendorLiExpr
  let pubRestrictionsExpr = CoreStringSegment_Structure_PubRestrictionsSection.read(this.io, this.root, this)
  this.pubRestrictions = pubRestrictionsExpr

proc fromFile*(_: typedesc[CoreStringSegment_Structure], filename: string): CoreStringSegment_Structure =
  CoreStringSegment_Structure.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Structure_PubRestrictionsSection], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure): CoreStringSegment_Structure_PubRestrictionsSection =
  template this: untyped = result
  this = new(CoreStringSegment_Structure_PubRestrictionsSection)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numPubRestrictionsExpr = this.io.readBitsIntBe(12)
  this.numPubRestrictions = numPubRestrictionsExpr
  alignToByte(this.io)
  if this.numPubRestrictions > 0:
    for i in 0 ..< int(this.numPubRestrictions):
      let it = CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry.read(this.io, this.root, this)
      this.pubRestrictionEntries.add(it)

proc fromFile*(_: typedesc[CoreStringSegment_Structure_PubRestrictionsSection], filename: string): CoreStringSegment_Structure_PubRestrictionsSection =
  CoreStringSegment_Structure_PubRestrictionsSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure_PubRestrictionsSection): CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry =
  template this: untyped = result
  this = new(CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let purposeIdExpr = this.io.readBitsIntBe(6)
  this.purposeId = purposeIdExpr
  let restrictionTypeExpr = this.io.readBitsIntBe(2)
  this.restrictionType = restrictionTypeExpr
  alignToByte(this.io)
  let rangeSectionExpr = CoreStringSegment_Structure_RangeSection.read(this.io, this.root, this)
  this.rangeSection = rangeSectionExpr
  let numEntriesExpr = this.io.readBitsIntBe(12)
  this.numEntries = numEntriesExpr
  alignToByte(this.io)
  for i in 0 ..< int(this.numEntries):
    let it = CoreStringSegment_Structure_RangeEntry.read(this.io, this.root, this)
    this.rangeEntries.add(it)

proc fromFile*(_: typedesc[CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry], filename: string): CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry =
  CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Structure_VendorSection], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure): CoreStringSegment_Structure_VendorSection =
  template this: untyped = result
  this = new(CoreStringSegment_Structure_VendorSection)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
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
    let rangeSectionExpr = CoreStringSegment_Structure_RangeSection.read(this.io, this.root, this)
    this.rangeSection = rangeSectionExpr

proc fromFile*(_: typedesc[CoreStringSegment_Structure_VendorSection], filename: string): CoreStringSegment_Structure_VendorSection =
  CoreStringSegment_Structure_VendorSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Structure_RangeSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment_Structure_RangeSection =
  template this: untyped = result
  this = new(CoreStringSegment_Structure_RangeSection)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numEntriesExpr = this.io.readBitsIntBe(12)
  this.numEntries = numEntriesExpr
  alignToByte(this.io)
  for i in 0 ..< int(this.numEntries):
    let it = CoreStringSegment_Structure_RangeEntry.read(this.io, this.root, this)
    this.rangeEntries.add(it)

proc fromFile*(_: typedesc[CoreStringSegment_Structure_RangeSection], filename: string): CoreStringSegment_Structure_RangeSection =
  CoreStringSegment_Structure_RangeSection.read(newKaitaiFileStream(filename), nil, nil)


##[
Specific Jurisdiction Disclosures
]##
proc read*(_: typedesc[CoreStringSegment_Structure_SjDisclosures], io: KaitaiStream, root: KaitaiStruct, parent: CoreStringSegment_Structure): CoreStringSegment_Structure_SjDisclosures =
  template this: untyped = result
  this = new(CoreStringSegment_Structure_SjDisclosures)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let purposeOneTreatmentExpr = this.io.readBitsIntBe(1) != 0
  this.purposeOneTreatment = purposeOneTreatmentExpr
  alignToByte(this.io)

  ##[
  Publisher Country Code
  ]##
  let pubCountryExpr = CoreStringSegment_Alpha.read(this.io, this.root, this)
  this.pubCountry = pubCountryExpr

proc fromFile*(_: typedesc[CoreStringSegment_Structure_SjDisclosures], filename: string): CoreStringSegment_Structure_SjDisclosures =
  CoreStringSegment_Structure_SjDisclosures.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CoreStringSegment_Structure_RangeEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CoreStringSegment_Structure_RangeEntry =
  template this: untyped = result
  this = new(CoreStringSegment_Structure_RangeEntry)
  let root = if root == nil: cast[CoreStringSegment](this) else: cast[CoreStringSegment](root)
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

proc fromFile*(_: typedesc[CoreStringSegment_Structure_RangeEntry], filename: string): CoreStringSegment_Structure_RangeEntry =
  CoreStringSegment_Structure_RangeEntry.read(newKaitaiFileStream(filename), nil, nil)

