// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "core_string_segment.h"

core_string_segment_t::core_string_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_metadata = nullptr;
    m_structure = nullptr;
    _read();
}

void core_string_segment_t::_read() {
    m_metadata = std::unique_ptr<metadata_t>(new metadata_t(m__io, this, m__root));
    m_structure = std::unique_ptr<structure_t>(new structure_t(m__io, this, m__root));
}

core_string_segment_t::~core_string_segment_t() {
    _clean_up();
}

void core_string_segment_t::_clean_up() {
}

core_string_segment_t::alpha_t::alpha_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_cmp = nullptr;
    _read();
}

void core_string_segment_t::metadata_t::_read() {
    m_version = m__io->read_bits_int_be(6);
    m_created = m__io->read_bits_int_be(32);
    m_created_overflow = m__io->read_bits_int_be(4);
    m_last_updated = m__io->read_bits_int_be(32);
    m_last_updated_overflow = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_cmp = std::unique_ptr<cmp_t>(new cmp_t(m__io, this, m__root));
    m_gvl_version = m__io->read_bits_int_be(12);
}

core_string_segment_t::metadata_t::~metadata_t() {
    _clean_up();
}

void core_string_segment_t::metadata_t::_clean_up() {
}

core_string_segment_t::metadata_t::cmp_t::cmp_t(kaitai::kstream* p__io, core_string_segment_t::metadata_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_language = nullptr;
    _read();
}

void core_string_segment_t::metadata_t::cmp_t::_read() {
    m_id = m__io->read_bits_int_be(12);
    m_version = m__io->read_bits_int_be(12);
    m_screen = m__io->read_bits_int_be(6);
    m__io->align_to_byte();
    m_language = std::unique_ptr<alpha_t>(new alpha_t(m__io, this, m__root));
}

core_string_segment_t::metadata_t::cmp_t::~cmp_t() {
    _clean_up();
}

void core_string_segment_t::metadata_t::cmp_t::_clean_up() {
}

core_string_segment_t::structure_t::structure_t(kaitai::kstream* p__io, core_string_segment_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_special_feature_opt_ins = nullptr;
    m_purposes_consent = nullptr;
    m_purposes_li_transparency = nullptr;
    m_sj_disclosures = nullptr;
    m_vendor_consent = nullptr;
    m_vendor_li = nullptr;
    m_pub_restrictions = nullptr;
    _read();
}

void core_string_segment_t::structure_t::_read() {
    m_policy_version = m__io->read_bits_int_be(6);
    m_is_service_specific = m__io->read_bits_int_be(1);
    m_use_non_standard_texts = m__io->read_bits_int_be(1);
    m_special_feature_opt_ins = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    const int l_special_feature_opt_ins = 12;
    for (int i = 0; i < l_special_feature_opt_ins; i++) {
        m_special_feature_opt_ins->push_back(std::move(m__io->read_bits_int_be(1)));
    }
    m_purposes_consent = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    const int l_purposes_consent = 24;
    for (int i = 0; i < l_purposes_consent; i++) {
        m_purposes_consent->push_back(std::move(m__io->read_bits_int_be(1)));
    }
    m_purposes_li_transparency = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    const int l_purposes_li_transparency = 24;
    for (int i = 0; i < l_purposes_li_transparency; i++) {
        m_purposes_li_transparency->push_back(std::move(m__io->read_bits_int_be(1)));
    }
    m__io->align_to_byte();
    m_sj_disclosures = std::unique_ptr<sj_disclosures_t>(new sj_disclosures_t(m__io, this, m__root));
    m_vendor_consent = std::unique_ptr<vendor_section_t>(new vendor_section_t(m__io, this, m__root));
    m_vendor_li = std::unique_ptr<vendor_section_t>(new vendor_section_t(m__io, this, m__root));
    m_pub_restrictions = std::unique_ptr<pub_restrictions_section_t>(new pub_restrictions_section_t(m__io, this, m__root));
}

core_string_segment_t::structure_t::~structure_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::_clean_up() {
}

core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restrictions_section_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pub_restriction_entries = nullptr;
    _read();
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::_read() {
    m_num_pub_restrictions = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    n_pub_restriction_entries = true;
    if (num_pub_restrictions() > 0) {
        n_pub_restriction_entries = false;
        m_pub_restriction_entries = std::unique_ptr<std::vector<std::unique_ptr<pub_restriction_entry_t>>>(new std::vector<std::unique_ptr<pub_restriction_entry_t>>());
        const int l_pub_restriction_entries = num_pub_restrictions();
        for (int i = 0; i < l_pub_restriction_entries; i++) {
            m_pub_restriction_entries->push_back(std::move(std::unique_ptr<pub_restriction_entry_t>(new pub_restriction_entry_t(m__io, this, m__root))));
        }
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::~pub_restrictions_section_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::_clean_up() {
    if (!n_pub_restriction_entries) {
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::pub_restriction_entry_t(kaitai::kstream* p__io, core_string_segment_t::structure_t::pub_restrictions_section_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_range_section = nullptr;
    m_range_entries = nullptr;
    _read();
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::_read() {
    m_purpose_id = m__io->read_bits_int_be(6);
    m_restriction_type = m__io->read_bits_int_be(2);
    m__io->align_to_byte();
    m_range_section = std::unique_ptr<range_section_t>(new range_section_t(m__io, this, m__root));
    m_num_entries = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    m_range_entries = std::unique_ptr<std::vector<std::unique_ptr<range_entry_t>>>(new std::vector<std::unique_ptr<range_entry_t>>());
    const int l_range_entries = num_entries();
    for (int i = 0; i < l_range_entries; i++) {
        m_range_entries->push_back(std::move(std::unique_ptr<range_entry_t>(new range_entry_t(m__io, this, m__root))));
    }
}

core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::~pub_restriction_entry_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::pub_restrictions_section_t::pub_restriction_entry_t::_clean_up() {
}

core_string_segment_t::structure_t::vendor_section_t::vendor_section_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bit_field = nullptr;
    m_range_section = nullptr;
    _read();
}

void core_string_segment_t::structure_t::vendor_section_t::_read() {
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

core_string_segment_t::structure_t::vendor_section_t::~vendor_section_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::vendor_section_t::_clean_up() {
    if (!n_bit_field) {
    }
    if (!n_range_section) {
    }
}

core_string_segment_t::structure_t::range_section_t::range_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_range_entries = nullptr;
    _read();
}

void core_string_segment_t::structure_t::range_section_t::_read() {
    m_num_entries = m__io->read_bits_int_be(12);
    m__io->align_to_byte();
    m_range_entries = std::unique_ptr<std::vector<std::unique_ptr<range_entry_t>>>(new std::vector<std::unique_ptr<range_entry_t>>());
    const int l_range_entries = num_entries();
    for (int i = 0; i < l_range_entries; i++) {
        m_range_entries->push_back(std::move(std::unique_ptr<range_entry_t>(new range_entry_t(m__io, this, m__root))));
    }
}

core_string_segment_t::structure_t::range_section_t::~range_section_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::range_section_t::_clean_up() {
}

core_string_segment_t::structure_t::sj_disclosures_t::sj_disclosures_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pub_country = nullptr;
    _read();
}

void core_string_segment_t::structure_t::sj_disclosures_t::_read() {
    m_purpose_one_treatment = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_pub_country = std::unique_ptr<alpha_t>(new alpha_t(m__io, this, m__root));
}

core_string_segment_t::structure_t::sj_disclosures_t::~sj_disclosures_t() {
    _clean_up();
}

void core_string_segment_t::structure_t::sj_disclosures_t::_clean_up() {
}

core_string_segment_t::structure_t::range_entry_t::range_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, core_string_segment_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
