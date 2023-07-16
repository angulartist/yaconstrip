import kaitai_struct_nim_runtime
import options

type
  PublisherTcSegment* = ref object of KaitaiStruct
    `segmentType`*: uint64
    `pubPurposesConsent`*: seq[bool]
    `pubPurposesLiTransparency`*: seq[bool]
    `numCustomPurposes`*: uint64
    `customPurposesConsent`*: seq[bool]
    `customPurposesLiTransparency`*: seq[bool]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[PublisherTcSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PublisherTcSegment


proc read*(_: typedesc[PublisherTcSegment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PublisherTcSegment =
  template this: untyped = result
  this = new(PublisherTcSegment)
  let root = if root == nil: cast[PublisherTcSegment](this) else: cast[PublisherTcSegment](root)
  this.io = io
  this.root = root
  this.parent = parent

  let segmentTypeExpr = this.io.readBitsIntBe(3)
  this.segmentType = segmentTypeExpr
  for i in 0 ..< int(24):
    let it = this.io.readBitsIntBe(1) != 0
    this.pubPurposesConsent.add(it)
  for i in 0 ..< int(24):
    let it = this.io.readBitsIntBe(1) != 0
    this.pubPurposesLiTransparency.add(it)
  let numCustomPurposesExpr = this.io.readBitsIntBe(6)
  this.numCustomPurposes = numCustomPurposesExpr
  if this.numCustomPurposes > 0:
    for i in 0 ..< int(this.numCustomPurposes):
      let it = this.io.readBitsIntBe(1) != 0
      this.customPurposesConsent.add(it)
  if this.numCustomPurposes > 0:
    for i in 0 ..< int(this.numCustomPurposes):
      let it = this.io.readBitsIntBe(1) != 0
      this.customPurposesLiTransparency.add(it)

proc fromFile*(_: typedesc[PublisherTcSegment], filename: string): PublisherTcSegment =
  PublisherTcSegment.read(newKaitaiFileStream(filename), nil, nil)

