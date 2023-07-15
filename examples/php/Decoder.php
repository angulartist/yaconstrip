<?php
require __DIR__ . '/vendor/autoload.php';

// Include the generated classes.
require __DIR__ . '/compiled-ksy/CoreStringSegment.php';
require __DIR__ . '/compiled-ksy/DisclosedVendorsSegment.php';
require __DIR__ . '/compiled-ksy/PublisherTcSegment.php';

require __DIR__ . '/UnalignedKaitaiStream.php';

function base64url_decode($data)
{
    return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT));
}

class Decoder
{
    private ?string $consentString = null;
    private array $results = [];

    public function __construct($consentString)
    {
        $this->consentString = $consentString;
        $this->results = [];
    }

    private function base64ToBitStream($segment)
    {
        $segment .= "===";
        $source = base64url_decode($segment);

        /**
         * Expected example bytes array, 1st segment:
         * 
         * [
         *      8, 251, 190, 24, 108, 143, 187, 
         *      225, 134, 200, 49, 192, 8, 1, 13,
         *      9, 144, 152, 0, 0, 0, 0, 0, 0, 0, 
         *      4, 0, 0, 0, 0, 0, 0, 0
         * ]
         */
        return new UnaliagnedKataiStream($source);
    }

    public function process()
    {
        $segments = explode('.', $this->consentString);
        $segmentsCount = count($segments);
        echo "Found $segmentsCount segments in the provided TC String. \n";

        if ($segmentsCount < 2) {
            throw new Exception("Expecting at least two segments in the TC String (Core + Publisher TC).");
        }

        return array_map(function ($segment, $index) {
            echo "Processing segment '$segment'. \n";

            $stream = $this->base64ToBitStream($segment);

            if ($index === 0) {
                // we assume that's the Core String
                // as it's always the head of the TC String
                $stream->setSegmentType(0);
            } else {
                $stream->readSegmentType();
            }

            switch ($stream->getSegmentType()) {
                case 0:
                    return new CoreStringSegment($stream);
                case 1:
                    return new DisclosedVendorsSegment($stream);
                case 2:
                    return new PublisherTcSegment($stream);
                default:
                    return [];
            }
        }, $segments, array_keys($segments));
    }
}
