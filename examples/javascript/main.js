const { Decoder } = require("./decoder");

const decoder = new Decoder(
  "CPu-GGyPu-GGyDHACAENCZCYAAAAAAAAAAQAAAAAAAAA.II7Nd_X__bX9n-_7_6ft0eY1f9_r37uQzDhfNs-8F3L_W_LwX32E7NF36tq4KmR4ku1bBIQNtHMnUDUmxaolVrzHsak2cpyNKJ_JkknsZe2dYGF9Pn9lD-YKZ7_5_9_f52T_9_9_-39z3_9f___dv_-__-vjf_599n_v9fV_78_Kf9______-____________8A"
);

const tc = decoder.process();

console.log(JSON.stringify(tc));

console.log(
  "Nb of disclosed vendors",
  tc[1]?.vendorConsent?.bitField?.filter(Boolean).length
);
