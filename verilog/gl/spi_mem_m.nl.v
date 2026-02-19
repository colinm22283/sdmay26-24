// This is the unpowered netlist.
module spi_mem_m (clk_i,
    nrst_i,
    spi_clk_o,
    spi_cs_o,
    spi_dqsm_en_o,
    spi_dqsm_i,
    spi_dqsm_o,
    spi_miso_i,
    spi_mosi_o,
    spi_sio_en_o,
    sport_i,
    sport_o);
 input clk_i;
 input nrst_i;
 output spi_clk_o;
 output spi_cs_o;
 output spi_dqsm_en_o;
 input spi_dqsm_i;
 output spi_dqsm_o;
 input [3:0] spi_miso_i;
 output [3:0] spi_mosi_o;
 output [3:0] spi_sio_en_o;
 input [68:0] sport_i;
 output [33:0] sport_o;

 wire _0000_;
 wire _0006_;
 wire _0007_;
 wire _0008_;
 wire _0009_;
 wire _0010_;
 wire _0011_;
 wire _0012_;
 wire _0013_;
 wire _0014_;
 wire _0015_;
 wire _0016_;
 wire _0017_;
 wire _0018_;
 wire _0019_;
 wire _0020_;
 wire _0021_;
 wire _0022_;
 wire _0023_;
 wire _0024_;
 wire _0025_;
 wire _0026_;
 wire _0027_;
 wire _0028_;
 wire _0029_;
 wire _0030_;
 wire _0031_;
 wire _0032_;
 wire _0033_;
 wire _0034_;
 wire _0035_;
 wire _0036_;
 wire _0037_;
 wire _0038_;
 wire _0039_;
 wire _0040_;
 wire _0041_;
 wire _0042_;
 wire _0043_;
 wire _0044_;
 wire _0045_;
 wire _0046_;
 wire _0047_;
 wire _0048_;
 wire _0049_;
 wire _0050_;
 wire _0051_;
 wire _0052_;
 wire _0053_;
 wire _0054_;
 wire _0055_;
 wire _0056_;
 wire _0057_;
 wire _0058_;
 wire _0059_;
 wire _0060_;
 wire _0061_;
 wire _0062_;
 wire _0063_;
 wire _0064_;
 wire _0065_;
 wire _0066_;
 wire _0067_;
 wire _0068_;
 wire _0069_;
 wire _0070_;
 wire _0071_;
 wire _0072_;
 wire _0073_;
 wire _0074_;
 wire _0075_;
 wire _0076_;
 wire _0077_;
 wire _0078_;
 wire _0079_;
 wire _0080_;
 wire _0081_;
 wire _0082_;
 wire _0083_;
 wire _0084_;
 wire _0085_;
 wire _0086_;
 wire _0087_;
 wire _0088_;
 wire _0089_;
 wire _0090_;
 wire _0091_;
 wire _0092_;
 wire _0093_;
 wire _0094_;
 wire _0095_;
 wire _0096_;
 wire _0097_;
 wire _0098_;
 wire _0099_;
 wire _0100_;
 wire _0101_;
 wire _0102_;
 wire _0103_;
 wire _0104_;
 wire _0105_;
 wire _0106_;
 wire _0107_;
 wire _0108_;
 wire _0109_;
 wire _0110_;
 wire _0111_;
 wire _0112_;
 wire _0113_;
 wire _0114_;
 wire _0115_;
 wire _0116_;
 wire _0117_;
 wire _0118_;
 wire _0119_;
 wire _0120_;
 wire _0121_;
 wire _0122_;
 wire _0123_;
 wire _0124_;
 wire _0125_;
 wire _0126_;
 wire _0127_;
 wire _0128_;
 wire _0129_;
 wire _0130_;
 wire _0131_;
 wire _0132_;
 wire _0133_;
 wire _0134_;
 wire _0135_;
 wire _0136_;
 wire _0137_;
 wire _0138_;
 wire _0139_;
 wire _0140_;
 wire _0141_;
 wire _0142_;
 wire _0143_;
 wire _0144_;
 wire _0145_;
 wire _0146_;
 wire _0147_;
 wire _0148_;
 wire _0149_;
 wire _0150_;
 wire _0151_;
 wire _0152_;
 wire _0153_;
 wire _0154_;
 wire _0155_;
 wire _0156_;
 wire _0157_;
 wire _0158_;
 wire _0159_;
 wire _0160_;
 wire _0161_;
 wire _0162_;
 wire _0163_;
 wire _0164_;
 wire _0165_;
 wire _0166_;
 wire _0167_;
 wire _0168_;
 wire _0169_;
 wire _0170_;
 wire _0171_;
 wire _0172_;
 wire _0173_;
 wire _0174_;
 wire _0175_;
 wire _0176_;
 wire _0177_;
 wire _0178_;
 wire _0179_;
 wire _0180_;
 wire _0181_;
 wire _0182_;
 wire _0183_;
 wire _0184_;
 wire _0185_;
 wire _0186_;
 wire _0187_;
 wire _0188_;
 wire _0189_;
 wire _0190_;
 wire _0191_;
 wire _0192_;
 wire _0193_;
 wire _0194_;
 wire _0195_;
 wire _0196_;
 wire _0197_;
 wire _0198_;
 wire _0199_;
 wire _0200_;
 wire _0201_;
 wire _0202_;
 wire _0203_;
 wire _0204_;
 wire _0205_;
 wire _0206_;
 wire _0207_;
 wire _0208_;
 wire _0209_;
 wire _0210_;
 wire _0211_;
 wire _0212_;
 wire _0213_;
 wire _0214_;
 wire _0215_;
 wire _0216_;
 wire _0217_;
 wire _0218_;
 wire _0219_;
 wire _0220_;
 wire _0221_;
 wire _0222_;
 wire _0223_;
 wire _0224_;
 wire _0225_;
 wire _0226_;
 wire _0227_;
 wire _0228_;
 wire _0229_;
 wire _0230_;
 wire _0231_;
 wire _0232_;
 wire _0233_;
 wire _0234_;
 wire _0235_;
 wire _0236_;
 wire _0237_;
 wire _0238_;
 wire _0239_;
 wire _0240_;
 wire _0241_;
 wire _0242_;
 wire _0243_;
 wire _0244_;
 wire _0245_;
 wire _0246_;
 wire _0247_;
 wire _0248_;
 wire _0249_;
 wire _0250_;
 wire _0251_;
 wire _0252_;
 wire _0253_;
 wire _0254_;
 wire _0255_;
 wire _0256_;
 wire _0257_;
 wire _0258_;
 wire _0259_;
 wire _0260_;
 wire _0261_;
 wire _0262_;
 wire _0263_;
 wire _0264_;
 wire _0265_;
 wire _0266_;
 wire _0267_;
 wire _0268_;
 wire _0269_;
 wire _0270_;
 wire _0271_;
 wire _0272_;
 wire _0273_;
 wire _0274_;
 wire _0275_;
 wire _0276_;
 wire _0277_;
 wire _0278_;
 wire _0279_;
 wire _0280_;
 wire _0281_;
 wire _0282_;
 wire _0283_;
 wire _0284_;
 wire _0285_;
 wire _0286_;
 wire _0287_;
 wire _0288_;
 wire _0289_;
 wire _0290_;
 wire _0291_;
 wire _0292_;
 wire _0293_;
 wire _0294_;
 wire _0295_;
 wire _0296_;
 wire _0297_;
 wire _0298_;
 wire _0299_;
 wire _0300_;
 wire _0301_;
 wire _0302_;
 wire _0303_;
 wire _0304_;
 wire _0305_;
 wire _0306_;
 wire _0307_;
 wire _0308_;
 wire _0309_;
 wire _0310_;
 wire _0311_;
 wire _0312_;
 wire _0313_;
 wire _0314_;
 wire _0315_;
 wire _0316_;
 wire _0317_;
 wire _0318_;
 wire _0319_;
 wire _0320_;
 wire _0321_;
 wire _0322_;
 wire _0323_;
 wire _0324_;
 wire _0325_;
 wire _0326_;
 wire _0327_;
 wire _0328_;
 wire _0329_;
 wire _0330_;
 wire _0331_;
 wire _0332_;
 wire _0333_;
 wire _0334_;
 wire _0335_;
 wire _0336_;
 wire _0337_;
 wire _0338_;
 wire _0339_;
 wire _0340_;
 wire _0341_;
 wire _0342_;
 wire _0343_;
 wire _0344_;
 wire _0345_;
 wire _0346_;
 wire _0347_;
 wire _0348_;
 wire _0349_;
 wire _0350_;
 wire _0351_;
 wire _0352_;
 wire _0353_;
 wire _0354_;
 wire _0355_;
 wire _0356_;
 wire _0357_;
 wire _0358_;
 wire _0359_;
 wire _0360_;
 wire _0361_;
 wire _0362_;
 wire _0363_;
 wire _0364_;
 wire _0365_;
 wire _0366_;
 wire _0367_;
 wire _0368_;
 wire _0369_;
 wire _0370_;
 wire _0371_;
 wire _0372_;
 wire _0373_;
 wire _0374_;
 wire _0375_;
 wire _0376_;
 wire _0377_;
 wire _0378_;
 wire _0379_;
 wire _0380_;
 wire _0381_;
 wire _0382_;
 wire _0383_;
 wire _0384_;
 wire _0385_;
 wire _0386_;
 wire _0387_;
 wire _0388_;
 wire _0389_;
 wire _0390_;
 wire _0391_;
 wire _0392_;
 wire _0393_;
 wire _0394_;
 wire _0395_;
 wire _0396_;
 wire _0397_;
 wire _0398_;
 wire _0399_;
 wire _0400_;
 wire _0401_;
 wire _0402_;
 wire _0403_;
 wire _0404_;
 wire _0405_;
 wire _0406_;
 wire _0407_;
 wire _0408_;
 wire _0409_;
 wire _0410_;
 wire _0411_;
 wire _0412_;
 wire _0413_;
 wire _0414_;
 wire _0415_;
 wire _0416_;
 wire _0417_;
 wire _0418_;
 wire _0419_;
 wire _0420_;
 wire _0421_;
 wire _0422_;
 wire _0423_;
 wire _0424_;
 wire _0425_;
 wire _0426_;
 wire _0427_;
 wire _0428_;
 wire _0429_;
 wire _0430_;
 wire _0431_;
 wire _0432_;
 wire _0433_;
 wire _0434_;
 wire _0435_;
 wire _0436_;
 wire _0437_;
 wire _0438_;
 wire _0439_;
 wire _0440_;
 wire _0441_;
 wire _0442_;
 wire _0443_;
 wire _0444_;
 wire _0445_;
 wire _0446_;
 wire _0447_;
 wire _0448_;
 wire _0449_;
 wire _0450_;
 wire _0451_;
 wire _0452_;
 wire _0453_;
 wire _0454_;
 wire _0455_;
 wire _0456_;
 wire _0457_;
 wire _0458_;
 wire _0459_;
 wire _0460_;
 wire _0461_;
 wire _0462_;
 wire _0463_;
 wire _0464_;
 wire _0465_;
 wire _0466_;
 wire _0467_;
 wire _0468_;
 wire _0469_;
 wire _0470_;
 wire _0471_;
 wire _0472_;
 wire _0473_;
 wire _0474_;
 wire _0475_;
 wire _0476_;
 wire _0477_;
 wire _0478_;
 wire _0479_;
 wire _0480_;
 wire _0481_;
 wire _0482_;
 wire _0483_;
 wire _0484_;
 wire _0485_;
 wire _0486_;
 wire _0487_;
 wire _0488_;
 wire _0489_;
 wire _0490_;
 wire _0491_;
 wire _0492_;
 wire _0493_;
 wire _0494_;
 wire _0495_;
 wire _0496_;
 wire _0497_;
 wire _0498_;
 wire _0499_;
 wire _0500_;
 wire _0501_;
 wire _0502_;
 wire _0503_;
 wire _0504_;
 wire _0505_;
 wire _0506_;
 wire _0507_;
 wire _0508_;
 wire _0509_;
 wire _0510_;
 wire _0511_;
 wire _0512_;
 wire _0513_;
 wire _0514_;
 wire _0515_;
 wire _0516_;
 wire _0517_;
 wire _0518_;
 wire _0519_;
 wire _0520_;
 wire _0521_;
 wire _0522_;
 wire _0523_;
 wire _0524_;
 wire _0525_;
 wire _0526_;
 wire _0527_;
 wire _0528_;
 wire _0529_;
 wire _0530_;
 wire _0531_;
 wire _0532_;
 wire _0533_;
 wire _0534_;
 wire _0535_;
 wire _0536_;
 wire _0537_;
 wire _0538_;
 wire _0539_;
 wire _0540_;
 wire _0541_;
 wire _0542_;
 wire _0543_;
 wire _0544_;
 wire _0545_;
 wire _0546_;
 wire _0547_;
 wire _0548_;
 wire _0549_;
 wire _0550_;
 wire _0551_;
 wire _0552_;
 wire _0553_;
 wire _0554_;
 wire _0555_;
 wire _0556_;
 wire _0557_;
 wire _0558_;
 wire _0559_;
 wire _0560_;
 wire _0561_;
 wire _0562_;
 wire _0563_;
 wire _0564_;
 wire _0565_;
 wire _0566_;
 wire _0567_;
 wire _0568_;
 wire _0569_;
 wire _0570_;
 wire _0571_;
 wire _0572_;
 wire _0573_;
 wire _0574_;
 wire _0575_;
 wire _0576_;
 wire _0577_;
 wire _0578_;
 wire _0579_;
 wire _0580_;
 wire _0581_;
 wire _0582_;
 wire _0583_;
 wire _0584_;
 wire _0585_;
 wire _0586_;
 wire _0587_;
 wire _0588_;
 wire _0589_;
 wire _0590_;
 wire _0591_;
 wire _0592_;
 wire _0593_;
 wire _0594_;
 wire _0595_;
 wire _0596_;
 wire _0597_;
 wire _0598_;
 wire _0599_;
 wire _0600_;
 wire _0601_;
 wire _0602_;
 wire _0603_;
 wire _0604_;
 wire _0605_;
 wire _0606_;
 wire _0607_;
 wire _0608_;
 wire _0609_;
 wire _0610_;
 wire _0611_;
 wire _0612_;
 wire _0613_;
 wire _0614_;
 wire _0615_;
 wire _0616_;
 wire _0617_;
 wire _0618_;
 wire _0619_;
 wire _0620_;
 wire _0621_;
 wire _0622_;
 wire _0623_;
 wire _0624_;
 wire _0625_;
 wire _0626_;
 wire _0627_;
 wire _0628_;
 wire _0629_;
 wire _0630_;
 wire _0631_;
 wire _0632_;
 wire _0633_;
 wire _0634_;
 wire _0635_;
 wire _0636_;
 wire _0637_;
 wire _0638_;
 wire _0639_;
 wire _0640_;
 wire _0641_;
 wire _0642_;
 wire _0643_;
 wire _0644_;
 wire _0645_;
 wire _0646_;
 wire _0647_;
 wire _0648_;
 wire _0649_;
 wire _0650_;
 wire _0651_;
 wire _0652_;
 wire _0653_;
 wire _0654_;
 wire _0655_;
 wire _0656_;
 wire _0657_;
 wire _0658_;
 wire _0659_;
 wire _0660_;
 wire _0661_;
 wire _0662_;
 wire _0663_;
 wire _0664_;
 wire _0665_;
 wire _0666_;
 wire _0667_;
 wire _0668_;
 wire _0669_;
 wire _0670_;
 wire _0671_;
 wire _0672_;
 wire _0673_;
 wire _0674_;
 wire _0675_;
 wire _0676_;
 wire _0677_;
 wire _0678_;
 wire _0679_;
 wire _0680_;
 wire _0681_;
 wire _0682_;
 wire _0683_;
 wire _0684_;
 wire _0685_;
 wire _0686_;
 wire _0687_;
 wire _0688_;
 wire _0689_;
 wire _0690_;
 wire _0691_;
 wire _0692_;
 wire _0693_;
 wire _0694_;
 wire _0695_;
 wire _0696_;
 wire _0697_;
 wire _0698_;
 wire _0699_;
 wire _0700_;
 wire _0701_;
 wire _0702_;
 wire _0703_;
 wire _0704_;
 wire _0705_;
 wire _0706_;
 wire _0707_;
 wire _0708_;
 wire _0709_;
 wire _0710_;
 wire \address[0] ;
 wire \address[10] ;
 wire \address[11] ;
 wire \address[12] ;
 wire \address[13] ;
 wire \address[14] ;
 wire \address[15] ;
 wire \address[16] ;
 wire \address[17] ;
 wire \address[18] ;
 wire \address[19] ;
 wire \address[1] ;
 wire \address[20] ;
 wire \address[21] ;
 wire \address[2] ;
 wire \address[3] ;
 wire \address[4] ;
 wire \address[5] ;
 wire \address[6] ;
 wire \address[7] ;
 wire \address[8] ;
 wire \address[9] ;
 wire \address_nibble[0] ;
 wire \address_nibble[1] ;
 wire \address_nibble[2] ;
 wire clknet_0_clk_i;
 wire clknet_4_0_0_clk_i;
 wire clknet_4_10_0_clk_i;
 wire clknet_4_11_0_clk_i;
 wire clknet_4_12_0_clk_i;
 wire clknet_4_13_0_clk_i;
 wire clknet_4_14_0_clk_i;
 wire clknet_4_15_0_clk_i;
 wire clknet_4_1_0_clk_i;
 wire clknet_4_2_0_clk_i;
 wire clknet_4_3_0_clk_i;
 wire clknet_4_4_0_clk_i;
 wire clknet_4_5_0_clk_i;
 wire clknet_4_6_0_clk_i;
 wire clknet_4_7_0_clk_i;
 wire clknet_4_8_0_clk_i;
 wire clknet_4_9_0_clk_i;
 wire \data_buf[0] ;
 wire \data_buf[10] ;
 wire \data_buf[11] ;
 wire \data_buf[12] ;
 wire \data_buf[13] ;
 wire \data_buf[14] ;
 wire \data_buf[15] ;
 wire \data_buf[16] ;
 wire \data_buf[17] ;
 wire \data_buf[18] ;
 wire \data_buf[19] ;
 wire \data_buf[1] ;
 wire \data_buf[20] ;
 wire \data_buf[21] ;
 wire \data_buf[22] ;
 wire \data_buf[23] ;
 wire \data_buf[24] ;
 wire \data_buf[25] ;
 wire \data_buf[26] ;
 wire \data_buf[27] ;
 wire \data_buf[28] ;
 wire \data_buf[29] ;
 wire \data_buf[2] ;
 wire \data_buf[30] ;
 wire \data_buf[31] ;
 wire \data_buf[3] ;
 wire \data_buf[4] ;
 wire \data_buf[5] ;
 wire \data_buf[6] ;
 wire \data_buf[7] ;
 wire \data_buf[8] ;
 wire \data_buf[9] ;
 wire \data_byte[0] ;
 wire \data_byte[1] ;
 wire data_nibble;
 wire data_ready;
 wire \delayed_miso[0] ;
 wire \delayed_miso[1] ;
 wire \delayed_miso[2] ;
 wire \delayed_miso[3] ;
 wire has_2lc;
 wire \latency[0] ;
 wire \latency[1] ;
 wire \latency[2] ;
 wire \latency[3] ;
 wire \latency[4] ;
 wire \latency[5] ;
 wire net1;
 wire net10;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net11;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net12;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net13;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;
 wire net139;
 wire net14;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net144;
 wire net145;
 wire net146;
 wire net147;
 wire net148;
 wire net149;
 wire net15;
 wire net150;
 wire net151;
 wire net152;
 wire net153;
 wire net154;
 wire net155;
 wire net156;
 wire net157;
 wire net158;
 wire net159;
 wire net16;
 wire net160;
 wire net161;
 wire net162;
 wire net163;
 wire net164;
 wire net165;
 wire net166;
 wire net167;
 wire net168;
 wire net169;
 wire net17;
 wire net170;
 wire net171;
 wire net172;
 wire net173;
 wire net174;
 wire net175;
 wire net176;
 wire net177;
 wire net178;
 wire net179;
 wire net18;
 wire net180;
 wire net181;
 wire net182;
 wire net183;
 wire net184;
 wire net185;
 wire net186;
 wire net187;
 wire net188;
 wire net189;
 wire net19;
 wire net190;
 wire net191;
 wire net192;
 wire net193;
 wire net194;
 wire net195;
 wire net196;
 wire net197;
 wire net198;
 wire net199;
 wire net2;
 wire net20;
 wire net200;
 wire net201;
 wire net202;
 wire net203;
 wire net204;
 wire net205;
 wire net206;
 wire net207;
 wire net208;
 wire net209;
 wire net21;
 wire net210;
 wire net211;
 wire net212;
 wire net213;
 wire net214;
 wire net215;
 wire net216;
 wire net217;
 wire net218;
 wire net219;
 wire net22;
 wire net220;
 wire net221;
 wire net222;
 wire net223;
 wire net224;
 wire net225;
 wire net226;
 wire net227;
 wire net228;
 wire net229;
 wire net23;
 wire net230;
 wire net231;
 wire net232;
 wire net233;
 wire net234;
 wire net235;
 wire net236;
 wire net237;
 wire net238;
 wire net239;
 wire net24;
 wire net240;
 wire net241;
 wire net242;
 wire net243;
 wire net244;
 wire net245;
 wire net246;
 wire net247;
 wire net248;
 wire net249;
 wire net25;
 wire net250;
 wire net251;
 wire net252;
 wire net253;
 wire net254;
 wire net255;
 wire net256;
 wire net257;
 wire net258;
 wire net259;
 wire net26;
 wire net260;
 wire net261;
 wire net262;
 wire net263;
 wire net264;
 wire net265;
 wire net266;
 wire net267;
 wire net268;
 wire net269;
 wire net27;
 wire net270;
 wire net271;
 wire net272;
 wire net273;
 wire net274;
 wire net275;
 wire net276;
 wire net277;
 wire net278;
 wire net279;
 wire net28;
 wire net280;
 wire net281;
 wire net282;
 wire net283;
 wire net284;
 wire net285;
 wire net286;
 wire net287;
 wire net288;
 wire net289;
 wire net29;
 wire net290;
 wire net291;
 wire net292;
 wire net293;
 wire net294;
 wire net295;
 wire net296;
 wire net297;
 wire net298;
 wire net299;
 wire net3;
 wire net30;
 wire net300;
 wire net301;
 wire net302;
 wire net303;
 wire net304;
 wire net305;
 wire net306;
 wire net307;
 wire net308;
 wire net309;
 wire net31;
 wire net310;
 wire net311;
 wire net312;
 wire net313;
 wire net314;
 wire net315;
 wire net316;
 wire net317;
 wire net318;
 wire net319;
 wire net32;
 wire net320;
 wire net321;
 wire net322;
 wire net323;
 wire net324;
 wire net325;
 wire net326;
 wire net327;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net4;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net5;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net6;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net7;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net8;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net9;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire spi_clk;
 wire \state[0] ;
 wire \state[1] ;
 wire \state[2] ;
 wire \state[3] ;

 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(net39));
 sky130_fd_sc_hd__diode_2 ANTENNA__0733__A (.DIODE(net113));
 sky130_fd_sc_hd__diode_2 ANTENNA__0752__A2 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0773__A1 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0808__A (.DIODE(net175));
 sky130_fd_sc_hd__diode_2 ANTENNA__0877__A1_N (.DIODE(net73));
 sky130_fd_sc_hd__diode_2 ANTENNA__0877__B1 (.DIODE(net71));
 sky130_fd_sc_hd__diode_2 ANTENNA__0903__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0905__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0907__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0909__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0911__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0913__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0915__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0917__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0919__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0921__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0923__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0925__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0927__A1 (.DIODE(net175));
 sky130_fd_sc_hd__diode_2 ANTENNA__0927__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0929__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0931__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0933__S (.DIODE(_0306_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0936__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0938__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0940__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0942__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0944__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0946__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0948__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0950__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0952__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0954__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0956__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0958__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0960__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0962__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0964__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0966__S (.DIODE(_0323_));
 sky130_fd_sc_hd__diode_2 ANTENNA__0979__B (.DIODE(net67));
 sky130_fd_sc_hd__diode_2 ANTENNA__1012__B (.DIODE(net67));
 sky130_fd_sc_hd__diode_2 ANTENNA__1057__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1064__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1069__A1 (.DIODE(net71));
 sky130_fd_sc_hd__diode_2 ANTENNA__1070__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1073__B (.DIODE(net71));
 sky130_fd_sc_hd__diode_2 ANTENNA__1076__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1192__A0 (.DIODE(\delayed_miso[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1196__A2 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1198__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1198__C (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1201__A0 (.DIODE(\delayed_miso[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1203__A2 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1204__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1204__C (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1212__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1215__A0 (.DIODE(\delayed_miso[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1218__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1224__B (.DIODE(\delayed_miso[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1227__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1231__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1234__B (.DIODE(\delayed_miso[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1237__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1240__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1246__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1249__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1252__B (.DIODE(\delayed_miso[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1255__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1256__B (.DIODE(net73));
 sky130_fd_sc_hd__diode_2 ANTENNA__1258__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1266__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1272__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1278__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1284__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1286__B (.DIODE(net175));
 sky130_fd_sc_hd__diode_2 ANTENNA__1292__B1 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1295__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1300__B1 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1303__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1308__B1 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1311__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1316__B1 (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1319__B (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1323__A (.DIODE(\delayed_miso[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1327__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1330__A (.DIODE(\delayed_miso[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1334__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1340__A2 (.DIODE(net16));
 sky130_fd_sc_hd__diode_2 ANTENNA__1341__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1344__A (.DIODE(\delayed_miso[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1348__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1355__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1355__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1361__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1361__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1366__A2 (.DIODE(net21));
 sky130_fd_sc_hd__diode_2 ANTENNA__1367__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1367__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1373__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1373__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1376__A0 (.DIODE(\delayed_miso[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1377__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1380__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1380__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1383__A0 (.DIODE(\delayed_miso[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1384__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1387__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1387__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1391__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1394__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1394__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1397__A0 (.DIODE(\delayed_miso[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__1398__B (.DIODE(_0155_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1401__A (.DIODE(_0586_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1401__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1408__A (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1414__A (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1414__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1420__A (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1426__A (.DIODE(_0530_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1426__B (.DIODE(_0423_));
 sky130_fd_sc_hd__diode_2 ANTENNA__1428__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1429__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1430__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1431__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1432__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1433__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1434__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1435__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1436__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1437__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1438__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1445__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1446__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1452__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1453__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1454__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1457__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1460__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1461__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1462__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1463__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1464__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1465__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1466__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1467__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1468__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1469__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1470__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1471__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1472__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1473__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1474__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1475__SET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1477__SET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1500__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1501__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1502__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1503__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1504__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1505__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1506__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1507__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1508__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1509__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1512__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1513__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1516__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1517__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1523__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA__1524__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1525__RESET_B (.DIODE(net127));
 sky130_fd_sc_hd__diode_2 ANTENNA__1526__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1527__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1528__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA__1529__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA__1530__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1531__RESET_B (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA__1532__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA__1533__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA__1534__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1535__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1536__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1537__RESET_B (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA__1538__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1539__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA__1540__RESET_B (.DIODE(net128));
 sky130_fd_sc_hd__diode_2 ANTENNA__1541__RESET_B (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_0_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_10_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_11_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_12_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_13_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_14_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_15_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_1_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_2_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_3_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_4_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_5_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_6_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_7_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_8_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_4_9_0_clk_i_A (.DIODE(clknet_0_clk_i));
 sky130_fd_sc_hd__diode_2 ANTENNA_fanout123_A (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA_fanout124_A (.DIODE(net125));
 sky130_fd_sc_hd__diode_2 ANTENNA_fanout125_A (.DIODE(net126));
 sky130_fd_sc_hd__diode_2 ANTENNA_fanout127_A (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA_fanout128_A (.DIODE(net129));
 sky130_fd_sc_hd__diode_2 ANTENNA_output113_A (.DIODE(net113));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_108 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_125 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_181 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_193 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_205 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_209 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_213 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_217 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_221 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_236 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_248 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_253 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_26 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_261 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_267 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_279 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_281 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_38 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_50 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_96 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_107 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_132 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_147 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_159 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_167 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_173 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_179 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_186 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_219 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_223 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_227 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_231 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_234 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_248 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_261 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_283 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_289 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_297 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_32 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_36 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_44 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_48 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_6 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_60 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_83 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_99 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_11_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_117 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_129 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_149 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_157 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_169 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_185 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_201 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_207 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_215 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_241 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_263 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_279 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_281 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_101 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_104 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_108 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_112 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_12_124 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_130 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_144 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_156 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_160 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_164 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_176 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_187 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_195 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_12_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_270 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_291 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_295 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_59 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_70 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_119 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_123 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_133 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_146 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_160 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_184 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_13_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_20 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_204 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_210 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_213 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_222 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_245 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_13_285 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_297 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_65 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_87 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_14_145 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_14_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_14_166 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_174 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_179 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_194 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_14_202 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_211 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_215 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_14_227 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_236 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_24 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_240 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_14_266 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_14_271 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_58 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_14_67 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_110 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_117 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_15_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_130 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_15_159 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_167 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_173 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_177 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_193 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_20 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_15_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_233 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_257 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_269 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_297 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_65 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_15_87 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_101 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_105 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_16_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_162 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_168 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_193 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_197 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_16_201 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_210 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_16_22 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_229 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_236 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_16_248 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_253 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_265 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_274 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_298 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_48 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_72 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_16_82 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_102 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_17_106 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_17_123 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_132 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_17_153 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_190 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_194 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_204 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_212 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_228 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_23 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_240 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_252 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_17_264 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_281 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_47 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_17_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_6 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_17_63 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_73 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_17_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_81 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_17_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_17_91 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_18_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_115 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_118 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_18_126 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_131 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_153 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_172 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_176 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_18_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_197 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_209 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_218 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_234 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_240 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_18_256 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_262 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_270 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_49 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_58 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_89 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_9 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_100 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_104 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_116 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_135 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_19_143 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_149 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_163 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_167 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_19_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_181 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_19_190 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_19_198 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_229 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_233 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_19_257 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_263 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_281 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_19_39 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_89 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_104 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_113 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_12 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_1_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_193 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_223 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_244 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_248 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_252 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_279 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_284 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_1_296 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_34 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_54 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_1_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_83 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_20_116 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_139 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_141 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_20_149 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_20_155 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_20_176 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_188 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_20_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_201 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_205 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_23 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_230 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_238 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_242 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_20_256 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_298 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_20_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_83 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_20_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_21_116 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_21_120 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_128 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_142 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_154 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_21_160 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_21_164 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_21_182 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_186 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_21_198 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_215 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_21_220 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_231 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_249 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_261 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_21_297 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_33 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_21_38 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_67 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_21_89 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_95 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_117 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_129 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_22_137 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_22_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_201 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_205 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_212 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_216 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_223 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_232 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_22_245 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_22_25 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_253 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_22_265 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_9 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_97 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_23_101 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_23_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_116 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_128 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_23_137 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_23_143 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_147 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_151 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_159 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_163 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_173 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_183 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_206 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_218 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_23_231 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_243 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_255 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_26 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_23_267 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_273 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_276 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_281 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_298 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_38 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_23_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_64 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_23_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_23_87 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_23_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_103 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_107 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_115 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_123 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_24_127 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_135 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_139 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_150 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_171 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_192 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_24_21 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_24_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_230 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_24_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_250 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_258 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_24_262 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_275 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_24_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_24_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_24_83 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_24_99 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_25_110 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_117 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_25_125 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_25_159 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_167 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_25_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_206 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25_237 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25_24 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25_277 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_25_289 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_25_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_295 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_25_33 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_25_45 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_25_54 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_25_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_120 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_26_124 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_26_130 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_150 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_158 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_170 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_175 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_26_187 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_195 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_26_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_201 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_205 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_217 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_26_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_228 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_238 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_251 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_261 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_26_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_26_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_101 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_105 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_27_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_122 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_129 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_27_134 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_27_140 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_27_145 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_193 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_27_205 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_27_240 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_252 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_256 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_278 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_281 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_27_293 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_27_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_54 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_27_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_27_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_84 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_27_88 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_28_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_28_165 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_28_17 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_183 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_195 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_28_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_201 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_208 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_213 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_28_217 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_235 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_28_24 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_28_247 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_251 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_28_253 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_28_258 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_28_266 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_28_276 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_28_284 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_28_290 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_298 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_33 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_28_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_28_9 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_28_97 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_29_101 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_29_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_137 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_29_149 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_29_158 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_166 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_29_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29_173 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_29_18 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_29_190 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_29_198 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29_216 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_29_237 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_245 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_252 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_264 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_29_276 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_281 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_30 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29_66 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_70 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_29_82 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_29_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29_98 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_125 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_177 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_189 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_243 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_247 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_253 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_30_105 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_30_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_30_115 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_30_121 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_30_129 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_30_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_156 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_30_189 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_30_197 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_30_209 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_30_215 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_30_232 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_30_238 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_30_251 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_30_273 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_30_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_30_45 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_30_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_30_7 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_30_78 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_30_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_31_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_31_165 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_31_169 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_31_177 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_31_186 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_31_198 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31_206 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_31_210 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31_222 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31_225 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_31_229 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_31_236 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_31_269 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_31_277 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_31_291 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_31_295 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31_45 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_31_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_31_53 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_31_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31_91 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_100 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_122 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_32_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_32_139 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_32_156 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_32_169 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_32_181 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_187 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_32_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_32_195 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_32_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_32_205 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_32_211 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_32_227 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_32_239 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_32_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_32_276 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_32_288 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_79 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_32_89 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_32_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_103 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_33_117 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_33_129 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_33_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_33_146 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_150 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_33_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_33_165 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_33_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_195 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_199 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_213 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_223 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_234 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_33_238 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_244 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_278 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_33_281 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_33_293 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_7 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_33_72 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_79 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_83 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_33_87 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_33_91 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_33_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_106 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_110 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_34_114 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_119 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_123 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_127 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_34_131 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_34_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_34_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_155 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_34_159 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_34_163 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_208 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_216 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_221 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_225 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_229 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_34_233 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_34_245 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_34_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_34_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_34_265 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_34_277 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_34_289 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_297 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_34_89 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_34_95 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_128 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_132 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_35_140 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_35_152 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_35_156 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_35_160 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_198 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_35_202 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_35_207 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_214 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_218 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_222 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_234 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_35_238 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_35_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_35_262 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_35_274 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_281 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_35_74 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_87 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_35_91 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_35_95 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_103 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_107 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_112 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_116 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_127 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_36_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_141 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_36_145 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_168 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_180 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_184 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_188 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_192 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_36_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_235 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_36_239 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_251 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_36_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_36_265 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_36_277 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_36_289 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_36_297 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_59 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_36_99 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_37_133 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_37_155 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_37_186 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_37_200 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_37_204 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_37_213 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_37_217 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_37_221 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_37_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_37_241 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_37_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_37_265 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_37_277 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_37_281 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_37_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_37_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_37_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_38_128 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_38_188 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_38_192 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_38_214 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_38_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_38_222 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_38_234 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_38_24 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_38_246 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_38_253 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_38_265 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_38_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_38_50 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_38_56 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_38_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_38_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_39_110 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_39_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_39_146 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_39_161 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_39_165 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_39_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_39_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_39_229 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_39_233 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_39_245 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_39_257 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_39_269 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_39_277 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_39_281 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_39_293 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_39_298 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_39_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_39_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_39_89 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_101 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_116 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_128 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_140 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_169 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_32 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_129 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_138 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_40_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_145 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_148 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_153 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_161 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_173 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_177 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_40_181 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_204 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_226 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_40_244 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_40_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_40_265 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_40_277 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_40_289 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_297 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_40_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_40_75 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_40_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_41_152 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_156 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_160 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_164 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_173 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_181 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_193 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_41_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_41_203 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_41_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_41_234 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_41_246 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_41_258 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_41_270 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_278 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_41_281 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_41_293 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_33 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_41_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_41_66 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_42_139 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_166 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_42_170 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_174 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_178 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_42_182 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_194 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_42_200 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_206 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_210 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_42_230 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_42_242 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_250 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_42_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_42_265 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_42_277 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_42_289 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_297 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_42_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_43_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_43_169 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_43_210 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_43_214 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_43_218 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_43_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_43_237 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_43_249 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_43_25 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_43_261 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_43_273 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_43_279 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_43_281 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_43_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_43_293 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_43_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_43_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_44_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_44_135 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_44_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_44_163 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_44_167 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_44_190 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_44_194 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_44_205 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_44_228 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_44_240 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_44_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_44_265 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_44_277 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_44_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_44_82 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_44_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_45_111 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_45_145 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_45_180 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_45_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_45_209 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_45_213 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_45_221 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_45_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_45_237 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_45_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_45_261 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_45_273 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_45_279 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_45_281 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_45_293 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_45_44 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_101 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_166 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_46_185 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_46_189 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_192 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_46_197 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_203 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_207 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_46_211 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_46_223 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_46_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_46_237 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_46_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_46_253 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_46_265 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_46_277 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_281 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_46_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_46_54 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_106 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_118 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_130 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_138 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_163 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_171 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_183 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_213 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_247 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_251 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_253 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_278 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_282 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_286 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_6 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_102 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_123 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_130 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_138 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_193 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_197 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_202 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_223 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_252 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_260 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_266 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_278 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_281 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_41 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_6 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_63 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_84 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_5_96 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_6_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_117 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_12 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_180 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_184 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_188 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_208 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_220 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_237 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_24 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_6_249 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_270 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_282 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_294 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_298 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_44 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_56 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_64 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_78 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_99 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_102 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_108 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_136 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_142 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_146 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_167 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_173 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_180 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_210 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_222 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_237 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_249 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_256 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_260 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_263 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_275 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_279 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_281 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_290 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_298 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_40 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_81 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_105 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_110 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_132 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_141 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_150 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_158 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_184 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_197 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_215 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_239 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_243 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_256 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_268 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_279 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_291 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_295 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_32 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_43 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_48 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_56 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_78 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_102 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_113 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_124 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_134 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_146 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_158 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_179 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_190 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_202 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_214 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_223 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_277 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_281 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_293 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_42 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_6 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_64 ();
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
 sky130_fd_sc_hd__decap_3 PHY_44 ();
 sky130_fd_sc_hd__decap_3 PHY_45 ();
 sky130_fd_sc_hd__decap_3 PHY_46 ();
 sky130_fd_sc_hd__decap_3 PHY_47 ();
 sky130_fd_sc_hd__decap_3 PHY_48 ();
 sky130_fd_sc_hd__decap_3 PHY_49 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_50 ();
 sky130_fd_sc_hd__decap_3 PHY_51 ();
 sky130_fd_sc_hd__decap_3 PHY_52 ();
 sky130_fd_sc_hd__decap_3 PHY_53 ();
 sky130_fd_sc_hd__decap_3 PHY_54 ();
 sky130_fd_sc_hd__decap_3 PHY_55 ();
 sky130_fd_sc_hd__decap_3 PHY_56 ();
 sky130_fd_sc_hd__decap_3 PHY_57 ();
 sky130_fd_sc_hd__decap_3 PHY_58 ();
 sky130_fd_sc_hd__decap_3 PHY_59 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_60 ();
 sky130_fd_sc_hd__decap_3 PHY_61 ();
 sky130_fd_sc_hd__decap_3 PHY_62 ();
 sky130_fd_sc_hd__decap_3 PHY_63 ();
 sky130_fd_sc_hd__decap_3 PHY_64 ();
 sky130_fd_sc_hd__decap_3 PHY_65 ();
 sky130_fd_sc_hd__decap_3 PHY_66 ();
 sky130_fd_sc_hd__decap_3 PHY_67 ();
 sky130_fd_sc_hd__decap_3 PHY_68 ();
 sky130_fd_sc_hd__decap_3 PHY_69 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_70 ();
 sky130_fd_sc_hd__decap_3 PHY_71 ();
 sky130_fd_sc_hd__decap_3 PHY_72 ();
 sky130_fd_sc_hd__decap_3 PHY_73 ();
 sky130_fd_sc_hd__decap_3 PHY_74 ();
 sky130_fd_sc_hd__decap_3 PHY_75 ();
 sky130_fd_sc_hd__decap_3 PHY_76 ();
 sky130_fd_sc_hd__decap_3 PHY_77 ();
 sky130_fd_sc_hd__decap_3 PHY_78 ();
 sky130_fd_sc_hd__decap_3 PHY_79 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_80 ();
 sky130_fd_sc_hd__decap_3 PHY_81 ();
 sky130_fd_sc_hd__decap_3 PHY_82 ();
 sky130_fd_sc_hd__decap_3 PHY_83 ();
 sky130_fd_sc_hd__decap_3 PHY_84 ();
 sky130_fd_sc_hd__decap_3 PHY_85 ();
 sky130_fd_sc_hd__decap_3 PHY_86 ();
 sky130_fd_sc_hd__decap_3 PHY_87 ();
 sky130_fd_sc_hd__decap_3 PHY_88 ();
 sky130_fd_sc_hd__decap_3 PHY_89 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_90 ();
 sky130_fd_sc_hd__decap_3 PHY_91 ();
 sky130_fd_sc_hd__decap_3 PHY_92 ();
 sky130_fd_sc_hd__decap_3 PHY_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_111 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_116 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_117 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_118 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_119 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_120 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_121 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_122 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_123 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_124 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_125 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_126 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_127 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_128 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_129 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_130 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_131 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_132 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_133 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_134 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_135 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_136 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_137 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_138 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_139 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_140 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_141 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_142 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_143 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_144 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_145 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_146 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_147 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_148 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_149 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_150 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_151 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_152 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_153 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_154 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_155 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_156 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_157 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_158 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_159 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_160 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_161 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_162 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_163 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_164 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_165 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_166 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_167 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_168 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_169 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_170 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_171 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_172 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_173 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_174 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_175 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_176 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_177 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_178 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_179 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_180 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_181 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_182 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_183 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_184 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_185 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_186 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_187 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_188 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_189 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_190 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_191 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_192 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_193 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_194 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_195 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_196 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_197 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_198 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_199 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_200 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_201 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_202 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_203 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_204 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_205 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_206 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_207 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_208 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_209 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_210 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_211 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_212 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_213 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_214 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_215 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_216 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_217 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_218 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_219 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_220 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_221 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_222 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_223 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_224 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_225 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_226 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_227 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_228 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_229 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_230 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_231 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_232 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_233 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_234 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_235 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_236 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_237 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_238 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_239 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_240 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_241 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_242 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_243 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_244 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_245 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_246 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_247 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_248 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_249 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_250 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_251 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_252 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_253 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_254 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_255 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_256 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_257 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_258 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_259 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_260 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_261 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_262 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_263 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_264 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_265 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_266 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_267 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_268 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_269 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_270 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_271 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_272 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_273 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_274 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_275 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_276 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_277 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_278 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_279 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_280 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_281 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_282 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_283 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_284 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_285 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_286 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_287 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_288 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_289 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_290 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_291 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_292 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_293 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_294 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_295 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_296 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_297 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_298 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_299 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_300 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_301 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_302 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_303 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_304 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_305 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_306 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_307 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_308 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_309 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_310 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_311 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_312 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_313 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_314 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_315 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_316 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_317 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_318 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_319 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_320 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_321 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_322 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_323 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_324 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_325 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_326 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_327 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_328 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_329 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_330 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_331 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_332 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_333 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_334 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_335 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_336 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_337 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_338 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_99 ();
 sky130_fd_sc_hd__nor2_1 _0711_ (.A(\state[2] ),
    .B(\state[3] ),
    .Y(_0133_));
 sky130_fd_sc_hd__nand2_2 _0712_ (.A(net264),
    .B(net269),
    .Y(_0134_));
 sky130_fd_sc_hd__inv_2 _0713_ (.A(_0134_),
    .Y(_0135_));
 sky130_fd_sc_hd__nor2_2 _0714_ (.A(net158),
    .B(net261),
    .Y(_0136_));
 sky130_fd_sc_hd__o21ai_1 _0715_ (.A1(_0133_),
    .A2(_0135_),
    .B1(_0136_),
    .Y(_0137_));
 sky130_fd_sc_hd__inv_2 _0716_ (.A(net135),
    .Y(_0000_));
 sky130_fd_sc_hd__nand2_2 _0717_ (.A(net158),
    .B(net261),
    .Y(_0138_));
 sky130_fd_sc_hd__inv_4 _0718_ (.A(net264),
    .Y(_0139_));
 sky130_fd_sc_hd__nand2_4 _0719_ (.A(_0139_),
    .B(net269),
    .Y(_0140_));
 sky130_fd_sc_hd__nor2_1 _0720_ (.A(_0138_),
    .B(_0140_),
    .Y(_0141_));
 sky130_fd_sc_hd__nor2_1 _0721_ (.A(_0000_),
    .B(_0141_),
    .Y(_0142_));
 sky130_fd_sc_hd__nand2_2 _0722_ (.A(_0137_),
    .B(_0142_),
    .Y(_0143_));
 sky130_fd_sc_hd__inv_6 _0723_ (.A(_0143_),
    .Y(net76));
 sky130_fd_sc_hd__inv_2 _0724_ (.A(net158),
    .Y(_0144_));
 sky130_fd_sc_hd__inv_2 _0725_ (.A(net261),
    .Y(_0145_));
 sky130_fd_sc_hd__inv_2 _0726_ (.A(net269),
    .Y(_0146_));
 sky130_fd_sc_hd__nand2_4 _0727_ (.A(_0146_),
    .B(net264),
    .Y(_0147_));
 sky130_fd_sc_hd__a21oi_4 _0728_ (.A1(_0144_),
    .A2(_0145_),
    .B1(_0147_),
    .Y(net87));
 sky130_fd_sc_hd__nand2_1 _0729_ (.A(_0139_),
    .B(_0146_),
    .Y(_0148_));
 sky130_fd_sc_hd__inv_2 _0730_ (.A(_0136_),
    .Y(_0149_));
 sky130_fd_sc_hd__nor2_1 _0731_ (.A(_0148_),
    .B(_0149_),
    .Y(_0150_));
 sky130_fd_sc_hd__nor2_2 _0732_ (.A(_0141_),
    .B(_0150_),
    .Y(net113));
 sky130_fd_sc_hd__inv_2 _0733_ (.A(net113),
    .Y(net77));
 sky130_fd_sc_hd__nand2_1 _0734_ (.A(_0136_),
    .B(_0139_),
    .Y(_0151_));
 sky130_fd_sc_hd__mux2_1 _0735_ (.A0(_0151_),
    .A1(_0136_),
    .S(\state[3] ),
    .X(_0152_));
 sky130_fd_sc_hd__buf_1 _0736_ (.A(_0152_),
    .X(net78));
 sky130_fd_sc_hd__nand2_1 _0737_ (.A(_0145_),
    .B(net158),
    .Y(_0153_));
 sky130_fd_sc_hd__nor2_2 _0738_ (.A(_0147_),
    .B(_0153_),
    .Y(_0154_));
 sky130_fd_sc_hd__buf_4 _0739_ (.A(_0154_),
    .X(_0155_));
 sky130_fd_sc_hd__inv_2 _0740_ (.A(_0140_),
    .Y(_0156_));
 sky130_fd_sc_hd__nor2_1 _0741_ (.A(net158),
    .B(_0145_),
    .Y(_0157_));
 sky130_fd_sc_hd__nand2_1 _0742_ (.A(_0156_),
    .B(net159),
    .Y(_0158_));
 sky130_fd_sc_hd__clkbuf_8 _0743_ (.A(net304),
    .X(_0159_));
 sky130_fd_sc_hd__clkinv_4 _0744_ (.A(_0159_),
    .Y(_0160_));
 sky130_fd_sc_hd__nor2_2 _0745_ (.A(net302),
    .B(_0160_),
    .Y(_0161_));
 sky130_fd_sc_hd__nand2_1 _0746_ (.A(net69),
    .B(net70),
    .Y(_0162_));
 sky130_fd_sc_hd__inv_2 _0747_ (.A(_0162_),
    .Y(_0163_));
 sky130_fd_sc_hd__buf_4 _0748_ (.A(net278),
    .X(_0164_));
 sky130_fd_sc_hd__inv_6 _0749_ (.A(_0164_),
    .Y(_0165_));
 sky130_fd_sc_hd__nand3_1 _0750_ (.A(_0161_),
    .B(_0163_),
    .C(_0165_),
    .Y(_0166_));
 sky130_fd_sc_hd__nor2_1 _0751_ (.A(net160),
    .B(_0166_),
    .Y(_0167_));
 sky130_fd_sc_hd__a21o_1 _0752_ (.A1(net150),
    .A2(_0155_),
    .B1(net161),
    .X(_0710_));
 sky130_fd_sc_hd__nand2_1 _0753_ (.A(_0144_),
    .B(\state[0] ),
    .Y(_0168_));
 sky130_fd_sc_hd__nor2_4 _0754_ (.A(_0140_),
    .B(_0168_),
    .Y(_0169_));
 sky130_fd_sc_hd__nor2_1 _0755_ (.A(_0140_),
    .B(_0153_),
    .Y(_0170_));
 sky130_fd_sc_hd__nor2_1 _0756_ (.A(_0169_),
    .B(_0170_),
    .Y(net79));
 sky130_fd_sc_hd__nand2_1 _0757_ (.A(_0156_),
    .B(_0136_),
    .Y(_0171_));
 sky130_fd_sc_hd__inv_4 _0758_ (.A(_0147_),
    .Y(_0172_));
 sky130_fd_sc_hd__nand2_2 _0759_ (.A(_0172_),
    .B(_0136_),
    .Y(_0173_));
 sky130_fd_sc_hd__nand2_4 _0760_ (.A(_0171_),
    .B(_0173_),
    .Y(_0174_));
 sky130_fd_sc_hd__nand2_1 _0761_ (.A(_0159_),
    .B(\data_byte[0] ),
    .Y(_0175_));
 sky130_fd_sc_hd__inv_2 _0762_ (.A(net68),
    .Y(_0176_));
 sky130_fd_sc_hd__nand2_1 _0763_ (.A(_0176_),
    .B(_0165_),
    .Y(_0177_));
 sky130_fd_sc_hd__nor2_1 _0764_ (.A(_0175_),
    .B(_0177_),
    .Y(_0178_));
 sky130_fd_sc_hd__or3b_1 _0765_ (.A(_0162_),
    .B(_0174_),
    .C_N(_0178_),
    .X(_0179_));
 sky130_fd_sc_hd__nor2_1 _0766_ (.A(net137),
    .B(net163),
    .Y(_0180_));
 sky130_fd_sc_hd__nor2_1 _0767_ (.A(net143),
    .B(net167),
    .Y(_0181_));
 sky130_fd_sc_hd__nand2_1 _0768_ (.A(_0180_),
    .B(_0181_),
    .Y(_0182_));
 sky130_fd_sc_hd__nor2_1 _0769_ (.A(net140),
    .B(_0182_),
    .Y(_0183_));
 sky130_fd_sc_hd__inv_2 _0770_ (.A(net153),
    .Y(_0184_));
 sky130_fd_sc_hd__nand2_2 _0771_ (.A(_0183_),
    .B(_0184_),
    .Y(_0185_));
 sky130_fd_sc_hd__o21ai_2 _0772_ (.A1(_0185_),
    .A2(net76),
    .B1(_0174_),
    .Y(_0186_));
 sky130_fd_sc_hd__o21ai_1 _0773_ (.A1(_0155_),
    .A2(_0174_),
    .B1(_0186_),
    .Y(_0187_));
 sky130_fd_sc_hd__nand2_1 _0774_ (.A(_0187_),
    .B(net150),
    .Y(_0188_));
 sky130_fd_sc_hd__o21ai_1 _0775_ (.A1(_0179_),
    .A2(_0187_),
    .B1(net151),
    .Y(_0006_));
 sky130_fd_sc_hd__inv_2 _0776__1 (.A(clknet_4_9_0_clk_i),
    .Y(net130));
 sky130_fd_sc_hd__inv_2 _0777__2 (.A(clknet_4_11_0_clk_i),
    .Y(net131));
 sky130_fd_sc_hd__inv_2 _0778__3 (.A(clknet_4_14_0_clk_i),
    .Y(net132));
 sky130_fd_sc_hd__inv_2 _0779__4 (.A(clknet_4_14_0_clk_i),
    .Y(net133));
 sky130_fd_sc_hd__inv_2 _0780__5 (.A(clknet_4_15_0_clk_i),
    .Y(net134));
 sky130_fd_sc_hd__inv_2 _0781_ (.A(\address_nibble[0] ),
    .Y(_0189_));
 sky130_fd_sc_hd__or2_1 _0782_ (.A(\address_nibble[0] ),
    .B(\address[3] ),
    .X(_0190_));
 sky130_fd_sc_hd__o211a_1 _0783_ (.A1(\address[7] ),
    .A2(_0189_),
    .B1(\address_nibble[1] ),
    .C1(_0190_),
    .X(_0191_));
 sky130_fd_sc_hd__nor2_2 _0784_ (.A(_0138_),
    .B(_0148_),
    .Y(_0192_));
 sky130_fd_sc_hd__inv_2 _0785_ (.A(_0192_),
    .Y(_0193_));
 sky130_fd_sc_hd__inv_2 _0786_ (.A(_0153_),
    .Y(_0194_));
 sky130_fd_sc_hd__nand2_1 _0787_ (.A(_0194_),
    .B(_0133_),
    .Y(_0195_));
 sky130_fd_sc_hd__nand2_1 _0788_ (.A(_0193_),
    .B(_0195_),
    .Y(_0196_));
 sky130_fd_sc_hd__nand2_1 _0789_ (.A(_0189_),
    .B(\address[17] ),
    .Y(_0197_));
 sky130_fd_sc_hd__nand2_1 _0790_ (.A(\address_nibble[0] ),
    .B(\address[21] ),
    .Y(_0198_));
 sky130_fd_sc_hd__inv_2 _0791_ (.A(net254),
    .Y(_0199_));
 sky130_fd_sc_hd__a31o_1 _0792_ (.A1(_0197_),
    .A2(_0198_),
    .A3(\address_nibble[2] ),
    .B1(_0199_),
    .X(_0200_));
 sky130_fd_sc_hd__nor2_2 _0793_ (.A(\address_nibble[0] ),
    .B(\address_nibble[1] ),
    .Y(_0201_));
 sky130_fd_sc_hd__nor2_2 _0794_ (.A(net254),
    .B(_0189_),
    .Y(_0202_));
 sky130_fd_sc_hd__a22oi_1 _0795_ (.A1(_0201_),
    .A2(\address[9] ),
    .B1(_0202_),
    .B2(\address[13] ),
    .Y(_0203_));
 sky130_fd_sc_hd__nand2_1 _0796_ (.A(_0200_),
    .B(_0203_),
    .Y(_0204_));
 sky130_fd_sc_hd__o211ai_1 _0797_ (.A1(\address_nibble[2] ),
    .A2(_0191_),
    .B1(_0196_),
    .C1(_0204_),
    .Y(_0205_));
 sky130_fd_sc_hd__inv_2 _0798_ (.A(net146),
    .Y(_0206_));
 sky130_fd_sc_hd__nand2_4 _0799_ (.A(_0164_),
    .B(\data_byte[0] ),
    .Y(_0207_));
 sky130_fd_sc_hd__inv_2 _0800_ (.A(net302),
    .Y(_0208_));
 sky130_fd_sc_hd__nor2_2 _0801_ (.A(_0164_),
    .B(_0208_),
    .Y(_0209_));
 sky130_fd_sc_hd__nand2_1 _0802_ (.A(_0209_),
    .B(net179),
    .Y(_0210_));
 sky130_fd_sc_hd__nor2_4 _0803_ (.A(\data_byte[0] ),
    .B(_0165_),
    .Y(_0211_));
 sky130_fd_sc_hd__nand2_1 _0804_ (.A(_0211_),
    .B(\data_buf[20] ),
    .Y(_0212_));
 sky130_fd_sc_hd__nor2_4 _0805_ (.A(_0164_),
    .B(net307),
    .Y(_0213_));
 sky130_fd_sc_hd__a21oi_1 _0806_ (.A1(_0213_),
    .A2(\data_buf[16] ),
    .B1(_0160_),
    .Y(_0214_));
 sky130_fd_sc_hd__o2111ai_1 _0807_ (.A1(_0206_),
    .A2(_0207_),
    .B1(_0210_),
    .C1(_0212_),
    .D1(_0214_),
    .Y(_0215_));
 sky130_fd_sc_hd__inv_2 _0808_ (.A(net175),
    .Y(_0216_));
 sky130_fd_sc_hd__nand2_1 _0809_ (.A(_0209_),
    .B(net156),
    .Y(_0217_));
 sky130_fd_sc_hd__nand2_1 _0810_ (.A(_0211_),
    .B(net170),
    .Y(_0218_));
 sky130_fd_sc_hd__a21oi_1 _0811_ (.A1(_0213_),
    .A2(net157),
    .B1(_0159_),
    .Y(_0219_));
 sky130_fd_sc_hd__o2111ai_1 _0812_ (.A1(_0216_),
    .A2(_0207_),
    .B1(_0217_),
    .C1(_0218_),
    .D1(_0219_),
    .Y(_0220_));
 sky130_fd_sc_hd__nand3_1 _0813_ (.A(_0215_),
    .B(_0220_),
    .C(_0169_),
    .Y(_0221_));
 sky130_fd_sc_hd__nor2_2 _0814_ (.A(_0140_),
    .B(_0149_),
    .Y(_0222_));
 sky130_fd_sc_hd__nand2_1 _0815_ (.A(_0222_),
    .B(net51),
    .Y(_0223_));
 sky130_fd_sc_hd__nand3_1 _0816_ (.A(_0205_),
    .B(_0221_),
    .C(_0223_),
    .Y(_0224_));
 sky130_fd_sc_hd__nor2_4 _0817_ (.A(_0134_),
    .B(_0149_),
    .Y(_0225_));
 sky130_fd_sc_hd__nor2_1 _0818_ (.A(_0169_),
    .B(_0222_),
    .Y(_0226_));
 sky130_fd_sc_hd__o21ai_1 _0819_ (.A1(net158),
    .A2(\state[0] ),
    .B1(_0133_),
    .Y(_0227_));
 sky130_fd_sc_hd__nand2_1 _0820_ (.A(_0226_),
    .B(_0227_),
    .Y(_0228_));
 sky130_fd_sc_hd__or2_1 _0821_ (.A(_0225_),
    .B(_0228_),
    .X(_0229_));
 sky130_fd_sc_hd__nand3_1 _0822_ (.A(_0137_),
    .B(_0142_),
    .C(_0222_),
    .Y(_0230_));
 sky130_fd_sc_hd__nand3_1 _0823_ (.A(_0157_),
    .B(spi_clk),
    .C(_0133_),
    .Y(_0231_));
 sky130_fd_sc_hd__and2_1 _0824_ (.A(_0230_),
    .B(_0231_),
    .X(_0232_));
 sky130_fd_sc_hd__nand3_1 _0825_ (.A(_0143_),
    .B(_0222_),
    .C(_0185_),
    .Y(_0233_));
 sky130_fd_sc_hd__nand3_2 _0826_ (.A(_0229_),
    .B(_0232_),
    .C(_0233_),
    .Y(_0234_));
 sky130_fd_sc_hd__inv_2 _0827_ (.A(_0234_),
    .Y(_0235_));
 sky130_fd_sc_hd__nand2_1 _0828_ (.A(_0224_),
    .B(_0235_),
    .Y(_0236_));
 sky130_fd_sc_hd__nand2_1 _0829_ (.A(_0234_),
    .B(net184),
    .Y(_0237_));
 sky130_fd_sc_hd__nand2_1 _0830_ (.A(_0236_),
    .B(net185),
    .Y(_0007_));
 sky130_fd_sc_hd__a22o_1 _0831_ (.A1(net62),
    .A2(_0222_),
    .B1(_0226_),
    .B2(_0227_),
    .X(_0238_));
 sky130_fd_sc_hd__a21o_1 _0832_ (.A1(_0202_),
    .A2(\address[0] ),
    .B1(\address_nibble[2] ),
    .X(_0239_));
 sky130_fd_sc_hd__or2_1 _0833_ (.A(\address_nibble[0] ),
    .B(\address[4] ),
    .X(_0240_));
 sky130_fd_sc_hd__o211a_1 _0834_ (.A1(\address[8] ),
    .A2(_0189_),
    .B1(\address_nibble[1] ),
    .C1(_0240_),
    .X(_0241_));
 sky130_fd_sc_hd__inv_2 _0835_ (.A(net212),
    .Y(_0242_));
 sky130_fd_sc_hd__a21oi_1 _0836_ (.A1(_0201_),
    .A2(\address[10] ),
    .B1(_0242_),
    .Y(_0243_));
 sky130_fd_sc_hd__nor2_2 _0837_ (.A(\address_nibble[0] ),
    .B(_0199_),
    .Y(_0244_));
 sky130_fd_sc_hd__nand2_1 _0838_ (.A(_0244_),
    .B(\address[18] ),
    .Y(_0245_));
 sky130_fd_sc_hd__nand2_1 _0839_ (.A(_0202_),
    .B(\address[14] ),
    .Y(_0246_));
 sky130_fd_sc_hd__nand3_1 _0840_ (.A(_0243_),
    .B(_0245_),
    .C(_0246_),
    .Y(_0247_));
 sky130_fd_sc_hd__o211ai_1 _0841_ (.A1(_0239_),
    .A2(_0241_),
    .B1(_0196_),
    .C1(_0247_),
    .Y(_0248_));
 sky130_fd_sc_hd__a21o_1 _0842_ (.A1(_0209_),
    .A2(net196),
    .B1(_0159_),
    .X(_0249_));
 sky130_fd_sc_hd__a22oi_1 _0843_ (.A1(_0213_),
    .A2(net172),
    .B1(_0211_),
    .B2(net177),
    .Y(_0250_));
 sky130_fd_sc_hd__inv_2 _0844_ (.A(_0207_),
    .Y(_0251_));
 sky130_fd_sc_hd__nand2_1 _0845_ (.A(_0251_),
    .B(\data_buf[13] ),
    .Y(_0252_));
 sky130_fd_sc_hd__nand3b_1 _0846_ (.A_N(_0249_),
    .B(_0250_),
    .C(_0252_),
    .Y(_0253_));
 sky130_fd_sc_hd__a21o_1 _0847_ (.A1(_0209_),
    .A2(net189),
    .B1(_0160_),
    .X(_0254_));
 sky130_fd_sc_hd__a22oi_1 _0848_ (.A1(_0213_),
    .A2(\data_buf[17] ),
    .B1(_0211_),
    .B2(\data_buf[21] ),
    .Y(_0255_));
 sky130_fd_sc_hd__nand2_1 _0849_ (.A(_0251_),
    .B(net197),
    .Y(_0256_));
 sky130_fd_sc_hd__nand3b_1 _0850_ (.A_N(_0254_),
    .B(_0255_),
    .C(_0256_),
    .Y(_0257_));
 sky130_fd_sc_hd__nand3_1 _0851_ (.A(_0253_),
    .B(_0257_),
    .C(_0169_),
    .Y(_0258_));
 sky130_fd_sc_hd__nand3b_1 _0852_ (.A_N(_0238_),
    .B(_0248_),
    .C(_0258_),
    .Y(_0259_));
 sky130_fd_sc_hd__nand2_1 _0853_ (.A(_0259_),
    .B(_0235_),
    .Y(_0260_));
 sky130_fd_sc_hd__nand2_1 _0854_ (.A(_0234_),
    .B(net203),
    .Y(_0261_));
 sky130_fd_sc_hd__nand2_1 _0855_ (.A(_0260_),
    .B(net204),
    .Y(_0008_));
 sky130_fd_sc_hd__a21o_1 _0856_ (.A1(_0244_),
    .A2(\address[19] ),
    .B1(_0242_),
    .X(_0262_));
 sky130_fd_sc_hd__a22o_1 _0857_ (.A1(_0201_),
    .A2(\address[11] ),
    .B1(_0202_),
    .B2(\address[15] ),
    .X(_0263_));
 sky130_fd_sc_hd__a21o_1 _0858_ (.A1(_0202_),
    .A2(\address[1] ),
    .B1(net212),
    .X(_0264_));
 sky130_fd_sc_hd__a21o_1 _0859_ (.A1(\address[5] ),
    .A2(_0244_),
    .B1(_0264_),
    .X(_0265_));
 sky130_fd_sc_hd__o211ai_1 _0860_ (.A1(_0262_),
    .A2(_0263_),
    .B1(_0196_),
    .C1(_0265_),
    .Y(_0266_));
 sky130_fd_sc_hd__inv_2 _0861_ (.A(net148),
    .Y(_0267_));
 sky130_fd_sc_hd__nand2_1 _0862_ (.A(_0209_),
    .B(net201),
    .Y(_0268_));
 sky130_fd_sc_hd__nand2_1 _0863_ (.A(_0211_),
    .B(net173),
    .Y(_0269_));
 sky130_fd_sc_hd__a21oi_1 _0864_ (.A1(_0213_),
    .A2(net187),
    .B1(_0160_),
    .Y(_0270_));
 sky130_fd_sc_hd__o2111ai_1 _0865_ (.A1(_0267_),
    .A2(_0207_),
    .B1(_0268_),
    .C1(_0269_),
    .D1(_0270_),
    .Y(_0271_));
 sky130_fd_sc_hd__inv_2 _0866_ (.A(net180),
    .Y(_0272_));
 sky130_fd_sc_hd__nand2_1 _0867_ (.A(_0209_),
    .B(net166),
    .Y(_0273_));
 sky130_fd_sc_hd__nand2_1 _0868_ (.A(_0211_),
    .B(net191),
    .Y(_0274_));
 sky130_fd_sc_hd__a21oi_1 _0869_ (.A1(_0213_),
    .A2(net202),
    .B1(_0159_),
    .Y(_0275_));
 sky130_fd_sc_hd__o2111ai_1 _0870_ (.A1(_0272_),
    .A2(_0207_),
    .B1(_0273_),
    .C1(_0274_),
    .D1(_0275_),
    .Y(_0276_));
 sky130_fd_sc_hd__nand3_1 _0871_ (.A(_0271_),
    .B(_0276_),
    .C(_0169_),
    .Y(_0277_));
 sky130_fd_sc_hd__nand2_1 _0872_ (.A(_0222_),
    .B(net72),
    .Y(_0278_));
 sky130_fd_sc_hd__nand3_1 _0873_ (.A(_0266_),
    .B(_0277_),
    .C(_0278_),
    .Y(_0279_));
 sky130_fd_sc_hd__nand2_1 _0874_ (.A(_0279_),
    .B(_0235_),
    .Y(_0280_));
 sky130_fd_sc_hd__nand2_1 _0875_ (.A(_0234_),
    .B(net217),
    .Y(_0281_));
 sky130_fd_sc_hd__nand2_1 _0876_ (.A(_0280_),
    .B(net218),
    .Y(_0009_));
 sky130_fd_sc_hd__o2bb2a_1 _0877_ (.A1_N(net73),
    .A2_N(_0222_),
    .B1(net71),
    .B2(_0228_),
    .X(_0282_));
 sky130_fd_sc_hd__a22oi_1 _0878_ (.A1(_0251_),
    .A2(net182),
    .B1(net162),
    .B2(_0209_),
    .Y(_0283_));
 sky130_fd_sc_hd__a22oi_1 _0879_ (.A1(_0213_),
    .A2(\data_buf[19] ),
    .B1(_0211_),
    .B2(\data_buf[23] ),
    .Y(_0284_));
 sky130_fd_sc_hd__nand2_1 _0880_ (.A(_0283_),
    .B(_0284_),
    .Y(_0285_));
 sky130_fd_sc_hd__nand2_1 _0881_ (.A(_0285_),
    .B(_0159_),
    .Y(_0286_));
 sky130_fd_sc_hd__a22oi_1 _0882_ (.A1(_0251_),
    .A2(\data_buf[15] ),
    .B1(net190),
    .B2(_0209_),
    .Y(_0287_));
 sky130_fd_sc_hd__a22oi_1 _0883_ (.A1(_0213_),
    .A2(\data_buf[3] ),
    .B1(_0211_),
    .B2(\data_buf[7] ),
    .Y(_0288_));
 sky130_fd_sc_hd__nand2_1 _0884_ (.A(_0287_),
    .B(_0288_),
    .Y(_0289_));
 sky130_fd_sc_hd__nand2_1 _0885_ (.A(_0289_),
    .B(_0160_),
    .Y(_0290_));
 sky130_fd_sc_hd__nand2_1 _0886_ (.A(_0286_),
    .B(_0290_),
    .Y(_0291_));
 sky130_fd_sc_hd__nand2_1 _0887_ (.A(_0291_),
    .B(_0169_),
    .Y(_0292_));
 sky130_fd_sc_hd__nand2_1 _0888_ (.A(_0202_),
    .B(\address[16] ),
    .Y(_0293_));
 sky130_fd_sc_hd__nand2_1 _0889_ (.A(_0244_),
    .B(\address[20] ),
    .Y(_0294_));
 sky130_fd_sc_hd__nand2_1 _0890_ (.A(_0201_),
    .B(\address[12] ),
    .Y(_0295_));
 sky130_fd_sc_hd__a31o_1 _0891_ (.A1(_0293_),
    .A2(_0294_),
    .A3(_0295_),
    .B1(_0242_),
    .X(_0296_));
 sky130_fd_sc_hd__a22o_1 _0892_ (.A1(_0202_),
    .A2(\address[2] ),
    .B1(\address[6] ),
    .B2(_0244_),
    .X(_0297_));
 sky130_fd_sc_hd__nand2_1 _0893_ (.A(_0297_),
    .B(_0242_),
    .Y(_0298_));
 sky130_fd_sc_hd__nand2_1 _0894_ (.A(_0296_),
    .B(_0298_),
    .Y(_0299_));
 sky130_fd_sc_hd__nand2_1 _0895_ (.A(_0299_),
    .B(_0196_),
    .Y(_0300_));
 sky130_fd_sc_hd__nand3_1 _0896_ (.A(_0282_),
    .B(_0292_),
    .C(_0300_),
    .Y(_0301_));
 sky130_fd_sc_hd__nand2_1 _0897_ (.A(_0301_),
    .B(_0235_),
    .Y(_0302_));
 sky130_fd_sc_hd__nand2_1 _0898_ (.A(_0234_),
    .B(net193),
    .Y(_0303_));
 sky130_fd_sc_hd__nand2_1 _0899_ (.A(_0302_),
    .B(net194),
    .Y(_0010_));
 sky130_fd_sc_hd__nor2_1 _0900_ (.A(_0138_),
    .B(_0147_),
    .Y(_0304_));
 sky130_fd_sc_hd__a21o_1 _0901_ (.A1(_0154_),
    .A2(net150),
    .B1(_0304_),
    .X(_0305_));
 sky130_fd_sc_hd__clkbuf_8 _0902_ (.A(_0305_),
    .X(_0306_));
 sky130_fd_sc_hd__mux2_1 _0903_ (.A0(net260),
    .A1(net157),
    .S(_0306_),
    .X(_0307_));
 sky130_fd_sc_hd__clkbuf_1 _0904_ (.A(_0307_),
    .X(_0011_));
 sky130_fd_sc_hd__mux2_1 _0905_ (.A0(net273),
    .A1(net172),
    .S(_0306_),
    .X(_0308_));
 sky130_fd_sc_hd__clkbuf_1 _0906_ (.A(_0308_),
    .X(_0012_));
 sky130_fd_sc_hd__mux2_1 _0907_ (.A0(net282),
    .A1(net202),
    .S(_0306_),
    .X(_0309_));
 sky130_fd_sc_hd__clkbuf_1 _0908_ (.A(_0309_),
    .X(_0013_));
 sky130_fd_sc_hd__mux2_1 _0909_ (.A0(net301),
    .A1(net233),
    .S(_0306_),
    .X(_0310_));
 sky130_fd_sc_hd__clkbuf_1 _0910_ (.A(_0310_),
    .X(_0014_));
 sky130_fd_sc_hd__mux2_1 _0911_ (.A0(net274),
    .A1(net170),
    .S(_0306_),
    .X(_0311_));
 sky130_fd_sc_hd__clkbuf_1 _0912_ (.A(_0311_),
    .X(_0015_));
 sky130_fd_sc_hd__mux2_1 _0913_ (.A0(net277),
    .A1(net177),
    .S(_0306_),
    .X(_0312_));
 sky130_fd_sc_hd__clkbuf_1 _0914_ (.A(_0312_),
    .X(_0016_));
 sky130_fd_sc_hd__mux2_1 _0915_ (.A0(net288),
    .A1(net191),
    .S(_0306_),
    .X(_0313_));
 sky130_fd_sc_hd__clkbuf_1 _0916_ (.A(_0313_),
    .X(_0017_));
 sky130_fd_sc_hd__mux2_1 _0917_ (.A0(net297),
    .A1(net206),
    .S(_0306_),
    .X(_0314_));
 sky130_fd_sc_hd__clkbuf_1 _0918_ (.A(_0314_),
    .X(_0018_));
 sky130_fd_sc_hd__mux2_1 _0919_ (.A0(net286),
    .A1(net156),
    .S(_0306_),
    .X(_0315_));
 sky130_fd_sc_hd__clkbuf_1 _0920_ (.A(_0315_),
    .X(_0019_));
 sky130_fd_sc_hd__mux2_1 _0921_ (.A0(net283),
    .A1(net196),
    .S(_0306_),
    .X(_0316_));
 sky130_fd_sc_hd__clkbuf_1 _0922_ (.A(_0316_),
    .X(_0020_));
 sky130_fd_sc_hd__mux2_1 _0923_ (.A0(net292),
    .A1(net166),
    .S(_0306_),
    .X(_0317_));
 sky130_fd_sc_hd__clkbuf_1 _0924_ (.A(_0317_),
    .X(_0021_));
 sky130_fd_sc_hd__mux2_1 _0925_ (.A0(net281),
    .A1(net190),
    .S(_0306_),
    .X(_0318_));
 sky130_fd_sc_hd__clkbuf_1 _0926_ (.A(_0318_),
    .X(_0022_));
 sky130_fd_sc_hd__mux2_1 _0927_ (.A0(net280),
    .A1(net175),
    .S(_0306_),
    .X(_0319_));
 sky130_fd_sc_hd__clkbuf_1 _0928_ (.A(_0319_),
    .X(_0023_));
 sky130_fd_sc_hd__mux2_1 _0929_ (.A0(net289),
    .A1(net210),
    .S(_0306_),
    .X(_0320_));
 sky130_fd_sc_hd__clkbuf_1 _0930_ (.A(_0320_),
    .X(_0024_));
 sky130_fd_sc_hd__mux2_1 _0931_ (.A0(net293),
    .A1(net180),
    .S(_0306_),
    .X(_0321_));
 sky130_fd_sc_hd__clkbuf_1 _0932_ (.A(_0321_),
    .X(_0025_));
 sky130_fd_sc_hd__mux2_1 _0933_ (.A0(net298),
    .A1(net208),
    .S(_0306_),
    .X(_0322_));
 sky130_fd_sc_hd__clkbuf_1 _0934_ (.A(_0322_),
    .X(_0026_));
 sky130_fd_sc_hd__clkbuf_8 _0935_ (.A(_0305_),
    .X(_0323_));
 sky130_fd_sc_hd__mux2_1 _0936_ (.A0(net299),
    .A1(net215),
    .S(_0323_),
    .X(_0324_));
 sky130_fd_sc_hd__clkbuf_1 _0937_ (.A(_0324_),
    .X(_0027_));
 sky130_fd_sc_hd__mux2_1 _0938_ (.A0(net294),
    .A1(net214),
    .S(_0323_),
    .X(_0325_));
 sky130_fd_sc_hd__clkbuf_1 _0939_ (.A(_0325_),
    .X(_0028_));
 sky130_fd_sc_hd__mux2_1 _0940_ (.A0(net300),
    .A1(net187),
    .S(_0323_),
    .X(_0326_));
 sky130_fd_sc_hd__clkbuf_1 _0941_ (.A(_0326_),
    .X(_0029_));
 sky130_fd_sc_hd__mux2_1 _0942_ (.A0(net279),
    .A1(net199),
    .S(_0323_),
    .X(_0327_));
 sky130_fd_sc_hd__clkbuf_1 _0943_ (.A(_0327_),
    .X(_0030_));
 sky130_fd_sc_hd__mux2_1 _0944_ (.A0(net296),
    .A1(net247),
    .S(_0323_),
    .X(_0328_));
 sky130_fd_sc_hd__clkbuf_1 _0945_ (.A(_0328_),
    .X(_0031_));
 sky130_fd_sc_hd__mux2_1 _0946_ (.A0(net303),
    .A1(net245),
    .S(_0323_),
    .X(_0329_));
 sky130_fd_sc_hd__clkbuf_1 _0947_ (.A(_0329_),
    .X(_0032_));
 sky130_fd_sc_hd__mux2_1 _0948_ (.A0(net276),
    .A1(net173),
    .S(_0323_),
    .X(_0330_));
 sky130_fd_sc_hd__clkbuf_1 _0949_ (.A(_0330_),
    .X(_0033_));
 sky130_fd_sc_hd__mux2_1 _0950_ (.A0(net295),
    .A1(net223),
    .S(_0323_),
    .X(_0331_));
 sky130_fd_sc_hd__clkbuf_1 _0951_ (.A(_0331_),
    .X(_0034_));
 sky130_fd_sc_hd__mux2_1 _0952_ (.A0(net291),
    .A1(net179),
    .S(_0323_),
    .X(_0332_));
 sky130_fd_sc_hd__clkbuf_1 _0953_ (.A(_0332_),
    .X(_0035_));
 sky130_fd_sc_hd__mux2_1 _0954_ (.A0(net284),
    .A1(net189),
    .S(_0323_),
    .X(_0333_));
 sky130_fd_sc_hd__clkbuf_1 _0955_ (.A(_0333_),
    .X(_0036_));
 sky130_fd_sc_hd__mux2_1 _0956_ (.A0(net285),
    .A1(net201),
    .S(_0323_),
    .X(_0334_));
 sky130_fd_sc_hd__clkbuf_1 _0957_ (.A(_0334_),
    .X(_0037_));
 sky130_fd_sc_hd__mux2_1 _0958_ (.A0(net268),
    .A1(net162),
    .S(_0323_),
    .X(_0335_));
 sky130_fd_sc_hd__clkbuf_1 _0959_ (.A(_0335_),
    .X(_0038_));
 sky130_fd_sc_hd__mux2_1 _0960_ (.A0(net287),
    .A1(net146),
    .S(_0323_),
    .X(_0336_));
 sky130_fd_sc_hd__clkbuf_1 _0961_ (.A(_0336_),
    .X(_0039_));
 sky130_fd_sc_hd__mux2_1 _0962_ (.A0(net290),
    .A1(net197),
    .S(_0323_),
    .X(_0337_));
 sky130_fd_sc_hd__clkbuf_1 _0963_ (.A(_0337_),
    .X(_0040_));
 sky130_fd_sc_hd__mux2_1 _0964_ (.A0(net272),
    .A1(net148),
    .S(_0323_),
    .X(_0338_));
 sky130_fd_sc_hd__clkbuf_1 _0965_ (.A(_0338_),
    .X(_0041_));
 sky130_fd_sc_hd__mux2_1 _0966_ (.A0(net275),
    .A1(net182),
    .S(_0323_),
    .X(_0339_));
 sky130_fd_sc_hd__clkbuf_1 _0967_ (.A(_0339_),
    .X(_0042_));
 sky130_fd_sc_hd__inv_2 _0968_ (.A(_0173_),
    .Y(_0340_));
 sky130_fd_sc_hd__nand3_1 _0969_ (.A(_0143_),
    .B(_0340_),
    .C(_0185_),
    .Y(_0341_));
 sky130_fd_sc_hd__nand2_1 _0970_ (.A(_0341_),
    .B(_0230_),
    .Y(_0342_));
 sky130_fd_sc_hd__nand2_1 _0971_ (.A(_0201_),
    .B(_0242_),
    .Y(_0343_));
 sky130_fd_sc_hd__nand2_1 _0972_ (.A(_0192_),
    .B(_0343_),
    .Y(_0344_));
 sky130_fd_sc_hd__nand3_1 _0973_ (.A(_0156_),
    .B(_0157_),
    .C(_0164_),
    .Y(_0345_));
 sky130_fd_sc_hd__nand2_1 _0974_ (.A(_0344_),
    .B(_0345_),
    .Y(_0346_));
 sky130_fd_sc_hd__inv_2 _0975_ (.A(net69),
    .Y(_0347_));
 sky130_fd_sc_hd__nand2_1 _0976_ (.A(_0347_),
    .B(net70),
    .Y(_0348_));
 sky130_fd_sc_hd__nand2_1 _0977_ (.A(_0348_),
    .B(_0165_),
    .Y(_0349_));
 sky130_fd_sc_hd__nand2_1 _0978_ (.A(_0154_),
    .B(_0349_),
    .Y(_0350_));
 sky130_fd_sc_hd__nand2_1 _0979_ (.A(_0141_),
    .B(net67),
    .Y(_0351_));
 sky130_fd_sc_hd__nand2_1 _0980_ (.A(_0350_),
    .B(_0351_),
    .Y(_0352_));
 sky130_fd_sc_hd__nor2_1 _0981_ (.A(_0346_),
    .B(_0352_),
    .Y(_0353_));
 sky130_fd_sc_hd__nand2_1 _0982_ (.A(_0149_),
    .B(_0135_),
    .Y(_0354_));
 sky130_fd_sc_hd__nand2_1 _0983_ (.A(_0231_),
    .B(_0354_),
    .Y(_0355_));
 sky130_fd_sc_hd__nor2_1 _0984_ (.A(_0355_),
    .B(_0167_),
    .Y(_0356_));
 sky130_fd_sc_hd__inv_2 _0985_ (.A(_0175_),
    .Y(_0357_));
 sky130_fd_sc_hd__nor2_1 _0986_ (.A(_0164_),
    .B(_0357_),
    .Y(_0358_));
 sky130_fd_sc_hd__nand2_2 _0987_ (.A(_0172_),
    .B(_0194_),
    .Y(_0359_));
 sky130_fd_sc_hd__nor2_1 _0988_ (.A(_0162_),
    .B(_0359_),
    .Y(_0360_));
 sky130_fd_sc_hd__o21ai_1 _0989_ (.A1(_0178_),
    .A2(_0358_),
    .B1(_0360_),
    .Y(_0361_));
 sky130_fd_sc_hd__nand3_1 _0990_ (.A(_0353_),
    .B(_0356_),
    .C(_0361_),
    .Y(_0362_));
 sky130_fd_sc_hd__inv_2 _0991_ (.A(net44),
    .Y(_0363_));
 sky130_fd_sc_hd__inv_2 _0992_ (.A(net43),
    .Y(_0364_));
 sky130_fd_sc_hd__nand2_1 _0993_ (.A(_0363_),
    .B(_0364_),
    .Y(_0365_));
 sky130_fd_sc_hd__inv_2 _0994_ (.A(net42),
    .Y(_0366_));
 sky130_fd_sc_hd__inv_2 _0995_ (.A(net41),
    .Y(_0367_));
 sky130_fd_sc_hd__nand2_1 _0996_ (.A(_0366_),
    .B(_0367_),
    .Y(_0368_));
 sky130_fd_sc_hd__nor2_1 _0997_ (.A(_0365_),
    .B(_0368_),
    .Y(_0369_));
 sky130_fd_sc_hd__nor3_1 _0998_ (.A(net39),
    .B(net38),
    .C(net37),
    .Y(_0370_));
 sky130_fd_sc_hd__nand2_1 _0999_ (.A(_0369_),
    .B(_0370_),
    .Y(_0371_));
 sky130_fd_sc_hd__nor2_1 _1000_ (.A(net53),
    .B(net52),
    .Y(_0372_));
 sky130_fd_sc_hd__nor2_1 _1001_ (.A(net50),
    .B(net49),
    .Y(_0373_));
 sky130_fd_sc_hd__and2_1 _1002_ (.A(_0372_),
    .B(_0373_),
    .X(_0374_));
 sky130_fd_sc_hd__inv_2 _1003_ (.A(net48),
    .Y(_0375_));
 sky130_fd_sc_hd__inv_2 _1004_ (.A(net47),
    .Y(_0376_));
 sky130_fd_sc_hd__nand2_1 _1005_ (.A(_0375_),
    .B(_0376_),
    .Y(_0377_));
 sky130_fd_sc_hd__inv_2 _1006_ (.A(net46),
    .Y(_0378_));
 sky130_fd_sc_hd__inv_2 _1007_ (.A(net45),
    .Y(_0379_));
 sky130_fd_sc_hd__nand2_1 _1008_ (.A(_0378_),
    .B(_0379_),
    .Y(_0380_));
 sky130_fd_sc_hd__nor2_1 _1009_ (.A(_0377_),
    .B(_0380_),
    .Y(_0381_));
 sky130_fd_sc_hd__nand2_1 _1010_ (.A(_0374_),
    .B(_0381_),
    .Y(_0382_));
 sky130_fd_sc_hd__nor2_1 _1011_ (.A(_0371_),
    .B(_0382_),
    .Y(_0383_));
 sky130_fd_sc_hd__nand2_1 _1012_ (.A(spi_clk),
    .B(net67),
    .Y(_0384_));
 sky130_fd_sc_hd__nor2_1 _1013_ (.A(net66),
    .B(net65),
    .Y(_0385_));
 sky130_fd_sc_hd__nor2_1 _1014_ (.A(net64),
    .B(net63),
    .Y(_0386_));
 sky130_fd_sc_hd__nand3b_1 _1015_ (.A_N(_0384_),
    .B(_0385_),
    .C(_0386_),
    .Y(_0387_));
 sky130_fd_sc_hd__inv_2 _1016_ (.A(net61),
    .Y(_0388_));
 sky130_fd_sc_hd__inv_2 _1017_ (.A(net60),
    .Y(_0389_));
 sky130_fd_sc_hd__nand2_1 _1018_ (.A(_0388_),
    .B(_0389_),
    .Y(_0390_));
 sky130_fd_sc_hd__inv_2 _1019_ (.A(net59),
    .Y(_0391_));
 sky130_fd_sc_hd__inv_2 _1020_ (.A(net58),
    .Y(_0392_));
 sky130_fd_sc_hd__nand2_1 _1021_ (.A(_0391_),
    .B(_0392_),
    .Y(_0393_));
 sky130_fd_sc_hd__nor2_1 _1022_ (.A(_0390_),
    .B(_0393_),
    .Y(_0394_));
 sky130_fd_sc_hd__inv_2 _1023_ (.A(net57),
    .Y(_0395_));
 sky130_fd_sc_hd__inv_2 _1024_ (.A(net56),
    .Y(_0396_));
 sky130_fd_sc_hd__nand2_1 _1025_ (.A(_0395_),
    .B(_0396_),
    .Y(_0397_));
 sky130_fd_sc_hd__inv_2 _1026_ (.A(net55),
    .Y(_0398_));
 sky130_fd_sc_hd__inv_2 _1027_ (.A(net54),
    .Y(_0399_));
 sky130_fd_sc_hd__nand2_1 _1028_ (.A(_0398_),
    .B(_0399_),
    .Y(_0400_));
 sky130_fd_sc_hd__nor2_1 _1029_ (.A(_0397_),
    .B(_0400_),
    .Y(_0401_));
 sky130_fd_sc_hd__nand2_1 _1030_ (.A(_0394_),
    .B(_0401_),
    .Y(_0402_));
 sky130_fd_sc_hd__nor2_1 _1031_ (.A(_0387_),
    .B(_0402_),
    .Y(_0403_));
 sky130_fd_sc_hd__nand2_1 _1032_ (.A(_0383_),
    .B(_0403_),
    .Y(_0404_));
 sky130_fd_sc_hd__nand2_1 _1033_ (.A(_0404_),
    .B(_0150_),
    .Y(_0405_));
 sky130_fd_sc_hd__nor2_1 _1034_ (.A(net70),
    .B(_0347_),
    .Y(_0406_));
 sky130_fd_sc_hd__nand2_1 _1035_ (.A(_0358_),
    .B(_0406_),
    .Y(_0407_));
 sky130_fd_sc_hd__nor2_2 _1036_ (.A(_0154_),
    .B(_0169_),
    .Y(_0408_));
 sky130_fd_sc_hd__nor2_1 _1037_ (.A(_0407_),
    .B(_0408_),
    .Y(_0409_));
 sky130_fd_sc_hd__nand3_1 _1038_ (.A(_0169_),
    .B(_0178_),
    .C(_0163_),
    .Y(_0410_));
 sky130_fd_sc_hd__nor2_1 _1039_ (.A(_0164_),
    .B(_0163_),
    .Y(_0411_));
 sky130_fd_sc_hd__nand3_1 _1040_ (.A(_0169_),
    .B(_0411_),
    .C(net70),
    .Y(_0412_));
 sky130_fd_sc_hd__nand2_1 _1041_ (.A(_0410_),
    .B(_0412_),
    .Y(_0413_));
 sky130_fd_sc_hd__nor2_1 _1042_ (.A(_0409_),
    .B(_0413_),
    .Y(_0414_));
 sky130_fd_sc_hd__nand2_1 _1043_ (.A(_0405_),
    .B(_0414_),
    .Y(_0415_));
 sky130_fd_sc_hd__nor3_2 _1044_ (.A(_0342_),
    .B(_0362_),
    .C(_0415_),
    .Y(_0416_));
 sky130_fd_sc_hd__nand2_1 _1045_ (.A(_0169_),
    .B(_0163_),
    .Y(_0417_));
 sky130_fd_sc_hd__nor3_1 _1046_ (.A(_0164_),
    .B(_0159_),
    .C(_0417_),
    .Y(_0418_));
 sky130_fd_sc_hd__nor2_1 _1047_ (.A(_0173_),
    .B(_0143_),
    .Y(_0419_));
 sky130_fd_sc_hd__nor2_1 _1048_ (.A(_0418_),
    .B(_0419_),
    .Y(_0420_));
 sky130_fd_sc_hd__nand2_1 _1049_ (.A(_0420_),
    .B(_0233_),
    .Y(_0421_));
 sky130_fd_sc_hd__inv_2 _1050_ (.A(_0421_),
    .Y(_0422_));
 sky130_fd_sc_hd__buf_6 _1051_ (.A(_0422_),
    .X(_0423_));
 sky130_fd_sc_hd__nor2_1 _1052_ (.A(_0304_),
    .B(_0170_),
    .Y(_0424_));
 sky130_fd_sc_hd__inv_2 _1053_ (.A(_0225_),
    .Y(_0425_));
 sky130_fd_sc_hd__and3_1 _1054_ (.A(_0424_),
    .B(_0425_),
    .C(_0195_),
    .X(_0426_));
 sky130_fd_sc_hd__clkinv_4 _1055_ (.A(_0174_),
    .Y(_0427_));
 sky130_fd_sc_hd__nand3_1 _1056_ (.A(_0426_),
    .B(_0359_),
    .C(_0427_),
    .Y(_0428_));
 sky130_fd_sc_hd__nand3_1 _1057_ (.A(_0416_),
    .B(_0423_),
    .C(_0428_),
    .Y(_0429_));
 sky130_fd_sc_hd__nor2_1 _1058_ (.A(_0362_),
    .B(_0415_),
    .Y(_0430_));
 sky130_fd_sc_hd__inv_2 _1059_ (.A(_0342_),
    .Y(_0431_));
 sky130_fd_sc_hd__nand3_2 _1060_ (.A(_0430_),
    .B(_0422_),
    .C(_0431_),
    .Y(_0432_));
 sky130_fd_sc_hd__nand2_1 _1061_ (.A(_0432_),
    .B(net261),
    .Y(_0433_));
 sky130_fd_sc_hd__nand2_1 _1062_ (.A(_0429_),
    .B(net262),
    .Y(_0043_));
 sky130_fd_sc_hd__o211a_1 _1063_ (.A1(net264),
    .A2(_0138_),
    .B1(_0149_),
    .C1(_0134_),
    .X(_0434_));
 sky130_fd_sc_hd__nand3_1 _1064_ (.A(_0416_),
    .B(_0423_),
    .C(net265),
    .Y(_0435_));
 sky130_fd_sc_hd__nand2_1 _1065_ (.A(_0432_),
    .B(net158),
    .Y(_0436_));
 sky130_fd_sc_hd__nand2_1 _1066_ (.A(net266),
    .B(_0436_),
    .Y(_0044_));
 sky130_fd_sc_hd__o21ai_1 _1067_ (.A1(net159),
    .A2(_0194_),
    .B1(_0172_),
    .Y(_0437_));
 sky130_fd_sc_hd__a22o_1 _1068_ (.A1(net269),
    .A2(_0136_),
    .B1(_0151_),
    .B2(_0134_),
    .X(_0438_));
 sky130_fd_sc_hd__o2111ai_1 _1069_ (.A1(net71),
    .A2(_0193_),
    .B1(_0437_),
    .C1(_0173_),
    .D1(_0438_),
    .Y(_0439_));
 sky130_fd_sc_hd__nand3_1 _1070_ (.A(_0416_),
    .B(_0423_),
    .C(_0439_),
    .Y(_0440_));
 sky130_fd_sc_hd__nand2_1 _1071_ (.A(_0432_),
    .B(net264),
    .Y(_0441_));
 sky130_fd_sc_hd__nand2_1 _1072_ (.A(_0440_),
    .B(_0441_),
    .Y(_0045_));
 sky130_fd_sc_hd__nand2_1 _1073_ (.A(_0192_),
    .B(net71),
    .Y(_0442_));
 sky130_fd_sc_hd__and3_1 _1074_ (.A(_0226_),
    .B(_0424_),
    .C(_0442_),
    .X(_0443_));
 sky130_fd_sc_hd__nand2_1 _1075_ (.A(_0443_),
    .B(_0438_),
    .Y(_0444_));
 sky130_fd_sc_hd__nand3_1 _1076_ (.A(_0416_),
    .B(_0423_),
    .C(_0444_),
    .Y(_0445_));
 sky130_fd_sc_hd__nand2_1 _1077_ (.A(_0432_),
    .B(net269),
    .Y(_0446_));
 sky130_fd_sc_hd__nand2_1 _1078_ (.A(_0445_),
    .B(net270),
    .Y(_0046_));
 sky130_fd_sc_hd__nand2_1 _1079_ (.A(_0425_),
    .B(_0193_),
    .Y(_0447_));
 sky130_fd_sc_hd__mux2_1 _1080_ (.A0(_0447_),
    .A1(_0193_),
    .S(net306),
    .X(_0448_));
 sky130_fd_sc_hd__clkbuf_1 _1081_ (.A(_0448_),
    .X(_0047_));
 sky130_fd_sc_hd__nor2_1 _1082_ (.A(_0202_),
    .B(_0244_),
    .Y(_0449_));
 sky130_fd_sc_hd__o22a_1 _1083_ (.A1(_0193_),
    .A2(_0449_),
    .B1(net254),
    .B2(_0447_),
    .X(_0048_));
 sky130_fd_sc_hd__nand2_1 _1084_ (.A(_0447_),
    .B(_0201_),
    .Y(_0450_));
 sky130_fd_sc_hd__a22o_1 _1085_ (.A1(_0344_),
    .A2(_0447_),
    .B1(_0450_),
    .B2(net212),
    .X(_0049_));
 sky130_fd_sc_hd__clkbuf_8 _1086_ (.A(_0225_),
    .X(_0451_));
 sky130_fd_sc_hd__mux2_1 _1087_ (.A0(net232),
    .A1(net32),
    .S(_0451_),
    .X(_0452_));
 sky130_fd_sc_hd__clkbuf_1 _1088_ (.A(_0452_),
    .X(_0050_));
 sky130_fd_sc_hd__mux2_1 _1089_ (.A0(net225),
    .A1(net33),
    .S(_0451_),
    .X(_0453_));
 sky130_fd_sc_hd__clkbuf_1 _1090_ (.A(_0453_),
    .X(_0051_));
 sky130_fd_sc_hd__mux2_1 _1091_ (.A0(net238),
    .A1(net34),
    .S(_0451_),
    .X(_0454_));
 sky130_fd_sc_hd__clkbuf_1 _1092_ (.A(_0454_),
    .X(_0052_));
 sky130_fd_sc_hd__mux2_1 _1093_ (.A0(net237),
    .A1(net35),
    .S(_0451_),
    .X(_0455_));
 sky130_fd_sc_hd__clkbuf_1 _1094_ (.A(_0455_),
    .X(_0053_));
 sky130_fd_sc_hd__mux2_1 _1095_ (.A0(net220),
    .A1(net36),
    .S(_0451_),
    .X(_0456_));
 sky130_fd_sc_hd__clkbuf_1 _1096_ (.A(_0456_),
    .X(_0054_));
 sky130_fd_sc_hd__mux2_1 _1097_ (.A0(net235),
    .A1(net37),
    .S(_0451_),
    .X(_0457_));
 sky130_fd_sc_hd__clkbuf_1 _1098_ (.A(_0457_),
    .X(_0055_));
 sky130_fd_sc_hd__mux2_1 _1099_ (.A0(net251),
    .A1(net38),
    .S(_0451_),
    .X(_0458_));
 sky130_fd_sc_hd__clkbuf_1 _1100_ (.A(_0458_),
    .X(_0056_));
 sky130_fd_sc_hd__mux2_1 _1101_ (.A0(net229),
    .A1(net39),
    .S(_0451_),
    .X(_0459_));
 sky130_fd_sc_hd__clkbuf_1 _1102_ (.A(_0459_),
    .X(_0057_));
 sky130_fd_sc_hd__mux2_1 _1103_ (.A0(net252),
    .A1(net41),
    .S(_0451_),
    .X(_0460_));
 sky130_fd_sc_hd__clkbuf_1 _1104_ (.A(_0460_),
    .X(_0058_));
 sky130_fd_sc_hd__mux2_1 _1105_ (.A0(net228),
    .A1(net42),
    .S(_0451_),
    .X(_0461_));
 sky130_fd_sc_hd__clkbuf_1 _1106_ (.A(_0461_),
    .X(_0059_));
 sky130_fd_sc_hd__mux2_1 _1107_ (.A0(net241),
    .A1(net43),
    .S(_0451_),
    .X(_0462_));
 sky130_fd_sc_hd__clkbuf_1 _1108_ (.A(_0462_),
    .X(_0060_));
 sky130_fd_sc_hd__mux2_1 _1109_ (.A0(net236),
    .A1(net44),
    .S(_0451_),
    .X(_0463_));
 sky130_fd_sc_hd__clkbuf_1 _1110_ (.A(_0463_),
    .X(_0061_));
 sky130_fd_sc_hd__mux2_1 _1111_ (.A0(net239),
    .A1(net45),
    .S(_0451_),
    .X(_0464_));
 sky130_fd_sc_hd__clkbuf_1 _1112_ (.A(_0464_),
    .X(_0062_));
 sky130_fd_sc_hd__mux2_1 _1113_ (.A0(net240),
    .A1(net46),
    .S(_0451_),
    .X(_0465_));
 sky130_fd_sc_hd__clkbuf_1 _1114_ (.A(_0465_),
    .X(_0063_));
 sky130_fd_sc_hd__mux2_1 _1115_ (.A0(net253),
    .A1(net47),
    .S(_0451_),
    .X(_0466_));
 sky130_fd_sc_hd__clkbuf_1 _1116_ (.A(_0466_),
    .X(_0064_));
 sky130_fd_sc_hd__mux2_1 _1117_ (.A0(net242),
    .A1(net48),
    .S(_0451_),
    .X(_0467_));
 sky130_fd_sc_hd__clkbuf_1 _1118_ (.A(_0467_),
    .X(_0065_));
 sky130_fd_sc_hd__mux2_1 _1119_ (.A0(net256),
    .A1(net49),
    .S(_0225_),
    .X(_0468_));
 sky130_fd_sc_hd__clkbuf_1 _1120_ (.A(net257),
    .X(_0066_));
 sky130_fd_sc_hd__mux2_1 _1121_ (.A0(net243),
    .A1(net50),
    .S(_0225_),
    .X(_0469_));
 sky130_fd_sc_hd__clkbuf_1 _1122_ (.A(net244),
    .X(_0067_));
 sky130_fd_sc_hd__mux2_1 _1123_ (.A0(net249),
    .A1(net52),
    .S(_0225_),
    .X(_0470_));
 sky130_fd_sc_hd__clkbuf_1 _1124_ (.A(net250),
    .X(_0068_));
 sky130_fd_sc_hd__mux2_1 _1125_ (.A0(net226),
    .A1(net53),
    .S(_0225_),
    .X(_0471_));
 sky130_fd_sc_hd__clkbuf_1 _1126_ (.A(net227),
    .X(_0069_));
 sky130_fd_sc_hd__mux2_1 _1127_ (.A0(net258),
    .A1(net54),
    .S(_0225_),
    .X(_0472_));
 sky130_fd_sc_hd__clkbuf_1 _1128_ (.A(net259),
    .X(_0070_));
 sky130_fd_sc_hd__mux2_1 _1129_ (.A0(net230),
    .A1(net55),
    .S(_0225_),
    .X(_0473_));
 sky130_fd_sc_hd__clkbuf_1 _1130_ (.A(net231),
    .X(_0071_));
 sky130_fd_sc_hd__nor2_1 _1131_ (.A(has_2lc),
    .B(_0174_),
    .Y(_0474_));
 sky130_fd_sc_hd__o21bai_1 _1132_ (.A1(net163),
    .A2(_0427_),
    .B1_N(_0474_),
    .Y(_0475_));
 sky130_fd_sc_hd__inv_2 _1133_ (.A(_0475_),
    .Y(_0476_));
 sky130_fd_sc_hd__nor2_1 _1134_ (.A(_0427_),
    .B(_0143_),
    .Y(_0477_));
 sky130_fd_sc_hd__o21ai_1 _1135_ (.A1(_0192_),
    .A2(_0174_),
    .B1(_0344_),
    .Y(_0478_));
 sky130_fd_sc_hd__nor2_1 _1136_ (.A(_0477_),
    .B(_0478_),
    .Y(_0479_));
 sky130_fd_sc_hd__o31ai_4 _1137_ (.A1(_0185_),
    .A2(_0427_),
    .A3(net76),
    .B1(_0479_),
    .Y(_0480_));
 sky130_fd_sc_hd__nand2_1 _1138_ (.A(_0480_),
    .B(net163),
    .Y(_0481_));
 sky130_fd_sc_hd__o21ai_1 _1139_ (.A1(_0476_),
    .A2(_0480_),
    .B1(net164),
    .Y(_0072_));
 sky130_fd_sc_hd__inv_2 _1140_ (.A(_0180_),
    .Y(_0482_));
 sky130_fd_sc_hd__nand2_1 _1141_ (.A(net137),
    .B(\latency[0] ),
    .Y(_0483_));
 sky130_fd_sc_hd__nand2_1 _1142_ (.A(_0482_),
    .B(_0483_),
    .Y(_0484_));
 sky130_fd_sc_hd__a21o_1 _1143_ (.A1(_0174_),
    .A2(_0484_),
    .B1(_0474_),
    .X(_0485_));
 sky130_fd_sc_hd__or2b_1 _1144_ (.A(_0480_),
    .B_N(_0485_),
    .X(_0486_));
 sky130_fd_sc_hd__nand2_1 _1145_ (.A(_0480_),
    .B(net137),
    .Y(_0487_));
 sky130_fd_sc_hd__nand2_1 _1146_ (.A(_0486_),
    .B(net138),
    .Y(_0073_));
 sky130_fd_sc_hd__or2b_1 _1147_ (.A(net167),
    .B_N(_0180_),
    .X(_0488_));
 sky130_fd_sc_hd__nand2_1 _1148_ (.A(_0482_),
    .B(net167),
    .Y(_0489_));
 sky130_fd_sc_hd__a21o_1 _1149_ (.A1(_0488_),
    .A2(_0489_),
    .B1(_0427_),
    .X(_0490_));
 sky130_fd_sc_hd__nand2_1 _1150_ (.A(_0480_),
    .B(net167),
    .Y(_0491_));
 sky130_fd_sc_hd__o21ai_1 _1151_ (.A1(_0490_),
    .A2(_0480_),
    .B1(net168),
    .Y(_0074_));
 sky130_fd_sc_hd__nand2_1 _1152_ (.A(_0488_),
    .B(net143),
    .Y(_0492_));
 sky130_fd_sc_hd__a31o_1 _1153_ (.A1(_0174_),
    .A2(_0182_),
    .A3(_0492_),
    .B1(_0474_),
    .X(_0493_));
 sky130_fd_sc_hd__nand2_1 _1154_ (.A(_0480_),
    .B(net143),
    .Y(_0494_));
 sky130_fd_sc_hd__o21ai_1 _1155_ (.A1(_0493_),
    .A2(_0480_),
    .B1(net144),
    .Y(_0075_));
 sky130_fd_sc_hd__inv_2 _1156_ (.A(_0183_),
    .Y(_0495_));
 sky130_fd_sc_hd__clkinvlp_2 _1157_ (.A(_0182_),
    .Y(_0496_));
 sky130_fd_sc_hd__nor2_1 _1158_ (.A(net140),
    .B(_0496_),
    .Y(_0497_));
 sky130_fd_sc_hd__a211o_1 _1159_ (.A1(_0495_),
    .A2(_0496_),
    .B1(_0497_),
    .C1(_0427_),
    .X(_0498_));
 sky130_fd_sc_hd__nand2_1 _1160_ (.A(_0480_),
    .B(net140),
    .Y(_0499_));
 sky130_fd_sc_hd__o21ai_1 _1161_ (.A1(_0498_),
    .A2(_0480_),
    .B1(net141),
    .Y(_0076_));
 sky130_fd_sc_hd__nand2_1 _1162_ (.A(_0495_),
    .B(_0184_),
    .Y(_0500_));
 sky130_fd_sc_hd__nand2_1 _1163_ (.A(_0183_),
    .B(net153),
    .Y(_0501_));
 sky130_fd_sc_hd__nand3_1 _1164_ (.A(_0500_),
    .B(_0174_),
    .C(_0501_),
    .Y(_0502_));
 sky130_fd_sc_hd__nand2_1 _1165_ (.A(_0480_),
    .B(net153),
    .Y(_0503_));
 sky130_fd_sc_hd__o21ai_1 _1166_ (.A1(_0502_),
    .A2(_0480_),
    .B1(net154),
    .Y(_0077_));
 sky130_fd_sc_hd__and3_1 _1167_ (.A(_0192_),
    .B(_0242_),
    .C(_0244_),
    .X(_0504_));
 sky130_fd_sc_hd__mux2_1 _1168_ (.A0(net221),
    .A1(net2),
    .S(_0504_),
    .X(_0505_));
 sky130_fd_sc_hd__clkbuf_1 _1169_ (.A(net222),
    .X(_0078_));
 sky130_fd_sc_hd__nand2_2 _1170_ (.A(_0427_),
    .B(_0408_),
    .Y(_0506_));
 sky130_fd_sc_hd__and2_1 _1171_ (.A(_0186_),
    .B(_0506_),
    .X(_0507_));
 sky130_fd_sc_hd__o211ai_4 _1172_ (.A1(_0165_),
    .A2(_0408_),
    .B1(_0506_),
    .C1(_0186_),
    .Y(_0508_));
 sky130_fd_sc_hd__o22ai_1 _1173_ (.A1(_0165_),
    .A2(_0507_),
    .B1(_0222_),
    .B2(_0508_),
    .Y(_0079_));
 sky130_fd_sc_hd__inv_2 _1174_ (.A(_0408_),
    .Y(_0509_));
 sky130_fd_sc_hd__nand2_1 _1175_ (.A(_0509_),
    .B(_0208_),
    .Y(_0510_));
 sky130_fd_sc_hd__nand2_1 _1176_ (.A(_0508_),
    .B(net302),
    .Y(_0511_));
 sky130_fd_sc_hd__o21ai_1 _1177_ (.A1(_0510_),
    .A2(_0508_),
    .B1(_0511_),
    .Y(_0080_));
 sky130_fd_sc_hd__nor2_1 _1178_ (.A(_0159_),
    .B(_0208_),
    .Y(_0512_));
 sky130_fd_sc_hd__o21ai_1 _1179_ (.A1(_0161_),
    .A2(_0512_),
    .B1(_0509_),
    .Y(_0513_));
 sky130_fd_sc_hd__nand2_1 _1180_ (.A(_0508_),
    .B(_0159_),
    .Y(_0514_));
 sky130_fd_sc_hd__o21ai_1 _1181_ (.A1(_0513_),
    .A2(_0508_),
    .B1(_0514_),
    .Y(_0081_));
 sky130_fd_sc_hd__nand2_2 _1182_ (.A(_0357_),
    .B(_0165_),
    .Y(_0515_));
 sky130_fd_sc_hd__nor3_1 _1183_ (.A(_0176_),
    .B(_0515_),
    .C(_0417_),
    .Y(_0516_));
 sky130_fd_sc_hd__nand2_4 _1184_ (.A(_0161_),
    .B(_0165_),
    .Y(_0517_));
 sky130_fd_sc_hd__a31o_1 _1185_ (.A1(_0517_),
    .A2(_0165_),
    .A3(_0163_),
    .B1(_0158_),
    .X(_0518_));
 sky130_fd_sc_hd__nand3b_1 _1186_ (.A_N(_0516_),
    .B(_0506_),
    .C(_0518_),
    .Y(_0519_));
 sky130_fd_sc_hd__nor2_1 _1187_ (.A(_0342_),
    .B(_0519_),
    .Y(_0520_));
 sky130_fd_sc_hd__nand2_1 _1188_ (.A(_0520_),
    .B(_0422_),
    .Y(_0521_));
 sky130_fd_sc_hd__buf_6 _1189_ (.A(_0521_),
    .X(_0522_));
 sky130_fd_sc_hd__nand2_1 _1190_ (.A(_0522_),
    .B(net157),
    .Y(_0523_));
 sky130_fd_sc_hd__nand2_4 _1191_ (.A(_0213_),
    .B(_0160_),
    .Y(_0524_));
 sky130_fd_sc_hd__mux2_1 _1192_ (.A0(\delayed_miso[0] ),
    .A1(net157),
    .S(_0524_),
    .X(_0525_));
 sky130_fd_sc_hd__inv_2 _1193_ (.A(_0226_),
    .Y(_0526_));
 sky130_fd_sc_hd__buf_4 _1194_ (.A(_0526_),
    .X(_0527_));
 sky130_fd_sc_hd__and2_1 _1195_ (.A(_0527_),
    .B(net7),
    .X(_0528_));
 sky130_fd_sc_hd__a21o_1 _1196_ (.A1(_0525_),
    .A2(_0155_),
    .B1(_0528_),
    .X(_0529_));
 sky130_fd_sc_hd__buf_6 _1197_ (.A(_0520_),
    .X(_0530_));
 sky130_fd_sc_hd__nand3_1 _1198_ (.A(_0529_),
    .B(_0530_),
    .C(_0423_),
    .Y(_0531_));
 sky130_fd_sc_hd__nand2_1 _1199_ (.A(_0523_),
    .B(_0531_),
    .Y(_0082_));
 sky130_fd_sc_hd__nand2_1 _1200_ (.A(_0522_),
    .B(net172),
    .Y(_0532_));
 sky130_fd_sc_hd__mux2_1 _1201_ (.A0(\delayed_miso[1] ),
    .A1(net172),
    .S(_0524_),
    .X(_0533_));
 sky130_fd_sc_hd__and2_1 _1202_ (.A(_0527_),
    .B(net18),
    .X(_0534_));
 sky130_fd_sc_hd__a21o_1 _1203_ (.A1(_0533_),
    .A2(_0155_),
    .B1(_0534_),
    .X(_0535_));
 sky130_fd_sc_hd__nand3_1 _1204_ (.A(_0535_),
    .B(_0530_),
    .C(_0423_),
    .Y(_0536_));
 sky130_fd_sc_hd__nand2_1 _1205_ (.A(_0532_),
    .B(_0536_),
    .Y(_0083_));
 sky130_fd_sc_hd__nand2_1 _1206_ (.A(_0522_),
    .B(net202),
    .Y(_0537_));
 sky130_fd_sc_hd__mux2_1 _1207_ (.A0(\delayed_miso[2] ),
    .A1(net202),
    .S(_0524_),
    .X(_0538_));
 sky130_fd_sc_hd__buf_4 _1208_ (.A(_0154_),
    .X(_0539_));
 sky130_fd_sc_hd__and2_1 _1209_ (.A(_0527_),
    .B(net29),
    .X(_0540_));
 sky130_fd_sc_hd__a21o_1 _1210_ (.A1(_0538_),
    .A2(_0539_),
    .B1(_0540_),
    .X(_0541_));
 sky130_fd_sc_hd__buf_6 _1211_ (.A(_0422_),
    .X(_0542_));
 sky130_fd_sc_hd__nand3_1 _1212_ (.A(_0541_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0543_));
 sky130_fd_sc_hd__nand2_1 _1213_ (.A(_0537_),
    .B(_0543_),
    .Y(_0084_));
 sky130_fd_sc_hd__nand2_1 _1214_ (.A(_0522_),
    .B(net233),
    .Y(_0544_));
 sky130_fd_sc_hd__mux2_1 _1215_ (.A0(\delayed_miso[3] ),
    .A1(net233),
    .S(_0524_),
    .X(_0545_));
 sky130_fd_sc_hd__and2_1 _1216_ (.A(_0527_),
    .B(net40),
    .X(_0546_));
 sky130_fd_sc_hd__a21o_1 _1217_ (.A1(_0545_),
    .A2(_0539_),
    .B1(_0546_),
    .X(_0547_));
 sky130_fd_sc_hd__nand3_1 _1218_ (.A(_0547_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0548_));
 sky130_fd_sc_hd__nand2_1 _1219_ (.A(_0544_),
    .B(_0548_),
    .Y(_0085_));
 sky130_fd_sc_hd__nand2_1 _1220_ (.A(_0522_),
    .B(net170),
    .Y(_0549_));
 sky130_fd_sc_hd__nand2_1 _1221_ (.A(_0211_),
    .B(_0160_),
    .Y(_0550_));
 sky130_fd_sc_hd__inv_2 _1222_ (.A(_0213_),
    .Y(_0551_));
 sky130_fd_sc_hd__nand3_2 _1223_ (.A(_0551_),
    .B(_0160_),
    .C(_0207_),
    .Y(_0552_));
 sky130_fd_sc_hd__nand2_1 _1224_ (.A(_0524_),
    .B(\delayed_miso[0] ),
    .Y(_0553_));
 sky130_fd_sc_hd__or2_1 _1225_ (.A(_0165_),
    .B(_0553_),
    .X(_0554_));
 sky130_fd_sc_hd__o2bb2ai_1 _1226_ (.A1_N(net170),
    .A2_N(_0550_),
    .B1(_0552_),
    .B2(_0554_),
    .Y(_0555_));
 sky130_fd_sc_hd__nand2_1 _1227_ (.A(_0555_),
    .B(_0155_),
    .Y(_0556_));
 sky130_fd_sc_hd__buf_4 _1228_ (.A(_0526_),
    .X(_0557_));
 sky130_fd_sc_hd__nand2_1 _1229_ (.A(_0557_),
    .B(net51),
    .Y(_0558_));
 sky130_fd_sc_hd__nand2_1 _1230_ (.A(_0556_),
    .B(_0558_),
    .Y(_0559_));
 sky130_fd_sc_hd__nand3_1 _1231_ (.A(_0559_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0560_));
 sky130_fd_sc_hd__nand2_1 _1232_ (.A(_0549_),
    .B(_0560_),
    .Y(_0086_));
 sky130_fd_sc_hd__nand2_1 _1233_ (.A(_0522_),
    .B(net177),
    .Y(_0561_));
 sky130_fd_sc_hd__nand2_1 _1234_ (.A(_0524_),
    .B(\delayed_miso[1] ),
    .Y(_0562_));
 sky130_fd_sc_hd__or2_1 _1235_ (.A(_0165_),
    .B(_0562_),
    .X(_0563_));
 sky130_fd_sc_hd__o2bb2ai_1 _1236_ (.A1_N(net177),
    .A2_N(_0550_),
    .B1(_0552_),
    .B2(_0563_),
    .Y(_0564_));
 sky130_fd_sc_hd__nand2_1 _1237_ (.A(_0564_),
    .B(_0155_),
    .Y(_0565_));
 sky130_fd_sc_hd__nand2_1 _1238_ (.A(_0557_),
    .B(net62),
    .Y(_0566_));
 sky130_fd_sc_hd__nand2_1 _1239_ (.A(_0565_),
    .B(_0566_),
    .Y(_0567_));
 sky130_fd_sc_hd__nand3_1 _1240_ (.A(_0567_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0568_));
 sky130_fd_sc_hd__nand2_1 _1241_ (.A(_0561_),
    .B(_0568_),
    .Y(_0087_));
 sky130_fd_sc_hd__nand2_1 _1242_ (.A(_0522_),
    .B(net191),
    .Y(_0569_));
 sky130_fd_sc_hd__nand2_1 _1243_ (.A(_0524_),
    .B(\delayed_miso[2] ),
    .Y(_0570_));
 sky130_fd_sc_hd__or2_1 _1244_ (.A(_0165_),
    .B(_0570_),
    .X(_0571_));
 sky130_fd_sc_hd__o2bb2ai_1 _1245_ (.A1_N(net191),
    .A2_N(_0550_),
    .B1(_0552_),
    .B2(_0571_),
    .Y(_0572_));
 sky130_fd_sc_hd__nand2_1 _1246_ (.A(_0572_),
    .B(_0155_),
    .Y(_0573_));
 sky130_fd_sc_hd__nand2_1 _1247_ (.A(_0557_),
    .B(net72),
    .Y(_0574_));
 sky130_fd_sc_hd__nand2_1 _1248_ (.A(_0573_),
    .B(_0574_),
    .Y(_0575_));
 sky130_fd_sc_hd__nand3_1 _1249_ (.A(_0575_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0576_));
 sky130_fd_sc_hd__nand2_1 _1250_ (.A(_0569_),
    .B(_0576_),
    .Y(_0088_));
 sky130_fd_sc_hd__nand2_1 _1251_ (.A(_0522_),
    .B(net206),
    .Y(_0577_));
 sky130_fd_sc_hd__nand2_1 _1252_ (.A(_0524_),
    .B(\delayed_miso[3] ),
    .Y(_0578_));
 sky130_fd_sc_hd__or2_1 _1253_ (.A(_0165_),
    .B(_0578_),
    .X(_0579_));
 sky130_fd_sc_hd__o2bb2ai_1 _1254_ (.A1_N(net206),
    .A2_N(_0550_),
    .B1(_0552_),
    .B2(_0579_),
    .Y(_0580_));
 sky130_fd_sc_hd__nand2_1 _1255_ (.A(_0580_),
    .B(_0155_),
    .Y(_0581_));
 sky130_fd_sc_hd__nand2_1 _1256_ (.A(_0557_),
    .B(net73),
    .Y(_0582_));
 sky130_fd_sc_hd__nand2_1 _1257_ (.A(_0581_),
    .B(_0582_),
    .Y(_0583_));
 sky130_fd_sc_hd__nand3_1 _1258_ (.A(_0583_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0584_));
 sky130_fd_sc_hd__nand2_1 _1259_ (.A(_0577_),
    .B(_0584_),
    .Y(_0089_));
 sky130_fd_sc_hd__nand2_1 _1260_ (.A(_0522_),
    .B(net156),
    .Y(_0585_));
 sky130_fd_sc_hd__buf_6 _1261_ (.A(_0520_),
    .X(_0586_));
 sky130_fd_sc_hd__nand2_4 _1262_ (.A(_0512_),
    .B(_0165_),
    .Y(_0587_));
 sky130_fd_sc_hd__nand2_1 _1263_ (.A(_0587_),
    .B(net156),
    .Y(_0588_));
 sky130_fd_sc_hd__o21ai_1 _1264_ (.A1(_0587_),
    .A2(_0553_),
    .B1(_0588_),
    .Y(_0589_));
 sky130_fd_sc_hd__a22o_1 _1265_ (.A1(_0527_),
    .A2(net74),
    .B1(_0589_),
    .B2(_0539_),
    .X(_0590_));
 sky130_fd_sc_hd__nand3_1 _1266_ (.A(_0586_),
    .B(_0590_),
    .C(_0542_),
    .Y(_0591_));
 sky130_fd_sc_hd__nand2_1 _1267_ (.A(_0585_),
    .B(_0591_),
    .Y(_0090_));
 sky130_fd_sc_hd__nand2_1 _1268_ (.A(_0522_),
    .B(net196),
    .Y(_0592_));
 sky130_fd_sc_hd__nand2_1 _1269_ (.A(_0587_),
    .B(net196),
    .Y(_0593_));
 sky130_fd_sc_hd__o21ai_1 _1270_ (.A1(_0587_),
    .A2(_0562_),
    .B1(_0593_),
    .Y(_0594_));
 sky130_fd_sc_hd__a22o_1 _1271_ (.A1(_0527_),
    .A2(net75),
    .B1(_0594_),
    .B2(_0539_),
    .X(_0595_));
 sky130_fd_sc_hd__nand3_1 _1272_ (.A(_0586_),
    .B(_0595_),
    .C(_0542_),
    .Y(_0596_));
 sky130_fd_sc_hd__nand2_1 _1273_ (.A(_0592_),
    .B(_0596_),
    .Y(_0091_));
 sky130_fd_sc_hd__nand2_1 _1274_ (.A(_0522_),
    .B(net166),
    .Y(_0597_));
 sky130_fd_sc_hd__nand2_1 _1275_ (.A(_0587_),
    .B(net166),
    .Y(_0598_));
 sky130_fd_sc_hd__o21ai_1 _1276_ (.A1(_0587_),
    .A2(_0570_),
    .B1(_0598_),
    .Y(_0599_));
 sky130_fd_sc_hd__a22o_1 _1277_ (.A1(_0527_),
    .A2(net8),
    .B1(_0599_),
    .B2(_0539_),
    .X(_0600_));
 sky130_fd_sc_hd__nand3_1 _1278_ (.A(_0586_),
    .B(_0600_),
    .C(_0542_),
    .Y(_0601_));
 sky130_fd_sc_hd__nand2_1 _1279_ (.A(_0597_),
    .B(_0601_),
    .Y(_0092_));
 sky130_fd_sc_hd__nand2_1 _1280_ (.A(_0522_),
    .B(net190),
    .Y(_0602_));
 sky130_fd_sc_hd__nand2_1 _1281_ (.A(_0587_),
    .B(net190),
    .Y(_0603_));
 sky130_fd_sc_hd__o21ai_1 _1282_ (.A1(_0587_),
    .A2(_0578_),
    .B1(_0603_),
    .Y(_0604_));
 sky130_fd_sc_hd__a22o_1 _1283_ (.A1(_0527_),
    .A2(net9),
    .B1(_0604_),
    .B2(_0539_),
    .X(_0605_));
 sky130_fd_sc_hd__nand3_1 _1284_ (.A(_0586_),
    .B(_0605_),
    .C(_0542_),
    .Y(_0606_));
 sky130_fd_sc_hd__nand2_1 _1285_ (.A(_0602_),
    .B(_0606_),
    .Y(_0093_));
 sky130_fd_sc_hd__nand2_1 _1286_ (.A(_0522_),
    .B(net175),
    .Y(_0607_));
 sky130_fd_sc_hd__nor2_1 _1287_ (.A(_0159_),
    .B(_0207_),
    .Y(_0608_));
 sky130_fd_sc_hd__nor2_1 _1288_ (.A(_0216_),
    .B(_0608_),
    .Y(_0609_));
 sky130_fd_sc_hd__nand2_1 _1289_ (.A(_0551_),
    .B(_0159_),
    .Y(_0610_));
 sky130_fd_sc_hd__o211ai_4 _1290_ (.A1(_0213_),
    .A2(_0251_),
    .B1(_0524_),
    .C1(_0610_),
    .Y(_0611_));
 sky130_fd_sc_hd__nor2_1 _1291_ (.A(_0554_),
    .B(_0611_),
    .Y(_0612_));
 sky130_fd_sc_hd__o21ai_1 _1292_ (.A1(_0609_),
    .A2(_0612_),
    .B1(_0155_),
    .Y(_0613_));
 sky130_fd_sc_hd__nand2_1 _1293_ (.A(_0557_),
    .B(net10),
    .Y(_0614_));
 sky130_fd_sc_hd__nand2_1 _1294_ (.A(_0613_),
    .B(_0614_),
    .Y(_0615_));
 sky130_fd_sc_hd__nand3_1 _1295_ (.A(_0615_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0616_));
 sky130_fd_sc_hd__nand2_1 _1296_ (.A(_0607_),
    .B(_0616_),
    .Y(_0094_));
 sky130_fd_sc_hd__nand2_1 _1297_ (.A(_0522_),
    .B(net210),
    .Y(_0617_));
 sky130_fd_sc_hd__o21a_1 _1298_ (.A1(_0159_),
    .A2(_0207_),
    .B1(net210),
    .X(_0618_));
 sky130_fd_sc_hd__nor2_1 _1299_ (.A(_0563_),
    .B(_0611_),
    .Y(_0619_));
 sky130_fd_sc_hd__o21ai_1 _1300_ (.A1(_0618_),
    .A2(_0619_),
    .B1(_0155_),
    .Y(_0620_));
 sky130_fd_sc_hd__nand2_1 _1301_ (.A(_0557_),
    .B(net11),
    .Y(_0621_));
 sky130_fd_sc_hd__nand2_1 _1302_ (.A(_0620_),
    .B(_0621_),
    .Y(_0622_));
 sky130_fd_sc_hd__nand3_1 _1303_ (.A(_0622_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0623_));
 sky130_fd_sc_hd__nand2_1 _1304_ (.A(_0617_),
    .B(_0623_),
    .Y(_0095_));
 sky130_fd_sc_hd__nand2_1 _1305_ (.A(_0522_),
    .B(net180),
    .Y(_0624_));
 sky130_fd_sc_hd__nor2_1 _1306_ (.A(_0272_),
    .B(_0608_),
    .Y(_0625_));
 sky130_fd_sc_hd__nor2_1 _1307_ (.A(_0571_),
    .B(_0611_),
    .Y(_0626_));
 sky130_fd_sc_hd__o21ai_1 _1308_ (.A1(_0625_),
    .A2(_0626_),
    .B1(_0155_),
    .Y(_0627_));
 sky130_fd_sc_hd__nand2_1 _1309_ (.A(_0557_),
    .B(net12),
    .Y(_0628_));
 sky130_fd_sc_hd__nand2_1 _1310_ (.A(_0627_),
    .B(_0628_),
    .Y(_0629_));
 sky130_fd_sc_hd__nand3_1 _1311_ (.A(_0629_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0630_));
 sky130_fd_sc_hd__nand2_1 _1312_ (.A(_0624_),
    .B(_0630_),
    .Y(_0096_));
 sky130_fd_sc_hd__nand2_1 _1313_ (.A(_0522_),
    .B(net208),
    .Y(_0631_));
 sky130_fd_sc_hd__o21a_1 _1314_ (.A1(_0159_),
    .A2(_0207_),
    .B1(net208),
    .X(_0632_));
 sky130_fd_sc_hd__nor2_1 _1315_ (.A(_0579_),
    .B(_0611_),
    .Y(_0633_));
 sky130_fd_sc_hd__o21ai_1 _1316_ (.A1(_0632_),
    .A2(_0633_),
    .B1(_0155_),
    .Y(_0634_));
 sky130_fd_sc_hd__nand2_1 _1317_ (.A(_0557_),
    .B(net13),
    .Y(_0635_));
 sky130_fd_sc_hd__nand2_1 _1318_ (.A(_0634_),
    .B(_0635_),
    .Y(_0636_));
 sky130_fd_sc_hd__nand3_1 _1319_ (.A(_0636_),
    .B(_0530_),
    .C(_0542_),
    .Y(_0637_));
 sky130_fd_sc_hd__nand2_1 _1320_ (.A(_0631_),
    .B(_0637_),
    .Y(_0097_));
 sky130_fd_sc_hd__buf_6 _1321_ (.A(_0521_),
    .X(_0638_));
 sky130_fd_sc_hd__nand2_1 _1322_ (.A(_0638_),
    .B(net215),
    .Y(_0639_));
 sky130_fd_sc_hd__inv_2 _1323_ (.A(\delayed_miso[0] ),
    .Y(_0640_));
 sky130_fd_sc_hd__nand2_1 _1324_ (.A(_0517_),
    .B(net215),
    .Y(_0641_));
 sky130_fd_sc_hd__o21ai_1 _1325_ (.A1(_0640_),
    .A2(_0517_),
    .B1(_0641_),
    .Y(_0642_));
 sky130_fd_sc_hd__a22o_1 _1326_ (.A1(_0527_),
    .A2(net14),
    .B1(_0539_),
    .B2(_0642_),
    .X(_0643_));
 sky130_fd_sc_hd__nand3_1 _1327_ (.A(_0586_),
    .B(_0643_),
    .C(_0542_),
    .Y(_0644_));
 sky130_fd_sc_hd__nand2_1 _1328_ (.A(_0639_),
    .B(_0644_),
    .Y(_0098_));
 sky130_fd_sc_hd__nand2_1 _1329_ (.A(_0638_),
    .B(net214),
    .Y(_0645_));
 sky130_fd_sc_hd__inv_2 _1330_ (.A(\delayed_miso[1] ),
    .Y(_0646_));
 sky130_fd_sc_hd__nand2_1 _1331_ (.A(_0517_),
    .B(net214),
    .Y(_0647_));
 sky130_fd_sc_hd__o21ai_1 _1332_ (.A1(_0646_),
    .A2(_0517_),
    .B1(_0647_),
    .Y(_0648_));
 sky130_fd_sc_hd__a22o_1 _1333_ (.A1(_0527_),
    .A2(net15),
    .B1(_0539_),
    .B2(_0648_),
    .X(_0649_));
 sky130_fd_sc_hd__nand3_1 _1334_ (.A(_0586_),
    .B(_0649_),
    .C(_0542_),
    .Y(_0650_));
 sky130_fd_sc_hd__nand2_1 _1335_ (.A(_0645_),
    .B(_0650_),
    .Y(_0099_));
 sky130_fd_sc_hd__nand2_1 _1336_ (.A(_0638_),
    .B(net187),
    .Y(_0651_));
 sky130_fd_sc_hd__inv_2 _1337_ (.A(\delayed_miso[2] ),
    .Y(_0652_));
 sky130_fd_sc_hd__nand2_1 _1338_ (.A(_0517_),
    .B(net187),
    .Y(_0653_));
 sky130_fd_sc_hd__o21ai_1 _1339_ (.A1(_0652_),
    .A2(_0517_),
    .B1(_0653_),
    .Y(_0654_));
 sky130_fd_sc_hd__a22o_1 _1340_ (.A1(_0527_),
    .A2(net16),
    .B1(_0539_),
    .B2(_0654_),
    .X(_0655_));
 sky130_fd_sc_hd__nand3_1 _1341_ (.A(_0586_),
    .B(_0655_),
    .C(_0422_),
    .Y(_0656_));
 sky130_fd_sc_hd__nand2_1 _1342_ (.A(_0651_),
    .B(_0656_),
    .Y(_0100_));
 sky130_fd_sc_hd__nand2_1 _1343_ (.A(_0638_),
    .B(net199),
    .Y(_0657_));
 sky130_fd_sc_hd__inv_2 _1344_ (.A(\delayed_miso[3] ),
    .Y(_0658_));
 sky130_fd_sc_hd__nand2_1 _1345_ (.A(_0517_),
    .B(net199),
    .Y(_0659_));
 sky130_fd_sc_hd__o21ai_1 _1346_ (.A1(_0658_),
    .A2(_0517_),
    .B1(_0659_),
    .Y(_0660_));
 sky130_fd_sc_hd__a22o_1 _1347_ (.A1(_0527_),
    .A2(net17),
    .B1(_0539_),
    .B2(_0660_),
    .X(_0661_));
 sky130_fd_sc_hd__nand3_1 _1348_ (.A(_0586_),
    .B(_0661_),
    .C(_0422_),
    .Y(_0662_));
 sky130_fd_sc_hd__nand2_1 _1349_ (.A(_0657_),
    .B(_0662_),
    .Y(_0101_));
 sky130_fd_sc_hd__nand2_1 _1350_ (.A(_0638_),
    .B(net247),
    .Y(_0663_));
 sky130_fd_sc_hd__nand2_2 _1351_ (.A(_0211_),
    .B(_0159_),
    .Y(_0664_));
 sky130_fd_sc_hd__nand2_1 _1352_ (.A(_0664_),
    .B(net247),
    .Y(_0665_));
 sky130_fd_sc_hd__o21ai_1 _1353_ (.A1(_0640_),
    .A2(_0664_),
    .B1(_0665_),
    .Y(_0666_));
 sky130_fd_sc_hd__a22o_1 _1354_ (.A1(_0527_),
    .A2(net19),
    .B1(_0539_),
    .B2(_0666_),
    .X(_0667_));
 sky130_fd_sc_hd__nand3_1 _1355_ (.A(_0586_),
    .B(_0423_),
    .C(_0667_),
    .Y(_0668_));
 sky130_fd_sc_hd__nand2_1 _1356_ (.A(_0663_),
    .B(_0668_),
    .Y(_0102_));
 sky130_fd_sc_hd__nand2_1 _1357_ (.A(_0638_),
    .B(net245),
    .Y(_0669_));
 sky130_fd_sc_hd__nand2_1 _1358_ (.A(_0664_),
    .B(net245),
    .Y(_0670_));
 sky130_fd_sc_hd__o21ai_1 _1359_ (.A1(_0646_),
    .A2(_0664_),
    .B1(_0670_),
    .Y(_0671_));
 sky130_fd_sc_hd__a22o_1 _1360_ (.A1(_0527_),
    .A2(net20),
    .B1(_0539_),
    .B2(_0671_),
    .X(_0672_));
 sky130_fd_sc_hd__nand3_1 _1361_ (.A(_0586_),
    .B(_0423_),
    .C(_0672_),
    .Y(_0673_));
 sky130_fd_sc_hd__nand2_1 _1362_ (.A(_0669_),
    .B(_0673_),
    .Y(_0103_));
 sky130_fd_sc_hd__nand2_1 _1363_ (.A(_0638_),
    .B(net173),
    .Y(_0674_));
 sky130_fd_sc_hd__nand2_1 _1364_ (.A(_0664_),
    .B(net173),
    .Y(_0675_));
 sky130_fd_sc_hd__o21ai_1 _1365_ (.A1(_0652_),
    .A2(_0664_),
    .B1(_0675_),
    .Y(_0676_));
 sky130_fd_sc_hd__a22o_1 _1366_ (.A1(_0527_),
    .A2(net21),
    .B1(_0539_),
    .B2(_0676_),
    .X(_0677_));
 sky130_fd_sc_hd__nand3_1 _1367_ (.A(_0586_),
    .B(_0423_),
    .C(_0677_),
    .Y(_0678_));
 sky130_fd_sc_hd__nand2_1 _1368_ (.A(_0674_),
    .B(_0678_),
    .Y(_0104_));
 sky130_fd_sc_hd__nand2_1 _1369_ (.A(_0638_),
    .B(net223),
    .Y(_0679_));
 sky130_fd_sc_hd__nand2_1 _1370_ (.A(_0664_),
    .B(net223),
    .Y(_0680_));
 sky130_fd_sc_hd__o21ai_1 _1371_ (.A1(_0658_),
    .A2(_0664_),
    .B1(_0680_),
    .Y(_0681_));
 sky130_fd_sc_hd__a22o_1 _1372_ (.A1(_0527_),
    .A2(net22),
    .B1(_0539_),
    .B2(_0681_),
    .X(_0682_));
 sky130_fd_sc_hd__nand3_1 _1373_ (.A(_0586_),
    .B(_0423_),
    .C(_0682_),
    .Y(_0683_));
 sky130_fd_sc_hd__nand2_1 _1374_ (.A(_0679_),
    .B(_0683_),
    .Y(_0105_));
 sky130_fd_sc_hd__nand2_1 _1375_ (.A(_0638_),
    .B(net179),
    .Y(_0684_));
 sky130_fd_sc_hd__mux2_1 _1376_ (.A0(\delayed_miso[0] ),
    .A1(net179),
    .S(_0515_),
    .X(_0685_));
 sky130_fd_sc_hd__nand2_1 _1377_ (.A(_0685_),
    .B(_0155_),
    .Y(_0686_));
 sky130_fd_sc_hd__nand2_1 _1378_ (.A(_0557_),
    .B(net23),
    .Y(_0687_));
 sky130_fd_sc_hd__nand2_1 _1379_ (.A(_0686_),
    .B(_0687_),
    .Y(_0688_));
 sky130_fd_sc_hd__nand3_1 _1380_ (.A(_0586_),
    .B(_0423_),
    .C(_0688_),
    .Y(_0689_));
 sky130_fd_sc_hd__nand2_1 _1381_ (.A(_0684_),
    .B(_0689_),
    .Y(_0106_));
 sky130_fd_sc_hd__nand2_1 _1382_ (.A(_0638_),
    .B(net189),
    .Y(_0690_));
 sky130_fd_sc_hd__mux2_1 _1383_ (.A0(\delayed_miso[1] ),
    .A1(net189),
    .S(_0515_),
    .X(_0691_));
 sky130_fd_sc_hd__nand2_1 _1384_ (.A(_0691_),
    .B(_0155_),
    .Y(_0692_));
 sky130_fd_sc_hd__nand2_1 _1385_ (.A(_0557_),
    .B(net24),
    .Y(_0693_));
 sky130_fd_sc_hd__nand2_1 _1386_ (.A(_0692_),
    .B(_0693_),
    .Y(_0694_));
 sky130_fd_sc_hd__nand3_1 _1387_ (.A(_0586_),
    .B(_0423_),
    .C(_0694_),
    .Y(_0695_));
 sky130_fd_sc_hd__nand2_1 _1388_ (.A(_0690_),
    .B(_0695_),
    .Y(_0107_));
 sky130_fd_sc_hd__nand2_1 _1389_ (.A(_0638_),
    .B(net201),
    .Y(_0696_));
 sky130_fd_sc_hd__mux2_1 _1390_ (.A0(\delayed_miso[2] ),
    .A1(net201),
    .S(_0515_),
    .X(_0697_));
 sky130_fd_sc_hd__nand2_1 _1391_ (.A(_0697_),
    .B(_0155_),
    .Y(_0698_));
 sky130_fd_sc_hd__nand2_1 _1392_ (.A(_0557_),
    .B(net25),
    .Y(_0699_));
 sky130_fd_sc_hd__nand2_1 _1393_ (.A(_0698_),
    .B(_0699_),
    .Y(_0700_));
 sky130_fd_sc_hd__nand3_1 _1394_ (.A(_0586_),
    .B(_0423_),
    .C(_0700_),
    .Y(_0701_));
 sky130_fd_sc_hd__nand2_1 _1395_ (.A(_0696_),
    .B(_0701_),
    .Y(_0108_));
 sky130_fd_sc_hd__nand2_1 _1396_ (.A(_0638_),
    .B(net162),
    .Y(_0702_));
 sky130_fd_sc_hd__mux2_1 _1397_ (.A0(\delayed_miso[3] ),
    .A1(net162),
    .S(_0515_),
    .X(_0703_));
 sky130_fd_sc_hd__nand2_1 _1398_ (.A(_0703_),
    .B(_0155_),
    .Y(_0704_));
 sky130_fd_sc_hd__nand2_1 _1399_ (.A(_0557_),
    .B(net26),
    .Y(_0705_));
 sky130_fd_sc_hd__nand2_1 _1400_ (.A(_0704_),
    .B(_0705_),
    .Y(_0706_));
 sky130_fd_sc_hd__nand3_1 _1401_ (.A(_0586_),
    .B(_0423_),
    .C(_0706_),
    .Y(_0707_));
 sky130_fd_sc_hd__nand2_1 _1402_ (.A(_0702_),
    .B(_0707_),
    .Y(_0109_));
 sky130_fd_sc_hd__nand2_1 _1403_ (.A(_0638_),
    .B(net146),
    .Y(_0708_));
 sky130_fd_sc_hd__nand2_2 _1404_ (.A(_0251_),
    .B(_0159_),
    .Y(_0709_));
 sky130_fd_sc_hd__mux2_1 _1405_ (.A0(_0640_),
    .A1(_0206_),
    .S(_0709_),
    .X(_0114_));
 sky130_fd_sc_hd__nand2_1 _1406_ (.A(_0557_),
    .B(net27),
    .Y(_0115_));
 sky130_fd_sc_hd__o21ai_1 _1407_ (.A1(_0359_),
    .A2(_0114_),
    .B1(_0115_),
    .Y(_0116_));
 sky130_fd_sc_hd__nand3_1 _1408_ (.A(_0530_),
    .B(_0116_),
    .C(_0422_),
    .Y(_0117_));
 sky130_fd_sc_hd__nand2_1 _1409_ (.A(_0708_),
    .B(_0117_),
    .Y(_0110_));
 sky130_fd_sc_hd__nand2_1 _1410_ (.A(_0638_),
    .B(net197),
    .Y(_0118_));
 sky130_fd_sc_hd__nand2_1 _1411_ (.A(_0709_),
    .B(net197),
    .Y(_0119_));
 sky130_fd_sc_hd__o21ai_1 _1412_ (.A1(_0646_),
    .A2(_0709_),
    .B1(_0119_),
    .Y(_0120_));
 sky130_fd_sc_hd__a22o_1 _1413_ (.A1(_0120_),
    .A2(_0539_),
    .B1(net28),
    .B2(_0557_),
    .X(_0121_));
 sky130_fd_sc_hd__nand3_1 _1414_ (.A(_0530_),
    .B(_0423_),
    .C(_0121_),
    .Y(_0122_));
 sky130_fd_sc_hd__nand2_1 _1415_ (.A(_0118_),
    .B(_0122_),
    .Y(_0111_));
 sky130_fd_sc_hd__nand2_1 _1416_ (.A(_0638_),
    .B(net148),
    .Y(_0123_));
 sky130_fd_sc_hd__mux2_1 _1417_ (.A0(_0652_),
    .A1(_0267_),
    .S(_0709_),
    .X(_0124_));
 sky130_fd_sc_hd__nand2_1 _1418_ (.A(_0557_),
    .B(net30),
    .Y(_0125_));
 sky130_fd_sc_hd__o21ai_1 _1419_ (.A1(_0359_),
    .A2(_0124_),
    .B1(_0125_),
    .Y(_0126_));
 sky130_fd_sc_hd__nand3_1 _1420_ (.A(_0530_),
    .B(_0126_),
    .C(_0422_),
    .Y(_0127_));
 sky130_fd_sc_hd__nand2_1 _1421_ (.A(_0123_),
    .B(_0127_),
    .Y(_0112_));
 sky130_fd_sc_hd__nand2_1 _1422_ (.A(_0638_),
    .B(net182),
    .Y(_0128_));
 sky130_fd_sc_hd__nand2_1 _1423_ (.A(_0709_),
    .B(net182),
    .Y(_0129_));
 sky130_fd_sc_hd__o21ai_1 _1424_ (.A1(_0658_),
    .A2(_0709_),
    .B1(_0129_),
    .Y(_0130_));
 sky130_fd_sc_hd__a22o_1 _1425_ (.A1(_0130_),
    .A2(_0539_),
    .B1(net31),
    .B2(_0557_),
    .X(_0131_));
 sky130_fd_sc_hd__nand3_1 _1426_ (.A(_0530_),
    .B(_0423_),
    .C(_0131_),
    .Y(_0132_));
 sky130_fd_sc_hd__nand2_1 _1427_ (.A(_0128_),
    .B(_0132_),
    .Y(_0113_));
 sky130_fd_sc_hd__dfrtp_1 _1428_ (.CLK(clknet_4_14_0_clk_i),
    .D(net152),
    .RESET_B(net128),
    .Q(data_ready));
 sky130_fd_sc_hd__dfrtp_1 _1429_ (.CLK(net130),
    .D(net136),
    .RESET_B(net127),
    .Q(spi_clk));
 sky130_fd_sc_hd__dfrtp_4 _1430_ (.CLK(net131),
    .D(net3),
    .RESET_B(net127),
    .Q(\delayed_miso[0] ));
 sky130_fd_sc_hd__dfrtp_4 _1431_ (.CLK(net132),
    .D(net4),
    .RESET_B(net129),
    .Q(\delayed_miso[1] ));
 sky130_fd_sc_hd__dfrtp_2 _1432_ (.CLK(net133),
    .D(net5),
    .RESET_B(net129),
    .Q(\delayed_miso[2] ));
 sky130_fd_sc_hd__dfrtp_4 _1433_ (.CLK(net134),
    .D(net6),
    .RESET_B(net129),
    .Q(\delayed_miso[3] ));
 sky130_fd_sc_hd__dfrtp_1 _1434_ (.CLK(clknet_4_11_0_clk_i),
    .D(net186),
    .RESET_B(net127),
    .Q(net80));
 sky130_fd_sc_hd__dfrtp_1 _1435_ (.CLK(clknet_4_11_0_clk_i),
    .D(net205),
    .RESET_B(net127),
    .Q(net81));
 sky130_fd_sc_hd__dfrtp_1 _1436_ (.CLK(clknet_4_11_0_clk_i),
    .D(net219),
    .RESET_B(net127),
    .Q(net82));
 sky130_fd_sc_hd__dfrtp_2 _1437_ (.CLK(clknet_4_11_0_clk_i),
    .D(net195),
    .RESET_B(net127),
    .Q(net83));
 sky130_fd_sc_hd__dfrtp_1 _1438_ (.CLK(clknet_4_15_0_clk_i),
    .D(_0710_),
    .RESET_B(net128),
    .Q(net114));
 sky130_fd_sc_hd__dfrtp_1 _1439_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0011_),
    .RESET_B(net124),
    .Q(net88));
 sky130_fd_sc_hd__dfrtp_1 _1440_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0012_),
    .RESET_B(net124),
    .Q(net99));
 sky130_fd_sc_hd__dfrtp_1 _1441_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0013_),
    .RESET_B(net124),
    .Q(net110));
 sky130_fd_sc_hd__dfrtp_1 _1442_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0014_),
    .RESET_B(net124),
    .Q(net115));
 sky130_fd_sc_hd__dfrtp_1 _1443_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0015_),
    .RESET_B(net124),
    .Q(net116));
 sky130_fd_sc_hd__dfrtp_1 _1444_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0016_),
    .RESET_B(net124),
    .Q(net117));
 sky130_fd_sc_hd__dfrtp_2 _1445_ (.CLK(clknet_4_12_0_clk_i),
    .D(_0017_),
    .RESET_B(net128),
    .Q(net118));
 sky130_fd_sc_hd__dfrtp_2 _1446_ (.CLK(clknet_4_12_0_clk_i),
    .D(_0018_),
    .RESET_B(net128),
    .Q(net119));
 sky130_fd_sc_hd__dfrtp_1 _1447_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0019_),
    .RESET_B(net124),
    .Q(net120));
 sky130_fd_sc_hd__dfrtp_1 _1448_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0020_),
    .RESET_B(net124),
    .Q(net121));
 sky130_fd_sc_hd__dfrtp_1 _1449_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0021_),
    .RESET_B(net124),
    .Q(net89));
 sky130_fd_sc_hd__dfrtp_2 _1450_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0022_),
    .RESET_B(net124),
    .Q(net90));
 sky130_fd_sc_hd__dfrtp_1 _1451_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0023_),
    .RESET_B(net124),
    .Q(net91));
 sky130_fd_sc_hd__dfrtp_2 _1452_ (.CLK(clknet_4_7_0_clk_i),
    .D(_0024_),
    .RESET_B(net125),
    .Q(net92));
 sky130_fd_sc_hd__dfrtp_2 _1453_ (.CLK(clknet_4_12_0_clk_i),
    .D(_0025_),
    .RESET_B(net128),
    .Q(net93));
 sky130_fd_sc_hd__dfrtp_2 _1454_ (.CLK(clknet_4_12_0_clk_i),
    .D(_0026_),
    .RESET_B(net128),
    .Q(net94));
 sky130_fd_sc_hd__dfrtp_1 _1455_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0027_),
    .RESET_B(net124),
    .Q(net95));
 sky130_fd_sc_hd__dfrtp_2 _1456_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0028_),
    .RESET_B(net124),
    .Q(net96));
 sky130_fd_sc_hd__dfrtp_1 _1457_ (.CLK(clknet_4_7_0_clk_i),
    .D(_0029_),
    .RESET_B(net125),
    .Q(net97));
 sky130_fd_sc_hd__dfrtp_1 _1458_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0030_),
    .RESET_B(net124),
    .Q(net98));
 sky130_fd_sc_hd__dfrtp_2 _1459_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0031_),
    .RESET_B(net124),
    .Q(net100));
 sky130_fd_sc_hd__dfrtp_1 _1460_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0032_),
    .RESET_B(net125),
    .Q(net101));
 sky130_fd_sc_hd__dfrtp_1 _1461_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0033_),
    .RESET_B(net125),
    .Q(net102));
 sky130_fd_sc_hd__dfrtp_2 _1462_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0034_),
    .RESET_B(net125),
    .Q(net103));
 sky130_fd_sc_hd__dfrtp_2 _1463_ (.CLK(clknet_4_13_0_clk_i),
    .D(_0035_),
    .RESET_B(net128),
    .Q(net104));
 sky130_fd_sc_hd__dfrtp_1 _1464_ (.CLK(clknet_4_13_0_clk_i),
    .D(_0036_),
    .RESET_B(net128),
    .Q(net105));
 sky130_fd_sc_hd__dfrtp_1 _1465_ (.CLK(clknet_4_12_0_clk_i),
    .D(_0037_),
    .RESET_B(net128),
    .Q(net106));
 sky130_fd_sc_hd__dfrtp_1 _1466_ (.CLK(clknet_4_7_0_clk_i),
    .D(_0038_),
    .RESET_B(net125),
    .Q(net107));
 sky130_fd_sc_hd__dfrtp_2 _1467_ (.CLK(clknet_4_6_0_clk_i),
    .D(_0039_),
    .RESET_B(net125),
    .Q(net108));
 sky130_fd_sc_hd__dfrtp_1 _1468_ (.CLK(clknet_4_6_0_clk_i),
    .D(_0040_),
    .RESET_B(net125),
    .Q(net109));
 sky130_fd_sc_hd__dfrtp_1 _1469_ (.CLK(clknet_4_7_0_clk_i),
    .D(_0041_),
    .RESET_B(net128),
    .Q(net111));
 sky130_fd_sc_hd__dfrtp_1 _1470_ (.CLK(clknet_4_5_0_clk_i),
    .D(_0042_),
    .RESET_B(net125),
    .Q(net112));
 sky130_fd_sc_hd__dfrtp_1 _1471_ (.CLK(clknet_4_11_0_clk_i),
    .D(net263),
    .RESET_B(net127),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_1 _1472_ (.CLK(clknet_4_10_0_clk_i),
    .D(net267),
    .RESET_B(net127),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _1473_ (.CLK(clknet_4_10_0_clk_i),
    .D(_0045_),
    .RESET_B(net129),
    .Q(\state[2] ));
 sky130_fd_sc_hd__dfrtp_1 _1474_ (.CLK(clknet_4_10_0_clk_i),
    .D(net271),
    .RESET_B(net129),
    .Q(\state[3] ));
 sky130_fd_sc_hd__dfstp_2 _1475_ (.CLK(clknet_4_8_0_clk_i),
    .D(_0047_),
    .SET_B(net127),
    .Q(\address_nibble[0] ));
 sky130_fd_sc_hd__dfstp_1 _1476_ (.CLK(clknet_4_8_0_clk_i),
    .D(net255),
    .SET_B(net123),
    .Q(\address_nibble[1] ));
 sky130_fd_sc_hd__dfstp_1 _1477_ (.CLK(clknet_4_8_0_clk_i),
    .D(net213),
    .SET_B(net127),
    .Q(\address_nibble[2] ));
 sky130_fd_sc_hd__dfrtp_1 _1478_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0050_),
    .RESET_B(net122),
    .Q(\address[0] ));
 sky130_fd_sc_hd__dfrtp_1 _1479_ (.CLK(clknet_4_2_0_clk_i),
    .D(_0051_),
    .RESET_B(net122),
    .Q(\address[1] ));
 sky130_fd_sc_hd__dfrtp_1 _1480_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0052_),
    .RESET_B(net122),
    .Q(\address[2] ));
 sky130_fd_sc_hd__dfrtp_1 _1481_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0053_),
    .RESET_B(net122),
    .Q(\address[3] ));
 sky130_fd_sc_hd__dfrtp_1 _1482_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0054_),
    .RESET_B(net122),
    .Q(\address[4] ));
 sky130_fd_sc_hd__dfrtp_1 _1483_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0055_),
    .RESET_B(net122),
    .Q(\address[5] ));
 sky130_fd_sc_hd__dfrtp_1 _1484_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0056_),
    .RESET_B(net122),
    .Q(\address[6] ));
 sky130_fd_sc_hd__dfrtp_1 _1485_ (.CLK(clknet_4_2_0_clk_i),
    .D(_0057_),
    .RESET_B(net123),
    .Q(\address[7] ));
 sky130_fd_sc_hd__dfrtp_1 _1486_ (.CLK(clknet_4_2_0_clk_i),
    .D(_0058_),
    .RESET_B(net123),
    .Q(\address[8] ));
 sky130_fd_sc_hd__dfrtp_1 _1487_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0059_),
    .RESET_B(net122),
    .Q(\address[9] ));
 sky130_fd_sc_hd__dfrtp_1 _1488_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0060_),
    .RESET_B(net122),
    .Q(\address[10] ));
 sky130_fd_sc_hd__dfrtp_1 _1489_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0061_),
    .RESET_B(net122),
    .Q(\address[11] ));
 sky130_fd_sc_hd__dfrtp_1 _1490_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0062_),
    .RESET_B(net122),
    .Q(\address[12] ));
 sky130_fd_sc_hd__dfrtp_1 _1491_ (.CLK(clknet_4_0_0_clk_i),
    .D(_0063_),
    .RESET_B(net122),
    .Q(\address[13] ));
 sky130_fd_sc_hd__dfrtp_1 _1492_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0064_),
    .RESET_B(net122),
    .Q(\address[14] ));
 sky130_fd_sc_hd__dfrtp_1 _1493_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0065_),
    .RESET_B(net122),
    .Q(\address[15] ));
 sky130_fd_sc_hd__dfrtp_1 _1494_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0066_),
    .RESET_B(net122),
    .Q(\address[16] ));
 sky130_fd_sc_hd__dfrtp_1 _1495_ (.CLK(clknet_4_2_0_clk_i),
    .D(_0067_),
    .RESET_B(net123),
    .Q(\address[17] ));
 sky130_fd_sc_hd__dfrtp_1 _1496_ (.CLK(clknet_4_3_0_clk_i),
    .D(_0068_),
    .RESET_B(net122),
    .Q(\address[18] ));
 sky130_fd_sc_hd__dfrtp_1 _1497_ (.CLK(clknet_4_2_0_clk_i),
    .D(_0069_),
    .RESET_B(net123),
    .Q(\address[19] ));
 sky130_fd_sc_hd__dfrtp_1 _1498_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0070_),
    .RESET_B(net123),
    .Q(\address[20] ));
 sky130_fd_sc_hd__dfrtp_1 _1499_ (.CLK(clknet_4_2_0_clk_i),
    .D(_0071_),
    .RESET_B(net123),
    .Q(\address[21] ));
 sky130_fd_sc_hd__dfrtp_1 _1500_ (.CLK(clknet_4_8_0_clk_i),
    .D(net165),
    .RESET_B(net127),
    .Q(\latency[0] ));
 sky130_fd_sc_hd__dfrtp_1 _1501_ (.CLK(clknet_4_8_0_clk_i),
    .D(net139),
    .RESET_B(net127),
    .Q(\latency[1] ));
 sky130_fd_sc_hd__dfrtp_1 _1502_ (.CLK(clknet_4_10_0_clk_i),
    .D(net169),
    .RESET_B(net129),
    .Q(\latency[2] ));
 sky130_fd_sc_hd__dfrtp_1 _1503_ (.CLK(clknet_4_10_0_clk_i),
    .D(net145),
    .RESET_B(net129),
    .Q(\latency[3] ));
 sky130_fd_sc_hd__dfrtp_1 _1504_ (.CLK(clknet_4_10_0_clk_i),
    .D(net142),
    .RESET_B(net129),
    .Q(\latency[4] ));
 sky130_fd_sc_hd__dfrtp_1 _1505_ (.CLK(clknet_4_10_0_clk_i),
    .D(net155),
    .RESET_B(net129),
    .Q(\latency[5] ));
 sky130_fd_sc_hd__dfrtp_1 _1506_ (.CLK(clknet_4_8_0_clk_i),
    .D(_0078_),
    .RESET_B(net127),
    .Q(has_2lc));
 sky130_fd_sc_hd__dfrtp_1 _1507_ (.CLK(clknet_4_14_0_clk_i),
    .D(_0079_),
    .RESET_B(net129),
    .Q(data_nibble));
 sky130_fd_sc_hd__dfrtp_4 _1508_ (.CLK(clknet_4_15_0_clk_i),
    .D(_0080_),
    .RESET_B(net129),
    .Q(\data_byte[0] ));
 sky130_fd_sc_hd__dfrtp_1 _1509_ (.CLK(clknet_4_15_0_clk_i),
    .D(net305),
    .RESET_B(net129),
    .Q(\data_byte[1] ));
 sky130_fd_sc_hd__dfrtp_1 _1510_ (.CLK(clknet_4_3_0_clk_i),
    .D(_0082_),
    .RESET_B(net123),
    .Q(\data_buf[0] ));
 sky130_fd_sc_hd__dfrtp_1 _1511_ (.CLK(clknet_4_3_0_clk_i),
    .D(_0083_),
    .RESET_B(net123),
    .Q(\data_buf[1] ));
 sky130_fd_sc_hd__dfrtp_1 _1512_ (.CLK(clknet_4_7_0_clk_i),
    .D(_0084_),
    .RESET_B(net125),
    .Q(\data_buf[2] ));
 sky130_fd_sc_hd__dfrtp_1 _1513_ (.CLK(clknet_4_4_0_clk_i),
    .D(net234),
    .RESET_B(net125),
    .Q(\data_buf[3] ));
 sky130_fd_sc_hd__dfrtp_1 _1514_ (.CLK(clknet_4_9_0_clk_i),
    .D(net171),
    .RESET_B(net123),
    .Q(\data_buf[4] ));
 sky130_fd_sc_hd__dfrtp_1 _1515_ (.CLK(clknet_4_2_0_clk_i),
    .D(net178),
    .RESET_B(net123),
    .Q(\data_buf[5] ));
 sky130_fd_sc_hd__dfrtp_1 _1516_ (.CLK(clknet_4_9_0_clk_i),
    .D(net192),
    .RESET_B(net127),
    .Q(\data_buf[6] ));
 sky130_fd_sc_hd__dfrtp_1 _1517_ (.CLK(clknet_4_9_0_clk_i),
    .D(net207),
    .RESET_B(net127),
    .Q(\data_buf[7] ));
 sky130_fd_sc_hd__dfrtp_1 _1518_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0090_),
    .RESET_B(net123),
    .Q(\data_buf[8] ));
 sky130_fd_sc_hd__dfrtp_1 _1519_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0091_),
    .RESET_B(net123),
    .Q(\data_buf[9] ));
 sky130_fd_sc_hd__dfrtp_1 _1520_ (.CLK(clknet_4_4_0_clk_i),
    .D(_0092_),
    .RESET_B(net124),
    .Q(\data_buf[10] ));
 sky130_fd_sc_hd__dfrtp_1 _1521_ (.CLK(clknet_4_1_0_clk_i),
    .D(_0093_),
    .RESET_B(net123),
    .Q(\data_buf[11] ));
 sky130_fd_sc_hd__dfrtp_1 _1522_ (.CLK(clknet_4_3_0_clk_i),
    .D(net176),
    .RESET_B(net123),
    .Q(\data_buf[12] ));
 sky130_fd_sc_hd__dfrtp_1 _1523_ (.CLK(clknet_4_9_0_clk_i),
    .D(net211),
    .RESET_B(net126),
    .Q(\data_buf[13] ));
 sky130_fd_sc_hd__dfrtp_1 _1524_ (.CLK(clknet_4_12_0_clk_i),
    .D(net181),
    .RESET_B(net128),
    .Q(\data_buf[14] ));
 sky130_fd_sc_hd__dfrtp_1 _1525_ (.CLK(clknet_4_9_0_clk_i),
    .D(net209),
    .RESET_B(net127),
    .Q(\data_buf[15] ));
 sky130_fd_sc_hd__dfrtp_1 _1526_ (.CLK(clknet_4_5_0_clk_i),
    .D(net216),
    .RESET_B(net125),
    .Q(\data_buf[16] ));
 sky130_fd_sc_hd__dfrtp_1 _1527_ (.CLK(clknet_4_7_0_clk_i),
    .D(_0099_),
    .RESET_B(net125),
    .Q(\data_buf[17] ));
 sky130_fd_sc_hd__dfrtp_1 _1528_ (.CLK(clknet_4_7_0_clk_i),
    .D(net188),
    .RESET_B(net126),
    .Q(\data_buf[18] ));
 sky130_fd_sc_hd__dfrtp_1 _1529_ (.CLK(clknet_4_6_0_clk_i),
    .D(net200),
    .RESET_B(net126),
    .Q(\data_buf[19] ));
 sky130_fd_sc_hd__dfrtp_1 _1530_ (.CLK(clknet_4_5_0_clk_i),
    .D(net248),
    .RESET_B(net125),
    .Q(\data_buf[20] ));
 sky130_fd_sc_hd__dfrtp_1 _1531_ (.CLK(clknet_4_5_0_clk_i),
    .D(net246),
    .RESET_B(net125),
    .Q(\data_buf[21] ));
 sky130_fd_sc_hd__dfrtp_1 _1532_ (.CLK(clknet_4_7_0_clk_i),
    .D(net174),
    .RESET_B(net126),
    .Q(\data_buf[22] ));
 sky130_fd_sc_hd__dfrtp_1 _1533_ (.CLK(clknet_4_6_0_clk_i),
    .D(net224),
    .RESET_B(net126),
    .Q(\data_buf[23] ));
 sky130_fd_sc_hd__dfrtp_1 _1534_ (.CLK(clknet_4_13_0_clk_i),
    .D(_0106_),
    .RESET_B(net128),
    .Q(\data_buf[24] ));
 sky130_fd_sc_hd__dfrtp_1 _1535_ (.CLK(clknet_4_13_0_clk_i),
    .D(_0107_),
    .RESET_B(net128),
    .Q(\data_buf[25] ));
 sky130_fd_sc_hd__dfrtp_1 _1536_ (.CLK(clknet_4_13_0_clk_i),
    .D(_0108_),
    .RESET_B(net128),
    .Q(\data_buf[26] ));
 sky130_fd_sc_hd__dfrtp_1 _1537_ (.CLK(clknet_4_13_0_clk_i),
    .D(_0109_),
    .RESET_B(net129),
    .Q(\data_buf[27] ));
 sky130_fd_sc_hd__dfrtp_1 _1538_ (.CLK(clknet_4_6_0_clk_i),
    .D(net147),
    .RESET_B(net128),
    .Q(\data_buf[28] ));
 sky130_fd_sc_hd__dfrtp_1 _1539_ (.CLK(clknet_4_7_0_clk_i),
    .D(net198),
    .RESET_B(net126),
    .Q(\data_buf[29] ));
 sky130_fd_sc_hd__dfrtp_1 _1540_ (.CLK(clknet_4_12_0_clk_i),
    .D(net149),
    .RESET_B(net128),
    .Q(\data_buf[30] ));
 sky130_fd_sc_hd__dfrtp_1 _1541_ (.CLK(clknet_4_6_0_clk_i),
    .D(net183),
    .RESET_B(net126),
    .Q(\data_buf[31] ));
 sky130_fd_sc_hd__buf_1 _1542_ (.A(net87),
    .X(net84));
 sky130_fd_sc_hd__buf_1 _1543_ (.A(net87),
    .X(net85));
 sky130_fd_sc_hd__buf_1 _1544_ (.A(net87),
    .X(net86));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk_i (.A(clk_i),
    .X(clknet_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_0_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_0_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_10_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_10_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_11_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_11_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_12_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_12_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_13_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_13_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_14_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_14_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_15_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_15_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_1_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_1_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_2_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_2_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_3_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_3_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_4_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_4_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_5_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_5_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_6_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_6_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_7_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_7_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_8_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_8_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_4_9_0_clk_i (.A(clknet_0_clk_i),
    .X(clknet_4_9_0_clk_i));
 sky130_fd_sc_hd__clkbuf_8 fanout122 (.A(net123),
    .X(net122));
 sky130_fd_sc_hd__clkbuf_8 fanout123 (.A(net126),
    .X(net123));
 sky130_fd_sc_hd__clkbuf_8 fanout124 (.A(net125),
    .X(net124));
 sky130_fd_sc_hd__clkbuf_8 fanout125 (.A(net126),
    .X(net125));
 sky130_fd_sc_hd__buf_4 fanout126 (.A(net1),
    .X(net126));
 sky130_fd_sc_hd__clkbuf_8 fanout127 (.A(net129),
    .X(net127));
 sky130_fd_sc_hd__clkbuf_8 fanout128 (.A(net129),
    .X(net128));
 sky130_fd_sc_hd__clkbuf_8 fanout129 (.A(net1),
    .X(net129));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(spi_clk),
    .X(net135));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(_0494_),
    .X(net144));
 sky130_fd_sc_hd__dlygate4sd3_1 hold100 (.A(_0085_),
    .X(net234));
 sky130_fd_sc_hd__dlygate4sd3_1 hold101 (.A(\address[5] ),
    .X(net235));
 sky130_fd_sc_hd__dlygate4sd3_1 hold102 (.A(\address[11] ),
    .X(net236));
 sky130_fd_sc_hd__dlygate4sd3_1 hold103 (.A(\address[3] ),
    .X(net237));
 sky130_fd_sc_hd__dlygate4sd3_1 hold104 (.A(\address[2] ),
    .X(net238));
 sky130_fd_sc_hd__dlygate4sd3_1 hold105 (.A(\address[12] ),
    .X(net239));
 sky130_fd_sc_hd__dlygate4sd3_1 hold106 (.A(\address[13] ),
    .X(net240));
 sky130_fd_sc_hd__dlygate4sd3_1 hold107 (.A(\address[10] ),
    .X(net241));
 sky130_fd_sc_hd__dlygate4sd3_1 hold108 (.A(\address[15] ),
    .X(net242));
 sky130_fd_sc_hd__dlygate4sd3_1 hold109 (.A(\address[17] ),
    .X(net243));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(_0075_),
    .X(net145));
 sky130_fd_sc_hd__dlygate4sd3_1 hold110 (.A(_0469_),
    .X(net244));
 sky130_fd_sc_hd__buf_1 hold111 (.A(\data_buf[21] ),
    .X(net245));
 sky130_fd_sc_hd__dlygate4sd3_1 hold112 (.A(_0103_),
    .X(net246));
 sky130_fd_sc_hd__buf_1 hold113 (.A(\data_buf[20] ),
    .X(net247));
 sky130_fd_sc_hd__dlygate4sd3_1 hold114 (.A(_0102_),
    .X(net248));
 sky130_fd_sc_hd__dlygate4sd3_1 hold115 (.A(\address[18] ),
    .X(net249));
 sky130_fd_sc_hd__dlygate4sd3_1 hold116 (.A(_0470_),
    .X(net250));
 sky130_fd_sc_hd__dlygate4sd3_1 hold117 (.A(\address[6] ),
    .X(net251));
 sky130_fd_sc_hd__dlygate4sd3_1 hold118 (.A(\address[8] ),
    .X(net252));
 sky130_fd_sc_hd__dlygate4sd3_1 hold119 (.A(\address[14] ),
    .X(net253));
 sky130_fd_sc_hd__buf_1 hold12 (.A(\data_buf[28] ),
    .X(net146));
 sky130_fd_sc_hd__buf_1 hold120 (.A(\address_nibble[1] ),
    .X(net254));
 sky130_fd_sc_hd__dlygate4sd3_1 hold121 (.A(_0048_),
    .X(net255));
 sky130_fd_sc_hd__dlygate4sd3_1 hold122 (.A(\address[16] ),
    .X(net256));
 sky130_fd_sc_hd__dlygate4sd3_1 hold123 (.A(_0468_),
    .X(net257));
 sky130_fd_sc_hd__dlygate4sd3_1 hold124 (.A(\address[20] ),
    .X(net258));
 sky130_fd_sc_hd__dlygate4sd3_1 hold125 (.A(_0472_),
    .X(net259));
 sky130_fd_sc_hd__dlygate4sd3_1 hold126 (.A(net88),
    .X(net260));
 sky130_fd_sc_hd__clkbuf_2 hold127 (.A(\state[0] ),
    .X(net261));
 sky130_fd_sc_hd__dlygate4sd3_1 hold128 (.A(_0433_),
    .X(net262));
 sky130_fd_sc_hd__dlygate4sd3_1 hold129 (.A(_0043_),
    .X(net263));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(_0110_),
    .X(net147));
 sky130_fd_sc_hd__buf_2 hold130 (.A(net323),
    .X(net264));
 sky130_fd_sc_hd__dlygate4sd3_1 hold131 (.A(_0434_),
    .X(net265));
 sky130_fd_sc_hd__dlygate4sd3_1 hold132 (.A(_0435_),
    .X(net266));
 sky130_fd_sc_hd__dlygate4sd3_1 hold133 (.A(_0044_),
    .X(net267));
 sky130_fd_sc_hd__dlygate4sd3_1 hold134 (.A(net107),
    .X(net268));
 sky130_fd_sc_hd__buf_2 hold135 (.A(\state[3] ),
    .X(net269));
 sky130_fd_sc_hd__dlygate4sd3_1 hold136 (.A(_0446_),
    .X(net270));
 sky130_fd_sc_hd__dlygate4sd3_1 hold137 (.A(_0046_),
    .X(net271));
 sky130_fd_sc_hd__dlygate4sd3_1 hold138 (.A(net111),
    .X(net272));
 sky130_fd_sc_hd__dlygate4sd3_1 hold139 (.A(net99),
    .X(net273));
 sky130_fd_sc_hd__buf_1 hold14 (.A(net325),
    .X(net148));
 sky130_fd_sc_hd__dlygate4sd3_1 hold140 (.A(net116),
    .X(net274));
 sky130_fd_sc_hd__dlygate4sd3_1 hold141 (.A(net112),
    .X(net275));
 sky130_fd_sc_hd__dlygate4sd3_1 hold142 (.A(net102),
    .X(net276));
 sky130_fd_sc_hd__dlygate4sd3_1 hold143 (.A(net117),
    .X(net277));
 sky130_fd_sc_hd__dlygate4sd3_1 hold144 (.A(data_nibble),
    .X(net278));
 sky130_fd_sc_hd__dlygate4sd3_1 hold145 (.A(net98),
    .X(net279));
 sky130_fd_sc_hd__dlygate4sd3_1 hold146 (.A(net91),
    .X(net280));
 sky130_fd_sc_hd__dlygate4sd3_1 hold147 (.A(net90),
    .X(net281));
 sky130_fd_sc_hd__dlygate4sd3_1 hold148 (.A(net110),
    .X(net282));
 sky130_fd_sc_hd__dlygate4sd3_1 hold149 (.A(net121),
    .X(net283));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(_0112_),
    .X(net149));
 sky130_fd_sc_hd__dlygate4sd3_1 hold150 (.A(net105),
    .X(net284));
 sky130_fd_sc_hd__dlygate4sd3_1 hold151 (.A(net106),
    .X(net285));
 sky130_fd_sc_hd__dlygate4sd3_1 hold152 (.A(net120),
    .X(net286));
 sky130_fd_sc_hd__dlygate4sd3_1 hold153 (.A(net108),
    .X(net287));
 sky130_fd_sc_hd__dlygate4sd3_1 hold154 (.A(net118),
    .X(net288));
 sky130_fd_sc_hd__dlygate4sd3_1 hold155 (.A(net92),
    .X(net289));
 sky130_fd_sc_hd__dlygate4sd3_1 hold156 (.A(net109),
    .X(net290));
 sky130_fd_sc_hd__dlygate4sd3_1 hold157 (.A(net104),
    .X(net291));
 sky130_fd_sc_hd__dlygate4sd3_1 hold158 (.A(net89),
    .X(net292));
 sky130_fd_sc_hd__dlygate4sd3_1 hold159 (.A(net93),
    .X(net293));
 sky130_fd_sc_hd__buf_1 hold16 (.A(net311),
    .X(net150));
 sky130_fd_sc_hd__dlygate4sd3_1 hold160 (.A(net96),
    .X(net294));
 sky130_fd_sc_hd__dlygate4sd3_1 hold161 (.A(net103),
    .X(net295));
 sky130_fd_sc_hd__dlygate4sd3_1 hold162 (.A(net100),
    .X(net296));
 sky130_fd_sc_hd__dlygate4sd3_1 hold163 (.A(net119),
    .X(net297));
 sky130_fd_sc_hd__dlygate4sd3_1 hold164 (.A(net94),
    .X(net298));
 sky130_fd_sc_hd__dlygate4sd3_1 hold165 (.A(net95),
    .X(net299));
 sky130_fd_sc_hd__dlygate4sd3_1 hold166 (.A(net97),
    .X(net300));
 sky130_fd_sc_hd__dlygate4sd3_1 hold167 (.A(net115),
    .X(net301));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold168 (.A(\data_byte[0] ),
    .X(net302));
 sky130_fd_sc_hd__dlygate4sd3_1 hold169 (.A(net101),
    .X(net303));
 sky130_fd_sc_hd__dlygate4sd3_1 hold17 (.A(_0188_),
    .X(net151));
 sky130_fd_sc_hd__dlygate4sd3_1 hold170 (.A(\data_byte[1] ),
    .X(net304));
 sky130_fd_sc_hd__dlygate4sd3_1 hold171 (.A(_0081_),
    .X(net305));
 sky130_fd_sc_hd__dlygate4sd3_1 hold172 (.A(\address_nibble[0] ),
    .X(net306));
 sky130_fd_sc_hd__buf_1 hold173 (.A(\data_byte[0] ),
    .X(net307));
 sky130_fd_sc_hd__dlygate4sd3_1 hold174 (.A(\data_buf[0] ),
    .X(net308));
 sky130_fd_sc_hd__dlygate4sd3_1 hold175 (.A(\data_buf[27] ),
    .X(net309));
 sky130_fd_sc_hd__dlygate4sd3_1 hold176 (.A(\data_buf[11] ),
    .X(net310));
 sky130_fd_sc_hd__dlygate4sd3_1 hold177 (.A(data_ready),
    .X(net311));
 sky130_fd_sc_hd__dlygate4sd3_1 hold178 (.A(\data_buf[9] ),
    .X(net312));
 sky130_fd_sc_hd__dlygate4sd3_1 hold179 (.A(\data_buf[1] ),
    .X(net313));
 sky130_fd_sc_hd__dlygate4sd3_1 hold18 (.A(_0006_),
    .X(net152));
 sky130_fd_sc_hd__dlygate4sd3_1 hold180 (.A(\data_buf[25] ),
    .X(net314));
 sky130_fd_sc_hd__dlygate4sd3_1 hold181 (.A(\data_buf[24] ),
    .X(net315));
 sky130_fd_sc_hd__dlygate4sd3_1 hold182 (.A(\data_buf[26] ),
    .X(net316));
 sky130_fd_sc_hd__dlygate4sd3_1 hold183 (.A(\data_buf[10] ),
    .X(net317));
 sky130_fd_sc_hd__dlygate4sd3_1 hold184 (.A(\data_buf[4] ),
    .X(net318));
 sky130_fd_sc_hd__dlygate4sd3_1 hold185 (.A(\data_buf[2] ),
    .X(net319));
 sky130_fd_sc_hd__dlygate4sd3_1 hold186 (.A(\data_buf[8] ),
    .X(net320));
 sky130_fd_sc_hd__dlygate4sd3_1 hold187 (.A(\data_buf[12] ),
    .X(net321));
 sky130_fd_sc_hd__dlygate4sd3_1 hold188 (.A(\data_buf[22] ),
    .X(net322));
 sky130_fd_sc_hd__dlygate4sd3_1 hold189 (.A(\state[2] ),
    .X(net323));
 sky130_fd_sc_hd__buf_1 hold19 (.A(\latency[5] ),
    .X(net153));
 sky130_fd_sc_hd__dlygate4sd3_1 hold190 (.A(\data_buf[17] ),
    .X(net324));
 sky130_fd_sc_hd__dlygate4sd3_1 hold191 (.A(\data_buf[30] ),
    .X(net325));
 sky130_fd_sc_hd__dlygate4sd3_1 hold192 (.A(\data_buf[5] ),
    .X(net326));
 sky130_fd_sc_hd__dlygate4sd3_1 hold193 (.A(\data_buf[31] ),
    .X(net327));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(_0000_),
    .X(net136));
 sky130_fd_sc_hd__dlygate4sd3_1 hold20 (.A(_0503_),
    .X(net154));
 sky130_fd_sc_hd__dlygate4sd3_1 hold21 (.A(_0077_),
    .X(net155));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold22 (.A(net320),
    .X(net156));
 sky130_fd_sc_hd__clkbuf_2 hold23 (.A(net308),
    .X(net157));
 sky130_fd_sc_hd__buf_2 hold24 (.A(\state[1] ),
    .X(net158));
 sky130_fd_sc_hd__dlygate4sd3_1 hold25 (.A(_0157_),
    .X(net159));
 sky130_fd_sc_hd__dlygate4sd3_1 hold26 (.A(_0158_),
    .X(net160));
 sky130_fd_sc_hd__dlygate4sd3_1 hold27 (.A(_0167_),
    .X(net161));
 sky130_fd_sc_hd__clkbuf_2 hold28 (.A(net309),
    .X(net162));
 sky130_fd_sc_hd__dlygate4sd3_1 hold29 (.A(\latency[0] ),
    .X(net163));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\latency[1] ),
    .X(net137));
 sky130_fd_sc_hd__dlygate4sd3_1 hold30 (.A(_0481_),
    .X(net164));
 sky130_fd_sc_hd__dlygate4sd3_1 hold31 (.A(_0072_),
    .X(net165));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold32 (.A(net317),
    .X(net166));
 sky130_fd_sc_hd__buf_1 hold33 (.A(\latency[2] ),
    .X(net167));
 sky130_fd_sc_hd__dlygate4sd3_1 hold34 (.A(_0491_),
    .X(net168));
 sky130_fd_sc_hd__dlygate4sd3_1 hold35 (.A(_0074_),
    .X(net169));
 sky130_fd_sc_hd__clkbuf_2 hold36 (.A(net318),
    .X(net170));
 sky130_fd_sc_hd__dlygate4sd3_1 hold37 (.A(_0086_),
    .X(net171));
 sky130_fd_sc_hd__buf_1 hold38 (.A(net313),
    .X(net172));
 sky130_fd_sc_hd__clkbuf_2 hold39 (.A(net322),
    .X(net173));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(_0487_),
    .X(net138));
 sky130_fd_sc_hd__dlygate4sd3_1 hold40 (.A(_0104_),
    .X(net174));
 sky130_fd_sc_hd__clkbuf_2 hold41 (.A(net321),
    .X(net175));
 sky130_fd_sc_hd__dlygate4sd3_1 hold42 (.A(_0094_),
    .X(net176));
 sky130_fd_sc_hd__clkbuf_2 hold43 (.A(net326),
    .X(net177));
 sky130_fd_sc_hd__dlygate4sd3_1 hold44 (.A(_0087_),
    .X(net178));
 sky130_fd_sc_hd__buf_1 hold45 (.A(net315),
    .X(net179));
 sky130_fd_sc_hd__buf_1 hold46 (.A(\data_buf[14] ),
    .X(net180));
 sky130_fd_sc_hd__dlygate4sd3_1 hold47 (.A(_0096_),
    .X(net181));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold48 (.A(net327),
    .X(net182));
 sky130_fd_sc_hd__dlygate4sd3_1 hold49 (.A(_0113_),
    .X(net183));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(_0073_),
    .X(net139));
 sky130_fd_sc_hd__dlygate4sd3_1 hold50 (.A(net80),
    .X(net184));
 sky130_fd_sc_hd__dlygate4sd3_1 hold51 (.A(_0237_),
    .X(net185));
 sky130_fd_sc_hd__dlygate4sd3_1 hold52 (.A(_0007_),
    .X(net186));
 sky130_fd_sc_hd__buf_1 hold53 (.A(\data_buf[18] ),
    .X(net187));
 sky130_fd_sc_hd__dlygate4sd3_1 hold54 (.A(_0100_),
    .X(net188));
 sky130_fd_sc_hd__buf_1 hold55 (.A(net314),
    .X(net189));
 sky130_fd_sc_hd__clkbuf_2 hold56 (.A(net310),
    .X(net190));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold57 (.A(\data_buf[6] ),
    .X(net191));
 sky130_fd_sc_hd__dlygate4sd3_1 hold58 (.A(_0088_),
    .X(net192));
 sky130_fd_sc_hd__dlygate4sd3_1 hold59 (.A(net83),
    .X(net193));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(\latency[4] ),
    .X(net140));
 sky130_fd_sc_hd__dlygate4sd3_1 hold60 (.A(_0303_),
    .X(net194));
 sky130_fd_sc_hd__dlygate4sd3_1 hold61 (.A(_0010_),
    .X(net195));
 sky130_fd_sc_hd__clkbuf_2 hold62 (.A(net312),
    .X(net196));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold63 (.A(\data_buf[29] ),
    .X(net197));
 sky130_fd_sc_hd__dlygate4sd3_1 hold64 (.A(_0111_),
    .X(net198));
 sky130_fd_sc_hd__buf_1 hold65 (.A(\data_buf[19] ),
    .X(net199));
 sky130_fd_sc_hd__dlygate4sd3_1 hold66 (.A(_0101_),
    .X(net200));
 sky130_fd_sc_hd__dlymetal6s2s_1 hold67 (.A(net316),
    .X(net201));
 sky130_fd_sc_hd__buf_1 hold68 (.A(net319),
    .X(net202));
 sky130_fd_sc_hd__dlygate4sd3_1 hold69 (.A(net81),
    .X(net203));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(_0499_),
    .X(net141));
 sky130_fd_sc_hd__dlygate4sd3_1 hold70 (.A(_0261_),
    .X(net204));
 sky130_fd_sc_hd__dlygate4sd3_1 hold71 (.A(_0008_),
    .X(net205));
 sky130_fd_sc_hd__buf_1 hold72 (.A(\data_buf[7] ),
    .X(net206));
 sky130_fd_sc_hd__dlygate4sd3_1 hold73 (.A(_0089_),
    .X(net207));
 sky130_fd_sc_hd__buf_1 hold74 (.A(\data_buf[15] ),
    .X(net208));
 sky130_fd_sc_hd__dlygate4sd3_1 hold75 (.A(_0097_),
    .X(net209));
 sky130_fd_sc_hd__buf_1 hold76 (.A(\data_buf[13] ),
    .X(net210));
 sky130_fd_sc_hd__dlygate4sd3_1 hold77 (.A(_0095_),
    .X(net211));
 sky130_fd_sc_hd__buf_1 hold78 (.A(\address_nibble[2] ),
    .X(net212));
 sky130_fd_sc_hd__dlygate4sd3_1 hold79 (.A(_0049_),
    .X(net213));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(_0076_),
    .X(net142));
 sky130_fd_sc_hd__buf_1 hold80 (.A(net324),
    .X(net214));
 sky130_fd_sc_hd__clkdlybuf4s25_1 hold81 (.A(\data_buf[16] ),
    .X(net215));
 sky130_fd_sc_hd__dlygate4sd3_1 hold82 (.A(_0098_),
    .X(net216));
 sky130_fd_sc_hd__dlygate4sd3_1 hold83 (.A(net82),
    .X(net217));
 sky130_fd_sc_hd__dlygate4sd3_1 hold84 (.A(_0281_),
    .X(net218));
 sky130_fd_sc_hd__dlygate4sd3_1 hold85 (.A(_0009_),
    .X(net219));
 sky130_fd_sc_hd__dlygate4sd3_1 hold86 (.A(\address[4] ),
    .X(net220));
 sky130_fd_sc_hd__dlygate4sd3_1 hold87 (.A(has_2lc),
    .X(net221));
 sky130_fd_sc_hd__dlygate4sd3_1 hold88 (.A(_0505_),
    .X(net222));
 sky130_fd_sc_hd__buf_1 hold89 (.A(\data_buf[23] ),
    .X(net223));
 sky130_fd_sc_hd__clkdlybuf4s25_1 hold9 (.A(\latency[3] ),
    .X(net143));
 sky130_fd_sc_hd__dlygate4sd3_1 hold90 (.A(_0105_),
    .X(net224));
 sky130_fd_sc_hd__dlygate4sd3_1 hold91 (.A(\address[1] ),
    .X(net225));
 sky130_fd_sc_hd__dlygate4sd3_1 hold92 (.A(\address[19] ),
    .X(net226));
 sky130_fd_sc_hd__dlygate4sd3_1 hold93 (.A(_0471_),
    .X(net227));
 sky130_fd_sc_hd__dlygate4sd3_1 hold94 (.A(\address[9] ),
    .X(net228));
 sky130_fd_sc_hd__dlygate4sd3_1 hold95 (.A(\address[7] ),
    .X(net229));
 sky130_fd_sc_hd__dlygate4sd3_1 hold96 (.A(\address[21] ),
    .X(net230));
 sky130_fd_sc_hd__dlygate4sd3_1 hold97 (.A(_0473_),
    .X(net231));
 sky130_fd_sc_hd__dlygate4sd3_1 hold98 (.A(\address[0] ),
    .X(net232));
 sky130_fd_sc_hd__buf_1 hold99 (.A(\data_buf[3] ),
    .X(net233));
 sky130_fd_sc_hd__buf_1 input1 (.A(nrst_i),
    .X(net1));
 sky130_fd_sc_hd__buf_1 input10 (.A(sport_i[12]),
    .X(net10));
 sky130_fd_sc_hd__buf_1 input11 (.A(sport_i[13]),
    .X(net11));
 sky130_fd_sc_hd__buf_1 input12 (.A(sport_i[14]),
    .X(net12));
 sky130_fd_sc_hd__buf_1 input13 (.A(sport_i[15]),
    .X(net13));
 sky130_fd_sc_hd__buf_1 input14 (.A(sport_i[16]),
    .X(net14));
 sky130_fd_sc_hd__buf_1 input15 (.A(sport_i[17]),
    .X(net15));
 sky130_fd_sc_hd__buf_1 input16 (.A(sport_i[18]),
    .X(net16));
 sky130_fd_sc_hd__buf_1 input17 (.A(sport_i[19]),
    .X(net17));
 sky130_fd_sc_hd__buf_1 input18 (.A(sport_i[1]),
    .X(net18));
 sky130_fd_sc_hd__buf_1 input19 (.A(sport_i[20]),
    .X(net19));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(spi_dqsm_i),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input20 (.A(sport_i[21]),
    .X(net20));
 sky130_fd_sc_hd__buf_1 input21 (.A(sport_i[22]),
    .X(net21));
 sky130_fd_sc_hd__buf_1 input22 (.A(sport_i[23]),
    .X(net22));
 sky130_fd_sc_hd__buf_1 input23 (.A(sport_i[24]),
    .X(net23));
 sky130_fd_sc_hd__buf_1 input24 (.A(sport_i[25]),
    .X(net24));
 sky130_fd_sc_hd__buf_1 input25 (.A(sport_i[26]),
    .X(net25));
 sky130_fd_sc_hd__buf_1 input26 (.A(sport_i[27]),
    .X(net26));
 sky130_fd_sc_hd__buf_1 input27 (.A(sport_i[28]),
    .X(net27));
 sky130_fd_sc_hd__buf_1 input28 (.A(sport_i[29]),
    .X(net28));
 sky130_fd_sc_hd__clkbuf_1 input29 (.A(sport_i[2]),
    .X(net29));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(spi_miso_i[0]),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input30 (.A(sport_i[30]),
    .X(net30));
 sky130_fd_sc_hd__buf_1 input31 (.A(sport_i[31]),
    .X(net31));
 sky130_fd_sc_hd__clkbuf_1 input32 (.A(sport_i[32]),
    .X(net32));
 sky130_fd_sc_hd__clkbuf_1 input33 (.A(sport_i[33]),
    .X(net33));
 sky130_fd_sc_hd__clkbuf_1 input34 (.A(sport_i[34]),
    .X(net34));
 sky130_fd_sc_hd__buf_1 input35 (.A(sport_i[35]),
    .X(net35));
 sky130_fd_sc_hd__buf_1 input36 (.A(sport_i[36]),
    .X(net36));
 sky130_fd_sc_hd__buf_1 input37 (.A(sport_i[37]),
    .X(net37));
 sky130_fd_sc_hd__buf_1 input38 (.A(sport_i[38]),
    .X(net38));
 sky130_fd_sc_hd__buf_1 input39 (.A(sport_i[39]),
    .X(net39));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(spi_miso_i[1]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input40 (.A(sport_i[3]),
    .X(net40));
 sky130_fd_sc_hd__buf_1 input41 (.A(sport_i[40]),
    .X(net41));
 sky130_fd_sc_hd__buf_1 input42 (.A(sport_i[41]),
    .X(net42));
 sky130_fd_sc_hd__buf_1 input43 (.A(sport_i[42]),
    .X(net43));
 sky130_fd_sc_hd__buf_1 input44 (.A(sport_i[43]),
    .X(net44));
 sky130_fd_sc_hd__buf_1 input45 (.A(sport_i[44]),
    .X(net45));
 sky130_fd_sc_hd__buf_1 input46 (.A(sport_i[45]),
    .X(net46));
 sky130_fd_sc_hd__buf_1 input47 (.A(sport_i[46]),
    .X(net47));
 sky130_fd_sc_hd__buf_1 input48 (.A(sport_i[47]),
    .X(net48));
 sky130_fd_sc_hd__buf_1 input49 (.A(sport_i[48]),
    .X(net49));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(spi_miso_i[2]),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input50 (.A(sport_i[49]),
    .X(net50));
 sky130_fd_sc_hd__buf_1 input51 (.A(sport_i[4]),
    .X(net51));
 sky130_fd_sc_hd__buf_1 input52 (.A(sport_i[50]),
    .X(net52));
 sky130_fd_sc_hd__buf_1 input53 (.A(sport_i[51]),
    .X(net53));
 sky130_fd_sc_hd__buf_1 input54 (.A(sport_i[52]),
    .X(net54));
 sky130_fd_sc_hd__buf_1 input55 (.A(sport_i[53]),
    .X(net55));
 sky130_fd_sc_hd__clkbuf_1 input56 (.A(sport_i[54]),
    .X(net56));
 sky130_fd_sc_hd__clkbuf_1 input57 (.A(sport_i[55]),
    .X(net57));
 sky130_fd_sc_hd__clkbuf_1 input58 (.A(sport_i[56]),
    .X(net58));
 sky130_fd_sc_hd__clkbuf_1 input59 (.A(sport_i[57]),
    .X(net59));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(spi_miso_i[3]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input60 (.A(sport_i[58]),
    .X(net60));
 sky130_fd_sc_hd__clkbuf_1 input61 (.A(sport_i[59]),
    .X(net61));
 sky130_fd_sc_hd__buf_1 input62 (.A(sport_i[5]),
    .X(net62));
 sky130_fd_sc_hd__clkbuf_1 input63 (.A(sport_i[60]),
    .X(net63));
 sky130_fd_sc_hd__clkbuf_1 input64 (.A(sport_i[61]),
    .X(net64));
 sky130_fd_sc_hd__clkbuf_1 input65 (.A(sport_i[62]),
    .X(net65));
 sky130_fd_sc_hd__clkbuf_1 input66 (.A(sport_i[63]),
    .X(net66));
 sky130_fd_sc_hd__buf_1 input67 (.A(sport_i[64]),
    .X(net67));
 sky130_fd_sc_hd__buf_1 input68 (.A(sport_i[65]),
    .X(net68));
 sky130_fd_sc_hd__dlymetal6s2s_1 input69 (.A(sport_i[66]),
    .X(net69));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(sport_i[0]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_2 input70 (.A(sport_i[67]),
    .X(net70));
 sky130_fd_sc_hd__clkbuf_2 input71 (.A(sport_i[68]),
    .X(net71));
 sky130_fd_sc_hd__buf_1 input72 (.A(sport_i[6]),
    .X(net72));
 sky130_fd_sc_hd__buf_1 input73 (.A(sport_i[7]),
    .X(net73));
 sky130_fd_sc_hd__buf_1 input74 (.A(sport_i[8]),
    .X(net74));
 sky130_fd_sc_hd__buf_1 input75 (.A(sport_i[9]),
    .X(net75));
 sky130_fd_sc_hd__buf_1 input8 (.A(sport_i[10]),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(sport_i[11]),
    .X(net9));
 sky130_fd_sc_hd__buf_12 output100 (.A(net100),
    .X(sport_o[20]));
 sky130_fd_sc_hd__buf_12 output101 (.A(net101),
    .X(sport_o[21]));
 sky130_fd_sc_hd__buf_12 output102 (.A(net102),
    .X(sport_o[22]));
 sky130_fd_sc_hd__buf_12 output103 (.A(net103),
    .X(sport_o[23]));
 sky130_fd_sc_hd__buf_12 output104 (.A(net104),
    .X(sport_o[24]));
 sky130_fd_sc_hd__buf_12 output105 (.A(net105),
    .X(sport_o[25]));
 sky130_fd_sc_hd__buf_12 output106 (.A(net106),
    .X(sport_o[26]));
 sky130_fd_sc_hd__buf_12 output107 (.A(net107),
    .X(sport_o[27]));
 sky130_fd_sc_hd__buf_12 output108 (.A(net108),
    .X(sport_o[28]));
 sky130_fd_sc_hd__buf_12 output109 (.A(net109),
    .X(sport_o[29]));
 sky130_fd_sc_hd__buf_12 output110 (.A(net110),
    .X(sport_o[2]));
 sky130_fd_sc_hd__buf_12 output111 (.A(net111),
    .X(sport_o[30]));
 sky130_fd_sc_hd__buf_12 output112 (.A(net112),
    .X(sport_o[31]));
 sky130_fd_sc_hd__buf_12 output113 (.A(net113),
    .X(sport_o[32]));
 sky130_fd_sc_hd__buf_12 output114 (.A(net114),
    .X(sport_o[33]));
 sky130_fd_sc_hd__buf_12 output115 (.A(net115),
    .X(sport_o[3]));
 sky130_fd_sc_hd__buf_12 output116 (.A(net116),
    .X(sport_o[4]));
 sky130_fd_sc_hd__buf_12 output117 (.A(net117),
    .X(sport_o[5]));
 sky130_fd_sc_hd__buf_12 output118 (.A(net118),
    .X(sport_o[6]));
 sky130_fd_sc_hd__buf_12 output119 (.A(net119),
    .X(sport_o[7]));
 sky130_fd_sc_hd__buf_12 output120 (.A(net120),
    .X(sport_o[8]));
 sky130_fd_sc_hd__buf_12 output121 (.A(net121),
    .X(sport_o[9]));
 sky130_fd_sc_hd__buf_12 output76 (.A(net76),
    .X(spi_clk_o));
 sky130_fd_sc_hd__buf_12 output77 (.A(net77),
    .X(spi_cs_o));
 sky130_fd_sc_hd__buf_12 output78 (.A(net78),
    .X(spi_dqsm_en_o));
 sky130_fd_sc_hd__buf_12 output79 (.A(net79),
    .X(spi_dqsm_o));
 sky130_fd_sc_hd__buf_12 output80 (.A(net80),
    .X(spi_mosi_o[0]));
 sky130_fd_sc_hd__buf_12 output81 (.A(net81),
    .X(spi_mosi_o[1]));
 sky130_fd_sc_hd__buf_12 output82 (.A(net82),
    .X(spi_mosi_o[2]));
 sky130_fd_sc_hd__buf_12 output83 (.A(net83),
    .X(spi_mosi_o[3]));
 sky130_fd_sc_hd__buf_12 output84 (.A(net84),
    .X(spi_sio_en_o[0]));
 sky130_fd_sc_hd__buf_12 output85 (.A(net85),
    .X(spi_sio_en_o[1]));
 sky130_fd_sc_hd__buf_12 output86 (.A(net86),
    .X(spi_sio_en_o[2]));
 sky130_fd_sc_hd__buf_12 output87 (.A(net87),
    .X(spi_sio_en_o[3]));
 sky130_fd_sc_hd__buf_12 output88 (.A(net88),
    .X(sport_o[0]));
 sky130_fd_sc_hd__buf_12 output89 (.A(net89),
    .X(sport_o[10]));
 sky130_fd_sc_hd__buf_12 output90 (.A(net90),
    .X(sport_o[11]));
 sky130_fd_sc_hd__buf_12 output91 (.A(net91),
    .X(sport_o[12]));
 sky130_fd_sc_hd__buf_12 output92 (.A(net92),
    .X(sport_o[13]));
 sky130_fd_sc_hd__buf_12 output93 (.A(net93),
    .X(sport_o[14]));
 sky130_fd_sc_hd__buf_12 output94 (.A(net94),
    .X(sport_o[15]));
 sky130_fd_sc_hd__buf_12 output95 (.A(net95),
    .X(sport_o[16]));
 sky130_fd_sc_hd__buf_12 output96 (.A(net96),
    .X(sport_o[17]));
 sky130_fd_sc_hd__buf_12 output97 (.A(net97),
    .X(sport_o[18]));
 sky130_fd_sc_hd__buf_12 output98 (.A(net98),
    .X(sport_o[19]));
 sky130_fd_sc_hd__buf_12 output99 (.A(net99),
    .X(sport_o[1]));
endmodule

