// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"

type PublisherTcSegment struct {
	SegmentType uint64
	PubPurposesConsent []bool
	PubPurposesLiTransparency []bool
	NumCustomPurposes uint64
	CustomPurposesConsent []bool
	CustomPurposesLiTransparency []bool
	_io *kaitai.Stream
	_root *PublisherTcSegment
	_parent interface{}
}
func NewPublisherTcSegment() *PublisherTcSegment {
	return &PublisherTcSegment{
	}
}

func (this *PublisherTcSegment) Read(io *kaitai.Stream, parent interface{}, root *PublisherTcSegment) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBitsIntBe(3)
	if err != nil {
		return err
	}
	this.SegmentType = tmp1
	for i := 0; i < int(24); i++ {
		_ = i
		tmp2, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.PubPurposesConsent = append(this.PubPurposesConsent, tmp2 != 0)
	}
	for i := 0; i < int(24); i++ {
		_ = i
		tmp3, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.PubPurposesLiTransparency = append(this.PubPurposesLiTransparency, tmp3 != 0)
	}
	tmp4, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.NumCustomPurposes = tmp4
	if (this.NumCustomPurposes > 0) {
		for i := 0; i < int(this.NumCustomPurposes); i++ {
			_ = i
			tmp5, err := this._io.ReadBitsIntBe(1)
			if err != nil {
				return err
			}
			this.CustomPurposesConsent = append(this.CustomPurposesConsent, tmp5 != 0)
		}
	}
	if (this.NumCustomPurposes > 0) {
		for i := 0; i < int(this.NumCustomPurposes); i++ {
			_ = i
			tmp6, err := this._io.ReadBitsIntBe(1)
			if err != nil {
				return err
			}
			this.CustomPurposesLiTransparency = append(this.CustomPurposesLiTransparency, tmp6 != 0)
		}
	}
	return err
}
