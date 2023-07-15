const CoreStringSegment = require("./compiled-ksy/CoreStringSegment");
const DisclosedVendorsSegment = require("./compiled-ksy/DisclosedVendorsSegment");
const PublisherTcSegment = require("./compiled-ksy/PublisherTcSegment");

const { UnalignedKataiStream } = require("./models");

const UNDESIRED_OUTPUT_KEYS = ["_io", "_parent", "_root"];

class Decoder {
  constructor(consentString) {
    this.consentString = consentString;
    this.results = [];
  }

  base64ToBitStream(segment) {
    segment += "==="; // add padding
    const arrayBuffer = Buffer.from(segment, "base64url");

    return new UnalignedKataiStream(arrayBuffer);
  }

  removeObjectKeysDeep(obj, keys = []) {
    if (Array.isArray(obj))
      return obj.map((item) => this.removeObjectKeysDeep(item, keys));

    if (typeof obj === "object" && obj !== null) {
      return Object.keys(obj).reduce((previousValue, key) => {
        return keys.includes(key)
          ? previousValue
          : {
              ...previousValue,
              [key]: this.removeObjectKeysDeep(obj[key], keys),
            };
      }, {});
    }

    return obj;
  }

  process() {
    const segments = this.consentString.split(".");
    console.log("Found", segments.length, "segments in the provided TC String");

    if (segments.length < 2) {
      throw new Error(
        "Expecting at least two segments in the TC String (Core + Publisher TC)."
      );
    }

    return segments.map((segment, index) => {
      console.log("Processing segment", segment);

      const stream = this.base64ToBitStream(segment);

      if (index === 0) {
        // we assume that's the Core String
        // as it's always the head of the TC String
        stream.segmentType = 0;
      } else {
        stream.readSegmentType();
        // Should be impossible!
        if (stream.segmentType === 0) {
          throw new Error(
            `Duplicated Core string. Received segment type set to ${stream.segmentType}.`
          );
        }
      }

      if (
        stream.segmentType &&
        (![0, 1, 2].includes(stream.segmentType) ||
          stream.segmentType !== parseInt(stream.segmentType, 10))
      ) {
        throw new Error(
          `segmentType: Unknown segment type. Expected int in range [0, 2], Got ${stream.segmentType}.`
        );
      }

      try {
        let res = {};

        switch (stream.segmentType) {
          case 0:
            res = new CoreStringSegment(stream);
            break;
          case 1:
            res = new DisclosedVendorsSegment(stream);
            break;
          case 2:
            res = new PublisherTcSegment(stream);
            break;
          default:
            res = {};
            break;
        }

        return this.removeObjectKeysDeep(res, UNDESIRED_OUTPUT_KEYS);
      } catch (error) {
        console.error(error);
        throw new Error("Incorrect consent string format.");
      }
    });
  }
}

module.exports = {
  Decoder,
};
