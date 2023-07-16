#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class publisher_tc_segment_t : public kaitai::kstruct {

public:

    publisher_tc_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, publisher_tc_segment_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~publisher_tc_segment_t();

private:
    uint64_t m_segment_type;
    std::unique_ptr<std::vector<bool>> m_pub_purposes_consent;
    std::unique_ptr<std::vector<bool>> m_pub_purposes_li_transparency;
    uint64_t m_num_custom_purposes;
    std::unique_ptr<std::vector<bool>> m_custom_purposes_consent;
    bool n_custom_purposes_consent;

public:
    bool _is_null_custom_purposes_consent() { custom_purposes_consent(); return n_custom_purposes_consent; };

private:
    std::unique_ptr<std::vector<bool>> m_custom_purposes_li_transparency;
    bool n_custom_purposes_li_transparency;

public:
    bool _is_null_custom_purposes_li_transparency() { custom_purposes_li_transparency(); return n_custom_purposes_li_transparency; };

private:
    publisher_tc_segment_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint64_t segment_type() const { return m_segment_type; }
    std::vector<bool>* pub_purposes_consent() const { return m_pub_purposes_consent.get(); }
    std::vector<bool>* pub_purposes_li_transparency() const { return m_pub_purposes_li_transparency.get(); }
    uint64_t num_custom_purposes() const { return m_num_custom_purposes; }
    std::vector<bool>* custom_purposes_consent() const { return m_custom_purposes_consent.get(); }
    std::vector<bool>* custom_purposes_li_transparency() const { return m_custom_purposes_li_transparency.get(); }
    publisher_tc_segment_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
