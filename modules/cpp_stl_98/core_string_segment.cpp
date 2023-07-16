// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "core_string_segment.h"

core_string_segment_t::core_string_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_metadata = 0;
    m_structure = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::_read() {
    m_metadata = new metadata_t(m__io, this, m__root);
    m_structure = new structure_t(m__io, this, m__root);
}

core_string_segment_t::~core_string_segment_t() {
    _clean_up();
}

void core_string_segment_t::_clean_up() {
    if (m_metadata) {
        delete m_metadata; m_metadata = 0;
    }
    if (m_structure) {
        delete m_structure; m_structure = 0;
    }
}

core_string_segment_t::alpha_t::alpha_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::alpha_t::_read() {
    m_left = m__io->read_bits_int_be(6);
    m_right = m__io->read_bits_int_be(6);
}

core_string_segment_t::alpha_t::~alpha_t() {
    _clean_up();
}

void core_string_segment_t::alpha_t::_clean_up() {
}

core_string_segment_t::metadata_t::metadata_t(kaitai::kstream* p__io, core_string_segment_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cmp = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::metadata_t::_read() {
    m_version = m__io->read_bits_int_be(6);
    m_created = m__io->read_bits_int_be(32);
    m_created_overflow = m__io->read_bits_int_be(4);
    m_last_updated = m__io->read_bits_int_be(32);
    m_last_updated_overflow = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_cmp = new cmp_t(m__io, this, m__root);
    m_gvl_version = m__io->read_bits_int_be(12);
}

core_string_segment_t::metadata_t::~metadata_t() {
    _clean_up();
}

void core_string_segment_t::metadata_t::_clean_up() {
    if (m_cmp) {
        delete m_cmp; m_cmp = 0;
    }
}

core_string_segment_t::metadata_t::cmp_t::cmp_t(kaitai::kstream* p__io, core_string_segment_t::metadata_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_language = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::metadata_t::cmp_t::_read() {
    m_id = m__io->read_bits_int_be(12);
    m_version = m__io->read_bits_int_be(12);
    m_screen = m__io->read_bits_int_be(6);
    m__io->align_to_byte();
    m_language = new alpha_t(m__io, this, m__root);
}

core_string_segment_t::metadata_t::cmp_t::~cmp_t() {
    _clean_up();
}

void core_string_segment_t::metadata_t::cmp_t::_clean_up() {
    if (m_language) {
        delete m_language; m_language = 0;
    }
}

core_string_segment_t::structure_t::structure_t(kaitai::kstream* p__io, core_string_segment_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_special_feature_opt_ins = 0;
    m_purposes_consent = 0;
    m_purposes_li_transparency = 0;
    m_sj_disclosures = 0;
    m_vendor_consent = 0;
    m_vendor_li = 0;
    m_pub_restrictions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::structure_t::_read() {
    m_policy_version = m__io->read_bits_int_be(6);
    m_is_service_specific = m__io->read_bits_int_be(1);
    m_use_non_standard_texts = m__io->read_bits_int_be(1);
    m_special_feature_opt_ins = new std::vector<bool>();
    const int l_special_feature_opt_ins = 12;
    for (int i = 0; i < l_special_feature_opt_ins; i++) {
        m_special_feature_opt_ins->push_back(m__io->read_bits_int_be(1));
    }
    m_purposes_consent = new std::vector<bool>();
    const int l_purposes_consent = 24;
    for (int i = 0; i < l_purposes_consent; i++) {
        m_purposes_consent->push_back(m__io->read_bits_int_be(1));
    }
    m_purposes_li_transparency = new std::vector<bool>();
    const int l_purposes_li_transparency = 24;
    for (int i = 0; i < l_purposes_li_transparency; i++) {
        m_purposes_li_transparency->push_back(m__io->read_bits_int_be(1));
    }
    m__io->align_to_byte();
    m_sj_disclosures = new sj_disclosures_t(m__io, this, m__root);
    m_vendor_consent = new vendor_section_t(m__io, this, m__root);
    m_vendor_li = new vendor_section_t(m__io, this, m__root);
    m_pub_restrictions = new pub_restrictions_section_t(m__io, this, m__root);
}

core_string_segment_t::structure_t::~structure_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::_clean_up() {
    if (m_special_feature_opt_ins) {
        delete m_special_feature_opt_ins; m_special_feature_opt_ins = 0;
    }
    if (m_purposes_consent) {
        delete m_purposes_consent; m_purposes_consent = 0;
    }
    if (m_purposes_li_transparency) {
        delete m_purposes_li_transparency; m_purposes_li_transparency = 0;
    }
    if (m_sj_disclosures) {
        delete m_sj_disclosures; m_sj_disclosures = 0;
    }
    if (m_vendor_consent) {
        delete m_vendor_consent; m_vendor_consent = 0;
    }
    if (m_vendor_li) {
        delete m_vendor_li; m_vendor_li = 0;
    }
    if (m_pub_restrictions) {
        delete m_pub_restrictions; m_pub_restrictions = 0;
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restrictions_section_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pub_restriction_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::_read() {
    m_num_pub_restrictions = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    n_pub_restriction_entries = true;
    if (num_pub_restrictions() > 0) {
        n_pub_restriction_entries = false;
        m_pub_restriction_entries = new std::vector<pub_restriction_entry_t*>();
        const int l_pub_restriction_entries = num_pub_restrictions();
        for (int i = 0; i < l_pub_restriction_entries; i++) {
            m_pub_restriction_entries->push_back(new pub_restriction_entry_t(m__io, this, m__root));
        }
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::~pub_restrictions_section_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::_clean_up() {
    if (!n_pub_restriction_entries) {
        if (m_pub_restriction_entries) {
            for (std::vector<pub_restriction_entry_t*>::iterator it = m_pub_restriction_entries->begin(); it != m_pub_restriction_entries->end(); ++it) {
                delete *it;
            }
            delete m_pub_restriction_entries; m_pub_restriction_entries = 0;
        }
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::pub_restriction_entry_t(kaitai::kstream* p__io, core_string_segment_t::structure_t::pub_restrictions_section_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_range_section = 0;
    m_range_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::_read() {
    m_purpose_id = m__io->read_bits_int_be(6);
    m_restriction_type = m__io->read_bits_int_be(2);
    m__io->align_to_byte();
    m_range_section = new range_section_t(m__io, this, m__root);
    m_num_entries = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    m_range_entries = new std::vector<range_entry_t*>();
    const int l_range_entries = num_entries();
    for (int i = 0; i < l_range_entries; i++) {
        m_range_entries->push_back(new range_entry_t(m__io, this, m__root));
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::~pub_restriction_entry_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::_clean_up() {
    if (m_range_section) {
        delete m_range_section; m_range_section = 0;
    }
    if (m_range_entries) {
        for (std::vector<range_entry_t*>::iterator it = m_range_entries->begin(); it != m_range_entries->end(); ++it) {
            delete *it;
        }
        delete m_range_entries; m_range_entries = 0;
    }
}

core_string_segment_t::structure_t::vendor_section_t::vendor_section_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
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

void core_string_segment_t::structure_t::vendor_section_t::_read() {
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

core_string_segment_t::structure_t::vendor_section_t::~vendor_section_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::vendor_section_t::_clean_up() {
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

core_string_segment_t::structure_t::range_section_t::range_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
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

void core_string_segment_t::structure_t::range_section_t::_read() {
    m_num_entries = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    m_range_entries = new std::vector<range_entry_t*>();
    const int l_range_entries = num_entries();
    for (int i = 0; i < l_range_entries; i++) {
        m_range_entries->push_back(new range_entry_t(m__io, this, m__root));
    }
}

core_string_segment_t::structure_t::range_section_t::~range_section_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::range_section_t::_clean_up() {
    if (m_range_entries) {
        for (std::vector<range_entry_t*>::iterator it = m_range_entries->begin(); it != m_range_entries->end(); ++it) {
            delete *it;
        }
        delete m_range_entries; m_range_entries = 0;
    }
}

core_string_segment_t::structure_t::sj_disclosures_t::sj_disclosures_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pub_country = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::structure_t::sj_disclosures_t::_read() {
    m_purpose_one_treatment = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_pub_country = new alpha_t(m__io, this, m__root);
}

core_string_segment_t::structure_t::sj_disclosures_t::~sj_disclosures_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::sj_disclosures_t::_clean_up() {
    if (m_pub_country) {
        delete m_pub_country; m_pub_country = 0;
    }
}

core_string_segment_t::structure_t::range_entry_t::range_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void core_string_segment_t::structure_t::range_entry_t::_read() {
    m_is_a_range = m__io->read_bits_int_be(1);
    m_start_or_only_vendor_id = m__io->read_bits_int_be(16);
    n_end_vendor_id = true;
    if (is_a_range()) {
        n_end_vendor_id = false;
        m_end_vendor_id = m__io->read_bits_int_be(16);
    }
}

core_string_segment_t::structure_t::range_entry_t::~range_entry_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::range_entry_t::_clean_up() {
    if (!n_end_vendor_id) {
    }
}
