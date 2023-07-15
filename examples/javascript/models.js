const KaitaiStream = require("kaitai-struct/KaitaiStream");

/**
 * Extends the KaitaiStream class
 * to create an unaligned stream (no bytes alignement)
 * to avoid messing with the bit stream.
 */
class UnalignedKataiStream extends KaitaiStream {
  segmentType = null;

  constructor(arrayBuffer, byteOffset) {
    super(arrayBuffer, byteOffset);
    // Important.
    // As we override the alignToByte() method,
    // make sure that we align to byte as the instanciation.
    this.reset();
  }

  /**
   * We want an unaligned stream.
   * So we override the current
   * alignToByte method.
   */
  alignToByte() {}

  /**
   * Used to reset the stream.
   */
  reset() {
    this.bits = 0;
    this.bitsLeft = 0;
    this.seek(0);
  }

  /**
   * Read the next N (3) bits int,
   * in order to determine the segment type
   * of the current TC String.
   * @returns The segment type of the current TC String segment.
   */
  readSegmentType() {
    this.segmentType = this.readBitsIntBe(3);
    this.reset();

    return this.segmentType;
  }

  get segmentType() {
    return this.segmentType;
  }

  set segmentType(value) {
    this.segmentType = value;
  }
}

module.exports = {
  UnalignedKataiStream,
};
