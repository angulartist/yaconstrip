<?php
require __DIR__ . '/vendor/autoload.php';

require __DIR__ . '/Decoder.php';

$cs = 'CPu-GGyPu-GGyDHACAENCZCYAAAAAAAAAAQAAAAAAAAA.II7Nd_X__bX9n-_7_6ft0eY1f9_r37uQzDhfNs-8F3L_W_LwX32E7NF36tq4KmR4ku1bBIQNtHMnUDUmxaolVrzHsak2cpyNKJ_JkknsZe2dYGF9Pn9lD-YKZ7_5_9_f52T_9_9_-39z3_9f___dv_-__-vjf_599n_v9fV_78_Kf9______-____________8A';

$decoder = new Decoder($cs);
$decodedConsentStringSegments = $decoder->process();
echo "Nb of disclosed vendors \n";
print_r(count(array_filter($decodedConsentStringSegments[1]->vendorConsent->bitField, function($vendor_id) {
    return !!$vendor_id;
})));
