# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package CoreStringSegment;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{metadata} = CoreStringSegment::Metadata->new($self->{_io}, $self, $self->{_root});
    $self->{structure} = CoreStringSegment::Structure->new($self->{_io}, $self, $self->{_root});
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata};
}

sub structure {
    my ($self) = @_;
    return $self->{structure};
}

########################################################################
package CoreStringSegment::Alpha;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{left} = $self->{_io}->read_bits_int_be(6);
    $self->{right} = $self->{_io}->read_bits_int_be(6);
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

########################################################################
package CoreStringSegment::Metadata;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{version} = $self->{_io}->read_bits_int_be(6);
    $self->{created} = $self->{_io}->read_bits_int_be(32);
    $self->{created_overflow} = $self->{_io}->read_bits_int_be(4);
    $self->{last_updated} = $self->{_io}->read_bits_int_be(32);
    $self->{last_updated_overflow} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{cmp} = CoreStringSegment::Metadata::Cmp->new($self->{_io}, $self, $self->{_root});
    $self->{gvl_version} = $self->{_io}->read_bits_int_be(12);
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub created {
    my ($self) = @_;
    return $self->{created};
}

sub created_overflow {
    my ($self) = @_;
    return $self->{created_overflow};
}

sub last_updated {
    my ($self) = @_;
    return $self->{last_updated};
}

sub last_updated_overflow {
    my ($self) = @_;
    return $self->{last_updated_overflow};
}

sub cmp {
    my ($self) = @_;
    return $self->{cmp};
}

sub gvl_version {
    my ($self) = @_;
    return $self->{gvl_version};
}

########################################################################
package CoreStringSegment::Metadata::Cmp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{id} = $self->{_io}->read_bits_int_be(12);
    $self->{version} = $self->{_io}->read_bits_int_be(12);
    $self->{screen} = $self->{_io}->read_bits_int_be(6);
    $self->{_io}->align_to_byte();
    $self->{language} = CoreStringSegment::Alpha->new($self->{_io}, $self, $self->{_root});
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub screen {
    my ($self) = @_;
    return $self->{screen};
}

sub language {
    my ($self) = @_;
    return $self->{language};
}

########################################################################
package CoreStringSegment::Structure;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{policy_version} = $self->{_io}->read_bits_int_be(6);
    $self->{is_service_specific} = $self->{_io}->read_bits_int_be(1);
    $self->{use_non_standard_texts} = $self->{_io}->read_bits_int_be(1);
    $self->{special_feature_opt_ins} = ();
    my $n_special_feature_opt_ins = 12;
    for (my $i = 0; $i < $n_special_feature_opt_ins; $i++) {
        push @{$self->{special_feature_opt_ins}}, $self->{_io}->read_bits_int_be(1);
    }
    $self->{purposes_consent} = ();
    my $n_purposes_consent = 24;
    for (my $i = 0; $i < $n_purposes_consent; $i++) {
        push @{$self->{purposes_consent}}, $self->{_io}->read_bits_int_be(1);
    }
    $self->{purposes_li_transparency} = ();
    my $n_purposes_li_transparency = 24;
    for (my $i = 0; $i < $n_purposes_li_transparency; $i++) {
        push @{$self->{purposes_li_transparency}}, $self->{_io}->read_bits_int_be(1);
    }
    $self->{_io}->align_to_byte();
    $self->{sj_disclosures} = CoreStringSegment::Structure::SjDisclosures->new($self->{_io}, $self, $self->{_root});
    $self->{vendor_consent} = CoreStringSegment::Structure::VendorSection->new($self->{_io}, $self, $self->{_root});
    $self->{vendor_li} = CoreStringSegment::Structure::VendorSection->new($self->{_io}, $self, $self->{_root});
    $self->{pub_restrictions} = CoreStringSegment::Structure::PubRestrictionsSection->new($self->{_io}, $self, $self->{_root});
}

sub policy_version {
    my ($self) = @_;
    return $self->{policy_version};
}

sub is_service_specific {
    my ($self) = @_;
    return $self->{is_service_specific};
}

sub use_non_standard_texts {
    my ($self) = @_;
    return $self->{use_non_standard_texts};
}

sub special_feature_opt_ins {
    my ($self) = @_;
    return $self->{special_feature_opt_ins};
}

sub purposes_consent {
    my ($self) = @_;
    return $self->{purposes_consent};
}

sub purposes_li_transparency {
    my ($self) = @_;
    return $self->{purposes_li_transparency};
}

sub sj_disclosures {
    my ($self) = @_;
    return $self->{sj_disclosures};
}

sub vendor_consent {
    my ($self) = @_;
    return $self->{vendor_consent};
}

sub vendor_li {
    my ($self) = @_;
    return $self->{vendor_li};
}

sub pub_restrictions {
    my ($self) = @_;
    return $self->{pub_restrictions};
}

########################################################################
package CoreStringSegment::Structure::PubRestrictionsSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_pub_restrictions} = $self->{_io}->read_bits_int_be(12);
    $self->{_io}->align_to_byte();
    if ($self->num_pub_restrictions() > 0) {
        $self->{pub_restriction_entries} = ();
        my $n_pub_restriction_entries = $self->num_pub_restrictions();
        for (my $i = 0; $i < $n_pub_restriction_entries; $i++) {
            push @{$self->{pub_restriction_entries}}, CoreStringSegment::Structure::PubRestrictionsSection::PubRestrictionEntry->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub num_pub_restrictions {
    my ($self) = @_;
    return $self->{num_pub_restrictions};
}

sub pub_restriction_entries {
    my ($self) = @_;
    return $self->{pub_restriction_entries};
}

########################################################################
package CoreStringSegment::Structure::PubRestrictionsSection::PubRestrictionEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{purpose_id} = $self->{_io}->read_bits_int_be(6);
    $self->{restriction_type} = $self->{_io}->read_bits_int_be(2);
    $self->{_io}->align_to_byte();
    $self->{range_section} = CoreStringSegment::Structure::RangeSection->new($self->{_io}, $self, $self->{_root});
    $self->{num_entries} = $self->{_io}->read_bits_int_be(12);
    $self->{_io}->align_to_byte();
    $self->{range_entries} = ();
    my $n_range_entries = $self->num_entries();
    for (my $i = 0; $i < $n_range_entries; $i++) {
        push @{$self->{range_entries}}, CoreStringSegment::Structure::RangeEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub purpose_id {
    my ($self) = @_;
    return $self->{purpose_id};
}

sub restriction_type {
    my ($self) = @_;
    return $self->{restriction_type};
}

sub range_section {
    my ($self) = @_;
    return $self->{range_section};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub range_entries {
    my ($self) = @_;
    return $self->{range_entries};
}

########################################################################
package CoreStringSegment::Structure::VendorSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{max_vendor_id} = $self->{_io}->read_bits_int_be(16);
    $self->{is_range_encoding} = $self->{_io}->read_bits_int_be(1);
    if (!($self->is_range_encoding())) {
        $self->{bit_field} = ();
        my $n_bit_field = $self->max_vendor_id();
        for (my $i = 0; $i < $n_bit_field; $i++) {
            push @{$self->{bit_field}}, $self->{_io}->read_bits_int_be(1);
        }
    }
    $self->{_io}->align_to_byte();
    if ($self->is_range_encoding()) {
        $self->{range_section} = CoreStringSegment::Structure::RangeSection->new($self->{_io}, $self, $self->{_root});
    }
}

sub max_vendor_id {
    my ($self) = @_;
    return $self->{max_vendor_id};
}

sub is_range_encoding {
    my ($self) = @_;
    return $self->{is_range_encoding};
}

sub bit_field {
    my ($self) = @_;
    return $self->{bit_field};
}

sub range_section {
    my ($self) = @_;
    return $self->{range_section};
}

########################################################################
package CoreStringSegment::Structure::RangeSection;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_entries} = $self->{_io}->read_bits_int_be(12);
    $self->{_io}->align_to_byte();
    $self->{range_entries} = ();
    my $n_range_entries = $self->num_entries();
    for (my $i = 0; $i < $n_range_entries; $i++) {
        push @{$self->{range_entries}}, CoreStringSegment::Structure::RangeEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub range_entries {
    my ($self) = @_;
    return $self->{range_entries};
}

########################################################################
package CoreStringSegment::Structure::SjDisclosures;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{purpose_one_treatment} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{pub_country} = CoreStringSegment::Alpha->new($self->{_io}, $self, $self->{_root});
}

sub purpose_one_treatment {
    my ($self) = @_;
    return $self->{purpose_one_treatment};
}

sub pub_country {
    my ($self) = @_;
    return $self->{pub_country};
}

########################################################################
package CoreStringSegment::Structure::RangeEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{is_a_range} = $self->{_io}->read_bits_int_be(1);
    $self->{start_or_only_vendor_id} = $self->{_io}->read_bits_int_be(16);
    if ($self->is_a_range()) {
        $self->{end_vendor_id} = $self->{_io}->read_bits_int_be(16);
    }
}

sub is_a_range {
    my ($self) = @_;
    return $self->{is_a_range};
}

sub start_or_only_vendor_id {
    my ($self) = @_;
    return $self->{start_or_only_vendor_id};
}

sub end_vendor_id {
    my ($self) = @_;
    return $self->{end_vendor_id};
}

1;
