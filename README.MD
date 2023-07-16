# YACONSTRIP - Yet Another CONsent STRIng Parser

![YACONSTRIP](docs/header.png)

Q:What?
A: IAB TCF Consent String Parser, yeah... another one, but it works, in multiple languages.

Q:Why? 
A: Many of the existing TC String parsers are abandonned projects, or they do not comply
with the latest IAB TCF specifications. When the specification changes, you can make sure that
99% of the repos are outdated and it takes months, years or never to have them updated.

Instead, let's create a single source of truth, and generate parsers in many languages to make TC String parsing universal.


## Key Features 🎯
- **One ring... to rule them all**: One code, many languages:
    - C++/STL
    - C#
    - Go 
    - Java
    - JavaScript
    - Lua
    - Nim 
    - Perl
    - PHP
    - Python
    - Ruby
- **Easy to maintain**: IAB updated their guidelines? No problem, update the _.ksy_ definition files then use the compiler to re-build the modules.


## Roadmap 🎯
- Add encoding examples
- Add more examples
- Provide plug n play modules

## Getting Started 🚀

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites 📋

Ensure you have the following installed:
- Python 3
- [Kaitai Struct Compiler](https://kaitai.io/#download)

Optionally, you might want the [Kaitai Struct Visualizer](https://github.com/kaitai-io/kaitai_struct_visualizer)

### Installation Steps 💽

Step 1: Clone this repository:

```bash
git clone https://github.com/angulartist/yaconstrip.git && cd yaconstrip
```

Step 2: Install the dependencies:

```bash
pip install -r requirements.txt
```

### Compile the .ksy files

```bash
kaitai-struct-compiler --outdir [path/to/output/dir] -t [language] [path/to/.ksy/files]

# Example (Compile .ksy for Javascript)
kaitai-struct-compiler --outdir examples/javascript/compiled_ksy -t javascript kaitai/*
```

## Examples ✨

You can find some inspirations in the [examples](examples/) folder.

## Contributors ✨

Thanks go to these wonderful people:
<a href="https://github.com/angulartist/yaconstrip/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=angulartist/yaconstrip" />
</a>

## Contribute 🤝

Got a pull request? Open it, and we'll review it as soon as possible.

- [Open Issues](https://github.com/angulartist/yaconstrip/issues)
- [Open Pull Requests](https://github.com/angulartist/yaconstrip/pulls)

## Resources 📋

- IAB TCF DOC : [Official IAB TCF Consent String Documentation](https://github.com/InteractiveAdvertisingBureau/GDPR-Transparency-and-Consent-Framework/blob/master/TCFv2/IAB%20Tech%20Lab%20-%20Consent%20string%20and%20vendor%20list%20formats%20v2.md)
- About Kaitai Struct : https://kaitai.io/

