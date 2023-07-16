#ifndef DISCLOSED_VENDORS_SEGMENT_H_
#define DISCLOSED_VENDORS_SEGMENT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class disclosed_vendors_segment_t : public kaitai::kstruct {

public:
    class vendor_section_t;
    class range_section_t;
    class range_entry_t;

    disclosed_vendors_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, disclosed_vendors_segment_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~disclosed_vendors_segment_t();

    class vendor_section_t : public kaitai::kstruct {

    public:

        vendor_section_t(kaitai::kstream* p__io, disclosed_vendors_segment_t* p__parent = 0, disclosed_vendors_segment_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~vendor_section_t();

    private:
        uint64_t m_max_vendor_id;
        bool m_is_range_encoding;
        std::vector<bool>* m_bit_field;
        bool n_bit_field;

    public:
        bool _is_null_bit_field() { bit_field(); return n_bit_field; };

    private:
        range_section_t* m_range_section;
        bool n_range_section;

    public:
        bool _is_null_range_section() { range_section(); return n_range_section; };

    private:
        disclosed_vendors_segment_t* m__root;
        disclosed_vendors_segment_t* m__parent;

    public:
        uint64_t max_vendor_id() const { return m_max_vendor_id; }
        bool is_range_encoding() const { return m_is_range_encoding; }
        std::vector<bool>* bit_field() const { return m_bit_field; }
        range_section_t* range_section() const { return m_range_section; }
        disclosed_vendors_segment_t* _root() const { return m__root; }
        disclosed_vendors_segment_t* _parent() const { return m__parent; }
    };

    class range_section_t : public kaitai::kstruct {

    public:

        range_section_t(kaitai::kstream* p__io, disclosed_vendors_segment_t::vendor_section_t* p__parent = 0, disclosed_vendors_segment_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~range_section_t();

    private:
        uint64_t m_num_entries;
        std::vector<range_entry_t*>* m_range_entries;
        disclosed_vendors_segment_t* m__root;
        disclosed_vendors_segment_t::vendor_section_t* m__parent;

    public:
        uint64_t num_entries() const { return m_num_entries; }
        std::vector<range_entry_t*>* range_entries() const { return m_range_entries; }
        disclosed_vendors_segment_t* _root() const { return m__root; }
        disclosed_vendors_segment_t::vendor_section_t* _parent() const { return m__parent; }
    };

    class range_entry_t : public kaitai::kstruct {

    public:

        range_entry_t(kaitai::kstream* p__io, disclosed_vendors_segment_t::range_section_t* p__parent = 0, disclosed_vendors_segment_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~range_entry_t();

    private:
        bool m_is_a_range;
        uint64_t m_start_or_only_vendor_id;
        uint64_t m_end_vendor_id;
        bool n_end_vendor_id;

    public:
        bool _is_null_end_vendor_id() { end_vendor_id(); return n_end_vendor_id; };

    private:
        disclosed_vendors_segment_t* m__root;
        disclosed_vendors_segment_t::range_section_t* m__parent;

    public:
        bool is_a_range() const { return m_is_a_range; }
        uint64_t start_or_only_vendor_id() const { return m_start_or_only_vendor_id; }
        uint64_t end_vendor_id() const { return m_end_vendor_id; }
        disclosed_vendors_segment_t* _root() const { return m__root; }
        disclosed_vendors_segment_t::range_section_t* _parent() const { return m__parent; }
    };

private:
    uint64_t m_segment_type;
    vendor_section_t* m_vendor_consent;
    disclosed_vendors_segment_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uint64_t segment_type() const { return m_segment_type; }
    vendor_section_t* vendor_consent() const { return m_vendor_consent; }
    disclosed_vendors_segment_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // DISCLOSED_VENDORS_SEGMENT_H_
