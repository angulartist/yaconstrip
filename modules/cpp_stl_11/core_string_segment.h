#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class core_string_segment_t : public kaitai::kstruct {

public:
    class alpha_t;
    class metadata_t;
    class structure_t;

    core_string_segment_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~core_string_segment_t();

    class alpha_t : public kaitai::kstruct {

    public:

        alpha_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~alpha_t();

    private:
        uint64_t m_left;
        uint64_t m_right;
        core_string_segment_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint64_t left() const { return m_left; }
        uint64_t right() const { return m_right; }
        core_string_segment_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * TC Consent Management Platform
     */

    class metadata_t : public kaitai::kstruct {

    public:
        class cmp_t;

        metadata_t(kaitai::kstream* p__io, core_string_segment_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~metadata_t();

        /**
         * Consent Management Platform
         */

        class cmp_t : public kaitai::kstruct {

        public:

            cmp_t(kaitai::kstream* p__io, core_string_segment_t::metadata_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~cmp_t();

        private:
            uint64_t m_id;
            uint64_t m_version;
            uint64_t m_screen;
            std::unique_ptr<alpha_t> m_language;
            core_string_segment_t* m__root;
            core_string_segment_t::metadata_t* m__parent;

        public:
            uint64_t id() const { return m_id; }
            uint64_t version() const { return m_version; }
            uint64_t screen() const { return m_screen; }

            /**
             * ISO 3166-1 alpha-2 code used identify a country or a language
             */
            alpha_t* language() const { return m_language.get(); }
            core_string_segment_t* _root() const { return m__root; }
            core_string_segment_t::metadata_t* _parent() const { return m__parent; }
        };

    private:
        uint64_t m_version;
        uint64_t m_created;
        uint64_t m_created_overflow;
        uint64_t m_last_updated;
        uint64_t m_last_updated_overflow;
        std::unique_ptr<cmp_t> m_cmp;
        uint64_t m_gvl_version;
        core_string_segment_t* m__root;
        core_string_segment_t* m__parent;

    public:

        /**
         * Supported version is above 2 (TCF 2.O)
         */
        uint64_t version() const { return m_version; }

        /**
         * Timestamp
         */
        uint64_t created() const { return m_created; }

        /**
         * Timestamp
         */
        uint64_t created_overflow() const { return m_created_overflow; }

        /**
         * Timestamp
         */
        uint64_t last_updated() const { return m_last_updated; }

        /**
         * Timestamp
         */
        uint64_t last_updated_overflow() const { return m_last_updated_overflow; }
        cmp_t* cmp() const { return m_cmp.get(); }

        /**
         * Global Vendor List version
         */
        uint64_t gvl_version() const { return m_gvl_version; }
        core_string_segment_t* _root() const { return m__root; }
        core_string_segment_t* _parent() const { return m__parent; }
    };

    class structure_t : public kaitai::kstruct {

    public:
        class pub_restrictions_section_t;
        class vendor_section_t;
        class range_section_t;
        class sj_disclosures_t;
        class range_entry_t;

        structure_t(kaitai::kstream* p__io, core_string_segment_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~structure_t();

        class pub_restrictions_section_t : public kaitai::kstruct {

        public:
            class pub_restriction_entry_t;

            pub_restrictions_section_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~pub_restrictions_section_t();

            class pub_restriction_entry_t : public kaitai::kstruct {

            public:

                pub_restriction_entry_t(kaitai::kstream* p__io, core_string_segment_t::structure_t::pub_restrictions_section_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~pub_restriction_entry_t();

            private:
                uint64_t m_purpose_id;
                uint64_t m_restriction_type;
                std::unique_ptr<range_section_t> m_range_section;
                uint64_t m_num_entries;
                std::unique_ptr<std::vector<std::unique_ptr<range_entry_t>>> m_range_entries;
                core_string_segment_t* m__root;
                core_string_segment_t::structure_t::pub_restrictions_section_t* m__parent;

            public:
                uint64_t purpose_id() const { return m_purpose_id; }
                uint64_t restriction_type() const { return m_restriction_type; }
                range_section_t* range_section() const { return m_range_section.get(); }
                uint64_t num_entries() const { return m_num_entries; }
                std::vector<std::unique_ptr<range_entry_t>>* range_entries() const { return m_range_entries.get(); }
                core_string_segment_t* _root() const { return m__root; }
                core_string_segment_t::structure_t::pub_restrictions_section_t* _parent() const { return m__parent; }
            };

        private:
            uint64_t m_num_pub_restrictions;
            std::unique_ptr<std::vector<std::unique_ptr<pub_restriction_entry_t>>> m_pub_restriction_entries;
            bool n_pub_restriction_entries;

        public:
            bool _is_null_pub_restriction_entries() { pub_restriction_entries(); return n_pub_restriction_entries; };

        private:
            core_string_segment_t* m__root;
            core_string_segment_t::structure_t* m__parent;

        public:
            uint64_t num_pub_restrictions() const { return m_num_pub_restrictions; }
            std::vector<std::unique_ptr<pub_restriction_entry_t>>* pub_restriction_entries() const { return m_pub_restriction_entries.get(); }
            core_string_segment_t* _root() const { return m__root; }
            core_string_segment_t::structure_t* _parent() const { return m__parent; }
        };

        class vendor_section_t : public kaitai::kstruct {

        public:

            vendor_section_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~vendor_section_t();

        private:
            uint64_t m_max_vendor_id;
            bool m_is_range_encoding;
            std::unique_ptr<std::vector<bool>> m_bit_field;
            bool n_bit_field;

        public:
            bool _is_null_bit_field() { bit_field(); return n_bit_field; };

        private:
            std::unique_ptr<range_section_t> m_range_section;
            bool n_range_section;

        public:
            bool _is_null_range_section() { range_section(); return n_range_section; };

        private:
            core_string_segment_t* m__root;
            core_string_segment_t::structure_t* m__parent;

        public:
            uint64_t max_vendor_id() const { return m_max_vendor_id; }
            bool is_range_encoding() const { return m_is_range_encoding; }
            std::vector<bool>* bit_field() const { return m_bit_field.get(); }
            range_section_t* range_section() const { return m_range_section.get(); }
            core_string_segment_t* _root() const { return m__root; }
            core_string_segment_t::structure_t* _parent() const { return m__parent; }
        };

        class range_section_t : public kaitai::kstruct {

        public:

            range_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~range_section_t();

        private:
            uint64_t m_num_entries;
            std::unique_ptr<std::vector<std::unique_ptr<range_entry_t>>> m_range_entries;
            core_string_segment_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint64_t num_entries() const { return m_num_entries; }
            std::vector<std::unique_ptr<range_entry_t>>* range_entries() const { return m_range_entries.get(); }
            core_string_segment_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        /**
         * Specific Jurisdiction Disclosures
         */

        class sj_disclosures_t : public kaitai::kstruct {

        public:

            sj_disclosures_t(kaitai::kstream* p__io, core_string_segment_t::structure_t* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~sj_disclosures_t();

        private:
            bool m_purpose_one_treatment;
            std::unique_ptr<alpha_t> m_pub_country;
            core_string_segment_t* m__root;
            core_string_segment_t::structure_t* m__parent;

        public:
            bool purpose_one_treatment() const { return m_purpose_one_treatment; }

            /**
             * Publisher Country Code
             */
            alpha_t* pub_country() const { return m_pub_country.get(); }
            core_string_segment_t* _root() const { return m__root; }
            core_string_segment_t::structure_t* _parent() const { return m__parent; }
        };

        class range_entry_t : public kaitai::kstruct {

        public:

            range_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, core_string_segment_t* p__root = nullptr);

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
            core_string_segment_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            bool is_a_range() const { return m_is_a_range; }
            uint64_t start_or_only_vendor_id() const { return m_start_or_only_vendor_id; }
            uint64_t end_vendor_id() const { return m_end_vendor_id; }
            core_string_segment_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

    private:
        uint64_t m_policy_version;
        bool m_is_service_specific;
        bool m_use_non_standard_texts;
        std::unique_ptr<std::vector<bool>> m_special_feature_opt_ins;
        std::unique_ptr<std::vector<bool>> m_purposes_consent;
        std::unique_ptr<std::vector<bool>> m_purposes_li_transparency;
        std::unique_ptr<sj_disclosures_t> m_sj_disclosures;
        std::unique_ptr<vendor_section_t> m_vendor_consent;
        std::unique_ptr<vendor_section_t> m_vendor_li;
        std::unique_ptr<pub_restrictions_section_t> m_pub_restrictions;
        core_string_segment_t* m__root;
        core_string_segment_t* m__parent;

    public:
        uint64_t policy_version() const { return m_policy_version; }
        bool is_service_specific() const { return m_is_service_specific; }
        bool use_non_standard_texts() const { return m_use_non_standard_texts; }
        std::vector<bool>* special_feature_opt_ins() const { return m_special_feature_opt_ins.get(); }
        std::vector<bool>* purposes_consent() const { return m_purposes_consent.get(); }
        std::vector<bool>* purposes_li_transparency() const { return m_purposes_li_transparency.get(); }

        /**
         * Specific Jurisdiction Disclosures
         */
        sj_disclosures_t* sj_disclosures() const { return m_sj_disclosures.get(); }
        vendor_section_t* vendor_consent() const { return m_vendor_consent.get(); }
        vendor_section_t* vendor_li() const { return m_vendor_li.get(); }
        pub_restrictions_section_t* pub_restrictions() const { return m_pub_restrictions.get(); }
        core_string_segment_t* _root() const { return m__root; }
        core_string_segment_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<metadata_t> m_metadata;
    std::unique_ptr<structure_t> m_structure;
    core_string_segment_t* m__root;
    kaitai::kstruct* m__parent;

public:
    metadata_t* metadata() const { return m_metadata.get(); }
    structure_t* structure() const { return m_structure.get(); }
    core_string_segment_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
