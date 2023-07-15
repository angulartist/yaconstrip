const CoreStringSegment = require("./compiled-ksy/CoreStringSegment");
const DisclosedVendorsSegment = require("./compiled-ksy/DisclosedVendorsSegment");
const PublisherTcSegment = require("./compiled-ksy/PublisherTcSegment");

const { UnalignedKataiStream } = require("./models");

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
        switch (stream.segmentType) {
          case 0:
            return new CoreStringSegment(stream);
          case 1:
            return new DisclosedVendorsSegment(stream);
          case 2:
            return new PublisherTcSegment(stream);
          default:
            return {};
        }
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
