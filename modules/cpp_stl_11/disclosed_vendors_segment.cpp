// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "disclosed_vendors_segment.h"

disclosed_vendors_segment_t::disclosed_vendors_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_vendor_consent = nullptr;
    _read();
}

void disclosed_vendors_segment_t::_read() {
    m_segment_type = m__io->read_bits_int_be(3);
    m__io->align_to_byte();
    m_vendor_consent = std::unique_ptr<vendor_section_t>(new vendor_section_t(m__io, this, m__root));
}

disclosed_vendors_segment_t::~disclosed_vendors_segment_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::_clean_up() {
}

disclosed_vendors_segment_t::vendor_section_t::vendor_section_t(kaitai::kstream* p__io, disclosed_vendors_segment_t* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bit_field = nullptr;
    m_range_section = nullptr;
    _read();
}

void disclosed_vendors_segment_t::vendor_section_t::_read() {
    m_max_vendor_id = m__io->read_bits_int_be(16);
    m_is_range_encoding = m__io->read_bits_int_be(1);
    n_bit_field = true;
    if (!(is_range_encoding())) {
        n_bit_field = false;
        m_bit_field = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
        const int l_bit_field = max_vendor_id();
        for (int i = 0; i < l_bit_field; i++) {
            m_bit_field->push_back(std::move(m__io->read_bits_int_be(1)));
        }
    }
    m__io->align_to_byte();
    n_range_section = true;
    if (is_range_encoding()) {
        n_range_section = false;
        m_range_section = std::unique_ptr<range_section_t>(new range_section_t(m__io, this, m__root));
    }
}

disclosed_vendors_segment_t::vendor_section_t::~vendor_section_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::vendor_section_t::_clean_up() {
    if (!n_bit_field) {
    }
    if (!n_range_section) {
    }
}

disclosed_vendors_segment_t::range_section_t::range_section_t(kaitai::kstream* p__io, disclosed_vendors_segment_t::vendor_section_t* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_range_entries = nullptr;
    _read();
}

void disclosed_vendors_segment_t::range_section_t::_read() {
    m_num_entries = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    m_range_entries = std::unique_ptr<std::vector<std::unique_ptr<range_entry_t>>>(new std::vector<std::unique_ptr<range_entry_t>>());
    const int l_range_entries = num_entries();
    for (int i = 0; i < l_range_entries; i++) {
        m_range_entries->push_back(std::move(std::unique_ptr<range_entry_t>(new range_entry_t(m__io, this, m__root))));
    }
}

disclosed_vendors_segment_t::range_section_t::~range_section_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::range_section_t::_clean_up() {
}

disclosed_vendors_segment_t::range_entry_t::range_entry_t(kaitai::kstream* p__io, disclosed_vendors_segment_t::range_section_t* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void disclosed_vendors_segment_t::range_entry_t::_read() {
    m_is_a_range = m__io->read_bits_int_be(1);
    m_start_or_only_vendor_id = m__io->read_bits_int_be(16);
    n_end_vendor_id = true;
    if (is_a_range()) {
        n_end_vendor_id = false;
        m_end_vendor_id = m__io->read_bits_int_be(16);
    }
}

disclosed_vendors_segment_t::range_entry_t::~range_entry_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::range_entry_t::_clean_up() {
    if (!n_end_vendor_id) {
    }
}
