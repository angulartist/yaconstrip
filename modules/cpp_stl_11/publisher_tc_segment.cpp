// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "publisher_tc_segment.h"

publisher_tc_segment_t::publisher_tc_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, publisher_tc_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_pub_purposes_consent = nullptr;
    m_pub_purposes_li_transparency = nullptr;
    m_custom_purposes_consent = nullptr;
    m_custom_purposes_li_transparency = nullptr;
    _read();
}

void publisher_tc_segment_t::_read() {
    m_segment_type = m__io->read_bits_int_be(3);
    m_pub_purposes_consent = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    const int l_pub_purposes_consent = 24;
    for (int i = 0; i < l_pub_purposes_consent; i++) {
        m_pub_purposes_consent->push_back(std::move(m__io->read_bits_int_be(1)));
    }
    m_pub_purposes_li_transparency = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    const int l_pub_purposes_li_transparency = 24;
    for (int i = 0; i < l_pub_purposes_li_transparency; i++) {
        m_pub_purposes_li_transparency->push_back(std::move(m__io->read_bits_int_be(1)));
    }
    m_num_custom_purposes = m__io->read_bits_int_be(6);
    n_custom_purposes_consent = true;
    if (num_custom_purposes() > 0) {
        n_custom_purposes_consent = false;
        m_custom_purposes_consent = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
        const int l_custom_purposes_consent = num_custom_purposes();
        for (int i = 0; i < l_custom_purposes_consent; i++) {
            m_custom_purposes_consent->push_back(std::move(m__io->read_bits_int_be(1)));
        }
    }
    n_custom_purposes_li_transparency = true;
    if (num_custom_purposes() > 0) {
        n_custom_purposes_li_transparency = false;
        m_custom_purposes_li_transparency = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
        const int l_custom_purposes_li_transparency = num_custom_purposes();
        for (int i = 0; i < l_custom_purposes_li_transparency; i++) {
            m_custom_purposes_li_transparency->push_back(std::move(m__io->read_bits_int_be(1)));
        }
    }
}

publisher_tc_segment_t::~publisher_tc_segment_t() {
    _clean_up();
}

void publisher_tc_segment_t::_clean_up() {
    if (!n_custom_purposes_consent) {
    }
    if (!n_custom_purposes_li_transparency) {
    }
}
