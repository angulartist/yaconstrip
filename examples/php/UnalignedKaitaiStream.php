<?php
// Include Kaitai Struct PHP Runtime.
require __DIR__ . '/vendor/autoload.php';

/**
 * Extends the KaitaiStream class
 * to create an unaligned stream (no bytes alignement)
 * to avoid messing with the bit stream.
 */
class UnaliagnedKataiStream extends \Kaitai\Struct\Stream
{
    public ?int $segmentType = null;

    public function __construct($_io, $_parent = null, $_root = null)
    {
        parent::__construct($_io, $_parent, $_root);
        $this->reset();
    }

    /**
     * We want an unaligned stream.
     * So we override the current
     * alignToByte method.
     */
    public function alignToByte()
    {
    }

    private function reset()
    {
        parent::alignToByte();
        $this->seek(0);
    }

    public function readSegmentType()
    {
        $this->segmentType = $this->readBitsIntBe(3);
        $this->reset();

        return $this->segmentType;
    }

    public function setSegmentType($value)
    {
        $this->segmentType = $value;
    }

    public function getSegmentType()
    {
        return $this->segmentType;
    }
}