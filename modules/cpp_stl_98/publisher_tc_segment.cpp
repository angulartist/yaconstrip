// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "publisher_tc_segment.h"

publisher_tc_segment_t::publisher_tc_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, publisher_tc_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_pub_purposes_consent = 0;
    m_pub_purposes_li_transparency = 0;
    m_custom_purposes_consent = 0;
    m_custom_purposes_li_transparency = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void publisher_tc_segment_t::_read() {
    m_segment_type = m__io->read_bits_int_be(3);
    m_pub_purposes_consent = new std::vector<bool>();
    const int l_pub_purposes_consent = 24;
    for (int i = 0; i < l_pub_purposes_consent; i++) {
        m_pub_purposes_consent->push_back(m__io->read_bits_int_be(1));
    }
    m_pub_purposes_li_transparency = new std::vector<bool>();
    const int l_pub_purposes_li_transparency = 24;
    for (int i = 0; i < l_pub_purposes_li_transparency; i++) {
        m_pub_purposes_li_transparency->push_back(m__io->read_bits_int_be(1));
    }
    m_num_custom_purposes = m__io->read_bits_int_be(6);
    n_custom_purposes_consent = true;
    if (num_custom_purposes() > 0) {
        n_custom_purposes_consent = false;
        m_custom_purposes_consent = new std::vector<bool>();
        const int l_custom_purposes_consent = num_custom_purposes();
        for (int i = 0; i < l_custom_purposes_consent; i++) {
            m_custom_purposes_consent->push_back(m__io->read_bits_int_be(1));
        }
    }
    n_custom_purposes_li_transparency = true;
    if (num_custom_purposes() > 0) {
        n_custom_purposes_li_transparency = false;
        m_custom_purposes_li_transparency = new std::vector<bool>();
        const int l_custom_purposes_li_transparency = num_custom_purposes();
        for (int i = 0; i < l_custom_purposes_li_transparency; i++) {
            m_custom_purposes_li_transparency->push_back(m__io->read_bits_int_be(1));
        }
    }
}

publisher_tc_segment_t::~publisher_tc_segment_t() {
    _clean_up();
}

void publisher_tc_segment_t::_clean_up() {
    if (m_pub_purposes_consent) {
        delete m_pub_purposes_consent; m_pub_purposes_consent = 0;
    }
    if (m_pub_purposes_li_transparency) {
        delete m_pub_purposes_li_transparency; m_pub_purposes_li_transparency = 0;
    }
    if (!n_custom_purposes_consent) {
        if (m_custom_purposes_consent) {
            delete m_custom_purposes_consent; m_custom_purposes_consent = 0;
        }
    }
    if (!n_custom_purposes_li_transparency) {
        if (m_custom_purposes_li_transparency) {
            delete m_custom_purposes_li_transparency; m_custom_purposes_li_transparency = 0;
        }
    }
}
