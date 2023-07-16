# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package PublisherTcSegment;

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
    $self->{pub_purposes_consent} = ();
    my $n_pub_purposes_consent = 24;
    for (my $i = 0; $i < $n_pub_purposes_consent; $i++) {
        push @{$self->{pub_purposes_consent}}, $self->{_io}->read_bits_int_be(1);
    }
    $self->{pub_purposes_li_transparency} = ();
    my $n_pub_purposes_li_transparency = 24;
    for (my $i = 0; $i < $n_pub_purposes_li_transparency; $i++) {
        push @{$self->{pub_purposes_li_transparency}}, $self->{_io}->read_bits_int_be(1);
    }
    $self->{num_custom_purposes} = $self->{_io}->read_bits_int_be(6);
    if ($self->num_custom_purposes() > 0) {
        $self->{custom_purposes_consent} = ();
        my $n_custom_purposes_consent = $self->num_custom_purposes();
        for (my $i = 0; $i < $n_custom_purposes_consent; $i++) {
            push @{$self->{custom_purposes_consent}}, $self->{_io}->read_bits_int_be(1);
        }
    }
    if ($self->num_custom_purposes() > 0) {
        $self->{custom_purposes_li_transparency} = ();
        my $n_custom_purposes_li_transparency = $self->num_custom_purposes();
        for (my $i = 0; $i < $n_custom_purposes_li_transparency; $i++) {
            push @{$self->{custom_purposes_li_transparency}}, $self->{_io}->read_bits_int_be(1);
        }
    }
}

sub segment_type {
    my ($self) = @_;
    return $self->{segment_type};
}

sub pub_purposes_consent {
    my ($self) = @_;
    return $self->{pub_purposes_consent};
}

sub pub_purposes_li_transparency {
    my ($self) = @_;
    return $self->{pub_purposes_li_transparency};
}

sub num_custom_purposes {
    my ($self) = @_;
    return $self->{num_custom_purposes};
}

sub custom_purposes_consent {
    my ($self) = @_;
    return $self->{custom_purposes_consent};
}

sub custom_purposes_li_transparency {
    my ($self) = @_;
    return $self->{custom_purposes_li_transparency};
}

1;
