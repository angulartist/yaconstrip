// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"

type CoreStringSegment struct {
	Metadata *CoreStringSegment_Metadata
	Structure *CoreStringSegment_Structure
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent interface{}
}
func NewCoreStringSegment() *CoreStringSegment {
	return &CoreStringSegment{
	}
}

func (this *CoreStringSegment) Read(io *kaitai.Stream, parent interface{}, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewCoreStringSegment_Metadata()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Metadata = tmp1
	tmp2 := NewCoreStringSegment_Structure()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Structure = tmp2
	return err
}
type CoreStringSegment_Alpha struct {
	Left uint64
	Right uint64
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent interface{}
}
func NewCoreStringSegment_Alpha() *CoreStringSegment_Alpha {
	return &CoreStringSegment_Alpha{
	}
}

func (this *CoreStringSegment_Alpha) Read(io *kaitai.Stream, parent interface{}, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Left = tmp3
	tmp4, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Right = tmp4
	return err
}

/**
 * TC Consent Management Platform
 */
type CoreStringSegment_Metadata struct {
	Version uint64
	Created uint64
	CreatedOverflow uint64
	LastUpdated uint64
	LastUpdatedOverflow uint64
	Cmp *CoreStringSegment_Metadata_Cmp
	GvlVersion uint64
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment
}
func NewCoreStringSegment_Metadata() *CoreStringSegment_Metadata {
	return &CoreStringSegment_Metadata{
	}
}

func (this *CoreStringSegment_Metadata) Read(io *kaitai.Stream, parent *CoreStringSegment, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Version = tmp5
	tmp6, err := this._io.ReadBitsIntBe(32)
	if err != nil {
		return err
	}
	this.Created = tmp6
	tmp7, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.CreatedOverflow = tmp7
	tmp8, err := this._io.ReadBitsIntBe(32)
	if err != nil {
		return err
	}
	this.LastUpdated = tmp8
	tmp9, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.LastUpdatedOverflow = tmp9
	this._io.AlignToByte()
	tmp10 := NewCoreStringSegment_Metadata_Cmp()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Cmp = tmp10
	tmp11, err := this._io.ReadBitsIntBe(12)
	if err != nil {
		return err
	}
	this.GvlVersion = tmp11
	return err
}

/**
 * Supported version is above 2 (TCF 2.O)
 */

/**
 * Timestamp
 */

/**
 * Timestamp
 */

/**
 * Timestamp
 */

/**
 * Timestamp
 */

/**
 * Global Vendor List version
 */

/**
 * Consent Management Platform
 */
type CoreStringSegment_Metadata_Cmp struct {
	Id uint64
	Version uint64
	Screen uint64
	Language *CoreStringSegment_Alpha
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment_Metadata
}
func NewCoreStringSegment_Metadata_Cmp() *CoreStringSegment_Metadata_Cmp {
	return &CoreStringSegment_Metadata_Cmp{
	}
}

func (this *CoreStringSegment_Metadata_Cmp) Read(io *kaitai.Stream, parent *CoreStringSegment_Metadata, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadBitsIntBe(12)
	if err != nil {
		return err
	}
	this.Id = tmp12
	tmp13, err := this._io.ReadBitsIntBe(12)
	if err != nil {
		return err
	}
	this.Version = tmp13
	tmp14, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Screen = tmp14
	this._io.AlignToByte()
	tmp15 := NewCoreStringSegment_Alpha()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Language = tmp15
	return err
}

/**
 * ISO 3166-1 alpha-2 code used identify a country or a language
 */
type CoreStringSegment_Structure struct {
	PolicyVersion uint64
	IsServiceSpecific bool
	UseNonStandardTexts bool
	SpecialFeatureOptIns []bool
	PurposesConsent []bool
	PurposesLiTransparency []bool
	SjDisclosures *CoreStringSegment_Structure_SjDisclosures
	VendorConsent *CoreStringSegment_Structure_VendorSection
	VendorLi *CoreStringSegment_Structure_VendorSection
	PubRestrictions *CoreStringSegment_Structure_PubRestrictionsSection
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment
}
func NewCoreStringSegment_Structure() *CoreStringSegment_Structure {
	return &CoreStringSegment_Structure{
	}
}

func (this *CoreStringSegment_Structure) Read(io *kaitai.Stream, parent *CoreStringSegment, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.PolicyVersion = tmp16
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsServiceSpecific = tmp17 != 0
	tmp18, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.UseNonStandardTexts = tmp18 != 0
	for i := 0; i < int(12); i++ {
		_ = i
		tmp19, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.SpecialFeatureOptIns = append(this.SpecialFeatureOptIns, tmp19 != 0)
	}
	for i := 0; i < int(24); i++ {
		_ = i
		tmp20, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.PurposesConsent = append(this.PurposesConsent, tmp20 != 0)
	}
	for i := 0; i < int(24); i++ {
		_ = i
		tmp21, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.PurposesLiTransparency = append(this.PurposesLiTransparency, tmp21 != 0)
	}
	this._io.AlignToByte()
	tmp22 := NewCoreStringSegment_Structure_SjDisclosures()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SjDisclosures = tmp22
	tmp23 := NewCoreStringSegment_Structure_VendorSection()
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VendorConsent = tmp23
	tmp24 := NewCoreStringSegment_Structure_VendorSection()
	err = tmp24.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VendorLi = tmp24
	tmp25 := NewCoreStringSegment_Structure_PubRestrictionsSection()
	err = tmp25.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PubRestrictions = tmp25
	return err
}

/**
 * Specific Jurisdiction Disclosures
 */
type CoreStringSegment_Structure_PubRestrictionsSection struct {
	NumPubRestrictions uint64
	PubRestrictionEntries []*CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment_Structure
}
func NewCoreStringSegment_Structure_PubRestrictionsSection() *CoreStringSegment_Structure_PubRestrictionsSection {
	return &CoreStringSegment_Structure_PubRestrictionsSection{
	}
}

func (this *CoreStringSegment_Structure_PubRestrictionsSection) Read(io *kaitai.Stream, parent *CoreStringSegment_Structure, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadBitsIntBe(12)
	if err != nil {
		return err
	}
	this.NumPubRestrictions = tmp26
	this._io.AlignToByte()
	if (this.NumPubRestrictions > 0) {
		for i := 0; i < int(this.NumPubRestrictions); i++ {
			_ = i
			tmp27 := NewCoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry()
			err = tmp27.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.PubRestrictionEntries = append(this.PubRestrictionEntries, tmp27)
		}
	}
	return err
}
type CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry struct {
	PurposeId uint64
	RestrictionType uint64
	RangeSection *CoreStringSegment_Structure_RangeSection
	NumEntries uint64
	RangeEntries []*CoreStringSegment_Structure_RangeEntry
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment_Structure_PubRestrictionsSection
}
func NewCoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry() *CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry {
	return &CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry{
	}
}

func (this *CoreStringSegment_Structure_PubRestrictionsSection_PubRestrictionEntry) Read(io *kaitai.Stream, parent *CoreStringSegment_Structure_PubRestrictionsSection, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.PurposeId = tmp28
	tmp29, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.RestrictionType = tmp29
	this._io.AlignToByte()
	tmp30 := NewCoreStringSegment_Structure_RangeSection()
	err = tmp30.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.RangeSection = tmp30
	tmp31, err := this._io.ReadBitsIntBe(12)
	if err != nil {
		return err
	}
	this.NumEntries = tmp31
	this._io.AlignToByte()
	for i := 0; i < int(this.NumEntries); i++ {
		_ = i
		tmp32 := NewCoreStringSegment_Structure_RangeEntry()
		err = tmp32.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.RangeEntries = append(this.RangeEntries, tmp32)
	}
	return err
}
type CoreStringSegment_Structure_VendorSection struct {
	MaxVendorId uint64
	IsRangeEncoding bool
	BitField []bool
	RangeSection *CoreStringSegment_Structure_RangeSection
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment_Structure
}
func NewCoreStringSegment_Structure_VendorSection() *CoreStringSegment_Structure_VendorSection {
	return &CoreStringSegment_Structure_VendorSection{
	}
}

func (this *CoreStringSegment_Structure_VendorSection) Read(io *kaitai.Stream, parent *CoreStringSegment_Structure, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadBitsIntBe(16)
	if err != nil {
		return err
	}
	this.MaxVendorId = tmp33
	tmp34, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsRangeEncoding = tmp34 != 0
	if (!(this.IsRangeEncoding)) {
		for i := 0; i < int(this.MaxVendorId); i++ {
			_ = i
			tmp35, err := this._io.ReadBitsIntBe(1)
			if err != nil {
				return err
			}
			this.BitField = append(this.BitField, tmp35 != 0)
		}
	}
	this._io.AlignToByte()
	if (this.IsRangeEncoding) {
		tmp36 := NewCoreStringSegment_Structure_RangeSection()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.RangeSection = tmp36
	}
	return err
}
type CoreStringSegment_Structure_RangeSection struct {
	NumEntries uint64
	RangeEntries []*CoreStringSegment_Structure_RangeEntry
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent interface{}
}
func NewCoreStringSegment_Structure_RangeSection() *CoreStringSegment_Structure_RangeSection {
	return &CoreStringSegment_Structure_RangeSection{
	}
}

func (this *CoreStringSegment_Structure_RangeSection) Read(io *kaitai.Stream, parent interface{}, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadBitsIntBe(12)
	if err != nil {
		return err
	}
	this.NumEntries = tmp37
	this._io.AlignToByte()
	for i := 0; i < int(this.NumEntries); i++ {
		_ = i
		tmp38 := NewCoreStringSegment_Structure_RangeEntry()
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.RangeEntries = append(this.RangeEntries, tmp38)
	}
	return err
}

/**
 * Specific Jurisdiction Disclosures
 */
type CoreStringSegment_Structure_SjDisclosures struct {
	PurposeOneTreatment bool
	PubCountry *CoreStringSegment_Alpha
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent *CoreStringSegment_Structure
}
func NewCoreStringSegment_Structure_SjDisclosures() *CoreStringSegment_Structure_SjDisclosures {
	return &CoreStringSegment_Structure_SjDisclosures{
	}
}

func (this *CoreStringSegment_Structure_SjDisclosures) Read(io *kaitai.Stream, parent *CoreStringSegment_Structure, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.PurposeOneTreatment = tmp39 != 0
	this._io.AlignToByte()
	tmp40 := NewCoreStringSegment_Alpha()
	err = tmp40.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PubCountry = tmp40
	return err
}

/**
 * Publisher Country Code
 */
type CoreStringSegment_Structure_RangeEntry struct {
	IsARange bool
	StartOrOnlyVendorId uint64
	EndVendorId uint64
	_io *kaitai.Stream
	_root *CoreStringSegment
	_parent interface{}
}
func NewCoreStringSegment_Structure_RangeEntry() *CoreStringSegment_Structure_RangeEntry {
	return &CoreStringSegment_Structure_RangeEntry{
	}
}

func (this *CoreStringSegment_Structure_RangeEntry) Read(io *kaitai.Stream, parent interface{}, root *CoreStringSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsARange = tmp41 != 0
	tmp42, err := this._io.ReadBitsIntBe(16)
	if err != nil {
		return err
	}
	this.StartOrOnlyVendorId = tmp42
	if (this.IsARange) {
		tmp43, err := this._io.ReadBitsIntBe(16)
		if err != nil {
			return err
		}
		this.EndVendorId = tmp43
	}
	return err
}
