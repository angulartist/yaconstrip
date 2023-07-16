# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package DisclosedVendorsSegment;

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

    $self->{segment_type} = $self->{_io}->read_bits_int_be(3);
    $self->{_io}->align_to_byte();
    $self->{vendor_consent} = DisclosedVendorsSegment::VendorSection->new($self->{_io}, $self, $self->{_root});
}

sub segment_type {
    my ($self) = @_;
    return $self->{segment_type};
}

sub vendor_consent {
    my ($self) = @_;
    return $self->{vendor_consent};
}

########################################################################
package DisclosedVendorsSegment::VendorSection;

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
        $self->{range_section} = DisclosedVendorsSegment::RangeSection->new($self->{_io}, $self, $self->{_root});
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
package DisclosedVendorsSegment::RangeSection;

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
        push @{$self->{range_entries}}, DisclosedVendorsSegment::RangeEntry->new($self->{_io}, $self, $self->{_root});
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
package DisclosedVendorsSegment::RangeEntry;

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
