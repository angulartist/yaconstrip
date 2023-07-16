// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "disclosed_vendors_segment.h"

disclosed_vendors_segment_t::disclosed_vendors_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_vendor_consent = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void disclosed_vendors_segment_t::_read() {
    m_segment_type = m__io->read_bits_int_be(3);
    m__io->align_to_byte();
    m_vendor_consent = new vendor_section_t(m__io, this, m__root);
}

disclosed_vendors_segment_t::~disclosed_vendors_segment_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::_clean_up() {
    if (m_vendor_consent) {
        delete m_vendor_consent; m_vendor_consent = 0;
    }
}

disclosed_vendors_segment_t::vendor_section_t::vendor_section_t(kaitai::kstream* p__io, disclosed_vendors_segment_t* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bit_field = 0;
    m_range_section = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void disclosed_vendors_segment_t::vendor_section_t::_read() {
    m_max_vendor_id = m__io->read_bits_int_be(16);
    m_is_range_encoding = m__io->read_bits_int_be(1);
    n_bit_field = true;
    if (!(is_range_encoding())) {
        n_bit_field = false;
        m_bit_field = new std::vector<bool>();
        const int l_bit_field = max_vendor_id();
        for (int i = 0; i < l_bit_field; i++) {
            m_bit_field->push_back(m__io->read_bits_int_be(1));
        }
    }
    m__io->align_to_byte();
    n_range_section = true;
    if (is_range_encoding()) {
        n_range_section = false;
        m_range_section = new range_section_t(m__io, this, m__root);
    }
}

disclosed_vendors_segment_t::vendor_section_t::~vendor_section_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::vendor_section_t::_clean_up() {
    if (!n_bit_field) {
        if (m_bit_field) {
            delete m_bit_field; m_bit_field = 0;
        }
    }
    if (!n_range_section) {
        if (m_range_section) {
            delete m_range_section; m_range_section = 0;
        }
    }
}

disclosed_vendors_segment_t::range_section_t::range_section_t(kaitai::kstream* p__io, disclosed_vendors_segment_t::vendor_section_t* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_range_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void disclosed_vendors_segment_t::range_section_t::_read() {
    m_num_entries = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    m_range_entries = new std::vector<range_entry_t*>();
    const int l_range_entries = num_entries();
    for (int i = 0; i < l_range_entries; i++) {
        m_range_entries->push_back(new range_entry_t(m__io, this, m__root));
    }
}

disclosed_vendors_segment_t::range_section_t::~range_section_t() {
    _clean_up();
}

void disclosed_vendors_segment_t::range_section_t::_clean_up() {
    if (m_range_entries) {
        for (std::vector<range_entry_t*>::iterator it = m_range_entries->begin(); it != m_range_entries->end(); ++it) {
            delete *it;
        }
        delete m_range_entries; m_range_entries = 0;
    }
}

disclosed_vendors_segment_t::range_entry_t::range_entry_t(kaitai::kstream* p__io, disclosed_vendors_segment_t::range_section_t* p__parent, disclosed_vendors_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
