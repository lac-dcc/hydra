; ModuleID = 'security_blowfish_d.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

@.str = private unnamed_addr constant [42 x i8] c"BlowFish part of SSLeay 0.7.0 30-Jan-1997\00", align 1
@BF_version = dso_local global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [14 x i8] c"blowfish(idx)\00", align 1
@stderr = external global ptr, align 8
@.str.3 = private unnamed_addr constant [45 x i8] c"Usage: blowfish {e|d} <intput> <output> key\0A\00", align 1
@.str.1.4 = private unnamed_addr constant [37 x i8] c"key must be in hexadecimal notation\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Bad key value.\0A\00", align 1
@.str.3.5 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@bf_init = internal global %struct.bf_key_st { [18 x i64] [i64 608135816, i64 2242054355, i64 320440878, i64 57701188, i64 2752067618, i64 698298832, i64 137296536, i64 3964562569, i64 1160258022, i64 953160567, i64 3193202383, i64 887688300, i64 3232508343, i64 3380367581, i64 1065670069, i64 3041331479, i64 2450970073, i64 2306472731], [1024 x i64] [i64 3509652390, i64 2564797868, i64 805139163, i64 3491422135, i64 3101798381, i64 1780907670, i64 3128725573, i64 4046225305, i64 614570311, i64 3012652279, i64 134345442, i64 2240740374, i64 1667834072, i64 1901547113, i64 2757295779, i64 4103290238, i64 227898511, i64 1921955416, i64 1904987480, i64 2182433518, i64 2069144605, i64 3260701109, i64 2620446009, i64 720527379, i64 3318853667, i64 677414384, i64 3393288472, i64 3101374703, i64 2390351024, i64 1614419982, i64 1822297739, i64 2954791486, i64 3608508353, i64 3174124327, i64 2024746970, i64 1432378464, i64 3864339955, i64 2857741204, i64 1464375394, i64 1676153920, i64 1439316330, i64 715854006, i64 3033291828, i64 289532110, i64 2706671279, i64 2087905683, i64 3018724369, i64 1668267050, i64 732546397, i64 1947742710, i64 3462151702, i64 2609353502, i64 2950085171, i64 1814351708, i64 2050118529, i64 680887927, i64 999245976, i64 1800124847, i64 3300911131, i64 1713906067, i64 1641548236, i64 4213287313, i64 1216130144, i64 1575780402, i64 4018429277, i64 3917837745, i64 3693486850, i64 3949271944, i64 596196993, i64 3549867205, i64 258830323, i64 2213823033, i64 772490370, i64 2760122372, i64 1774776394, i64 2652871518, i64 566650946, i64 4142492826, i64 1728879713, i64 2882767088, i64 1783734482, i64 3629395816, i64 2517608232, i64 2874225571, i64 1861159788, i64 326777828, i64 3124490320, i64 2130389656, i64 2716951837, i64 967770486, i64 1724537150, i64 2185432712, i64 2364442137, i64 1164943284, i64 2105845187, i64 998989502, i64 3765401048, i64 2244026483, i64 1075463327, i64 1455516326, i64 1322494562, i64 910128902, i64 469688178, i64 1117454909, i64 936433444, i64 3490320968, i64 3675253459, i64 1240580251, i64 122909385, i64 2157517691, i64 634681816, i64 4142456567, i64 3825094682, i64 3061402683, i64 2540495037, i64 79693498, i64 3249098678, i64 1084186820, i64 1583128258, i64 426386531, i64 1761308591, i64 1047286709, i64 322548459, i64 995290223, i64 1845252383, i64 2603652396, i64 3431023940, i64 2942221577, i64 3202600964, i64 3727903485, i64 1712269319, i64 422464435, i64 3234572375, i64 1170764815, i64 3523960633, i64 3117677531, i64 1434042557, i64 442511882, i64 3600875718, i64 1076654713, i64 1738483198, i64 4213154764, i64 2393238008, i64 3677496056, i64 1014306527, i64 4251020053, i64 793779912, i64 2902807211, i64 842905082, i64 4246964064, i64 1395751752, i64 1040244610, i64 2656851899, i64 3396308128, i64 445077038, i64 3742853595, i64 3577915638, i64 679411651, i64 2892444358, i64 2354009459, i64 1767581616, i64 3150600392, i64 3791627101, i64 3102740896, i64 284835224, i64 4246832056, i64 1258075500, i64 768725851, i64 2589189241, i64 3069724005, i64 3532540348, i64 1274779536, i64 3789419226, i64 2764799539, i64 1660621633, i64 3471099624, i64 4011903706, i64 913787905, i64 3497959166, i64 737222580, i64 2514213453, i64 2928710040, i64 3937242737, i64 1804850592, i64 3499020752, i64 2949064160, i64 2386320175, i64 2390070455, i64 2415321851, i64 4061277028, i64 2290661394, i64 2416832540, i64 1336762016, i64 1754252060, i64 3520065937, i64 3014181293, i64 791618072, i64 3188594551, i64 3933548030, i64 2332172193, i64 3852520463, i64 3043980520, i64 413987798, i64 3465142937, i64 3030929376, i64 4245938359, i64 2093235073, i64 3534596313, i64 375366246, i64 2157278981, i64 2479649556, i64 555357303, i64 3870105701, i64 2008414854, i64 3344188149, i64 4221384143, i64 3956125452, i64 2067696032, i64 3594591187, i64 2921233993, i64 2428461, i64 544322398, i64 577241275, i64 1471733935, i64 610547355, i64 4027169054, i64 1432588573, i64 1507829418, i64 2025931657, i64 3646575487, i64 545086370, i64 48609733, i64 2200306550, i64 1653985193, i64 298326376, i64 1316178497, i64 3007786442, i64 2064951626, i64 458293330, i64 2589141269, i64 3591329599, i64 3164325604, i64 727753846, i64 2179363840, i64 146436021, i64 1461446943, i64 4069977195, i64 705550613, i64 3059967265, i64 3887724982, i64 4281599278, i64 3313849956, i64 1404054877, i64 2845806497, i64 146425753, i64 1854211946, i64 1266315497, i64 3048417604, i64 3681880366, i64 3289982499, i64 2909710000, i64 1235738493, i64 2632868024, i64 2414719590, i64 3970600049, i64 1771706367, i64 1449415276, i64 3266420449, i64 422970021, i64 1963543593, i64 2690192192, i64 3826793022, i64 1062508698, i64 1531092325, i64 1804592342, i64 2583117782, i64 2714934279, i64 4024971509, i64 1294809318, i64 4028980673, i64 1289560198, i64 2221992742, i64 1669523910, i64 35572830, i64 157838143, i64 1052438473, i64 1016535060, i64 1802137761, i64 1753167236, i64 1386275462, i64 3080475397, i64 2857371447, i64 1040679964, i64 2145300060, i64 2390574316, i64 1461121720, i64 2956646967, i64 4031777805, i64 4028374788, i64 33600511, i64 2920084762, i64 1018524850, i64 629373528, i64 3691585981, i64 3515945977, i64 2091462646, i64 2486323059, i64 586499841, i64 988145025, i64 935516892, i64 3367335476, i64 2599673255, i64 2839830854, i64 265290510, i64 3972581182, i64 2759138881, i64 3795373465, i64 1005194799, i64 847297441, i64 406762289, i64 1314163512, i64 1332590856, i64 1866599683, i64 4127851711, i64 750260880, i64 613907577, i64 1450815602, i64 3165620655, i64 3734664991, i64 3650291728, i64 3012275730, i64 3704569646, i64 1427272223, i64 778793252, i64 1343938022, i64 2676280711, i64 2052605720, i64 1946737175, i64 3164576444, i64 3914038668, i64 3967478842, i64 3682934266, i64 1661551462, i64 3294938066, i64 4011595847, i64 840292616, i64 3712170807, i64 616741398, i64 312560963, i64 711312465, i64 1351876610, i64 322626781, i64 1910503582, i64 271666773, i64 2175563734, i64 1594956187, i64 70604529, i64 3617834859, i64 1007753275, i64 1495573769, i64 4069517037, i64 2549218298, i64 2663038764, i64 504708206, i64 2263041392, i64 3941167025, i64 2249088522, i64 1514023603, i64 1998579484, i64 1312622330, i64 694541497, i64 2582060303, i64 2151582166, i64 1382467621, i64 776784248, i64 2618340202, i64 3323268794, i64 2497899128, i64 2784771155, i64 503983604, i64 4076293799, i64 907881277, i64 423175695, i64 432175456, i64 1378068232, i64 4145222326, i64 3954048622, i64 3938656102, i64 3820766613, i64 2793130115, i64 2977904593, i64 26017576, i64 3274890735, i64 3194772133, i64 1700274565, i64 1756076034, i64 4006520079, i64 3677328699, i64 720338349, i64 1533947780, i64 354530856, i64 688349552, i64 3973924725, i64 1637815568, i64 332179504, i64 3949051286, i64 53804574, i64 2852348879, i64 3044236432, i64 1282449977, i64 3583942155, i64 3416972820, i64 4006381244, i64 1617046695, i64 2628476075, i64 3002303598, i64 1686838959, i64 431878346, i64 2686675385, i64 1700445008, i64 1080580658, i64 1009431731, i64 832498133, i64 3223435511, i64 2605976345, i64 2271191193, i64 2516031870, i64 1648197032, i64 4164389018, i64 2548247927, i64 300782431, i64 375919233, i64 238389289, i64 3353747414, i64 2531188641, i64 2019080857, i64 1475708069, i64 455242339, i64 2609103871, i64 448939670, i64 3451063019, i64 1395535956, i64 2413381860, i64 1841049896, i64 1491858159, i64 885456874, i64 4264095073, i64 4001119347, i64 1565136089, i64 3898914787, i64 1108368660, i64 540939232, i64 1173283510, i64 2745871338, i64 3681308437, i64 4207628240, i64 3343053890, i64 4016749493, i64 1699691293, i64 1103962373, i64 3625875870, i64 2256883143, i64 3830138730, i64 1031889488, i64 3479347698, i64 1535977030, i64 4236805024, i64 3251091107, i64 2132092099, i64 1774941330, i64 1199868427, i64 1452454533, i64 157007616, i64 2904115357, i64 342012276, i64 595725824, i64 1480756522, i64 206960106, i64 497939518, i64 591360097, i64 863170706, i64 2375253569, i64 3596610801, i64 1814182875, i64 2094937945, i64 3421402208, i64 1082520231, i64 3463918190, i64 2785509508, i64 435703966, i64 3908032597, i64 1641649973, i64 2842273706, i64 3305899714, i64 1510255612, i64 2148256476, i64 2655287854, i64 3276092548, i64 4258621189, i64 236887753, i64 3681803219, i64 274041037, i64 1734335097, i64 3815195456, i64 3317970021, i64 1899903192, i64 1026095262, i64 4050517792, i64 356393447, i64 2410691914, i64 3873677099, i64 3682840055, i64 3913112168, i64 2491498743, i64 4132185628, i64 2489919796, i64 1091903735, i64 1979897079, i64 3170134830, i64 3567386728, i64 3557303409, i64 857797738, i64 1136121015, i64 1342202287, i64 507115054, i64 2535736646, i64 337727348, i64 3213592640, i64 1301675037, i64 2528481711, i64 1895095763, i64 1721773893, i64 3216771564, i64 62756741, i64 2142006736, i64 835421444, i64 2531993523, i64 1442658625, i64 3659876326, i64 2882144922, i64 676362277, i64 1392781812, i64 170690266, i64 3921047035, i64 1759253602, i64 3611846912, i64 1745797284, i64 664899054, i64 1329594018, i64 3901205900, i64 3045908486, i64 2062866102, i64 2865634940, i64 3543621612, i64 3464012697, i64 1080764994, i64 553557557, i64 3656615353, i64 3996768171, i64 991055499, i64 499776247, i64 1265440854, i64 648242737, i64 3940784050, i64 980351604, i64 3713745714, i64 1749149687, i64 3396870395, i64 4211799374, i64 3640570775, i64 1161844396, i64 3125318951, i64 1431517754, i64 545492359, i64 4268468663, i64 3499529547, i64 1437099964, i64 2702547544, i64 3433638243, i64 2581715763, i64 2787789398, i64 1060185593, i64 1593081372, i64 2418618748, i64 4260947970, i64 69676912, i64 2159744348, i64 86519011, i64 2512459080, i64 3838209314, i64 1220612927, i64 3339683548, i64 133810670, i64 1090789135, i64 1078426020, i64 1569222167, i64 845107691, i64 3583754449, i64 4072456591, i64 1091646820, i64 628848692, i64 1613405280, i64 3757631651, i64 526609435, i64 236106946, i64 48312990, i64 2942717905, i64 3402727701, i64 1797494240, i64 859738849, i64 992217954, i64 4005476642, i64 2243076622, i64 3870952857, i64 3732016268, i64 765654824, i64 3490871365, i64 2511836413, i64 1685915746, i64 3888969200, i64 1414112111, i64 2273134842, i64 3281911079, i64 4080962846, i64 172450625, i64 2569994100, i64 980381355, i64 4109958455, i64 2819808352, i64 2716589560, i64 2568741196, i64 3681446669, i64 3329971472, i64 1835478071, i64 660984891, i64 3704678404, i64 4045999559, i64 3422617507, i64 3040415634, i64 1762651403, i64 1719377915, i64 3470491036, i64 2693910283, i64 3642056355, i64 3138596744, i64 1364962596, i64 2073328063, i64 1983633131, i64 926494387, i64 3423689081, i64 2150032023, i64 4096667949, i64 1749200295, i64 3328846651, i64 309677260, i64 2016342300, i64 1779581495, i64 3079819751, i64 111262694, i64 1274766160, i64 443224088, i64 298511866, i64 1025883608, i64 3806446537, i64 1145181785, i64 168956806, i64 3641502830, i64 3584813610, i64 1689216846, i64 3666258015, i64 3200248200, i64 1692713982, i64 2646376535, i64 4042768518, i64 1618508792, i64 1610833997, i64 3523052358, i64 4130873264, i64 2001055236, i64 3610705100, i64 2202168115, i64 4028541809, i64 2961195399, i64 1006657119, i64 2006996926, i64 3186142756, i64 1430667929, i64 3210227297, i64 1314452623, i64 4074634658, i64 4101304120, i64 2273951170, i64 1399257539, i64 3367210612, i64 3027628629, i64 1190975929, i64 2062231137, i64 2333990788, i64 2221543033, i64 2438960610, i64 1181637006, i64 548689776, i64 2362791313, i64 3372408396, i64 3104550113, i64 3145860560, i64 296247880, i64 1970579870, i64 3078560182, i64 3769228297, i64 1714227617, i64 3291629107, i64 3898220290, i64 166772364, i64 1251581989, i64 493813264, i64 448347421, i64 195405023, i64 2709975567, i64 677966185, i64 3703036547, i64 1463355134, i64 2715995803, i64 1338867538, i64 1343315457, i64 2802222074, i64 2684532164, i64 233230375, i64 2599980071, i64 2000651841, i64 3277868038, i64 1638401717, i64 4028070440, i64 3237316320, i64 6314154, i64 819756386, i64 300326615, i64 590932579, i64 1405279636, i64 3267499572, i64 3150704214, i64 2428286686, i64 3959192993, i64 3461946742, i64 1862657033, i64 1266418056, i64 963775037, i64 2089974820, i64 2263052895, i64 1917689273, i64 448879540, i64 3550394620, i64 3981727096, i64 150775221, i64 3627908307, i64 1303187396, i64 508620638, i64 2975983352, i64 2726630617, i64 1817252668, i64 1876281319, i64 1457606340, i64 908771278, i64 3720792119, i64 3617206836, i64 2455994898, i64 1729034894, i64 1080033504, i64 976866871, i64 3556439503, i64 2881648439, i64 1522871579, i64 1555064734, i64 1336096578, i64 3548522304, i64 2579274686, i64 3574697629, i64 3205460757, i64 3593280638, i64 3338716283, i64 3079412587, i64 564236357, i64 2993598910, i64 1781952180, i64 1464380207, i64 3163844217, i64 3332601554, i64 1699332808, i64 1393555694, i64 1183702653, i64 3581086237, i64 1288719814, i64 691649499, i64 2847557200, i64 2895455976, i64 3193889540, i64 2717570544, i64 1781354906, i64 1676643554, i64 2592534050, i64 3230253752, i64 1126444790, i64 2770207658, i64 2633158820, i64 2210423226, i64 2615765581, i64 2414155088, i64 3127139286, i64 673620729, i64 2805611233, i64 1269405062, i64 4015350505, i64 3341807571, i64 4149409754, i64 1057255273, i64 2012875353, i64 2162469141, i64 2276492801, i64 2601117357, i64 993977747, i64 3918593370, i64 2654263191, i64 753973209, i64 36408145, i64 2530585658, i64 25011837, i64 3520020182, i64 2088578344, i64 530523599, i64 2918365339, i64 1524020338, i64 1518925132, i64 3760827505, i64 3759777254, i64 1202760957, i64 3985898139, i64 3906192525, i64 674977740, i64 4174734889, i64 2031300136, i64 2019492241, i64 3983892565, i64 4153806404, i64 3822280332, i64 352677332, i64 2297720250, i64 60907813, i64 90501309, i64 3286998549, i64 1016092578, i64 2535922412, i64 2839152426, i64 457141659, i64 509813237, i64 4120667899, i64 652014361, i64 1966332200, i64 2975202805, i64 55981186, i64 2327461051, i64 676427537, i64 3255491064, i64 2882294119, i64 3433927263, i64 1307055953, i64 942726286, i64 933058658, i64 2468411793, i64 3933900994, i64 4215176142, i64 1361170020, i64 2001714738, i64 2830558078, i64 3274259782, i64 1222529897, i64 1679025792, i64 2729314320, i64 3714953764, i64 1770335741, i64 151462246, i64 3013232138, i64 1682292957, i64 1483529935, i64 471910574, i64 1539241949, i64 458788160, i64 3436315007, i64 1807016891, i64 3718408830, i64 978976581, i64 1043663428, i64 3165965781, i64 1927990952, i64 4200891579, i64 2372276910, i64 3208408903, i64 3533431907, i64 1412390302, i64 2931980059, i64 4132332400, i64 1947078029, i64 3881505623, i64 4168226417, i64 2941484381, i64 1077988104, i64 1320477388, i64 886195818, i64 18198404, i64 3786409000, i64 2509781533, i64 112762804, i64 3463356488, i64 1866414978, i64 891333506, i64 18488651, i64 661792760, i64 1628790961, i64 3885187036, i64 3141171499, i64 876946877, i64 2693282273, i64 1372485963, i64 791857591, i64 2686433993, i64 3759982718, i64 3167212022, i64 3472953795, i64 2716379847, i64 445679433, i64 3561995674, i64 3504004811, i64 3574258232, i64 54117162, i64 3331405415, i64 2381918588, i64 3769707343, i64 4154350007, i64 1140177722, i64 4074052095, i64 668550556, i64 3214352940, i64 367459370, i64 261225585, i64 2610173221, i64 4209349473, i64 3468074219, i64 3265815641, i64 314222801, i64 3066103646, i64 3808782860, i64 282218597, i64 3406013506, i64 3773591054, i64 379116347, i64 1285071038, i64 846784868, i64 2669647154, i64 3771962079, i64 3550491691, i64 2305946142, i64 453669953, i64 1268987020, i64 3317592352, i64 3279303384, i64 3744833421, i64 2610507566, i64 3859509063, i64 266596637, i64 3847019092, i64 517658769, i64 3462560207, i64 3443424879, i64 370717030, i64 4247526661, i64 2224018117, i64 4143653529, i64 4112773975, i64 2788324899, i64 2477274417, i64 1456262402, i64 2901442914, i64 1517677493, i64 1846949527, i64 2295493580, i64 3734397586, i64 2176403920, i64 1280348187, i64 1908823572, i64 3871786941, i64 846861322, i64 1172426758, i64 3287448474, i64 3383383037, i64 1655181056, i64 3139813346, i64 901632758, i64 1897031941, i64 2986607138, i64 3066810236, i64 3447102507, i64 1393639104, i64 373351379, i64 950779232, i64 625454576, i64 3124240540, i64 4148612726, i64 2007998917, i64 544563296, i64 2244738638, i64 2330496472, i64 2058025392, i64 1291430526, i64 424198748, i64 50039436, i64 29584100, i64 3605783033, i64 2429876329, i64 2791104160, i64 1057563949, i64 3255363231, i64 3075367218, i64 3463963227, i64 1469046755, i64 985887462] }, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @BF_cbc_encrypt(ptr noundef %arg, ptr noundef %arg32, i64 noundef %arg33, ptr noundef %arg34, ptr noundef %arg35, i32 noundef %arg36) #0 {
bb:
  %i = alloca [2 x i64], align 16
  %i37 = icmp ne i32 %arg36, 0
  br i1 %i37, label %bb38, label %bb278

bb38:                                             ; preds = %bb
  %i39 = getelementptr inbounds i8, ptr %arg35, i32 1
  %i40 = load i8, ptr %arg35, align 1
  %i41 = zext i8 %i40 to i64
  %i42 = shl i64 %i41, 24
  %i43 = getelementptr inbounds i8, ptr %i39, i32 1
  %i44 = load i8, ptr %i39, align 1
  %i45 = zext i8 %i44 to i64
  %i46 = shl i64 %i45, 16
  %i47 = or i64 %i42, %i46
  %i48 = getelementptr inbounds i8, ptr %i43, i32 1
  %i49 = load i8, ptr %i43, align 1
  %i50 = zext i8 %i49 to i64
  %i51 = shl i64 %i50, 8
  %i52 = or i64 %i47, %i51
  %i53 = getelementptr inbounds i8, ptr %i48, i32 1
  %i54 = load i8, ptr %i48, align 1
  %i55 = zext i8 %i54 to i64
  %i56 = or i64 %i52, %i55
  %i57 = getelementptr inbounds i8, ptr %i53, i32 1
  %i58 = load i8, ptr %i53, align 1
  %i59 = zext i8 %i58 to i64
  %i60 = shl i64 %i59, 24
  %i61 = getelementptr inbounds i8, ptr %i57, i32 1
  %i62 = load i8, ptr %i57, align 1
  %i63 = zext i8 %i62 to i64
  %i64 = shl i64 %i63, 16
  %i65 = or i64 %i60, %i64
  %i66 = getelementptr inbounds i8, ptr %i61, i32 1
  %i67 = load i8, ptr %i61, align 1
  %i68 = zext i8 %i67 to i64
  %i69 = shl i64 %i68, 8
  %i70 = or i64 %i65, %i69
  %i72 = load i8, ptr %i66, align 1
  %i73 = zext i8 %i72 to i64
  %i74 = or i64 %i70, %i73
  %i76 = sub nsw i64 %arg33, 8
  %i118 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i119 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i120 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i121 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i123 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb77

bb77:                                             ; preds = %bb155, %bb38
  %.030 = phi i64 [ %i74, %bb38 ], [ %i124, %bb155 ]
  %.028 = phi i64 [ %i56, %bb38 ], [ %i122, %bb155 ]
  %.010 = phi i64 [ %i76, %bb38 ], [ %i156, %bb155 ]
  %.01 = phi ptr [ %arg32, %bb38 ], [ %i154, %bb155 ]
  %.0 = phi ptr [ %arg, %bb38 ], [ %i112, %bb155 ]
  %i78 = icmp sge i64 %.010, 0
  br i1 %i78, label %bb79, label %bb157

bb79:                                             ; preds = %bb77
  %i80 = getelementptr inbounds i8, ptr %.0, i32 1
  %i81 = load i8, ptr %.0, align 1
  %i82 = zext i8 %i81 to i64
  %i83 = shl i64 %i82, 24
  %i84 = getelementptr inbounds i8, ptr %i80, i32 1
  %i85 = load i8, ptr %i80, align 1
  %i86 = zext i8 %i85 to i64
  %i87 = shl i64 %i86, 16
  %i88 = or i64 %i83, %i87
  %i89 = getelementptr inbounds i8, ptr %i84, i32 1
  %i90 = load i8, ptr %i84, align 1
  %i91 = zext i8 %i90 to i64
  %i92 = shl i64 %i91, 8
  %i93 = or i64 %i88, %i92
  %i94 = getelementptr inbounds i8, ptr %i89, i32 1
  %i95 = load i8, ptr %i89, align 1
  %i96 = zext i8 %i95 to i64
  %i97 = or i64 %i93, %i96
  %i98 = getelementptr inbounds i8, ptr %i94, i32 1
  %i99 = load i8, ptr %i94, align 1
  %i100 = zext i8 %i99 to i64
  %i101 = shl i64 %i100, 24
  %i102 = getelementptr inbounds i8, ptr %i98, i32 1
  %i103 = load i8, ptr %i98, align 1
  %i104 = zext i8 %i103 to i64
  %i105 = shl i64 %i104, 16
  %i106 = or i64 %i101, %i105
  %i107 = getelementptr inbounds i8, ptr %i102, i32 1
  %i108 = load i8, ptr %i102, align 1
  %i109 = zext i8 %i108 to i64
  %i110 = shl i64 %i109, 8
  %i111 = or i64 %i106, %i110
  %i112 = getelementptr inbounds i8, ptr %i107, i32 1
  %i113 = load i8, ptr %i107, align 1
  %i114 = zext i8 %i113 to i64
  %i115 = or i64 %i111, %i114
  %i116 = xor i64 %i97, %.028
  %i117 = xor i64 %i115, %.030
  store i64 %i116, ptr %i118, align 16
  store i64 %i117, ptr %i119, align 8
  call void @BF_encrypt(ptr noundef %i120, ptr noundef %arg34, i32 noundef 1)
  %i122 = load i64, ptr %i121, align 16
  %i124 = load i64, ptr %i123, align 8
  %i125 = lshr i64 %i122, 24
  %i126 = and i64 %i125, 255
  %i127 = trunc i64 %i126 to i8
  %i128 = getelementptr inbounds i8, ptr %.01, i32 1
  store i8 %i127, ptr %.01, align 1
  %i129 = lshr i64 %i122, 16
  %i130 = and i64 %i129, 255
  %i131 = trunc i64 %i130 to i8
  %i132 = getelementptr inbounds i8, ptr %i128, i32 1
  store i8 %i131, ptr %i128, align 1
  %i133 = lshr i64 %i122, 8
  %i134 = and i64 %i133, 255
  %i135 = trunc i64 %i134 to i8
  %i136 = getelementptr inbounds i8, ptr %i132, i32 1
  store i8 %i135, ptr %i132, align 1
  %i137 = and i64 %i122, 255
  %i138 = trunc i64 %i137 to i8
  %i139 = getelementptr inbounds i8, ptr %i136, i32 1
  store i8 %i138, ptr %i136, align 1
  %i140 = lshr i64 %i124, 24
  %i141 = and i64 %i140, 255
  %i142 = trunc i64 %i141 to i8
  %i143 = getelementptr inbounds i8, ptr %i139, i32 1
  store i8 %i142, ptr %i139, align 1
  %i144 = lshr i64 %i124, 16
  %i145 = and i64 %i144, 255
  %i146 = trunc i64 %i145 to i8
  %i147 = getelementptr inbounds i8, ptr %i143, i32 1
  store i8 %i146, ptr %i143, align 1
  %i148 = lshr i64 %i124, 8
  %i149 = and i64 %i148, 255
  %i150 = trunc i64 %i149 to i8
  %i151 = getelementptr inbounds i8, ptr %i147, i32 1
  store i8 %i150, ptr %i147, align 1
  %i152 = and i64 %i124, 255
  %i153 = trunc i64 %i152 to i8
  %i154 = getelementptr inbounds i8, ptr %i151, i32 1
  store i8 %i153, ptr %i151, align 1
  br label %bb155

bb155:                                            ; preds = %bb79
  %i156 = sub nsw i64 %.010, 8
  br label %bb77, !llvm.loop !8

bb157:                                            ; preds = %bb77
  %.030.lcssa = phi i64 [ %.030, %bb77 ]
  %.028.lcssa = phi i64 [ %.028, %bb77 ]
  %.010.lcssa = phi i64 [ %.010, %bb77 ]
  %.01.lcssa = phi ptr [ %.01, %bb77 ]
  %.0.lcssa = phi ptr [ %.0, %bb77 ]
  %i71 = getelementptr inbounds i8, ptr %i66, i32 1
  %i75 = getelementptr inbounds i8, ptr %i71, i64 -8
  %i158 = icmp ne i64 %.010.lcssa, -8
  br i1 %i158, label %bb159, label %bb157.bb247_crit_edge

bb157.bb247_crit_edge:                            ; preds = %bb157
  br label %bb247

bb159:                                            ; preds = %bb157
  %i160 = add nsw i64 %.010.lcssa, 8
  %i161 = getelementptr inbounds i8, ptr %.0.lcssa, i64 %i160
  %i162 = add nsw i64 %.010.lcssa, 8
  switch i64 %i162, label %bb159.bb207_crit_edge [
    i64 8, label %bb163
    i64 7, label %bb159.bb167_crit_edge
    i64 6, label %bb159.bb173_crit_edge
    i64 5, label %bb159.bb179_crit_edge
    i64 4, label %bb159.bb185_crit_edge
    i64 3, label %bb159.bb189_crit_edge
    i64 2, label %bb159.bb195_crit_edge
    i64 1, label %bb159.bb201_crit_edge
  ]

bb159.bb201_crit_edge:                            ; preds = %bb159
  br label %bb201

bb159.bb195_crit_edge:                            ; preds = %bb159
  br label %bb195

bb159.bb189_crit_edge:                            ; preds = %bb159
  br label %bb189

bb159.bb185_crit_edge:                            ; preds = %bb159
  br label %bb185

bb159.bb179_crit_edge:                            ; preds = %bb159
  br label %bb179

bb159.bb173_crit_edge:                            ; preds = %bb159
  br label %bb173

bb159.bb167_crit_edge:                            ; preds = %bb159
  br label %bb167

bb159.bb207_crit_edge:                            ; preds = %bb159
  br label %bb207

bb163:                                            ; preds = %bb159
  %i164 = getelementptr inbounds i8, ptr %i161, i32 -1
  %i165 = load i8, ptr %i164, align 1
  %i166 = zext i8 %i165 to i64
  br label %bb167

bb167:                                            ; preds = %bb163, %bb159.bb167_crit_edge
  %.020 = phi i64 [ 0, %bb159.bb167_crit_edge ], [ %i166, %bb163 ]
  %.1 = phi ptr [ %i161, %bb159.bb167_crit_edge ], [ %i164, %bb163 ]
  %i168 = getelementptr inbounds i8, ptr %.1, i32 -1
  %i169 = load i8, ptr %i168, align 1
  %i170 = zext i8 %i169 to i64
  %i171 = shl i64 %i170, 8
  %i172 = or i64 %.020, %i171
  br label %bb173

bb173:                                            ; preds = %bb167, %bb159.bb173_crit_edge
  %.121 = phi i64 [ 0, %bb159.bb173_crit_edge ], [ %i172, %bb167 ]
  %.2 = phi ptr [ %i161, %bb159.bb173_crit_edge ], [ %i168, %bb167 ]
  %i174 = getelementptr inbounds i8, ptr %.2, i32 -1
  %i175 = load i8, ptr %i174, align 1
  %i176 = zext i8 %i175 to i64
  %i177 = shl i64 %i176, 16
  %i178 = or i64 %.121, %i177
  br label %bb179

bb179:                                            ; preds = %bb173, %bb159.bb179_crit_edge
  %.222 = phi i64 [ 0, %bb159.bb179_crit_edge ], [ %i178, %bb173 ]
  %.3 = phi ptr [ %i161, %bb159.bb179_crit_edge ], [ %i174, %bb173 ]
  %i180 = getelementptr inbounds i8, ptr %.3, i32 -1
  %i181 = load i8, ptr %i180, align 1
  %i182 = zext i8 %i181 to i64
  %i183 = shl i64 %i182, 24
  %i184 = or i64 %.222, %i183
  br label %bb185

bb185:                                            ; preds = %bb179, %bb159.bb185_crit_edge
  %.323 = phi i64 [ 0, %bb159.bb185_crit_edge ], [ %i184, %bb179 ]
  %.4 = phi ptr [ %i161, %bb159.bb185_crit_edge ], [ %i180, %bb179 ]
  %i186 = getelementptr inbounds i8, ptr %.4, i32 -1
  %i187 = load i8, ptr %i186, align 1
  %i188 = zext i8 %i187 to i64
  br label %bb189

bb189:                                            ; preds = %bb185, %bb159.bb189_crit_edge
  %.424 = phi i64 [ 0, %bb159.bb189_crit_edge ], [ %.323, %bb185 ]
  %.016 = phi i64 [ 0, %bb159.bb189_crit_edge ], [ %i188, %bb185 ]
  %.5 = phi ptr [ %i161, %bb159.bb189_crit_edge ], [ %i186, %bb185 ]
  %i190 = getelementptr inbounds i8, ptr %.5, i32 -1
  %i191 = load i8, ptr %i190, align 1
  %i192 = zext i8 %i191 to i64
  %i193 = shl i64 %i192, 8
  %i194 = or i64 %.016, %i193
  br label %bb195

bb195:                                            ; preds = %bb189, %bb159.bb195_crit_edge
  %.525 = phi i64 [ 0, %bb159.bb195_crit_edge ], [ %.424, %bb189 ]
  %.117 = phi i64 [ 0, %bb159.bb195_crit_edge ], [ %i194, %bb189 ]
  %.6 = phi ptr [ %i161, %bb159.bb195_crit_edge ], [ %i190, %bb189 ]
  %i196 = getelementptr inbounds i8, ptr %.6, i32 -1
  %i197 = load i8, ptr %i196, align 1
  %i198 = zext i8 %i197 to i64
  %i199 = shl i64 %i198, 16
  %i200 = or i64 %.117, %i199
  br label %bb201

bb201:                                            ; preds = %bb195, %bb159.bb201_crit_edge
  %.626 = phi i64 [ 0, %bb159.bb201_crit_edge ], [ %.525, %bb195 ]
  %.218 = phi i64 [ 0, %bb159.bb201_crit_edge ], [ %i200, %bb195 ]
  %.7 = phi ptr [ %i161, %bb159.bb201_crit_edge ], [ %i196, %bb195 ]
  %i202 = getelementptr inbounds i8, ptr %.7, i32 -1
  %i203 = load i8, ptr %i202, align 1
  %i204 = zext i8 %i203 to i64
  %i205 = shl i64 %i204, 24
  %i206 = or i64 %.218, %i205
  br label %bb207

bb207:                                            ; preds = %bb201, %bb159.bb207_crit_edge
  %.727 = phi i64 [ 0, %bb159.bb207_crit_edge ], [ %.626, %bb201 ]
  %.319 = phi i64 [ 0, %bb159.bb207_crit_edge ], [ %i206, %bb201 ]
  %i208 = xor i64 %.319, %.028.lcssa
  %i209 = xor i64 %.727, %.030.lcssa
  %i210 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 %i208, ptr %i210, align 16
  %i211 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 %i209, ptr %i211, align 8
  %i212 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  call void @BF_encrypt(ptr noundef %i212, ptr noundef %arg34, i32 noundef 1)
  %i213 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i214 = load i64, ptr %i213, align 16
  %i215 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i216 = load i64, ptr %i215, align 8
  %i217 = lshr i64 %i214, 24
  %i218 = and i64 %i217, 255
  %i219 = trunc i64 %i218 to i8
  %i220 = getelementptr inbounds i8, ptr %.01.lcssa, i32 1
  store i8 %i219, ptr %.01.lcssa, align 1
  %i221 = lshr i64 %i214, 16
  %i222 = and i64 %i221, 255
  %i223 = trunc i64 %i222 to i8
  %i224 = getelementptr inbounds i8, ptr %i220, i32 1
  store i8 %i223, ptr %i220, align 1
  %i225 = lshr i64 %i214, 8
  %i226 = and i64 %i225, 255
  %i227 = trunc i64 %i226 to i8
  %i228 = getelementptr inbounds i8, ptr %i224, i32 1
  store i8 %i227, ptr %i224, align 1
  %i229 = and i64 %i214, 255
  %i230 = trunc i64 %i229 to i8
  %i231 = getelementptr inbounds i8, ptr %i228, i32 1
  store i8 %i230, ptr %i228, align 1
  %i232 = lshr i64 %i216, 24
  %i233 = and i64 %i232, 255
  %i234 = trunc i64 %i233 to i8
  %i235 = getelementptr inbounds i8, ptr %i231, i32 1
  store i8 %i234, ptr %i231, align 1
  %i236 = lshr i64 %i216, 16
  %i237 = and i64 %i236, 255
  %i238 = trunc i64 %i237 to i8
  %i239 = getelementptr inbounds i8, ptr %i235, i32 1
  store i8 %i238, ptr %i235, align 1
  %i240 = lshr i64 %i216, 8
  %i241 = and i64 %i240, 255
  %i242 = trunc i64 %i241 to i8
  %i243 = getelementptr inbounds i8, ptr %i239, i32 1
  store i8 %i242, ptr %i239, align 1
  %i244 = and i64 %i216, 255
  %i245 = trunc i64 %i244 to i8
  %i246 = getelementptr inbounds i8, ptr %i243, i32 1
  store i8 %i245, ptr %i243, align 1
  br label %bb247

bb247:                                            ; preds = %bb207, %bb157.bb247_crit_edge
  %.131 = phi i64 [ %i216, %bb207 ], [ %.030.lcssa, %bb157.bb247_crit_edge ]
  %.129 = phi i64 [ %i214, %bb207 ], [ %.028.lcssa, %bb157.bb247_crit_edge ]
  %i248 = lshr i64 %.129, 24
  %i249 = and i64 %i248, 255
  %i250 = trunc i64 %i249 to i8
  %i251 = getelementptr inbounds i8, ptr %i75, i32 1
  store i8 %i250, ptr %i75, align 1
  %i252 = lshr i64 %.129, 16
  %i253 = and i64 %i252, 255
  %i254 = trunc i64 %i253 to i8
  %i255 = getelementptr inbounds i8, ptr %i251, i32 1
  store i8 %i254, ptr %i251, align 1
  %i256 = lshr i64 %.129, 8
  %i257 = and i64 %i256, 255
  %i258 = trunc i64 %i257 to i8
  %i259 = getelementptr inbounds i8, ptr %i255, i32 1
  store i8 %i258, ptr %i255, align 1
  %i260 = and i64 %.129, 255
  %i261 = trunc i64 %i260 to i8
  %i262 = getelementptr inbounds i8, ptr %i259, i32 1
  store i8 %i261, ptr %i259, align 1
  %i263 = lshr i64 %.131, 24
  %i264 = and i64 %i263, 255
  %i265 = trunc i64 %i264 to i8
  %i266 = getelementptr inbounds i8, ptr %i262, i32 1
  store i8 %i265, ptr %i262, align 1
  %i267 = lshr i64 %.131, 16
  %i268 = and i64 %i267, 255
  %i269 = trunc i64 %i268 to i8
  %i270 = getelementptr inbounds i8, ptr %i266, i32 1
  store i8 %i269, ptr %i266, align 1
  %i271 = lshr i64 %.131, 8
  %i272 = and i64 %i271, 255
  %i273 = trunc i64 %i272 to i8
  %i274 = getelementptr inbounds i8, ptr %i270, i32 1
  store i8 %i273, ptr %i270, align 1
  %i275 = and i64 %.131, 255
  %i276 = trunc i64 %i275 to i8
  %i277 = getelementptr inbounds i8, ptr %i274, i32 1
  store i8 %i276, ptr %i274, align 1
  br label %bb518

bb278:                                            ; preds = %bb
  %i279 = getelementptr inbounds i8, ptr %arg35, i32 1
  %i280 = load i8, ptr %arg35, align 1
  %i281 = zext i8 %i280 to i64
  %i282 = shl i64 %i281, 24
  %i283 = getelementptr inbounds i8, ptr %i279, i32 1
  %i284 = load i8, ptr %i279, align 1
  %i285 = zext i8 %i284 to i64
  %i286 = shl i64 %i285, 16
  %i287 = or i64 %i282, %i286
  %i288 = getelementptr inbounds i8, ptr %i283, i32 1
  %i289 = load i8, ptr %i283, align 1
  %i290 = zext i8 %i289 to i64
  %i291 = shl i64 %i290, 8
  %i292 = or i64 %i287, %i291
  %i293 = getelementptr inbounds i8, ptr %i288, i32 1
  %i294 = load i8, ptr %i288, align 1
  %i295 = zext i8 %i294 to i64
  %i296 = or i64 %i292, %i295
  %i297 = getelementptr inbounds i8, ptr %i293, i32 1
  %i298 = load i8, ptr %i293, align 1
  %i299 = zext i8 %i298 to i64
  %i300 = shl i64 %i299, 24
  %i301 = getelementptr inbounds i8, ptr %i297, i32 1
  %i302 = load i8, ptr %i297, align 1
  %i303 = zext i8 %i302 to i64
  %i304 = shl i64 %i303, 16
  %i305 = or i64 %i300, %i304
  %i306 = getelementptr inbounds i8, ptr %i301, i32 1
  %i307 = load i8, ptr %i301, align 1
  %i308 = zext i8 %i307 to i64
  %i309 = shl i64 %i308, 8
  %i310 = or i64 %i305, %i309
  %i312 = load i8, ptr %i306, align 1
  %i313 = zext i8 %i312 to i64
  %i314 = or i64 %i310, %i313
  %i316 = sub nsw i64 %arg33, 8
  %i356 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i357 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i358 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i359 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i362 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb317

bb317:                                            ; preds = %bb395, %bb278
  %.014 = phi i64 [ %i296, %bb278 ], [ %i337, %bb395 ]
  %.012 = phi i64 [ %i314, %bb278 ], [ %i355, %bb395 ]
  %.111 = phi i64 [ %i316, %bb278 ], [ %i396, %bb395 ]
  %.12 = phi ptr [ %arg32, %bb278 ], [ %i394, %bb395 ]
  %.8 = phi ptr [ %arg, %bb278 ], [ %i352, %bb395 ]
  %i318 = icmp sge i64 %.111, 0
  br i1 %i318, label %bb319, label %bb397

bb319:                                            ; preds = %bb317
  %i320 = getelementptr inbounds i8, ptr %.8, i32 1
  %i321 = load i8, ptr %.8, align 1
  %i322 = zext i8 %i321 to i64
  %i323 = shl i64 %i322, 24
  %i324 = getelementptr inbounds i8, ptr %i320, i32 1
  %i325 = load i8, ptr %i320, align 1
  %i326 = zext i8 %i325 to i64
  %i327 = shl i64 %i326, 16
  %i328 = or i64 %i323, %i327
  %i329 = getelementptr inbounds i8, ptr %i324, i32 1
  %i330 = load i8, ptr %i324, align 1
  %i331 = zext i8 %i330 to i64
  %i332 = shl i64 %i331, 8
  %i333 = or i64 %i328, %i332
  %i334 = getelementptr inbounds i8, ptr %i329, i32 1
  %i335 = load i8, ptr %i329, align 1
  %i336 = zext i8 %i335 to i64
  %i337 = or i64 %i333, %i336
  %i338 = getelementptr inbounds i8, ptr %i334, i32 1
  %i339 = load i8, ptr %i334, align 1
  %i340 = zext i8 %i339 to i64
  %i341 = shl i64 %i340, 24
  %i342 = getelementptr inbounds i8, ptr %i338, i32 1
  %i343 = load i8, ptr %i338, align 1
  %i344 = zext i8 %i343 to i64
  %i345 = shl i64 %i344, 16
  %i346 = or i64 %i341, %i345
  %i347 = getelementptr inbounds i8, ptr %i342, i32 1
  %i348 = load i8, ptr %i342, align 1
  %i349 = zext i8 %i348 to i64
  %i350 = shl i64 %i349, 8
  %i351 = or i64 %i346, %i350
  %i352 = getelementptr inbounds i8, ptr %i347, i32 1
  %i353 = load i8, ptr %i347, align 1
  %i354 = zext i8 %i353 to i64
  %i355 = or i64 %i351, %i354
  store i64 %i337, ptr %i356, align 16
  store i64 %i355, ptr %i357, align 8
  call void @BF_encrypt(ptr noundef %i358, ptr noundef %arg34, i32 noundef 0)
  %i360 = load i64, ptr %i359, align 16
  %i361 = xor i64 %i360, %.014
  %i363 = load i64, ptr %i362, align 8
  %i364 = xor i64 %i363, %.012
  %i365 = lshr i64 %i361, 24
  %i366 = and i64 %i365, 255
  %i367 = trunc i64 %i366 to i8
  %i368 = getelementptr inbounds i8, ptr %.12, i32 1
  store i8 %i367, ptr %.12, align 1
  %i369 = lshr i64 %i361, 16
  %i370 = and i64 %i369, 255
  %i371 = trunc i64 %i370 to i8
  %i372 = getelementptr inbounds i8, ptr %i368, i32 1
  store i8 %i371, ptr %i368, align 1
  %i373 = lshr i64 %i361, 8
  %i374 = and i64 %i373, 255
  %i375 = trunc i64 %i374 to i8
  %i376 = getelementptr inbounds i8, ptr %i372, i32 1
  store i8 %i375, ptr %i372, align 1
  %i377 = and i64 %i361, 255
  %i378 = trunc i64 %i377 to i8
  %i379 = getelementptr inbounds i8, ptr %i376, i32 1
  store i8 %i378, ptr %i376, align 1
  %i380 = lshr i64 %i364, 24
  %i381 = and i64 %i380, 255
  %i382 = trunc i64 %i381 to i8
  %i383 = getelementptr inbounds i8, ptr %i379, i32 1
  store i8 %i382, ptr %i379, align 1
  %i384 = lshr i64 %i364, 16
  %i385 = and i64 %i384, 255
  %i386 = trunc i64 %i385 to i8
  %i387 = getelementptr inbounds i8, ptr %i383, i32 1
  store i8 %i386, ptr %i383, align 1
  %i388 = lshr i64 %i364, 8
  %i389 = and i64 %i388, 255
  %i390 = trunc i64 %i389 to i8
  %i391 = getelementptr inbounds i8, ptr %i387, i32 1
  store i8 %i390, ptr %i387, align 1
  %i392 = and i64 %i364, 255
  %i393 = trunc i64 %i392 to i8
  %i394 = getelementptr inbounds i8, ptr %i391, i32 1
  store i8 %i393, ptr %i391, align 1
  br label %bb395

bb395:                                            ; preds = %bb319
  %i396 = sub nsw i64 %.111, 8
  br label %bb317, !llvm.loop !10

bb397:                                            ; preds = %bb317
  %.014.lcssa = phi i64 [ %.014, %bb317 ]
  %.012.lcssa = phi i64 [ %.012, %bb317 ]
  %.111.lcssa = phi i64 [ %.111, %bb317 ]
  %.12.lcssa = phi ptr [ %.12, %bb317 ]
  %.8.lcssa = phi ptr [ %.8, %bb317 ]
  %i311 = getelementptr inbounds i8, ptr %i306, i32 1
  %i315 = getelementptr inbounds i8, ptr %i311, i64 -8
  %i398 = icmp ne i64 %.111.lcssa, -8
  br i1 %i398, label %bb399, label %bb397.bb487_crit_edge

bb397.bb487_crit_edge:                            ; preds = %bb397
  br label %bb487

bb399:                                            ; preds = %bb397
  %i400 = getelementptr inbounds i8, ptr %.8.lcssa, i32 1
  %i401 = load i8, ptr %.8.lcssa, align 1
  %i402 = zext i8 %i401 to i64
  %i403 = shl i64 %i402, 24
  %i404 = getelementptr inbounds i8, ptr %i400, i32 1
  %i405 = load i8, ptr %i400, align 1
  %i406 = zext i8 %i405 to i64
  %i407 = shl i64 %i406, 16
  %i408 = or i64 %i403, %i407
  %i409 = getelementptr inbounds i8, ptr %i404, i32 1
  %i410 = load i8, ptr %i404, align 1
  %i411 = zext i8 %i410 to i64
  %i412 = shl i64 %i411, 8
  %i413 = or i64 %i408, %i412
  %i414 = getelementptr inbounds i8, ptr %i409, i32 1
  %i415 = load i8, ptr %i409, align 1
  %i416 = zext i8 %i415 to i64
  %i417 = or i64 %i413, %i416
  %i418 = getelementptr inbounds i8, ptr %i414, i32 1
  %i419 = load i8, ptr %i414, align 1
  %i420 = zext i8 %i419 to i64
  %i421 = shl i64 %i420, 24
  %i422 = getelementptr inbounds i8, ptr %i418, i32 1
  %i423 = load i8, ptr %i418, align 1
  %i424 = zext i8 %i423 to i64
  %i425 = shl i64 %i424, 16
  %i426 = or i64 %i421, %i425
  %i427 = getelementptr inbounds i8, ptr %i422, i32 1
  %i428 = load i8, ptr %i422, align 1
  %i429 = zext i8 %i428 to i64
  %i430 = shl i64 %i429, 8
  %i431 = or i64 %i426, %i430
  %i432 = getelementptr inbounds i8, ptr %i427, i32 1
  %i433 = load i8, ptr %i427, align 1
  %i434 = zext i8 %i433 to i64
  %i435 = or i64 %i431, %i434
  %i436 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 %i417, ptr %i436, align 16
  %i437 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 %i435, ptr %i437, align 8
  %i438 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  call void @BF_encrypt(ptr noundef %i438, ptr noundef %arg34, i32 noundef 0)
  %i439 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i440 = load i64, ptr %i439, align 16
  %i441 = xor i64 %i440, %.014.lcssa
  %i442 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i443 = load i64, ptr %i442, align 8
  %i444 = xor i64 %i443, %.012.lcssa
  %i445 = add nsw i64 %.111.lcssa, 8
  %i446 = getelementptr inbounds i8, ptr %.12.lcssa, i64 %i445
  %i447 = add nsw i64 %.111.lcssa, 8
  switch i64 %i447, label %bb399.bb486_crit_edge [
    i64 8, label %bb448
    i64 7, label %bb399.bb452_crit_edge
    i64 6, label %bb399.bb457_crit_edge
    i64 5, label %bb399.bb462_crit_edge
    i64 4, label %bb399.bb467_crit_edge
    i64 3, label %bb399.bb471_crit_edge
    i64 2, label %bb399.bb476_crit_edge
    i64 1, label %bb399.bb481_crit_edge
  ]

bb399.bb481_crit_edge:                            ; preds = %bb399
  br label %bb481

bb399.bb476_crit_edge:                            ; preds = %bb399
  br label %bb476

bb399.bb471_crit_edge:                            ; preds = %bb399
  br label %bb471

bb399.bb467_crit_edge:                            ; preds = %bb399
  br label %bb467

bb399.bb462_crit_edge:                            ; preds = %bb399
  br label %bb462

bb399.bb457_crit_edge:                            ; preds = %bb399
  br label %bb457

bb399.bb452_crit_edge:                            ; preds = %bb399
  br label %bb452

bb399.bb486_crit_edge:                            ; preds = %bb399
  br label %bb486

bb448:                                            ; preds = %bb399
  %i449 = and i64 %i444, 255
  %i450 = trunc i64 %i449 to i8
  %i451 = getelementptr inbounds i8, ptr %i446, i32 -1
  store i8 %i450, ptr %i451, align 1
  br label %bb452

bb452:                                            ; preds = %bb448, %bb399.bb452_crit_edge
  %.23 = phi ptr [ %i446, %bb399.bb452_crit_edge ], [ %i451, %bb448 ]
  %i453 = lshr i64 %i444, 8
  %i454 = and i64 %i453, 255
  %i455 = trunc i64 %i454 to i8
  %i456 = getelementptr inbounds i8, ptr %.23, i32 -1
  store i8 %i455, ptr %i456, align 1
  br label %bb457

bb457:                                            ; preds = %bb452, %bb399.bb457_crit_edge
  %.34 = phi ptr [ %i446, %bb399.bb457_crit_edge ], [ %i456, %bb452 ]
  %i458 = lshr i64 %i444, 16
  %i459 = and i64 %i458, 255
  %i460 = trunc i64 %i459 to i8
  %i461 = getelementptr inbounds i8, ptr %.34, i32 -1
  store i8 %i460, ptr %i461, align 1
  br label %bb462

bb462:                                            ; preds = %bb457, %bb399.bb462_crit_edge
  %.45 = phi ptr [ %i446, %bb399.bb462_crit_edge ], [ %i461, %bb457 ]
  %i463 = lshr i64 %i444, 24
  %i464 = and i64 %i463, 255
  %i465 = trunc i64 %i464 to i8
  %i466 = getelementptr inbounds i8, ptr %.45, i32 -1
  store i8 %i465, ptr %i466, align 1
  br label %bb467

bb467:                                            ; preds = %bb462, %bb399.bb467_crit_edge
  %.56 = phi ptr [ %i446, %bb399.bb467_crit_edge ], [ %i466, %bb462 ]
  %i468 = and i64 %i441, 255
  %i469 = trunc i64 %i468 to i8
  %i470 = getelementptr inbounds i8, ptr %.56, i32 -1
  store i8 %i469, ptr %i470, align 1
  br label %bb471

bb471:                                            ; preds = %bb467, %bb399.bb471_crit_edge
  %.67 = phi ptr [ %i446, %bb399.bb471_crit_edge ], [ %i470, %bb467 ]
  %i472 = lshr i64 %i441, 8
  %i473 = and i64 %i472, 255
  %i474 = trunc i64 %i473 to i8
  %i475 = getelementptr inbounds i8, ptr %.67, i32 -1
  store i8 %i474, ptr %i475, align 1
  br label %bb476

bb476:                                            ; preds = %bb471, %bb399.bb476_crit_edge
  %.78 = phi ptr [ %i446, %bb399.bb476_crit_edge ], [ %i475, %bb471 ]
  %i477 = lshr i64 %i441, 16
  %i478 = and i64 %i477, 255
  %i479 = trunc i64 %i478 to i8
  %i480 = getelementptr inbounds i8, ptr %.78, i32 -1
  store i8 %i479, ptr %i480, align 1
  br label %bb481

bb481:                                            ; preds = %bb476, %bb399.bb481_crit_edge
  %.89 = phi ptr [ %i446, %bb399.bb481_crit_edge ], [ %i480, %bb476 ]
  %i482 = lshr i64 %i441, 24
  %i483 = and i64 %i482, 255
  %i484 = trunc i64 %i483 to i8
  %i485 = getelementptr inbounds i8, ptr %.89, i32 -1
  store i8 %i484, ptr %i485, align 1
  br label %bb486

bb486:                                            ; preds = %bb481, %bb399.bb486_crit_edge
  br label %bb487

bb487:                                            ; preds = %bb486, %bb397.bb487_crit_edge
  %.115 = phi i64 [ %i417, %bb486 ], [ %.014.lcssa, %bb397.bb487_crit_edge ]
  %.113 = phi i64 [ %i435, %bb486 ], [ %.012.lcssa, %bb397.bb487_crit_edge ]
  %i488 = lshr i64 %.115, 24
  %i489 = and i64 %i488, 255
  %i490 = trunc i64 %i489 to i8
  %i491 = getelementptr inbounds i8, ptr %i315, i32 1
  store i8 %i490, ptr %i315, align 1
  %i492 = lshr i64 %.115, 16
  %i493 = and i64 %i492, 255
  %i494 = trunc i64 %i493 to i8
  %i495 = getelementptr inbounds i8, ptr %i491, i32 1
  store i8 %i494, ptr %i491, align 1
  %i496 = lshr i64 %.115, 8
  %i497 = and i64 %i496, 255
  %i498 = trunc i64 %i497 to i8
  %i499 = getelementptr inbounds i8, ptr %i495, i32 1
  store i8 %i498, ptr %i495, align 1
  %i500 = and i64 %.115, 255
  %i501 = trunc i64 %i500 to i8
  %i502 = getelementptr inbounds i8, ptr %i499, i32 1
  store i8 %i501, ptr %i499, align 1
  %i503 = lshr i64 %.113, 24
  %i504 = and i64 %i503, 255
  %i505 = trunc i64 %i504 to i8
  %i506 = getelementptr inbounds i8, ptr %i502, i32 1
  store i8 %i505, ptr %i502, align 1
  %i507 = lshr i64 %.113, 16
  %i508 = and i64 %i507, 255
  %i509 = trunc i64 %i508 to i8
  %i510 = getelementptr inbounds i8, ptr %i506, i32 1
  store i8 %i509, ptr %i506, align 1
  %i511 = lshr i64 %.113, 8
  %i512 = and i64 %i511, 255
  %i513 = trunc i64 %i512 to i8
  %i514 = getelementptr inbounds i8, ptr %i510, i32 1
  store i8 %i513, ptr %i510, align 1
  %i515 = and i64 %.113, 255
  %i516 = trunc i64 %i515 to i8
  %i517 = getelementptr inbounds i8, ptr %i514, i32 1
  store i8 %i516, ptr %i514, align 1
  br label %bb518

bb518:                                            ; preds = %bb487, %bb247
  %i519 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 0, ptr %i519, align 8
  %i520 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 0, ptr %i520, align 16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @BF_cfb64_encrypt(ptr noundef %arg, ptr noundef %arg10, i64 noundef %arg11, ptr noundef %arg12, ptr noundef %arg13, ptr noundef %arg14, i32 noundef %arg15) #0 {
bb:
  %i = alloca [2 x i64], align 16
  %i16 = load i32, ptr %arg14, align 4
  %i17 = icmp ne i32 %arg15, 0
  br i1 %i17, label %bb18, label %bb114

bb18:                                             ; preds = %bb
  %i43 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i62 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i63 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i64 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i69 = getelementptr inbounds i8, ptr %arg13, i32 1
  %i73 = getelementptr inbounds i8, ptr %i69, i32 1
  %i77 = getelementptr inbounds i8, ptr %i73, i32 1
  %i80 = getelementptr inbounds i8, ptr %i77, i32 1
  %i81 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i86 = getelementptr inbounds i8, ptr %i80, i32 1
  %i90 = getelementptr inbounds i8, ptr %i86, i32 1
  %i94 = getelementptr inbounds i8, ptr %i90, i32 1
  br label %bb19

bb19:                                             ; preds = %bb98, %bb18
  %.07 = phi i32 [ %i16, %bb18 ], [ %i112, %bb98 ]
  %.05 = phi i64 [ %arg11, %bb18 ], [ %i20, %bb98 ]
  %.03 = phi ptr [ %arg13, %bb18 ], [ %.14, %bb98 ]
  %.01 = phi ptr [ %arg10, %bb18 ], [ %i108, %bb98 ]
  %.0 = phi ptr [ %arg, %bb18 ], [ %i99, %bb98 ]
  %i20 = add nsw i64 %.05, -1
  %i21 = icmp ne i64 %.05, 0
  br i1 %i21, label %bb22, label %bb113

bb22:                                             ; preds = %bb19
  %i23 = icmp eq i32 %.07, 0
  br i1 %i23, label %bb24, label %bb22.bb98_crit_edge

bb22.bb98_crit_edge:                              ; preds = %bb22
  br label %bb98

bb24:                                             ; preds = %bb22
  %i25 = getelementptr inbounds i8, ptr %.03, i32 1
  %i26 = load i8, ptr %.03, align 1
  %i27 = zext i8 %i26 to i64
  %i28 = shl i64 %i27, 24
  %i29 = getelementptr inbounds i8, ptr %i25, i32 1
  %i30 = load i8, ptr %i25, align 1
  %i31 = zext i8 %i30 to i64
  %i32 = shl i64 %i31, 16
  %i33 = or i64 %i28, %i32
  %i34 = getelementptr inbounds i8, ptr %i29, i32 1
  %i35 = load i8, ptr %i29, align 1
  %i36 = zext i8 %i35 to i64
  %i37 = shl i64 %i36, 8
  %i38 = or i64 %i33, %i37
  %i39 = getelementptr inbounds i8, ptr %i34, i32 1
  %i40 = load i8, ptr %i34, align 1
  %i41 = zext i8 %i40 to i64
  %i42 = or i64 %i38, %i41
  store i64 %i42, ptr %i43, align 16
  %i44 = getelementptr inbounds i8, ptr %i39, i32 1
  %i45 = load i8, ptr %i39, align 1
  %i46 = zext i8 %i45 to i64
  %i47 = shl i64 %i46, 24
  %i48 = getelementptr inbounds i8, ptr %i44, i32 1
  %i49 = load i8, ptr %i44, align 1
  %i50 = zext i8 %i49 to i64
  %i51 = shl i64 %i50, 16
  %i52 = or i64 %i47, %i51
  %i53 = getelementptr inbounds i8, ptr %i48, i32 1
  %i54 = load i8, ptr %i48, align 1
  %i55 = zext i8 %i54 to i64
  %i56 = shl i64 %i55, 8
  %i57 = or i64 %i52, %i56
  %i59 = load i8, ptr %i53, align 1
  %i60 = zext i8 %i59 to i64
  %i61 = or i64 %i57, %i60
  store i64 %i61, ptr %i62, align 8
  call void @BF_encrypt(ptr noundef %i63, ptr noundef %arg12, i32 noundef 1)
  %i65 = load i64, ptr %i64, align 16
  %i66 = lshr i64 %i65, 24
  %i67 = and i64 %i66, 255
  %i68 = trunc i64 %i67 to i8
  store i8 %i68, ptr %arg13, align 1
  %i70 = lshr i64 %i65, 16
  %i71 = and i64 %i70, 255
  %i72 = trunc i64 %i71 to i8
  store i8 %i72, ptr %i69, align 1
  %i74 = lshr i64 %i65, 8
  %i75 = and i64 %i74, 255
  %i76 = trunc i64 %i75 to i8
  store i8 %i76, ptr %i73, align 1
  %i78 = and i64 %i65, 255
  %i79 = trunc i64 %i78 to i8
  store i8 %i79, ptr %i77, align 1
  %i82 = load i64, ptr %i81, align 8
  %i83 = lshr i64 %i82, 24
  %i84 = and i64 %i83, 255
  %i85 = trunc i64 %i84 to i8
  store i8 %i85, ptr %i80, align 1
  %i87 = lshr i64 %i82, 16
  %i88 = and i64 %i87, 255
  %i89 = trunc i64 %i88 to i8
  store i8 %i89, ptr %i86, align 1
  %i91 = lshr i64 %i82, 8
  %i92 = and i64 %i91, 255
  %i93 = trunc i64 %i92 to i8
  store i8 %i93, ptr %i90, align 1
  %i95 = and i64 %i82, 255
  %i96 = trunc i64 %i95 to i8
  store i8 %i96, ptr %i94, align 1
  br label %bb98

bb98:                                             ; preds = %bb24, %bb22.bb98_crit_edge
  %.14 = phi ptr [ %arg13, %bb24 ], [ %.03, %bb22.bb98_crit_edge ]
  %i99 = getelementptr inbounds i8, ptr %.0, i32 1
  %i100 = load i8, ptr %.0, align 1
  %i101 = zext i8 %i100 to i32
  %i102 = sext i32 %.07 to i64
  %i103 = getelementptr inbounds i8, ptr %.14, i64 %i102
  %i104 = load i8, ptr %i103, align 1
  %i105 = zext i8 %i104 to i32
  %i106 = xor i32 %i101, %i105
  %i107 = trunc i32 %i106 to i8
  %i108 = getelementptr inbounds i8, ptr %.01, i32 1
  store i8 %i107, ptr %.01, align 1
  %i109 = sext i32 %.07 to i64
  %i110 = getelementptr inbounds i8, ptr %.14, i64 %i109
  store i8 %i107, ptr %i110, align 1
  %i111 = add nsw i32 %.07, 1
  %i112 = and i32 %i111, 7
  br label %bb19, !llvm.loop !11

bb113:                                            ; preds = %bb19
  %.07.lcssa = phi i32 [ %.07, %bb19 ]
  br label %bb210

bb114:                                            ; preds = %bb
  %i139 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i158 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i159 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i160 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i165 = getelementptr inbounds i8, ptr %arg13, i32 1
  %i169 = getelementptr inbounds i8, ptr %i165, i32 1
  %i173 = getelementptr inbounds i8, ptr %i169, i32 1
  %i176 = getelementptr inbounds i8, ptr %i173, i32 1
  %i177 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i182 = getelementptr inbounds i8, ptr %i176, i32 1
  %i186 = getelementptr inbounds i8, ptr %i182, i32 1
  %i190 = getelementptr inbounds i8, ptr %i186, i32 1
  br label %bb115

bb115:                                            ; preds = %bb194, %bb114
  %.18 = phi i32 [ %i16, %bb114 ], [ %i208, %bb194 ]
  %.16 = phi i64 [ %arg11, %bb114 ], [ %i116, %bb194 ]
  %.2 = phi ptr [ %arg13, %bb114 ], [ %.3, %bb194 ]
  %.12 = phi ptr [ %arg10, %bb114 ], [ %i206, %bb194 ]
  %.1 = phi ptr [ %arg, %bb114 ], [ %i195, %bb194 ]
  %i116 = add nsw i64 %.16, -1
  %i117 = icmp ne i64 %.16, 0
  br i1 %i117, label %bb118, label %bb209

bb118:                                            ; preds = %bb115
  %i119 = icmp eq i32 %.18, 0
  br i1 %i119, label %bb120, label %bb118.bb194_crit_edge

bb118.bb194_crit_edge:                            ; preds = %bb118
  br label %bb194

bb120:                                            ; preds = %bb118
  %i121 = getelementptr inbounds i8, ptr %.2, i32 1
  %i122 = load i8, ptr %.2, align 1
  %i123 = zext i8 %i122 to i64
  %i124 = shl i64 %i123, 24
  %i125 = getelementptr inbounds i8, ptr %i121, i32 1
  %i126 = load i8, ptr %i121, align 1
  %i127 = zext i8 %i126 to i64
  %i128 = shl i64 %i127, 16
  %i129 = or i64 %i124, %i128
  %i130 = getelementptr inbounds i8, ptr %i125, i32 1
  %i131 = load i8, ptr %i125, align 1
  %i132 = zext i8 %i131 to i64
  %i133 = shl i64 %i132, 8
  %i134 = or i64 %i129, %i133
  %i135 = getelementptr inbounds i8, ptr %i130, i32 1
  %i136 = load i8, ptr %i130, align 1
  %i137 = zext i8 %i136 to i64
  %i138 = or i64 %i134, %i137
  store i64 %i138, ptr %i139, align 16
  %i140 = getelementptr inbounds i8, ptr %i135, i32 1
  %i141 = load i8, ptr %i135, align 1
  %i142 = zext i8 %i141 to i64
  %i143 = shl i64 %i142, 24
  %i144 = getelementptr inbounds i8, ptr %i140, i32 1
  %i145 = load i8, ptr %i140, align 1
  %i146 = zext i8 %i145 to i64
  %i147 = shl i64 %i146, 16
  %i148 = or i64 %i143, %i147
  %i149 = getelementptr inbounds i8, ptr %i144, i32 1
  %i150 = load i8, ptr %i144, align 1
  %i151 = zext i8 %i150 to i64
  %i152 = shl i64 %i151, 8
  %i153 = or i64 %i148, %i152
  %i155 = load i8, ptr %i149, align 1
  %i156 = zext i8 %i155 to i64
  %i157 = or i64 %i153, %i156
  store i64 %i157, ptr %i158, align 8
  call void @BF_encrypt(ptr noundef %i159, ptr noundef %arg12, i32 noundef 1)
  %i161 = load i64, ptr %i160, align 16
  %i162 = lshr i64 %i161, 24
  %i163 = and i64 %i162, 255
  %i164 = trunc i64 %i163 to i8
  store i8 %i164, ptr %arg13, align 1
  %i166 = lshr i64 %i161, 16
  %i167 = and i64 %i166, 255
  %i168 = trunc i64 %i167 to i8
  store i8 %i168, ptr %i165, align 1
  %i170 = lshr i64 %i161, 8
  %i171 = and i64 %i170, 255
  %i172 = trunc i64 %i171 to i8
  store i8 %i172, ptr %i169, align 1
  %i174 = and i64 %i161, 255
  %i175 = trunc i64 %i174 to i8
  store i8 %i175, ptr %i173, align 1
  %i178 = load i64, ptr %i177, align 8
  %i179 = lshr i64 %i178, 24
  %i180 = and i64 %i179, 255
  %i181 = trunc i64 %i180 to i8
  store i8 %i181, ptr %i176, align 1
  %i183 = lshr i64 %i178, 16
  %i184 = and i64 %i183, 255
  %i185 = trunc i64 %i184 to i8
  store i8 %i185, ptr %i182, align 1
  %i187 = lshr i64 %i178, 8
  %i188 = and i64 %i187, 255
  %i189 = trunc i64 %i188 to i8
  store i8 %i189, ptr %i186, align 1
  %i191 = and i64 %i178, 255
  %i192 = trunc i64 %i191 to i8
  store i8 %i192, ptr %i190, align 1
  br label %bb194

bb194:                                            ; preds = %bb120, %bb118.bb194_crit_edge
  %.3 = phi ptr [ %arg13, %bb120 ], [ %.2, %bb118.bb194_crit_edge ]
  %i195 = getelementptr inbounds i8, ptr %.1, i32 1
  %i196 = load i8, ptr %.1, align 1
  %i197 = sext i32 %.18 to i64
  %i198 = getelementptr inbounds i8, ptr %.3, i64 %i197
  %i199 = load i8, ptr %i198, align 1
  %i200 = sext i32 %.18 to i64
  %i201 = getelementptr inbounds i8, ptr %.3, i64 %i200
  store i8 %i196, ptr %i201, align 1
  %i202 = zext i8 %i199 to i32
  %i203 = zext i8 %i196 to i32
  %i204 = xor i32 %i202, %i203
  %i205 = trunc i32 %i204 to i8
  %i206 = getelementptr inbounds i8, ptr %.12, i32 1
  store i8 %i205, ptr %.12, align 1
  %i207 = add nsw i32 %.18, 1
  %i208 = and i32 %i207, 7
  br label %bb115, !llvm.loop !12

bb209:                                            ; preds = %bb115
  %.18.lcssa = phi i32 [ %.18, %bb115 ]
  br label %bb210

bb210:                                            ; preds = %bb209, %bb113
  %.29 = phi i32 [ %.07.lcssa, %bb113 ], [ %.18.lcssa, %bb209 ]
  %i211 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 0, ptr %i211, align 8
  %i212 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 0, ptr %i212, align 16
  store i32 %.29, ptr %arg14, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @BF_options() #0 {
bb:
  ret ptr @.str.1
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @BF_ecb_encrypt(ptr noundef %arg, ptr noundef %arg1, ptr noundef %arg2, i32 noundef %arg3) #0 {
bb:
  %i = alloca [2 x i64], align 16
  %i4 = getelementptr inbounds i8, ptr %arg, i32 1
  %i5 = load i8, ptr %arg, align 1
  %i6 = zext i8 %i5 to i64
  %i7 = shl i64 %i6, 24
  %i8 = getelementptr inbounds i8, ptr %i4, i32 1
  %i9 = load i8, ptr %i4, align 1
  %i10 = zext i8 %i9 to i64
  %i11 = shl i64 %i10, 16
  %i12 = or i64 %i7, %i11
  %i13 = getelementptr inbounds i8, ptr %i8, i32 1
  %i14 = load i8, ptr %i8, align 1
  %i15 = zext i8 %i14 to i64
  %i16 = shl i64 %i15, 8
  %i17 = or i64 %i12, %i16
  %i18 = getelementptr inbounds i8, ptr %i13, i32 1
  %i19 = load i8, ptr %i13, align 1
  %i20 = zext i8 %i19 to i64
  %i21 = or i64 %i17, %i20
  %i22 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 %i21, ptr %i22, align 16
  %i23 = getelementptr inbounds i8, ptr %i18, i32 1
  %i24 = load i8, ptr %i18, align 1
  %i25 = zext i8 %i24 to i64
  %i26 = shl i64 %i25, 24
  %i27 = getelementptr inbounds i8, ptr %i23, i32 1
  %i28 = load i8, ptr %i23, align 1
  %i29 = zext i8 %i28 to i64
  %i30 = shl i64 %i29, 16
  %i31 = or i64 %i26, %i30
  %i32 = getelementptr inbounds i8, ptr %i27, i32 1
  %i33 = load i8, ptr %i27, align 1
  %i34 = zext i8 %i33 to i64
  %i35 = shl i64 %i34, 8
  %i36 = or i64 %i31, %i35
  %i37 = getelementptr inbounds i8, ptr %i32, i32 1
  %i38 = load i8, ptr %i32, align 1
  %i39 = zext i8 %i38 to i64
  %i40 = or i64 %i36, %i39
  %i41 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 %i40, ptr %i41, align 8
  %i42 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  call void @BF_encrypt(ptr noundef %i42, ptr noundef %arg2, i32 noundef %arg3)
  %i43 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i44 = load i64, ptr %i43, align 16
  %i45 = lshr i64 %i44, 24
  %i46 = and i64 %i45, 255
  %i47 = trunc i64 %i46 to i8
  %i48 = getelementptr inbounds i8, ptr %arg1, i32 1
  store i8 %i47, ptr %arg1, align 1
  %i49 = lshr i64 %i44, 16
  %i50 = and i64 %i49, 255
  %i51 = trunc i64 %i50 to i8
  %i52 = getelementptr inbounds i8, ptr %i48, i32 1
  store i8 %i51, ptr %i48, align 1
  %i53 = lshr i64 %i44, 8
  %i54 = and i64 %i53, 255
  %i55 = trunc i64 %i54 to i8
  %i56 = getelementptr inbounds i8, ptr %i52, i32 1
  store i8 %i55, ptr %i52, align 1
  %i57 = and i64 %i44, 255
  %i58 = trunc i64 %i57 to i8
  %i59 = getelementptr inbounds i8, ptr %i56, i32 1
  store i8 %i58, ptr %i56, align 1
  %i60 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  %i61 = load i64, ptr %i60, align 8
  %i62 = lshr i64 %i61, 24
  %i63 = and i64 %i62, 255
  %i64 = trunc i64 %i63 to i8
  %i65 = getelementptr inbounds i8, ptr %i59, i32 1
  store i8 %i64, ptr %i59, align 1
  %i66 = lshr i64 %i61, 16
  %i67 = and i64 %i66, 255
  %i68 = trunc i64 %i67 to i8
  %i69 = getelementptr inbounds i8, ptr %i65, i32 1
  store i8 %i68, ptr %i65, align 1
  %i70 = lshr i64 %i61, 8
  %i71 = and i64 %i70, 255
  %i72 = trunc i64 %i71 to i8
  %i73 = getelementptr inbounds i8, ptr %i69, i32 1
  store i8 %i72, ptr %i69, align 1
  %i74 = and i64 %i61, 255
  %i75 = trunc i64 %i74 to i8
  %i76 = getelementptr inbounds i8, ptr %i73, i32 1
  store i8 %i75, ptr %i73, align 1
  %i77 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 0, ptr %i77, align 8
  %i78 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 0, ptr %i78, align 16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @BF_encrypt(ptr noundef %arg, ptr noundef %arg2, i32 noundef %arg3) #0 {
bb:
  %i = getelementptr inbounds %struct.bf_key_st, ptr %arg2, i32 0, i32 0
  %i4 = getelementptr inbounds [18 x i64], ptr %i, i64 0, i64 0
  %i5 = getelementptr inbounds %struct.bf_key_st, ptr %arg2, i32 0, i32 1
  %i6 = getelementptr inbounds [1024 x i64], ptr %i5, i64 0, i64 0
  %i7 = getelementptr inbounds i64, ptr %arg, i64 0
  %i8 = load i64, ptr %i7, align 8
  %i9 = getelementptr inbounds i64, ptr %arg, i64 1
  %i10 = load i64, ptr %i9, align 8
  %i11 = icmp ne i32 %arg3, 0
  br i1 %i11, label %bb12, label %bb419

bb12:                                             ; preds = %bb
  %i13 = getelementptr inbounds i64, ptr %i4, i64 0
  %i14 = load i64, ptr %i13, align 8
  %i15 = xor i64 %i8, %i14
  %i16 = getelementptr inbounds i64, ptr %i4, i64 1
  %i17 = load i64, ptr %i16, align 8
  %i18 = xor i64 %i10, %i17
  %i19 = lshr i64 %i15, 24
  %i20 = getelementptr inbounds i64, ptr %i6, i64 %i19
  %i21 = load i64, ptr %i20, align 8
  %i22 = lshr i64 %i15, 16
  %i23 = and i64 %i22, 255
  %i24 = add i64 256, %i23
  %i25 = getelementptr inbounds i64, ptr %i6, i64 %i24
  %i26 = load i64, ptr %i25, align 8
  %i27 = add i64 %i21, %i26
  %i28 = lshr i64 %i15, 8
  %i29 = and i64 %i28, 255
  %i30 = add i64 512, %i29
  %i31 = getelementptr inbounds i64, ptr %i6, i64 %i30
  %i32 = load i64, ptr %i31, align 8
  %i33 = xor i64 %i27, %i32
  %i34 = and i64 %i15, 255
  %i35 = add i64 768, %i34
  %i36 = getelementptr inbounds i64, ptr %i6, i64 %i35
  %i37 = load i64, ptr %i36, align 8
  %i38 = add i64 %i33, %i37
  %i39 = and i64 %i38, 4294967295
  %i40 = xor i64 %i18, %i39
  %i41 = getelementptr inbounds i64, ptr %i4, i64 2
  %i42 = load i64, ptr %i41, align 8
  %i43 = xor i64 %i15, %i42
  %i44 = lshr i64 %i40, 24
  %i45 = getelementptr inbounds i64, ptr %i6, i64 %i44
  %i46 = load i64, ptr %i45, align 8
  %i47 = lshr i64 %i40, 16
  %i48 = and i64 %i47, 255
  %i49 = add i64 256, %i48
  %i50 = getelementptr inbounds i64, ptr %i6, i64 %i49
  %i51 = load i64, ptr %i50, align 8
  %i52 = add i64 %i46, %i51
  %i53 = lshr i64 %i40, 8
  %i54 = and i64 %i53, 255
  %i55 = add i64 512, %i54
  %i56 = getelementptr inbounds i64, ptr %i6, i64 %i55
  %i57 = load i64, ptr %i56, align 8
  %i58 = xor i64 %i52, %i57
  %i59 = and i64 %i40, 255
  %i60 = add i64 768, %i59
  %i61 = getelementptr inbounds i64, ptr %i6, i64 %i60
  %i62 = load i64, ptr %i61, align 8
  %i63 = add i64 %i58, %i62
  %i64 = and i64 %i63, 4294967295
  %i65 = xor i64 %i43, %i64
  %i66 = getelementptr inbounds i64, ptr %i4, i64 3
  %i67 = load i64, ptr %i66, align 8
  %i68 = xor i64 %i40, %i67
  %i69 = lshr i64 %i65, 24
  %i70 = getelementptr inbounds i64, ptr %i6, i64 %i69
  %i71 = load i64, ptr %i70, align 8
  %i72 = lshr i64 %i65, 16
  %i73 = and i64 %i72, 255
  %i74 = add i64 256, %i73
  %i75 = getelementptr inbounds i64, ptr %i6, i64 %i74
  %i76 = load i64, ptr %i75, align 8
  %i77 = add i64 %i71, %i76
  %i78 = lshr i64 %i65, 8
  %i79 = and i64 %i78, 255
  %i80 = add i64 512, %i79
  %i81 = getelementptr inbounds i64, ptr %i6, i64 %i80
  %i82 = load i64, ptr %i81, align 8
  %i83 = xor i64 %i77, %i82
  %i84 = and i64 %i65, 255
  %i85 = add i64 768, %i84
  %i86 = getelementptr inbounds i64, ptr %i6, i64 %i85
  %i87 = load i64, ptr %i86, align 8
  %i88 = add i64 %i83, %i87
  %i89 = and i64 %i88, 4294967295
  %i90 = xor i64 %i68, %i89
  %i91 = getelementptr inbounds i64, ptr %i4, i64 4
  %i92 = load i64, ptr %i91, align 8
  %i93 = xor i64 %i65, %i92
  %i94 = lshr i64 %i90, 24
  %i95 = getelementptr inbounds i64, ptr %i6, i64 %i94
  %i96 = load i64, ptr %i95, align 8
  %i97 = lshr i64 %i90, 16
  %i98 = and i64 %i97, 255
  %i99 = add i64 256, %i98
  %i100 = getelementptr inbounds i64, ptr %i6, i64 %i99
  %i101 = load i64, ptr %i100, align 8
  %i102 = add i64 %i96, %i101
  %i103 = lshr i64 %i90, 8
  %i104 = and i64 %i103, 255
  %i105 = add i64 512, %i104
  %i106 = getelementptr inbounds i64, ptr %i6, i64 %i105
  %i107 = load i64, ptr %i106, align 8
  %i108 = xor i64 %i102, %i107
  %i109 = and i64 %i90, 255
  %i110 = add i64 768, %i109
  %i111 = getelementptr inbounds i64, ptr %i6, i64 %i110
  %i112 = load i64, ptr %i111, align 8
  %i113 = add i64 %i108, %i112
  %i114 = and i64 %i113, 4294967295
  %i115 = xor i64 %i93, %i114
  %i116 = getelementptr inbounds i64, ptr %i4, i64 5
  %i117 = load i64, ptr %i116, align 8
  %i118 = xor i64 %i90, %i117
  %i119 = lshr i64 %i115, 24
  %i120 = getelementptr inbounds i64, ptr %i6, i64 %i119
  %i121 = load i64, ptr %i120, align 8
  %i122 = lshr i64 %i115, 16
  %i123 = and i64 %i122, 255
  %i124 = add i64 256, %i123
  %i125 = getelementptr inbounds i64, ptr %i6, i64 %i124
  %i126 = load i64, ptr %i125, align 8
  %i127 = add i64 %i121, %i126
  %i128 = lshr i64 %i115, 8
  %i129 = and i64 %i128, 255
  %i130 = add i64 512, %i129
  %i131 = getelementptr inbounds i64, ptr %i6, i64 %i130
  %i132 = load i64, ptr %i131, align 8
  %i133 = xor i64 %i127, %i132
  %i134 = and i64 %i115, 255
  %i135 = add i64 768, %i134
  %i136 = getelementptr inbounds i64, ptr %i6, i64 %i135
  %i137 = load i64, ptr %i136, align 8
  %i138 = add i64 %i133, %i137
  %i139 = and i64 %i138, 4294967295
  %i140 = xor i64 %i118, %i139
  %i141 = getelementptr inbounds i64, ptr %i4, i64 6
  %i142 = load i64, ptr %i141, align 8
  %i143 = xor i64 %i115, %i142
  %i144 = lshr i64 %i140, 24
  %i145 = getelementptr inbounds i64, ptr %i6, i64 %i144
  %i146 = load i64, ptr %i145, align 8
  %i147 = lshr i64 %i140, 16
  %i148 = and i64 %i147, 255
  %i149 = add i64 256, %i148
  %i150 = getelementptr inbounds i64, ptr %i6, i64 %i149
  %i151 = load i64, ptr %i150, align 8
  %i152 = add i64 %i146, %i151
  %i153 = lshr i64 %i140, 8
  %i154 = and i64 %i153, 255
  %i155 = add i64 512, %i154
  %i156 = getelementptr inbounds i64, ptr %i6, i64 %i155
  %i157 = load i64, ptr %i156, align 8
  %i158 = xor i64 %i152, %i157
  %i159 = and i64 %i140, 255
  %i160 = add i64 768, %i159
  %i161 = getelementptr inbounds i64, ptr %i6, i64 %i160
  %i162 = load i64, ptr %i161, align 8
  %i163 = add i64 %i158, %i162
  %i164 = and i64 %i163, 4294967295
  %i165 = xor i64 %i143, %i164
  %i166 = getelementptr inbounds i64, ptr %i4, i64 7
  %i167 = load i64, ptr %i166, align 8
  %i168 = xor i64 %i140, %i167
  %i169 = lshr i64 %i165, 24
  %i170 = getelementptr inbounds i64, ptr %i6, i64 %i169
  %i171 = load i64, ptr %i170, align 8
  %i172 = lshr i64 %i165, 16
  %i173 = and i64 %i172, 255
  %i174 = add i64 256, %i173
  %i175 = getelementptr inbounds i64, ptr %i6, i64 %i174
  %i176 = load i64, ptr %i175, align 8
  %i177 = add i64 %i171, %i176
  %i178 = lshr i64 %i165, 8
  %i179 = and i64 %i178, 255
  %i180 = add i64 512, %i179
  %i181 = getelementptr inbounds i64, ptr %i6, i64 %i180
  %i182 = load i64, ptr %i181, align 8
  %i183 = xor i64 %i177, %i182
  %i184 = and i64 %i165, 255
  %i185 = add i64 768, %i184
  %i186 = getelementptr inbounds i64, ptr %i6, i64 %i185
  %i187 = load i64, ptr %i186, align 8
  %i188 = add i64 %i183, %i187
  %i189 = and i64 %i188, 4294967295
  %i190 = xor i64 %i168, %i189
  %i191 = getelementptr inbounds i64, ptr %i4, i64 8
  %i192 = load i64, ptr %i191, align 8
  %i193 = xor i64 %i165, %i192
  %i194 = lshr i64 %i190, 24
  %i195 = getelementptr inbounds i64, ptr %i6, i64 %i194
  %i196 = load i64, ptr %i195, align 8
  %i197 = lshr i64 %i190, 16
  %i198 = and i64 %i197, 255
  %i199 = add i64 256, %i198
  %i200 = getelementptr inbounds i64, ptr %i6, i64 %i199
  %i201 = load i64, ptr %i200, align 8
  %i202 = add i64 %i196, %i201
  %i203 = lshr i64 %i190, 8
  %i204 = and i64 %i203, 255
  %i205 = add i64 512, %i204
  %i206 = getelementptr inbounds i64, ptr %i6, i64 %i205
  %i207 = load i64, ptr %i206, align 8
  %i208 = xor i64 %i202, %i207
  %i209 = and i64 %i190, 255
  %i210 = add i64 768, %i209
  %i211 = getelementptr inbounds i64, ptr %i6, i64 %i210
  %i212 = load i64, ptr %i211, align 8
  %i213 = add i64 %i208, %i212
  %i214 = and i64 %i213, 4294967295
  %i215 = xor i64 %i193, %i214
  %i216 = getelementptr inbounds i64, ptr %i4, i64 9
  %i217 = load i64, ptr %i216, align 8
  %i218 = xor i64 %i190, %i217
  %i219 = lshr i64 %i215, 24
  %i220 = getelementptr inbounds i64, ptr %i6, i64 %i219
  %i221 = load i64, ptr %i220, align 8
  %i222 = lshr i64 %i215, 16
  %i223 = and i64 %i222, 255
  %i224 = add i64 256, %i223
  %i225 = getelementptr inbounds i64, ptr %i6, i64 %i224
  %i226 = load i64, ptr %i225, align 8
  %i227 = add i64 %i221, %i226
  %i228 = lshr i64 %i215, 8
  %i229 = and i64 %i228, 255
  %i230 = add i64 512, %i229
  %i231 = getelementptr inbounds i64, ptr %i6, i64 %i230
  %i232 = load i64, ptr %i231, align 8
  %i233 = xor i64 %i227, %i232
  %i234 = and i64 %i215, 255
  %i235 = add i64 768, %i234
  %i236 = getelementptr inbounds i64, ptr %i6, i64 %i235
  %i237 = load i64, ptr %i236, align 8
  %i238 = add i64 %i233, %i237
  %i239 = and i64 %i238, 4294967295
  %i240 = xor i64 %i218, %i239
  %i241 = getelementptr inbounds i64, ptr %i4, i64 10
  %i242 = load i64, ptr %i241, align 8
  %i243 = xor i64 %i215, %i242
  %i244 = lshr i64 %i240, 24
  %i245 = getelementptr inbounds i64, ptr %i6, i64 %i244
  %i246 = load i64, ptr %i245, align 8
  %i247 = lshr i64 %i240, 16
  %i248 = and i64 %i247, 255
  %i249 = add i64 256, %i248
  %i250 = getelementptr inbounds i64, ptr %i6, i64 %i249
  %i251 = load i64, ptr %i250, align 8
  %i252 = add i64 %i246, %i251
  %i253 = lshr i64 %i240, 8
  %i254 = and i64 %i253, 255
  %i255 = add i64 512, %i254
  %i256 = getelementptr inbounds i64, ptr %i6, i64 %i255
  %i257 = load i64, ptr %i256, align 8
  %i258 = xor i64 %i252, %i257
  %i259 = and i64 %i240, 255
  %i260 = add i64 768, %i259
  %i261 = getelementptr inbounds i64, ptr %i6, i64 %i260
  %i262 = load i64, ptr %i261, align 8
  %i263 = add i64 %i258, %i262
  %i264 = and i64 %i263, 4294967295
  %i265 = xor i64 %i243, %i264
  %i266 = getelementptr inbounds i64, ptr %i4, i64 11
  %i267 = load i64, ptr %i266, align 8
  %i268 = xor i64 %i240, %i267
  %i269 = lshr i64 %i265, 24
  %i270 = getelementptr inbounds i64, ptr %i6, i64 %i269
  %i271 = load i64, ptr %i270, align 8
  %i272 = lshr i64 %i265, 16
  %i273 = and i64 %i272, 255
  %i274 = add i64 256, %i273
  %i275 = getelementptr inbounds i64, ptr %i6, i64 %i274
  %i276 = load i64, ptr %i275, align 8
  %i277 = add i64 %i271, %i276
  %i278 = lshr i64 %i265, 8
  %i279 = and i64 %i278, 255
  %i280 = add i64 512, %i279
  %i281 = getelementptr inbounds i64, ptr %i6, i64 %i280
  %i282 = load i64, ptr %i281, align 8
  %i283 = xor i64 %i277, %i282
  %i284 = and i64 %i265, 255
  %i285 = add i64 768, %i284
  %i286 = getelementptr inbounds i64, ptr %i6, i64 %i285
  %i287 = load i64, ptr %i286, align 8
  %i288 = add i64 %i283, %i287
  %i289 = and i64 %i288, 4294967295
  %i290 = xor i64 %i268, %i289
  %i291 = getelementptr inbounds i64, ptr %i4, i64 12
  %i292 = load i64, ptr %i291, align 8
  %i293 = xor i64 %i265, %i292
  %i294 = lshr i64 %i290, 24
  %i295 = getelementptr inbounds i64, ptr %i6, i64 %i294
  %i296 = load i64, ptr %i295, align 8
  %i297 = lshr i64 %i290, 16
  %i298 = and i64 %i297, 255
  %i299 = add i64 256, %i298
  %i300 = getelementptr inbounds i64, ptr %i6, i64 %i299
  %i301 = load i64, ptr %i300, align 8
  %i302 = add i64 %i296, %i301
  %i303 = lshr i64 %i290, 8
  %i304 = and i64 %i303, 255
  %i305 = add i64 512, %i304
  %i306 = getelementptr inbounds i64, ptr %i6, i64 %i305
  %i307 = load i64, ptr %i306, align 8
  %i308 = xor i64 %i302, %i307
  %i309 = and i64 %i290, 255
  %i310 = add i64 768, %i309
  %i311 = getelementptr inbounds i64, ptr %i6, i64 %i310
  %i312 = load i64, ptr %i311, align 8
  %i313 = add i64 %i308, %i312
  %i314 = and i64 %i313, 4294967295
  %i315 = xor i64 %i293, %i314
  %i316 = getelementptr inbounds i64, ptr %i4, i64 13
  %i317 = load i64, ptr %i316, align 8
  %i318 = xor i64 %i290, %i317
  %i319 = lshr i64 %i315, 24
  %i320 = getelementptr inbounds i64, ptr %i6, i64 %i319
  %i321 = load i64, ptr %i320, align 8
  %i322 = lshr i64 %i315, 16
  %i323 = and i64 %i322, 255
  %i324 = add i64 256, %i323
  %i325 = getelementptr inbounds i64, ptr %i6, i64 %i324
  %i326 = load i64, ptr %i325, align 8
  %i327 = add i64 %i321, %i326
  %i328 = lshr i64 %i315, 8
  %i329 = and i64 %i328, 255
  %i330 = add i64 512, %i329
  %i331 = getelementptr inbounds i64, ptr %i6, i64 %i330
  %i332 = load i64, ptr %i331, align 8
  %i333 = xor i64 %i327, %i332
  %i334 = and i64 %i315, 255
  %i335 = add i64 768, %i334
  %i336 = getelementptr inbounds i64, ptr %i6, i64 %i335
  %i337 = load i64, ptr %i336, align 8
  %i338 = add i64 %i333, %i337
  %i339 = and i64 %i338, 4294967295
  %i340 = xor i64 %i318, %i339
  %i341 = getelementptr inbounds i64, ptr %i4, i64 14
  %i342 = load i64, ptr %i341, align 8
  %i343 = xor i64 %i315, %i342
  %i344 = lshr i64 %i340, 24
  %i345 = getelementptr inbounds i64, ptr %i6, i64 %i344
  %i346 = load i64, ptr %i345, align 8
  %i347 = lshr i64 %i340, 16
  %i348 = and i64 %i347, 255
  %i349 = add i64 256, %i348
  %i350 = getelementptr inbounds i64, ptr %i6, i64 %i349
  %i351 = load i64, ptr %i350, align 8
  %i352 = add i64 %i346, %i351
  %i353 = lshr i64 %i340, 8
  %i354 = and i64 %i353, 255
  %i355 = add i64 512, %i354
  %i356 = getelementptr inbounds i64, ptr %i6, i64 %i355
  %i357 = load i64, ptr %i356, align 8
  %i358 = xor i64 %i352, %i357
  %i359 = and i64 %i340, 255
  %i360 = add i64 768, %i359
  %i361 = getelementptr inbounds i64, ptr %i6, i64 %i360
  %i362 = load i64, ptr %i361, align 8
  %i363 = add i64 %i358, %i362
  %i364 = and i64 %i363, 4294967295
  %i365 = xor i64 %i343, %i364
  %i366 = getelementptr inbounds i64, ptr %i4, i64 15
  %i367 = load i64, ptr %i366, align 8
  %i368 = xor i64 %i340, %i367
  %i369 = lshr i64 %i365, 24
  %i370 = getelementptr inbounds i64, ptr %i6, i64 %i369
  %i371 = load i64, ptr %i370, align 8
  %i372 = lshr i64 %i365, 16
  %i373 = and i64 %i372, 255
  %i374 = add i64 256, %i373
  %i375 = getelementptr inbounds i64, ptr %i6, i64 %i374
  %i376 = load i64, ptr %i375, align 8
  %i377 = add i64 %i371, %i376
  %i378 = lshr i64 %i365, 8
  %i379 = and i64 %i378, 255
  %i380 = add i64 512, %i379
  %i381 = getelementptr inbounds i64, ptr %i6, i64 %i380
  %i382 = load i64, ptr %i381, align 8
  %i383 = xor i64 %i377, %i382
  %i384 = and i64 %i365, 255
  %i385 = add i64 768, %i384
  %i386 = getelementptr inbounds i64, ptr %i6, i64 %i385
  %i387 = load i64, ptr %i386, align 8
  %i388 = add i64 %i383, %i387
  %i389 = and i64 %i388, 4294967295
  %i390 = xor i64 %i368, %i389
  %i391 = getelementptr inbounds i64, ptr %i4, i64 16
  %i392 = load i64, ptr %i391, align 8
  %i393 = xor i64 %i365, %i392
  %i394 = lshr i64 %i390, 24
  %i395 = getelementptr inbounds i64, ptr %i6, i64 %i394
  %i396 = load i64, ptr %i395, align 8
  %i397 = lshr i64 %i390, 16
  %i398 = and i64 %i397, 255
  %i399 = add i64 256, %i398
  %i400 = getelementptr inbounds i64, ptr %i6, i64 %i399
  %i401 = load i64, ptr %i400, align 8
  %i402 = add i64 %i396, %i401
  %i403 = lshr i64 %i390, 8
  %i404 = and i64 %i403, 255
  %i405 = add i64 512, %i404
  %i406 = getelementptr inbounds i64, ptr %i6, i64 %i405
  %i407 = load i64, ptr %i406, align 8
  %i408 = xor i64 %i402, %i407
  %i409 = and i64 %i390, 255
  %i410 = add i64 768, %i409
  %i411 = getelementptr inbounds i64, ptr %i6, i64 %i410
  %i412 = load i64, ptr %i411, align 8
  %i413 = add i64 %i408, %i412
  %i414 = and i64 %i413, 4294967295
  %i415 = xor i64 %i393, %i414
  %i416 = getelementptr inbounds i64, ptr %i4, i64 17
  %i417 = load i64, ptr %i416, align 8
  %i418 = xor i64 %i390, %i417
  br label %bb826

bb419:                                            ; preds = %bb
  %i420 = getelementptr inbounds i64, ptr %i4, i64 17
  %i421 = load i64, ptr %i420, align 8
  %i422 = xor i64 %i8, %i421
  %i423 = getelementptr inbounds i64, ptr %i4, i64 16
  %i424 = load i64, ptr %i423, align 8
  %i425 = xor i64 %i10, %i424
  %i426 = lshr i64 %i422, 24
  %i427 = getelementptr inbounds i64, ptr %i6, i64 %i426
  %i428 = load i64, ptr %i427, align 8
  %i429 = lshr i64 %i422, 16
  %i430 = and i64 %i429, 255
  %i431 = add i64 256, %i430
  %i432 = getelementptr inbounds i64, ptr %i6, i64 %i431
  %i433 = load i64, ptr %i432, align 8
  %i434 = add i64 %i428, %i433
  %i435 = lshr i64 %i422, 8
  %i436 = and i64 %i435, 255
  %i437 = add i64 512, %i436
  %i438 = getelementptr inbounds i64, ptr %i6, i64 %i437
  %i439 = load i64, ptr %i438, align 8
  %i440 = xor i64 %i434, %i439
  %i441 = and i64 %i422, 255
  %i442 = add i64 768, %i441
  %i443 = getelementptr inbounds i64, ptr %i6, i64 %i442
  %i444 = load i64, ptr %i443, align 8
  %i445 = add i64 %i440, %i444
  %i446 = and i64 %i445, 4294967295
  %i447 = xor i64 %i425, %i446
  %i448 = getelementptr inbounds i64, ptr %i4, i64 15
  %i449 = load i64, ptr %i448, align 8
  %i450 = xor i64 %i422, %i449
  %i451 = lshr i64 %i447, 24
  %i452 = getelementptr inbounds i64, ptr %i6, i64 %i451
  %i453 = load i64, ptr %i452, align 8
  %i454 = lshr i64 %i447, 16
  %i455 = and i64 %i454, 255
  %i456 = add i64 256, %i455
  %i457 = getelementptr inbounds i64, ptr %i6, i64 %i456
  %i458 = load i64, ptr %i457, align 8
  %i459 = add i64 %i453, %i458
  %i460 = lshr i64 %i447, 8
  %i461 = and i64 %i460, 255
  %i462 = add i64 512, %i461
  %i463 = getelementptr inbounds i64, ptr %i6, i64 %i462
  %i464 = load i64, ptr %i463, align 8
  %i465 = xor i64 %i459, %i464
  %i466 = and i64 %i447, 255
  %i467 = add i64 768, %i466
  %i468 = getelementptr inbounds i64, ptr %i6, i64 %i467
  %i469 = load i64, ptr %i468, align 8
  %i470 = add i64 %i465, %i469
  %i471 = and i64 %i470, 4294967295
  %i472 = xor i64 %i450, %i471
  %i473 = getelementptr inbounds i64, ptr %i4, i64 14
  %i474 = load i64, ptr %i473, align 8
  %i475 = xor i64 %i447, %i474
  %i476 = lshr i64 %i472, 24
  %i477 = getelementptr inbounds i64, ptr %i6, i64 %i476
  %i478 = load i64, ptr %i477, align 8
  %i479 = lshr i64 %i472, 16
  %i480 = and i64 %i479, 255
  %i481 = add i64 256, %i480
  %i482 = getelementptr inbounds i64, ptr %i6, i64 %i481
  %i483 = load i64, ptr %i482, align 8
  %i484 = add i64 %i478, %i483
  %i485 = lshr i64 %i472, 8
  %i486 = and i64 %i485, 255
  %i487 = add i64 512, %i486
  %i488 = getelementptr inbounds i64, ptr %i6, i64 %i487
  %i489 = load i64, ptr %i488, align 8
  %i490 = xor i64 %i484, %i489
  %i491 = and i64 %i472, 255
  %i492 = add i64 768, %i491
  %i493 = getelementptr inbounds i64, ptr %i6, i64 %i492
  %i494 = load i64, ptr %i493, align 8
  %i495 = add i64 %i490, %i494
  %i496 = and i64 %i495, 4294967295
  %i497 = xor i64 %i475, %i496
  %i498 = getelementptr inbounds i64, ptr %i4, i64 13
  %i499 = load i64, ptr %i498, align 8
  %i500 = xor i64 %i472, %i499
  %i501 = lshr i64 %i497, 24
  %i502 = getelementptr inbounds i64, ptr %i6, i64 %i501
  %i503 = load i64, ptr %i502, align 8
  %i504 = lshr i64 %i497, 16
  %i505 = and i64 %i504, 255
  %i506 = add i64 256, %i505
  %i507 = getelementptr inbounds i64, ptr %i6, i64 %i506
  %i508 = load i64, ptr %i507, align 8
  %i509 = add i64 %i503, %i508
  %i510 = lshr i64 %i497, 8
  %i511 = and i64 %i510, 255
  %i512 = add i64 512, %i511
  %i513 = getelementptr inbounds i64, ptr %i6, i64 %i512
  %i514 = load i64, ptr %i513, align 8
  %i515 = xor i64 %i509, %i514
  %i516 = and i64 %i497, 255
  %i517 = add i64 768, %i516
  %i518 = getelementptr inbounds i64, ptr %i6, i64 %i517
  %i519 = load i64, ptr %i518, align 8
  %i520 = add i64 %i515, %i519
  %i521 = and i64 %i520, 4294967295
  %i522 = xor i64 %i500, %i521
  %i523 = getelementptr inbounds i64, ptr %i4, i64 12
  %i524 = load i64, ptr %i523, align 8
  %i525 = xor i64 %i497, %i524
  %i526 = lshr i64 %i522, 24
  %i527 = getelementptr inbounds i64, ptr %i6, i64 %i526
  %i528 = load i64, ptr %i527, align 8
  %i529 = lshr i64 %i522, 16
  %i530 = and i64 %i529, 255
  %i531 = add i64 256, %i530
  %i532 = getelementptr inbounds i64, ptr %i6, i64 %i531
  %i533 = load i64, ptr %i532, align 8
  %i534 = add i64 %i528, %i533
  %i535 = lshr i64 %i522, 8
  %i536 = and i64 %i535, 255
  %i537 = add i64 512, %i536
  %i538 = getelementptr inbounds i64, ptr %i6, i64 %i537
  %i539 = load i64, ptr %i538, align 8
  %i540 = xor i64 %i534, %i539
  %i541 = and i64 %i522, 255
  %i542 = add i64 768, %i541
  %i543 = getelementptr inbounds i64, ptr %i6, i64 %i542
  %i544 = load i64, ptr %i543, align 8
  %i545 = add i64 %i540, %i544
  %i546 = and i64 %i545, 4294967295
  %i547 = xor i64 %i525, %i546
  %i548 = getelementptr inbounds i64, ptr %i4, i64 11
  %i549 = load i64, ptr %i548, align 8
  %i550 = xor i64 %i522, %i549
  %i551 = lshr i64 %i547, 24
  %i552 = getelementptr inbounds i64, ptr %i6, i64 %i551
  %i553 = load i64, ptr %i552, align 8
  %i554 = lshr i64 %i547, 16
  %i555 = and i64 %i554, 255
  %i556 = add i64 256, %i555
  %i557 = getelementptr inbounds i64, ptr %i6, i64 %i556
  %i558 = load i64, ptr %i557, align 8
  %i559 = add i64 %i553, %i558
  %i560 = lshr i64 %i547, 8
  %i561 = and i64 %i560, 255
  %i562 = add i64 512, %i561
  %i563 = getelementptr inbounds i64, ptr %i6, i64 %i562
  %i564 = load i64, ptr %i563, align 8
  %i565 = xor i64 %i559, %i564
  %i566 = and i64 %i547, 255
  %i567 = add i64 768, %i566
  %i568 = getelementptr inbounds i64, ptr %i6, i64 %i567
  %i569 = load i64, ptr %i568, align 8
  %i570 = add i64 %i565, %i569
  %i571 = and i64 %i570, 4294967295
  %i572 = xor i64 %i550, %i571
  %i573 = getelementptr inbounds i64, ptr %i4, i64 10
  %i574 = load i64, ptr %i573, align 8
  %i575 = xor i64 %i547, %i574
  %i576 = lshr i64 %i572, 24
  %i577 = getelementptr inbounds i64, ptr %i6, i64 %i576
  %i578 = load i64, ptr %i577, align 8
  %i579 = lshr i64 %i572, 16
  %i580 = and i64 %i579, 255
  %i581 = add i64 256, %i580
  %i582 = getelementptr inbounds i64, ptr %i6, i64 %i581
  %i583 = load i64, ptr %i582, align 8
  %i584 = add i64 %i578, %i583
  %i585 = lshr i64 %i572, 8
  %i586 = and i64 %i585, 255
  %i587 = add i64 512, %i586
  %i588 = getelementptr inbounds i64, ptr %i6, i64 %i587
  %i589 = load i64, ptr %i588, align 8
  %i590 = xor i64 %i584, %i589
  %i591 = and i64 %i572, 255
  %i592 = add i64 768, %i591
  %i593 = getelementptr inbounds i64, ptr %i6, i64 %i592
  %i594 = load i64, ptr %i593, align 8
  %i595 = add i64 %i590, %i594
  %i596 = and i64 %i595, 4294967295
  %i597 = xor i64 %i575, %i596
  %i598 = getelementptr inbounds i64, ptr %i4, i64 9
  %i599 = load i64, ptr %i598, align 8
  %i600 = xor i64 %i572, %i599
  %i601 = lshr i64 %i597, 24
  %i602 = getelementptr inbounds i64, ptr %i6, i64 %i601
  %i603 = load i64, ptr %i602, align 8
  %i604 = lshr i64 %i597, 16
  %i605 = and i64 %i604, 255
  %i606 = add i64 256, %i605
  %i607 = getelementptr inbounds i64, ptr %i6, i64 %i606
  %i608 = load i64, ptr %i607, align 8
  %i609 = add i64 %i603, %i608
  %i610 = lshr i64 %i597, 8
  %i611 = and i64 %i610, 255
  %i612 = add i64 512, %i611
  %i613 = getelementptr inbounds i64, ptr %i6, i64 %i612
  %i614 = load i64, ptr %i613, align 8
  %i615 = xor i64 %i609, %i614
  %i616 = and i64 %i597, 255
  %i617 = add i64 768, %i616
  %i618 = getelementptr inbounds i64, ptr %i6, i64 %i617
  %i619 = load i64, ptr %i618, align 8
  %i620 = add i64 %i615, %i619
  %i621 = and i64 %i620, 4294967295
  %i622 = xor i64 %i600, %i621
  %i623 = getelementptr inbounds i64, ptr %i4, i64 8
  %i624 = load i64, ptr %i623, align 8
  %i625 = xor i64 %i597, %i624
  %i626 = lshr i64 %i622, 24
  %i627 = getelementptr inbounds i64, ptr %i6, i64 %i626
  %i628 = load i64, ptr %i627, align 8
  %i629 = lshr i64 %i622, 16
  %i630 = and i64 %i629, 255
  %i631 = add i64 256, %i630
  %i632 = getelementptr inbounds i64, ptr %i6, i64 %i631
  %i633 = load i64, ptr %i632, align 8
  %i634 = add i64 %i628, %i633
  %i635 = lshr i64 %i622, 8
  %i636 = and i64 %i635, 255
  %i637 = add i64 512, %i636
  %i638 = getelementptr inbounds i64, ptr %i6, i64 %i637
  %i639 = load i64, ptr %i638, align 8
  %i640 = xor i64 %i634, %i639
  %i641 = and i64 %i622, 255
  %i642 = add i64 768, %i641
  %i643 = getelementptr inbounds i64, ptr %i6, i64 %i642
  %i644 = load i64, ptr %i643, align 8
  %i645 = add i64 %i640, %i644
  %i646 = and i64 %i645, 4294967295
  %i647 = xor i64 %i625, %i646
  %i648 = getelementptr inbounds i64, ptr %i4, i64 7
  %i649 = load i64, ptr %i648, align 8
  %i650 = xor i64 %i622, %i649
  %i651 = lshr i64 %i647, 24
  %i652 = getelementptr inbounds i64, ptr %i6, i64 %i651
  %i653 = load i64, ptr %i652, align 8
  %i654 = lshr i64 %i647, 16
  %i655 = and i64 %i654, 255
  %i656 = add i64 256, %i655
  %i657 = getelementptr inbounds i64, ptr %i6, i64 %i656
  %i658 = load i64, ptr %i657, align 8
  %i659 = add i64 %i653, %i658
  %i660 = lshr i64 %i647, 8
  %i661 = and i64 %i660, 255
  %i662 = add i64 512, %i661
  %i663 = getelementptr inbounds i64, ptr %i6, i64 %i662
  %i664 = load i64, ptr %i663, align 8
  %i665 = xor i64 %i659, %i664
  %i666 = and i64 %i647, 255
  %i667 = add i64 768, %i666
  %i668 = getelementptr inbounds i64, ptr %i6, i64 %i667
  %i669 = load i64, ptr %i668, align 8
  %i670 = add i64 %i665, %i669
  %i671 = and i64 %i670, 4294967295
  %i672 = xor i64 %i650, %i671
  %i673 = getelementptr inbounds i64, ptr %i4, i64 6
  %i674 = load i64, ptr %i673, align 8
  %i675 = xor i64 %i647, %i674
  %i676 = lshr i64 %i672, 24
  %i677 = getelementptr inbounds i64, ptr %i6, i64 %i676
  %i678 = load i64, ptr %i677, align 8
  %i679 = lshr i64 %i672, 16
  %i680 = and i64 %i679, 255
  %i681 = add i64 256, %i680
  %i682 = getelementptr inbounds i64, ptr %i6, i64 %i681
  %i683 = load i64, ptr %i682, align 8
  %i684 = add i64 %i678, %i683
  %i685 = lshr i64 %i672, 8
  %i686 = and i64 %i685, 255
  %i687 = add i64 512, %i686
  %i688 = getelementptr inbounds i64, ptr %i6, i64 %i687
  %i689 = load i64, ptr %i688, align 8
  %i690 = xor i64 %i684, %i689
  %i691 = and i64 %i672, 255
  %i692 = add i64 768, %i691
  %i693 = getelementptr inbounds i64, ptr %i6, i64 %i692
  %i694 = load i64, ptr %i693, align 8
  %i695 = add i64 %i690, %i694
  %i696 = and i64 %i695, 4294967295
  %i697 = xor i64 %i675, %i696
  %i698 = getelementptr inbounds i64, ptr %i4, i64 5
  %i699 = load i64, ptr %i698, align 8
  %i700 = xor i64 %i672, %i699
  %i701 = lshr i64 %i697, 24
  %i702 = getelementptr inbounds i64, ptr %i6, i64 %i701
  %i703 = load i64, ptr %i702, align 8
  %i704 = lshr i64 %i697, 16
  %i705 = and i64 %i704, 255
  %i706 = add i64 256, %i705
  %i707 = getelementptr inbounds i64, ptr %i6, i64 %i706
  %i708 = load i64, ptr %i707, align 8
  %i709 = add i64 %i703, %i708
  %i710 = lshr i64 %i697, 8
  %i711 = and i64 %i710, 255
  %i712 = add i64 512, %i711
  %i713 = getelementptr inbounds i64, ptr %i6, i64 %i712
  %i714 = load i64, ptr %i713, align 8
  %i715 = xor i64 %i709, %i714
  %i716 = and i64 %i697, 255
  %i717 = add i64 768, %i716
  %i718 = getelementptr inbounds i64, ptr %i6, i64 %i717
  %i719 = load i64, ptr %i718, align 8
  %i720 = add i64 %i715, %i719
  %i721 = and i64 %i720, 4294967295
  %i722 = xor i64 %i700, %i721
  %i723 = getelementptr inbounds i64, ptr %i4, i64 4
  %i724 = load i64, ptr %i723, align 8
  %i725 = xor i64 %i697, %i724
  %i726 = lshr i64 %i722, 24
  %i727 = getelementptr inbounds i64, ptr %i6, i64 %i726
  %i728 = load i64, ptr %i727, align 8
  %i729 = lshr i64 %i722, 16
  %i730 = and i64 %i729, 255
  %i731 = add i64 256, %i730
  %i732 = getelementptr inbounds i64, ptr %i6, i64 %i731
  %i733 = load i64, ptr %i732, align 8
  %i734 = add i64 %i728, %i733
  %i735 = lshr i64 %i722, 8
  %i736 = and i64 %i735, 255
  %i737 = add i64 512, %i736
  %i738 = getelementptr inbounds i64, ptr %i6, i64 %i737
  %i739 = load i64, ptr %i738, align 8
  %i740 = xor i64 %i734, %i739
  %i741 = and i64 %i722, 255
  %i742 = add i64 768, %i741
  %i743 = getelementptr inbounds i64, ptr %i6, i64 %i742
  %i744 = load i64, ptr %i743, align 8
  %i745 = add i64 %i740, %i744
  %i746 = and i64 %i745, 4294967295
  %i747 = xor i64 %i725, %i746
  %i748 = getelementptr inbounds i64, ptr %i4, i64 3
  %i749 = load i64, ptr %i748, align 8
  %i750 = xor i64 %i722, %i749
  %i751 = lshr i64 %i747, 24
  %i752 = getelementptr inbounds i64, ptr %i6, i64 %i751
  %i753 = load i64, ptr %i752, align 8
  %i754 = lshr i64 %i747, 16
  %i755 = and i64 %i754, 255
  %i756 = add i64 256, %i755
  %i757 = getelementptr inbounds i64, ptr %i6, i64 %i756
  %i758 = load i64, ptr %i757, align 8
  %i759 = add i64 %i753, %i758
  %i760 = lshr i64 %i747, 8
  %i761 = and i64 %i760, 255
  %i762 = add i64 512, %i761
  %i763 = getelementptr inbounds i64, ptr %i6, i64 %i762
  %i764 = load i64, ptr %i763, align 8
  %i765 = xor i64 %i759, %i764
  %i766 = and i64 %i747, 255
  %i767 = add i64 768, %i766
  %i768 = getelementptr inbounds i64, ptr %i6, i64 %i767
  %i769 = load i64, ptr %i768, align 8
  %i770 = add i64 %i765, %i769
  %i771 = and i64 %i770, 4294967295
  %i772 = xor i64 %i750, %i771
  %i773 = getelementptr inbounds i64, ptr %i4, i64 2
  %i774 = load i64, ptr %i773, align 8
  %i775 = xor i64 %i747, %i774
  %i776 = lshr i64 %i772, 24
  %i777 = getelementptr inbounds i64, ptr %i6, i64 %i776
  %i778 = load i64, ptr %i777, align 8
  %i779 = lshr i64 %i772, 16
  %i780 = and i64 %i779, 255
  %i781 = add i64 256, %i780
  %i782 = getelementptr inbounds i64, ptr %i6, i64 %i781
  %i783 = load i64, ptr %i782, align 8
  %i784 = add i64 %i778, %i783
  %i785 = lshr i64 %i772, 8
  %i786 = and i64 %i785, 255
  %i787 = add i64 512, %i786
  %i788 = getelementptr inbounds i64, ptr %i6, i64 %i787
  %i789 = load i64, ptr %i788, align 8
  %i790 = xor i64 %i784, %i789
  %i791 = and i64 %i772, 255
  %i792 = add i64 768, %i791
  %i793 = getelementptr inbounds i64, ptr %i6, i64 %i792
  %i794 = load i64, ptr %i793, align 8
  %i795 = add i64 %i790, %i794
  %i796 = and i64 %i795, 4294967295
  %i797 = xor i64 %i775, %i796
  %i798 = getelementptr inbounds i64, ptr %i4, i64 1
  %i799 = load i64, ptr %i798, align 8
  %i800 = xor i64 %i772, %i799
  %i801 = lshr i64 %i797, 24
  %i802 = getelementptr inbounds i64, ptr %i6, i64 %i801
  %i803 = load i64, ptr %i802, align 8
  %i804 = lshr i64 %i797, 16
  %i805 = and i64 %i804, 255
  %i806 = add i64 256, %i805
  %i807 = getelementptr inbounds i64, ptr %i6, i64 %i806
  %i808 = load i64, ptr %i807, align 8
  %i809 = add i64 %i803, %i808
  %i810 = lshr i64 %i797, 8
  %i811 = and i64 %i810, 255
  %i812 = add i64 512, %i811
  %i813 = getelementptr inbounds i64, ptr %i6, i64 %i812
  %i814 = load i64, ptr %i813, align 8
  %i815 = xor i64 %i809, %i814
  %i816 = and i64 %i797, 255
  %i817 = add i64 768, %i816
  %i818 = getelementptr inbounds i64, ptr %i6, i64 %i817
  %i819 = load i64, ptr %i818, align 8
  %i820 = add i64 %i815, %i819
  %i821 = and i64 %i820, 4294967295
  %i822 = xor i64 %i800, %i821
  %i823 = getelementptr inbounds i64, ptr %i4, i64 0
  %i824 = load i64, ptr %i823, align 8
  %i825 = xor i64 %i797, %i824
  br label %bb826

bb826:                                            ; preds = %bb419, %bb12
  %.01 = phi i64 [ %i415, %bb12 ], [ %i822, %bb419 ]
  %.0 = phi i64 [ %i418, %bb12 ], [ %i825, %bb419 ]
  %i827 = and i64 %.01, 4294967295
  %i828 = getelementptr inbounds i64, ptr %arg, i64 1
  store i64 %i827, ptr %i828, align 8
  %i829 = and i64 %.0, 4294967295
  %i830 = getelementptr inbounds i64, ptr %arg, i64 0
  store i64 %i829, ptr %i830, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg8) #0 {
bb:
  %i = alloca %struct.bf_key_st, align 8
  %i9 = alloca [32 x i8], align 16
  %i10 = alloca [40 x i8], align 16
  %i11 = alloca [40 x i8], align 16
  %i12 = alloca [32 x i8], align 16
  %i13 = alloca i32, align 4
  %i14 = alloca i64, align 8
  %i15 = alloca [32 x i8], align 16
  call void @llvm.memset.p0.i64(ptr align 16 %i12, i8 0, i64 32, i1 false)
  store i32 0, ptr %i13, align 4
  %i16 = icmp slt i32 %arg, 3
  br i1 %i16, label %bb17, label %bb20

bb17:                                             ; preds = %bb
  %i18 = load ptr, ptr @stderr, align 8
  %i19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i18, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #7
  unreachable

bb20:                                             ; preds = %bb
  %i21 = getelementptr inbounds ptr, ptr %arg8, i64 1
  %i22 = load ptr, ptr %i21, align 8
  %i23 = load i8, ptr %i22, align 1
  %i24 = sext i8 %i23 to i32
  %i25 = icmp eq i32 %i24, 101
  br i1 %i25, label %bb20.bb32_crit_edge, label %bb26

bb20.bb32_crit_edge:                              ; preds = %bb20
  br label %bb32

bb26:                                             ; preds = %bb20
  %i27 = getelementptr inbounds ptr, ptr %arg8, i64 1
  %i28 = load ptr, ptr %i27, align 8
  %i29 = load i8, ptr %i28, align 1
  %i30 = sext i8 %i29 to i32
  %i31 = icmp eq i32 %i30, 69
  br i1 %i31, label %bb26.bb32_crit_edge, label %bb33

bb26.bb32_crit_edge:                              ; preds = %bb26
  br label %bb32

bb32:                                             ; preds = %bb26.bb32_crit_edge, %bb20.bb32_crit_edge
  br label %bb50

bb33:                                             ; preds = %bb26
  %i34 = getelementptr inbounds ptr, ptr %arg8, i64 1
  %i35 = load ptr, ptr %i34, align 8
  %i36 = load i8, ptr %i35, align 1
  %i37 = sext i8 %i36 to i32
  %i38 = icmp eq i32 %i37, 100
  br i1 %i38, label %bb33.bb45_crit_edge, label %bb39

bb33.bb45_crit_edge:                              ; preds = %bb33
  br label %bb45

bb39:                                             ; preds = %bb33
  %i40 = getelementptr inbounds ptr, ptr %arg8, i64 1
  %i41 = load ptr, ptr %i40, align 8
  %i42 = load i8, ptr %i41, align 1
  %i43 = sext i8 %i42 to i32
  %i44 = icmp eq i32 %i43, 68
  br i1 %i44, label %bb39.bb45_crit_edge, label %bb46

bb39.bb45_crit_edge:                              ; preds = %bb39
  br label %bb45

bb45:                                             ; preds = %bb39.bb45_crit_edge, %bb33.bb45_crit_edge
  br label %bb49

bb46:                                             ; preds = %bb39
  %i47 = load ptr, ptr @stderr, align 8
  %i48 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i47, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #7
  unreachable

bb49:                                             ; preds = %bb45
  br label %bb50

bb50:                                             ; preds = %bb49, %bb32
  %.06 = phi i32 [ 1, %bb32 ], [ 0, %bb49 ]
  %i51 = getelementptr inbounds ptr, ptr %arg8, i64 4
  %i52 = load ptr, ptr %i51, align 8
  br label %bb53

bb53:                                             ; preds = %bb103, %bb50
  %.07 = phi ptr [ %i52, %bb50 ], [ %i62, %bb103 ]
  %.04 = phi i32 [ 0, %bb50 ], [ %i93, %bb103 ]
  %.03 = phi i32 [ 0, %bb50 ], [ %.1, %bb103 ]
  %i54 = icmp ult i32 %.04, 64
  br i1 %i54, label %bb55, label %bb53.bb59_crit_edge

bb53.bb59_crit_edge:                              ; preds = %bb53
  br label %bb59

bb55:                                             ; preds = %bb53
  %i56 = load i8, ptr %.07, align 1
  %i57 = sext i8 %i56 to i32
  %i58 = icmp ne i32 %i57, 0
  br label %bb59

bb59:                                             ; preds = %bb55, %bb53.bb59_crit_edge
  %i60 = phi i1 [ false, %bb53.bb59_crit_edge ], [ %i58, %bb55 ]
  br i1 %i60, label %bb61, label %bb104

bb61:                                             ; preds = %bb59
  %i62 = getelementptr inbounds i8, ptr %.07, i32 1
  %i63 = load i8, ptr %.07, align 1
  %i64 = sext i8 %i63 to i32
  %i65 = call i32 @toupper(i32 noundef %i64) #8
  %i66 = trunc i32 %i65 to i8
  %i67 = sext i8 %i66 to i32
  %i68 = icmp sge i32 %i67, 48
  br i1 %i68, label %bb69, label %bb61.bb77_crit_edge

bb61.bb77_crit_edge:                              ; preds = %bb61
  br label %bb77

bb69:                                             ; preds = %bb61
  %i70 = sext i8 %i66 to i32
  %i71 = icmp sle i32 %i70, 57
  br i1 %i71, label %bb72, label %bb69.bb77_crit_edge

bb69.bb77_crit_edge:                              ; preds = %bb69
  br label %bb77

bb72:                                             ; preds = %bb69
  %i73 = shl i32 %.03, 4
  %i74 = sext i8 %i66 to i32
  %i75 = add nsw i32 %i73, %i74
  %i76 = sub nsw i32 %i75, 48
  br label %bb92

bb77:                                             ; preds = %bb69.bb77_crit_edge, %bb61.bb77_crit_edge
  %i78 = sext i8 %i66 to i32
  %i79 = icmp sge i32 %i78, 65
  br i1 %i79, label %bb80, label %bb77.bb89_crit_edge

bb77.bb89_crit_edge:                              ; preds = %bb77
  br label %bb89

bb80:                                             ; preds = %bb77
  %i81 = sext i8 %i66 to i32
  %i82 = icmp sle i32 %i81, 70
  br i1 %i82, label %bb83, label %bb89split

bb83:                                             ; preds = %bb80
  %i84 = shl i32 %.03, 4
  %i85 = sext i8 %i66 to i32
  %i86 = add nsw i32 %i84, %i85
  %i87 = sub nsw i32 %i86, 65
  %i88 = add nsw i32 %i87, 10
  br label %bb91

bb89split:                                        ; preds = %bb80
  br label %bb89

bb89:                                             ; preds = %bb89split, %bb77.bb89_crit_edge
  %i90 = call i32 (ptr, ...) @printf(ptr noundef @.str.1.4)
  call void @exit(i32 noundef 1) #7
  unreachable

bb91:                                             ; preds = %bb83
  br label %bb92

bb92:                                             ; preds = %bb91, %bb72
  %.1 = phi i32 [ %i76, %bb72 ], [ %i88, %bb91 ]
  %i93 = add nuw nsw i32 %.04, 1
  %i94 = and i32 %.04, 1
  %i95 = icmp ne i32 %i94, 0
  br i1 %i95, label %bb96, label %bb92.bb103_crit_edge

bb92.bb103_crit_edge:                             ; preds = %bb92
  br label %bb103

bb96:                                             ; preds = %bb92
  %i97 = and i32 %.1, 255
  %i98 = trunc i32 %i97 to i8
  %i99 = sdiv i32 %i93, 2
  %i100 = sub nsw i32 %i99, 1
  %i101 = sext i32 %i100 to i64
  %i102 = getelementptr inbounds [32 x i8], ptr %i9, i64 0, i64 %i101
  store i8 %i98, ptr %i102, align 1
  br label %bb103

bb103:                                            ; preds = %bb96, %bb92.bb103_crit_edge
  br label %bb53, !llvm.loop !13

bb104:                                            ; preds = %bb59
  %.07.lcssa = phi ptr [ %.07, %bb59 ]
  %i105 = getelementptr inbounds [32 x i8], ptr %i9, i64 0, i64 0
  call void @BF_set_key(ptr noundef %i, i32 noundef 8, ptr noundef %i105)
  %i106 = load i8, ptr %.07.lcssa, align 1
  %i107 = icmp ne i8 %i106, 0
  br i1 %i107, label %bb108, label %bb110

bb108:                                            ; preds = %bb104
  %i109 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #7
  unreachable

bb110:                                            ; preds = %bb104
  %i111 = call noalias ptr @fopen(ptr noundef @.str.3.5, ptr noundef @.str.4)
  %i112 = icmp eq ptr %i111, null
  br i1 %i112, label %bb113, label %bb116

bb113:                                            ; preds = %bb110
  %i114 = load ptr, ptr @stderr, align 8
  %i115 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i114, ptr noundef @.str.5)
  br label %bb184

bb116:                                            ; preds = %bb110
  %i117 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i111, ptr noundef @.str.6, ptr noundef %i14)
  %i118 = call i32 @fclose(ptr noundef %i111)
  %i119 = getelementptr inbounds ptr, ptr %arg8, i64 2
  %i120 = load ptr, ptr %i119, align 8
  %i121 = call noalias ptr @fopen(ptr noundef %i120, ptr noundef @.str.7)
  %i122 = icmp eq ptr %i121, null
  br i1 %i122, label %bb123, label %bb126

bb123:                                            ; preds = %bb116
  %i124 = load ptr, ptr @stderr, align 8
  %i125 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i124, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #7
  unreachable

bb126:                                            ; preds = %bb116
  %i127 = getelementptr inbounds ptr, ptr %arg8, i64 3
  %i128 = load ptr, ptr %i127, align 8
  %i129 = call noalias ptr @fopen(ptr noundef %i128, ptr noundef @.str.8)
  %i130 = icmp eq ptr %i129, null
  br i1 %i130, label %bb131, label %bb134

bb131:                                            ; preds = %bb126
  %i132 = load ptr, ptr @stderr, align 8
  %i133 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i132, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #7
  unreachable

bb134:                                            ; preds = %bb126
  %i155 = getelementptr inbounds [32 x i8], ptr %i15, i64 0, i64 0
  %i156 = getelementptr inbounds [32 x i8], ptr %i12, i64 0, i64 0
  %i161 = getelementptr inbounds [32 x i8], ptr %i12, i64 0, i64 0
  %i162 = getelementptr inbounds [32 x i8], ptr %i15, i64 0, i64 0
  %i163 = getelementptr inbounds [40 x i8], ptr %i10, i64 0, i64 0
  %i164 = getelementptr inbounds [40 x i8], ptr %i11, i64 0, i64 0
  %i166 = getelementptr inbounds [32 x i8], ptr %i12, i64 0, i64 0
  br label %bb135

bb135:                                            ; preds = %bb180, %bb134
  %i136 = call i32 @feof(ptr noundef %i121) #9
  %i137 = icmp ne i32 %i136, 0
  %i138 = xor i1 %i137, true
  br i1 %i138, label %bb139, label %bb181

bb139:                                            ; preds = %bb135
  br label %bb140

bb140:                                            ; preds = %bb147, %bb139
  %indvars.iv7 = phi i32 [ %indvars.iv.next8, %bb147 ], [ 0, %bb139 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb147 ], [ 0, %bb139 ]
  %i141 = call i32 @feof(ptr noundef %i121) #9
  %i142 = icmp ne i32 %i141, 0
  br i1 %i142, label %bb140.bb145_crit_edge, label %bb143

bb140.bb145_crit_edge:                            ; preds = %bb140
  br label %bb145

bb143:                                            ; preds = %bb140
  %i144 = icmp ult i64 %indvars.iv, 40
  br label %bb145

bb145:                                            ; preds = %bb143, %bb140.bb145_crit_edge
  %i146 = phi i1 [ false, %bb140.bb145_crit_edge ], [ %i144, %bb143 ]
  br i1 %i146, label %bb147, label %bb153

bb147:                                            ; preds = %bb145
  %i148 = call i32 @getc(ptr noundef %i121)
  %i149 = trunc i32 %i148 to i8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %i152 = getelementptr inbounds [40 x i8], ptr %i10, i64 0, i64 %indvars.iv
  store i8 %i149, ptr %i152, align 1
  %indvars.iv.next8 = add nuw i32 %indvars.iv7, 1
  br label %bb140, !llvm.loop !14

bb153:                                            ; preds = %bb145
  %indvars.iv7.lcssa = phi i32 [ %indvars.iv7, %bb145 ]
  %.2.lcssa.wide = phi i64 [ %indvars.iv, %bb145 ]
  %0 = trunc i64 %.2.lcssa.wide to i32
  %i154 = load i32, ptr %i13, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %i155, ptr align 16 %i156, i64 32, i1 false)
  %i165 = sext i32 %0 to i64
  br label %bb157

bb157:                                            ; preds = %bb167, %bb153
  %.02 = phi i64 [ 0, %bb153 ], [ %i168, %bb167 ]
  %i158 = load i64, ptr %i14, align 8
  %i159 = icmp slt i64 %.02, %i158
  br i1 %i159, label %bb160, label %bb169

bb160:                                            ; preds = %bb157
  store i32 %i154, ptr %i13, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %i161, ptr align 16 %i162, i64 32, i1 false)
  call void @BF_cfb64_encrypt(ptr noundef %i163, ptr noundef %i164, i64 noundef %i165, ptr noundef %i, ptr noundef %i166, ptr noundef %i13, i32 noundef %.06)
  br label %bb167

bb167:                                            ; preds = %bb160
  %i168 = add nuw nsw i64 %.02, 1
  br label %bb157, !llvm.loop !15

bb169:                                            ; preds = %bb157
  %wide.trip.count = zext i32 %indvars.iv7.lcssa to i64
  br label %bb170

bb170:                                            ; preds = %bb178, %bb169
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %bb178 ], [ 0, %bb169 ]
  %exitcond = icmp ne i64 %indvars.iv4, %wide.trip.count
  br i1 %exitcond, label %bb172, label %bb180

bb172:                                            ; preds = %bb170
  %i174 = getelementptr inbounds [40 x i8], ptr %i11, i64 0, i64 %indvars.iv4
  %i175 = load i8, ptr %i174, align 1
  %i176 = zext i8 %i175 to i32
  %i177 = call i32 @fputc(i32 noundef %i176, ptr noundef %i129)
  br label %bb178

bb178:                                            ; preds = %bb172
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %bb170, !llvm.loop !16

bb180:                                            ; preds = %bb170
  br label %bb135, !llvm.loop !17

bb181:                                            ; preds = %bb135
  %i182 = call i32 @fclose(ptr noundef %i121)
  %i183 = call i32 @fclose(ptr noundef %i129)
  br label %bb184

bb184:                                            ; preds = %bb181, %bb113
  %.0 = phi i32 [ 1, %bb113 ], [ 0, %bb181 ]
  ret i32 %.0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #4

declare i32 @printf(ptr noundef, ...) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @feof(ptr noundef) #5

declare i32 @getc(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

declare i32 @fputc(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @BF_ofb64_encrypt(ptr noundef %arg, ptr noundef %arg5, i64 noundef %arg6, ptr noundef %arg7, ptr noundef %arg8, ptr noundef %arg9) #0 {
bb:
  %i = alloca [8 x i8], align 1
  %i10 = alloca [2 x i64], align 16
  %i11 = load i32, ptr %arg9, align 4
  %i12 = getelementptr inbounds i8, ptr %arg8, i32 1
  %i13 = load i8, ptr %arg8, align 1
  %i14 = zext i8 %i13 to i64
  %i15 = shl i64 %i14, 24
  %i16 = getelementptr inbounds i8, ptr %i12, i32 1
  %i17 = load i8, ptr %i12, align 1
  %i18 = zext i8 %i17 to i64
  %i19 = shl i64 %i18, 16
  %i20 = or i64 %i15, %i19
  %i21 = getelementptr inbounds i8, ptr %i16, i32 1
  %i22 = load i8, ptr %i16, align 1
  %i23 = zext i8 %i22 to i64
  %i24 = shl i64 %i23, 8
  %i25 = or i64 %i20, %i24
  %i26 = getelementptr inbounds i8, ptr %i21, i32 1
  %i27 = load i8, ptr %i21, align 1
  %i28 = zext i8 %i27 to i64
  %i29 = or i64 %i25, %i28
  %i30 = getelementptr inbounds i8, ptr %i26, i32 1
  %i31 = load i8, ptr %i26, align 1
  %i32 = zext i8 %i31 to i64
  %i33 = shl i64 %i32, 24
  %i34 = getelementptr inbounds i8, ptr %i30, i32 1
  %i35 = load i8, ptr %i30, align 1
  %i36 = zext i8 %i35 to i64
  %i37 = shl i64 %i36, 16
  %i38 = or i64 %i33, %i37
  %i39 = getelementptr inbounds i8, ptr %i34, i32 1
  %i40 = load i8, ptr %i34, align 1
  %i41 = zext i8 %i40 to i64
  %i42 = shl i64 %i41, 8
  %i43 = or i64 %i38, %i42
  %i45 = load i8, ptr %i39, align 1
  %i46 = zext i8 %i45 to i64
  %i47 = or i64 %i43, %i46
  %i48 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 0
  store i64 %i29, ptr %i48, align 16
  %i49 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 1
  store i64 %i47, ptr %i49, align 8
  %i50 = getelementptr inbounds [8 x i8], ptr %i, i64 0, i64 0
  %i51 = lshr i64 %i29, 24
  %i52 = and i64 %i51, 255
  %i53 = trunc i64 %i52 to i8
  %i54 = getelementptr inbounds i8, ptr %i50, i32 1
  store i8 %i53, ptr %i50, align 1
  %i55 = lshr i64 %i29, 16
  %i56 = and i64 %i55, 255
  %i57 = trunc i64 %i56 to i8
  %i58 = getelementptr inbounds i8, ptr %i54, i32 1
  store i8 %i57, ptr %i54, align 1
  %i59 = lshr i64 %i29, 8
  %i60 = and i64 %i59, 255
  %i61 = trunc i64 %i60 to i8
  %i62 = getelementptr inbounds i8, ptr %i58, i32 1
  store i8 %i61, ptr %i58, align 1
  %i63 = and i64 %i29, 255
  %i64 = trunc i64 %i63 to i8
  %i65 = getelementptr inbounds i8, ptr %i62, i32 1
  store i8 %i64, ptr %i62, align 1
  %i66 = lshr i64 %i47, 24
  %i67 = and i64 %i66, 255
  %i68 = trunc i64 %i67 to i8
  %i69 = getelementptr inbounds i8, ptr %i65, i32 1
  store i8 %i68, ptr %i65, align 1
  %i70 = lshr i64 %i47, 16
  %i71 = and i64 %i70, 255
  %i72 = trunc i64 %i71 to i8
  %i73 = getelementptr inbounds i8, ptr %i69, i32 1
  store i8 %i72, ptr %i69, align 1
  %i74 = lshr i64 %i47, 8
  %i75 = and i64 %i74, 255
  %i76 = trunc i64 %i75 to i8
  %i77 = getelementptr inbounds i8, ptr %i73, i32 1
  store i8 %i76, ptr %i73, align 1
  %i78 = and i64 %i47, 255
  %i79 = trunc i64 %i78 to i8
  store i8 %i79, ptr %i77, align 1
  %i87 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 0
  %i88 = getelementptr inbounds [8 x i8], ptr %i, i64 0, i64 0
  %i89 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 0
  %i94 = getelementptr inbounds i8, ptr %i88, i32 1
  %i98 = getelementptr inbounds i8, ptr %i94, i32 1
  %i102 = getelementptr inbounds i8, ptr %i98, i32 1
  %i105 = getelementptr inbounds i8, ptr %i102, i32 1
  %i106 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 1
  %i111 = getelementptr inbounds i8, ptr %i105, i32 1
  %i115 = getelementptr inbounds i8, ptr %i111, i32 1
  %i119 = getelementptr inbounds i8, ptr %i115, i32 1
  br label %bb81

bb81:                                             ; preds = %bb124, %bb
  %.04 = phi i32 [ %i11, %bb ], [ %i136, %bb124 ]
  %.03 = phi i64 [ %arg6, %bb ], [ %i82, %bb124 ]
  %.02 = phi i32 [ 0, %bb ], [ %.1, %bb124 ]
  %.01 = phi ptr [ %arg5, %bb ], [ %i134, %bb124 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i125, %bb124 ]
  %i82 = add nsw i64 %.03, -1
  %i83 = icmp ne i64 %.03, 0
  br i1 %i83, label %bb84, label %bb137

bb84:                                             ; preds = %bb81
  %i85 = icmp eq i32 %.04, 0
  br i1 %i85, label %bb86, label %bb84.bb124_crit_edge

bb84.bb124_crit_edge:                             ; preds = %bb84
  br label %bb124

bb86:                                             ; preds = %bb84
  call void @BF_encrypt(ptr noundef %i87, ptr noundef %arg7, i32 noundef 1)
  %i90 = load i64, ptr %i89, align 16
  %i91 = lshr i64 %i90, 24
  %i92 = and i64 %i91, 255
  %i93 = trunc i64 %i92 to i8
  store i8 %i93, ptr %i88, align 1
  %i95 = lshr i64 %i90, 16
  %i96 = and i64 %i95, 255
  %i97 = trunc i64 %i96 to i8
  store i8 %i97, ptr %i94, align 1
  %i99 = lshr i64 %i90, 8
  %i100 = and i64 %i99, 255
  %i101 = trunc i64 %i100 to i8
  store i8 %i101, ptr %i98, align 1
  %i103 = and i64 %i90, 255
  %i104 = trunc i64 %i103 to i8
  store i8 %i104, ptr %i102, align 1
  %i107 = load i64, ptr %i106, align 8
  %i108 = lshr i64 %i107, 24
  %i109 = and i64 %i108, 255
  %i110 = trunc i64 %i109 to i8
  store i8 %i110, ptr %i105, align 1
  %i112 = lshr i64 %i107, 16
  %i113 = and i64 %i112, 255
  %i114 = trunc i64 %i113 to i8
  store i8 %i114, ptr %i111, align 1
  %i116 = lshr i64 %i107, 8
  %i117 = and i64 %i116, 255
  %i118 = trunc i64 %i117 to i8
  store i8 %i118, ptr %i115, align 1
  %i120 = and i64 %i107, 255
  %i121 = trunc i64 %i120 to i8
  store i8 %i121, ptr %i119, align 1
  %i123 = add nsw i32 %.02, 1
  br label %bb124

bb124:                                            ; preds = %bb86, %bb84.bb124_crit_edge
  %.1 = phi i32 [ %i123, %bb86 ], [ %.02, %bb84.bb124_crit_edge ]
  %i125 = getelementptr inbounds i8, ptr %.0, i32 1
  %i126 = load i8, ptr %.0, align 1
  %i127 = zext i8 %i126 to i32
  %i128 = sext i32 %.04 to i64
  %i129 = getelementptr inbounds [8 x i8], ptr %i, i64 0, i64 %i128
  %i130 = load i8, ptr %i129, align 1
  %i131 = zext i8 %i130 to i32
  %i132 = xor i32 %i127, %i131
  %i133 = trunc i32 %i132 to i8
  %i134 = getelementptr inbounds i8, ptr %.01, i32 1
  store i8 %i133, ptr %.01, align 1
  %i135 = add nsw i32 %.04, 1
  %i136 = and i32 %i135, 7
  br label %bb81, !llvm.loop !18

bb137:                                            ; preds = %bb81
  %.04.lcssa = phi i32 [ %.04, %bb81 ]
  %.02.lcssa = phi i32 [ %.02, %bb81 ]
  %i44 = getelementptr inbounds i8, ptr %i39, i32 1
  %i80 = getelementptr inbounds i8, ptr %i77, i32 1
  %i138 = icmp ne i32 %.02.lcssa, 0
  br i1 %i138, label %bb139, label %bb137.bb174_crit_edge

bb137.bb174_crit_edge:                            ; preds = %bb137
  br label %bb174

bb139:                                            ; preds = %bb137
  %i140 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 0
  %i141 = load i64, ptr %i140, align 16
  %i142 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 1
  %i143 = load i64, ptr %i142, align 8
  %i144 = lshr i64 %i141, 24
  %i145 = and i64 %i144, 255
  %i146 = trunc i64 %i145 to i8
  %i147 = getelementptr inbounds i8, ptr %arg8, i32 1
  store i8 %i146, ptr %arg8, align 1
  %i148 = lshr i64 %i141, 16
  %i149 = and i64 %i148, 255
  %i150 = trunc i64 %i149 to i8
  %i151 = getelementptr inbounds i8, ptr %i147, i32 1
  store i8 %i150, ptr %i147, align 1
  %i152 = lshr i64 %i141, 8
  %i153 = and i64 %i152, 255
  %i154 = trunc i64 %i153 to i8
  %i155 = getelementptr inbounds i8, ptr %i151, i32 1
  store i8 %i154, ptr %i151, align 1
  %i156 = and i64 %i141, 255
  %i157 = trunc i64 %i156 to i8
  %i158 = getelementptr inbounds i8, ptr %i155, i32 1
  store i8 %i157, ptr %i155, align 1
  %i159 = lshr i64 %i143, 24
  %i160 = and i64 %i159, 255
  %i161 = trunc i64 %i160 to i8
  %i162 = getelementptr inbounds i8, ptr %i158, i32 1
  store i8 %i161, ptr %i158, align 1
  %i163 = lshr i64 %i143, 16
  %i164 = and i64 %i163, 255
  %i165 = trunc i64 %i164 to i8
  %i166 = getelementptr inbounds i8, ptr %i162, i32 1
  store i8 %i165, ptr %i162, align 1
  %i167 = lshr i64 %i143, 8
  %i168 = and i64 %i167, 255
  %i169 = trunc i64 %i168 to i8
  %i170 = getelementptr inbounds i8, ptr %i166, i32 1
  store i8 %i169, ptr %i166, align 1
  %i171 = and i64 %i143, 255
  %i172 = trunc i64 %i171 to i8
  %i173 = getelementptr inbounds i8, ptr %i170, i32 1
  store i8 %i172, ptr %i170, align 1
  br label %bb174

bb174:                                            ; preds = %bb139, %bb137.bb174_crit_edge
  %i175 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 1
  store i64 0, ptr %i175, align 8
  %i176 = getelementptr inbounds [2 x i64], ptr %i10, i64 0, i64 0
  store i64 0, ptr %i176, align 16
  store i32 %.04.lcssa, ptr %arg9, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @BF_set_key(ptr noundef %arg, i32 noundef %arg5, ptr noundef %arg6) #0 {
bb:
  %i = alloca [2 x i64], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %arg, ptr align 8 @bf_init, i64 8336, i1 false)
  %i7 = getelementptr inbounds %struct.bf_key_st, ptr %arg, i32 0, i32 0
  %i8 = getelementptr inbounds [18 x i64], ptr %i7, i64 0, i64 0
  %i9 = icmp sgt i32 %arg5, 72
  br i1 %i9, label %bb10, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb10:                                             ; preds = %bb
  br label %bb11

bb11:                                             ; preds = %bb10, %bb.bb11_crit_edge
  %.01 = phi i32 [ 72, %bb10 ], [ %arg5, %bb.bb11_crit_edge ]
  %i12 = sext i32 %.01 to i64
  %i13 = getelementptr inbounds i8, ptr %arg6, i64 %i12
  br label %bb14

bb14:                                             ; preds = %bb51, %bb11
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb51 ], [ 0, %bb11 ]
  %.0 = phi ptr [ %arg6, %bb11 ], [ %.4, %bb51 ]
  %exitcond = icmp ne i64 %indvars.iv, 18
  br i1 %exitcond, label %bb16, label %bb53

bb16:                                             ; preds = %bb14
  %i17 = getelementptr inbounds i8, ptr %.0, i32 1
  %i18 = load i8, ptr %.0, align 1
  %i19 = zext i8 %i18 to i64
  %i20 = icmp uge ptr %i17, %i13
  br i1 %i20, label %bb21, label %bb16.bb22_crit_edge

bb16.bb22_crit_edge:                              ; preds = %bb16
  br label %bb22

bb21:                                             ; preds = %bb16
  br label %bb22

bb22:                                             ; preds = %bb21, %bb16.bb22_crit_edge
  %.1 = phi ptr [ %arg6, %bb21 ], [ %i17, %bb16.bb22_crit_edge ]
  %i23 = shl i64 %i19, 8
  %i24 = getelementptr inbounds i8, ptr %.1, i32 1
  %i25 = load i8, ptr %.1, align 1
  %i26 = zext i8 %i25 to i64
  %i27 = or i64 %i23, %i26
  %i28 = icmp uge ptr %i24, %i13
  br i1 %i28, label %bb29, label %bb22.bb30_crit_edge

bb22.bb30_crit_edge:                              ; preds = %bb22
  br label %bb30

bb29:                                             ; preds = %bb22
  br label %bb30

bb30:                                             ; preds = %bb29, %bb22.bb30_crit_edge
  %.2 = phi ptr [ %arg6, %bb29 ], [ %i24, %bb22.bb30_crit_edge ]
  %i31 = shl i64 %i27, 8
  %i32 = getelementptr inbounds i8, ptr %.2, i32 1
  %i33 = load i8, ptr %.2, align 1
  %i34 = zext i8 %i33 to i64
  %i35 = or i64 %i31, %i34
  %i36 = icmp uge ptr %i32, %i13
  br i1 %i36, label %bb37, label %bb30.bb38_crit_edge

bb30.bb38_crit_edge:                              ; preds = %bb30
  br label %bb38

bb37:                                             ; preds = %bb30
  br label %bb38

bb38:                                             ; preds = %bb37, %bb30.bb38_crit_edge
  %.3 = phi ptr [ %arg6, %bb37 ], [ %i32, %bb30.bb38_crit_edge ]
  %i39 = shl i64 %i35, 8
  %i40 = getelementptr inbounds i8, ptr %.3, i32 1
  %i41 = load i8, ptr %.3, align 1
  %i42 = zext i8 %i41 to i64
  %i43 = or i64 %i39, %i42
  %i44 = icmp uge ptr %i40, %i13
  br i1 %i44, label %bb45, label %bb38.bb46_crit_edge

bb38.bb46_crit_edge:                              ; preds = %bb38
  br label %bb46

bb45:                                             ; preds = %bb38
  br label %bb46

bb46:                                             ; preds = %bb45, %bb38.bb46_crit_edge
  %.4 = phi ptr [ %arg6, %bb45 ], [ %i40, %bb38.bb46_crit_edge ]
  %i48 = getelementptr inbounds i64, ptr %i8, i64 %indvars.iv
  %i49 = load i64, ptr %i48, align 8
  %i50 = xor i64 %i49, %i43
  store i64 %i50, ptr %i48, align 8
  br label %bb51

bb51:                                             ; preds = %bb46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %bb14, !llvm.loop !19

bb53:                                             ; preds = %bb14
  %i54 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  store i64 0, ptr %i54, align 16
  %i55 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 0, ptr %i55, align 8
  %i59 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i60 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i64 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb56

bb56:                                             ; preds = %bb69, %bb53
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %bb69 ], [ 0, %bb53 ]
  %i57 = icmp ult i64 %indvars.iv2, 18
  br i1 %i57, label %bb58, label %bb71

bb58:                                             ; preds = %bb56
  call void @BF_encrypt(ptr noundef %i59, ptr noundef %arg, i32 noundef 1)
  %i61 = load i64, ptr %i60, align 16
  %i63 = getelementptr inbounds i64, ptr %i8, i64 %indvars.iv2
  store i64 %i61, ptr %i63, align 8
  %i65 = load i64, ptr %i64, align 8
  %0 = add nuw nsw i64 %indvars.iv2, 1
  %i68 = getelementptr inbounds i64, ptr %i8, i64 %0
  store i64 %i65, ptr %i68, align 8
  br label %bb69

bb69:                                             ; preds = %bb58
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 2
  br label %bb56, !llvm.loop !20

bb71:                                             ; preds = %bb56
  %i72 = getelementptr inbounds %struct.bf_key_st, ptr %arg, i32 0, i32 1
  %i73 = getelementptr inbounds [1024 x i64], ptr %i72, i64 0, i64 0
  %i77 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i78 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 0
  %i82 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb74

bb74:                                             ; preds = %bb87, %bb71
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %bb87 ], [ 0, %bb71 ]
  %i75 = icmp ult i64 %indvars.iv6, 1024
  br i1 %i75, label %bb76, label %bb89

bb76:                                             ; preds = %bb74
  call void @BF_encrypt(ptr noundef %i77, ptr noundef %arg, i32 noundef 1)
  %i79 = load i64, ptr %i78, align 16
  %i81 = getelementptr inbounds i64, ptr %i73, i64 %indvars.iv6
  store i64 %i79, ptr %i81, align 8
  %i83 = load i64, ptr %i82, align 8
  %1 = add nuw nsw i64 %indvars.iv6, 1
  %i86 = getelementptr inbounds i64, ptr %i73, i64 %1
  store i64 %i83, ptr %i86, align 8
  br label %bb87

bb87:                                             ; preds = %bb76
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 2
  br label %bb74, !llvm.loop !21

bb89:                                             ; preds = %bb74
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
