import base64

from kaitaistruct import BytesIO

from compiled_ksy.core_string_segment import CoreStringSegment
from compiled_ksy.disclosed_vendors_segment import DisclosedVendorsSegment
from compiled_ksy.publisher_tc_segment import PublisherTcSegment
from models import (
    UnalignedStream,
)

class Decoder:
    def __init__(self, consent_string: str):
        self.consent_string: str = consent_string
        self.results = []

    @staticmethod
    def base64_to_stream(segment: str) -> UnalignedStream:
        encoded = (segment + "===").encode()
        print(list(encoded))
        source = BytesIO(base64.urlsafe_b64decode(encoded))
        print('segment', segment, 'buffer', list(source.getvalue()))

        return UnalignedStream(source)

    def obj_to_dict(self, obj):
        if not hasattr(obj, "__dict__"):
            return obj
        result = {}
        for key, val in obj.__dict__.items():
            if key.startswith("_"):
                continue
            element = []
            if isinstance(val, list):
                for item in val:
                    element.append(self.obj_to_dict(item))
            else:
                element = self.obj_to_dict(val)
            result[key] = element
        return result

    def process(self):
        segments = self.consent_string.split(".")

        for segment in segments:
            stream = self.base64_to_stream(segment)
            segment_type = stream.segment_type

            if not isinstance(segment_type, int) and segment_type not in {0, 1, 2}:
                raise ValueError(
                    f"segment_type: Unknown segment type. Expected int in range [0, 2], Got {stream.segment_type}."
                )

            try:
                obj = {
                    0: CoreStringSegment,
                    1: DisclosedVendorsSegment,
                    2: PublisherTcSegment
                }[segment_type](stream)

            except Exception:
                raise Exception('Incorrect consent string format.')
            else:
                self.results.append(self.obj_to_dict(obj))

        return self.results