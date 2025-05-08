; ModuleID = 'security_blowfish_d.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

@.str = private unnamed_addr constant [42 x i8] c"BlowFish part of SSLeay 0.7.0 30-Jan-1997\00", align 1
@BF_version = dso_local local_unnamed_addr global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [14 x i8] c"blowfish(idx)\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.3 = private unnamed_addr constant [45 x i8] c"Usage: blowfish {e|d} <intput> <output> key\0A\00", align 1
@.str.3.4 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Bad key value.\00", align 1
@str.9 = private unnamed_addr constant [36 x i8] c"key must be in hexadecimal notation\00", align 1
@bf_init = internal unnamed_addr constant %struct.bf_key_st { [18 x i64] [i64 608135816, i64 2242054355, i64 320440878, i64 57701188, i64 2752067618, i64 698298832, i64 137296536, i64 3964562569, i64 1160258022, i64 953160567, i64 3193202383, i64 887688300, i64 3232508343, i64 3380367581, i64 1065670069, i64 3041331479, i64 2450970073, i64 2306472731], [1024 x i64] [i64 3509652390, i64 2564797868, i64 805139163, i64 3491422135, i64 3101798381, i64 1780907670, i64 3128725573, i64 4046225305, i64 614570311, i64 3012652279, i64 134345442, i64 2240740374, i64 1667834072, i64 1901547113, i64 2757295779, i64 4103290238, i64 227898511, i64 1921955416, i64 1904987480, i64 2182433518, i64 2069144605, i64 3260701109, i64 2620446009, i64 720527379, i64 3318853667, i64 677414384, i64 3393288472, i64 3101374703, i64 2390351024, i64 1614419982, i64 1822297739, i64 2954791486, i64 3608508353, i64 3174124327, i64 2024746970, i64 1432378464, i64 3864339955, i64 2857741204, i64 1464375394, i64 1676153920, i64 1439316330, i64 715854006, i64 3033291828, i64 289532110, i64 2706671279, i64 2087905683, i64 3018724369, i64 1668267050, i64 732546397, i64 1947742710, i64 3462151702, i64 2609353502, i64 2950085171, i64 1814351708, i64 2050118529, i64 680887927, i64 999245976, i64 1800124847, i64 3300911131, i64 1713906067, i64 1641548236, i64 4213287313, i64 1216130144, i64 1575780402, i64 4018429277, i64 3917837745, i64 3693486850, i64 3949271944, i64 596196993, i64 3549867205, i64 258830323, i64 2213823033, i64 772490370, i64 2760122372, i64 1774776394, i64 2652871518, i64 566650946, i64 4142492826, i64 1728879713, i64 2882767088, i64 1783734482, i64 3629395816, i64 2517608232, i64 2874225571, i64 1861159788, i64 326777828, i64 3124490320, i64 2130389656, i64 2716951837, i64 967770486, i64 1724537150, i64 2185432712, i64 2364442137, i64 1164943284, i64 2105845187, i64 998989502, i64 3765401048, i64 2244026483, i64 1075463327, i64 1455516326, i64 1322494562, i64 910128902, i64 469688178, i64 1117454909, i64 936433444, i64 3490320968, i64 3675253459, i64 1240580251, i64 122909385, i64 2157517691, i64 634681816, i64 4142456567, i64 3825094682, i64 3061402683, i64 2540495037, i64 79693498, i64 3249098678, i64 1084186820, i64 1583128258, i64 426386531, i64 1761308591, i64 1047286709, i64 322548459, i64 995290223, i64 1845252383, i64 2603652396, i64 3431023940, i64 2942221577, i64 3202600964, i64 3727903485, i64 1712269319, i64 422464435, i64 3234572375, i64 1170764815, i64 3523960633, i64 3117677531, i64 1434042557, i64 442511882, i64 3600875718, i64 1076654713, i64 1738483198, i64 4213154764, i64 2393238008, i64 3677496056, i64 1014306527, i64 4251020053, i64 793779912, i64 2902807211, i64 842905082, i64 4246964064, i64 1395751752, i64 1040244610, i64 2656851899, i64 3396308128, i64 445077038, i64 3742853595, i64 3577915638, i64 679411651, i64 2892444358, i64 2354009459, i64 1767581616, i64 3150600392, i64 3791627101, i64 3102740896, i64 284835224, i64 4246832056, i64 1258075500, i64 768725851, i64 2589189241, i64 3069724005, i64 3532540348, i64 1274779536, i64 3789419226, i64 2764799539, i64 1660621633, i64 3471099624, i64 4011903706, i64 913787905, i64 3497959166, i64 737222580, i64 2514213453, i64 2928710040, i64 3937242737, i64 1804850592, i64 3499020752, i64 2949064160, i64 2386320175, i64 2390070455, i64 2415321851, i64 4061277028, i64 2290661394, i64 2416832540, i64 1336762016, i64 1754252060, i64 3520065937, i64 3014181293, i64 791618072, i64 3188594551, i64 3933548030, i64 2332172193, i64 3852520463, i64 3043980520, i64 413987798, i64 3465142937, i64 3030929376, i64 4245938359, i64 2093235073, i64 3534596313, i64 375366246, i64 2157278981, i64 2479649556, i64 555357303, i64 3870105701, i64 2008414854, i64 3344188149, i64 4221384143, i64 3956125452, i64 2067696032, i64 3594591187, i64 2921233993, i64 2428461, i64 544322398, i64 577241275, i64 1471733935, i64 610547355, i64 4027169054, i64 1432588573, i64 1507829418, i64 2025931657, i64 3646575487, i64 545086370, i64 48609733, i64 2200306550, i64 1653985193, i64 298326376, i64 1316178497, i64 3007786442, i64 2064951626, i64 458293330, i64 2589141269, i64 3591329599, i64 3164325604, i64 727753846, i64 2179363840, i64 146436021, i64 1461446943, i64 4069977195, i64 705550613, i64 3059967265, i64 3887724982, i64 4281599278, i64 3313849956, i64 1404054877, i64 2845806497, i64 146425753, i64 1854211946, i64 1266315497, i64 3048417604, i64 3681880366, i64 3289982499, i64 2909710000, i64 1235738493, i64 2632868024, i64 2414719590, i64 3970600049, i64 1771706367, i64 1449415276, i64 3266420449, i64 422970021, i64 1963543593, i64 2690192192, i64 3826793022, i64 1062508698, i64 1531092325, i64 1804592342, i64 2583117782, i64 2714934279, i64 4024971509, i64 1294809318, i64 4028980673, i64 1289560198, i64 2221992742, i64 1669523910, i64 35572830, i64 157838143, i64 1052438473, i64 1016535060, i64 1802137761, i64 1753167236, i64 1386275462, i64 3080475397, i64 2857371447, i64 1040679964, i64 2145300060, i64 2390574316, i64 1461121720, i64 2956646967, i64 4031777805, i64 4028374788, i64 33600511, i64 2920084762, i64 1018524850, i64 629373528, i64 3691585981, i64 3515945977, i64 2091462646, i64 2486323059, i64 586499841, i64 988145025, i64 935516892, i64 3367335476, i64 2599673255, i64 2839830854, i64 265290510, i64 3972581182, i64 2759138881, i64 3795373465, i64 1005194799, i64 847297441, i64 406762289, i64 1314163512, i64 1332590856, i64 1866599683, i64 4127851711, i64 750260880, i64 613907577, i64 1450815602, i64 3165620655, i64 3734664991, i64 3650291728, i64 3012275730, i64 3704569646, i64 1427272223, i64 778793252, i64 1343938022, i64 2676280711, i64 2052605720, i64 1946737175, i64 3164576444, i64 3914038668, i64 3967478842, i64 3682934266, i64 1661551462, i64 3294938066, i64 4011595847, i64 840292616, i64 3712170807, i64 616741398, i64 312560963, i64 711312465, i64 1351876610, i64 322626781, i64 1910503582, i64 271666773, i64 2175563734, i64 1594956187, i64 70604529, i64 3617834859, i64 1007753275, i64 1495573769, i64 4069517037, i64 2549218298, i64 2663038764, i64 504708206, i64 2263041392, i64 3941167025, i64 2249088522, i64 1514023603, i64 1998579484, i64 1312622330, i64 694541497, i64 2582060303, i64 2151582166, i64 1382467621, i64 776784248, i64 2618340202, i64 3323268794, i64 2497899128, i64 2784771155, i64 503983604, i64 4076293799, i64 907881277, i64 423175695, i64 432175456, i64 1378068232, i64 4145222326, i64 3954048622, i64 3938656102, i64 3820766613, i64 2793130115, i64 2977904593, i64 26017576, i64 3274890735, i64 3194772133, i64 1700274565, i64 1756076034, i64 4006520079, i64 3677328699, i64 720338349, i64 1533947780, i64 354530856, i64 688349552, i64 3973924725, i64 1637815568, i64 332179504, i64 3949051286, i64 53804574, i64 2852348879, i64 3044236432, i64 1282449977, i64 3583942155, i64 3416972820, i64 4006381244, i64 1617046695, i64 2628476075, i64 3002303598, i64 1686838959, i64 431878346, i64 2686675385, i64 1700445008, i64 1080580658, i64 1009431731, i64 832498133, i64 3223435511, i64 2605976345, i64 2271191193, i64 2516031870, i64 1648197032, i64 4164389018, i64 2548247927, i64 300782431, i64 375919233, i64 238389289, i64 3353747414, i64 2531188641, i64 2019080857, i64 1475708069, i64 455242339, i64 2609103871, i64 448939670, i64 3451063019, i64 1395535956, i64 2413381860, i64 1841049896, i64 1491858159, i64 885456874, i64 4264095073, i64 4001119347, i64 1565136089, i64 3898914787, i64 1108368660, i64 540939232, i64 1173283510, i64 2745871338, i64 3681308437, i64 4207628240, i64 3343053890, i64 4016749493, i64 1699691293, i64 1103962373, i64 3625875870, i64 2256883143, i64 3830138730, i64 1031889488, i64 3479347698, i64 1535977030, i64 4236805024, i64 3251091107, i64 2132092099, i64 1774941330, i64 1199868427, i64 1452454533, i64 157007616, i64 2904115357, i64 342012276, i64 595725824, i64 1480756522, i64 206960106, i64 497939518, i64 591360097, i64 863170706, i64 2375253569, i64 3596610801, i64 1814182875, i64 2094937945, i64 3421402208, i64 1082520231, i64 3463918190, i64 2785509508, i64 435703966, i64 3908032597, i64 1641649973, i64 2842273706, i64 3305899714, i64 1510255612, i64 2148256476, i64 2655287854, i64 3276092548, i64 4258621189, i64 236887753, i64 3681803219, i64 274041037, i64 1734335097, i64 3815195456, i64 3317970021, i64 1899903192, i64 1026095262, i64 4050517792, i64 356393447, i64 2410691914, i64 3873677099, i64 3682840055, i64 3913112168, i64 2491498743, i64 4132185628, i64 2489919796, i64 1091903735, i64 1979897079, i64 3170134830, i64 3567386728, i64 3557303409, i64 857797738, i64 1136121015, i64 1342202287, i64 507115054, i64 2535736646, i64 337727348, i64 3213592640, i64 1301675037, i64 2528481711, i64 1895095763, i64 1721773893, i64 3216771564, i64 62756741, i64 2142006736, i64 835421444, i64 2531993523, i64 1442658625, i64 3659876326, i64 2882144922, i64 676362277, i64 1392781812, i64 170690266, i64 3921047035, i64 1759253602, i64 3611846912, i64 1745797284, i64 664899054, i64 1329594018, i64 3901205900, i64 3045908486, i64 2062866102, i64 2865634940, i64 3543621612, i64 3464012697, i64 1080764994, i64 553557557, i64 3656615353, i64 3996768171, i64 991055499, i64 499776247, i64 1265440854, i64 648242737, i64 3940784050, i64 980351604, i64 3713745714, i64 1749149687, i64 3396870395, i64 4211799374, i64 3640570775, i64 1161844396, i64 3125318951, i64 1431517754, i64 545492359, i64 4268468663, i64 3499529547, i64 1437099964, i64 2702547544, i64 3433638243, i64 2581715763, i64 2787789398, i64 1060185593, i64 1593081372, i64 2418618748, i64 4260947970, i64 69676912, i64 2159744348, i64 86519011, i64 2512459080, i64 3838209314, i64 1220612927, i64 3339683548, i64 133810670, i64 1090789135, i64 1078426020, i64 1569222167, i64 845107691, i64 3583754449, i64 4072456591, i64 1091646820, i64 628848692, i64 1613405280, i64 3757631651, i64 526609435, i64 236106946, i64 48312990, i64 2942717905, i64 3402727701, i64 1797494240, i64 859738849, i64 992217954, i64 4005476642, i64 2243076622, i64 3870952857, i64 3732016268, i64 765654824, i64 3490871365, i64 2511836413, i64 1685915746, i64 3888969200, i64 1414112111, i64 2273134842, i64 3281911079, i64 4080962846, i64 172450625, i64 2569994100, i64 980381355, i64 4109958455, i64 2819808352, i64 2716589560, i64 2568741196, i64 3681446669, i64 3329971472, i64 1835478071, i64 660984891, i64 3704678404, i64 4045999559, i64 3422617507, i64 3040415634, i64 1762651403, i64 1719377915, i64 3470491036, i64 2693910283, i64 3642056355, i64 3138596744, i64 1364962596, i64 2073328063, i64 1983633131, i64 926494387, i64 3423689081, i64 2150032023, i64 4096667949, i64 1749200295, i64 3328846651, i64 309677260, i64 2016342300, i64 1779581495, i64 3079819751, i64 111262694, i64 1274766160, i64 443224088, i64 298511866, i64 1025883608, i64 3806446537, i64 1145181785, i64 168956806, i64 3641502830, i64 3584813610, i64 1689216846, i64 3666258015, i64 3200248200, i64 1692713982, i64 2646376535, i64 4042768518, i64 1618508792, i64 1610833997, i64 3523052358, i64 4130873264, i64 2001055236, i64 3610705100, i64 2202168115, i64 4028541809, i64 2961195399, i64 1006657119, i64 2006996926, i64 3186142756, i64 1430667929, i64 3210227297, i64 1314452623, i64 4074634658, i64 4101304120, i64 2273951170, i64 1399257539, i64 3367210612, i64 3027628629, i64 1190975929, i64 2062231137, i64 2333990788, i64 2221543033, i64 2438960610, i64 1181637006, i64 548689776, i64 2362791313, i64 3372408396, i64 3104550113, i64 3145860560, i64 296247880, i64 1970579870, i64 3078560182, i64 3769228297, i64 1714227617, i64 3291629107, i64 3898220290, i64 166772364, i64 1251581989, i64 493813264, i64 448347421, i64 195405023, i64 2709975567, i64 677966185, i64 3703036547, i64 1463355134, i64 2715995803, i64 1338867538, i64 1343315457, i64 2802222074, i64 2684532164, i64 233230375, i64 2599980071, i64 2000651841, i64 3277868038, i64 1638401717, i64 4028070440, i64 3237316320, i64 6314154, i64 819756386, i64 300326615, i64 590932579, i64 1405279636, i64 3267499572, i64 3150704214, i64 2428286686, i64 3959192993, i64 3461946742, i64 1862657033, i64 1266418056, i64 963775037, i64 2089974820, i64 2263052895, i64 1917689273, i64 448879540, i64 3550394620, i64 3981727096, i64 150775221, i64 3627908307, i64 1303187396, i64 508620638, i64 2975983352, i64 2726630617, i64 1817252668, i64 1876281319, i64 1457606340, i64 908771278, i64 3720792119, i64 3617206836, i64 2455994898, i64 1729034894, i64 1080033504, i64 976866871, i64 3556439503, i64 2881648439, i64 1522871579, i64 1555064734, i64 1336096578, i64 3548522304, i64 2579274686, i64 3574697629, i64 3205460757, i64 3593280638, i64 3338716283, i64 3079412587, i64 564236357, i64 2993598910, i64 1781952180, i64 1464380207, i64 3163844217, i64 3332601554, i64 1699332808, i64 1393555694, i64 1183702653, i64 3581086237, i64 1288719814, i64 691649499, i64 2847557200, i64 2895455976, i64 3193889540, i64 2717570544, i64 1781354906, i64 1676643554, i64 2592534050, i64 3230253752, i64 1126444790, i64 2770207658, i64 2633158820, i64 2210423226, i64 2615765581, i64 2414155088, i64 3127139286, i64 673620729, i64 2805611233, i64 1269405062, i64 4015350505, i64 3341807571, i64 4149409754, i64 1057255273, i64 2012875353, i64 2162469141, i64 2276492801, i64 2601117357, i64 993977747, i64 3918593370, i64 2654263191, i64 753973209, i64 36408145, i64 2530585658, i64 25011837, i64 3520020182, i64 2088578344, i64 530523599, i64 2918365339, i64 1524020338, i64 1518925132, i64 3760827505, i64 3759777254, i64 1202760957, i64 3985898139, i64 3906192525, i64 674977740, i64 4174734889, i64 2031300136, i64 2019492241, i64 3983892565, i64 4153806404, i64 3822280332, i64 352677332, i64 2297720250, i64 60907813, i64 90501309, i64 3286998549, i64 1016092578, i64 2535922412, i64 2839152426, i64 457141659, i64 509813237, i64 4120667899, i64 652014361, i64 1966332200, i64 2975202805, i64 55981186, i64 2327461051, i64 676427537, i64 3255491064, i64 2882294119, i64 3433927263, i64 1307055953, i64 942726286, i64 933058658, i64 2468411793, i64 3933900994, i64 4215176142, i64 1361170020, i64 2001714738, i64 2830558078, i64 3274259782, i64 1222529897, i64 1679025792, i64 2729314320, i64 3714953764, i64 1770335741, i64 151462246, i64 3013232138, i64 1682292957, i64 1483529935, i64 471910574, i64 1539241949, i64 458788160, i64 3436315007, i64 1807016891, i64 3718408830, i64 978976581, i64 1043663428, i64 3165965781, i64 1927990952, i64 4200891579, i64 2372276910, i64 3208408903, i64 3533431907, i64 1412390302, i64 2931980059, i64 4132332400, i64 1947078029, i64 3881505623, i64 4168226417, i64 2941484381, i64 1077988104, i64 1320477388, i64 886195818, i64 18198404, i64 3786409000, i64 2509781533, i64 112762804, i64 3463356488, i64 1866414978, i64 891333506, i64 18488651, i64 661792760, i64 1628790961, i64 3885187036, i64 3141171499, i64 876946877, i64 2693282273, i64 1372485963, i64 791857591, i64 2686433993, i64 3759982718, i64 3167212022, i64 3472953795, i64 2716379847, i64 445679433, i64 3561995674, i64 3504004811, i64 3574258232, i64 54117162, i64 3331405415, i64 2381918588, i64 3769707343, i64 4154350007, i64 1140177722, i64 4074052095, i64 668550556, i64 3214352940, i64 367459370, i64 261225585, i64 2610173221, i64 4209349473, i64 3468074219, i64 3265815641, i64 314222801, i64 3066103646, i64 3808782860, i64 282218597, i64 3406013506, i64 3773591054, i64 379116347, i64 1285071038, i64 846784868, i64 2669647154, i64 3771962079, i64 3550491691, i64 2305946142, i64 453669953, i64 1268987020, i64 3317592352, i64 3279303384, i64 3744833421, i64 2610507566, i64 3859509063, i64 266596637, i64 3847019092, i64 517658769, i64 3462560207, i64 3443424879, i64 370717030, i64 4247526661, i64 2224018117, i64 4143653529, i64 4112773975, i64 2788324899, i64 2477274417, i64 1456262402, i64 2901442914, i64 1517677493, i64 1846949527, i64 2295493580, i64 3734397586, i64 2176403920, i64 1280348187, i64 1908823572, i64 3871786941, i64 846861322, i64 1172426758, i64 3287448474, i64 3383383037, i64 1655181056, i64 3139813346, i64 901632758, i64 1897031941, i64 2986607138, i64 3066810236, i64 3447102507, i64 1393639104, i64 373351379, i64 950779232, i64 625454576, i64 3124240540, i64 4148612726, i64 2007998917, i64 544563296, i64 2244738638, i64 2330496472, i64 2058025392, i64 1291430526, i64 424198748, i64 50039436, i64 29584100, i64 3605783033, i64 2429876329, i64 2791104160, i64 1057563949, i64 3255363231, i64 3075367218, i64 3463963227, i64 1469046755, i64 985887462] }, align 8

; Function Attrs: nounwind uwtable
define dso_local void @BF_cbc_encrypt(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, i64 noundef %arg2, ptr noundef %arg3, ptr nocapture noundef %arg4, i32 noundef %arg5) local_unnamed_addr #0 {
bb:
  %i = alloca [2 x i64], align 16
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %i) #12
  %i6 = icmp eq i32 %arg5, 0
  %i7 = getelementptr inbounds i8, ptr %arg4, i64 1
  %i8 = load i8, ptr %arg4, align 1, !tbaa !8
  %i9 = zext i8 %i8 to i64
  %i10 = shl nuw nsw i64 %i9, 24
  %i11 = getelementptr inbounds i8, ptr %arg4, i64 2
  %i12 = load i8, ptr %i7, align 1, !tbaa !8
  %i13 = zext i8 %i12 to i64
  %i14 = shl nuw nsw i64 %i13, 16
  %i15 = or disjoint i64 %i14, %i10
  %i16 = getelementptr inbounds i8, ptr %arg4, i64 3
  %i17 = load i8, ptr %i11, align 1, !tbaa !8
  %i18 = zext i8 %i17 to i64
  %i19 = shl nuw nsw i64 %i18, 8
  %i20 = or disjoint i64 %i15, %i19
  %i21 = getelementptr inbounds i8, ptr %arg4, i64 4
  %i22 = load i8, ptr %i16, align 1, !tbaa !8
  %i23 = zext i8 %i22 to i64
  %i24 = or disjoint i64 %i20, %i23
  %i25 = getelementptr inbounds i8, ptr %arg4, i64 5
  %i26 = load i8, ptr %i21, align 1, !tbaa !8
  %i27 = zext i8 %i26 to i64
  %i28 = shl nuw nsw i64 %i27, 24
  %i29 = getelementptr inbounds i8, ptr %arg4, i64 6
  %i30 = load i8, ptr %i25, align 1, !tbaa !8
  %i31 = zext i8 %i30 to i64
  %i32 = shl nuw nsw i64 %i31, 16
  %i33 = or disjoint i64 %i32, %i28
  %i34 = getelementptr inbounds i8, ptr %arg4, i64 7
  %i35 = load i8, ptr %i29, align 1, !tbaa !8
  %i36 = zext i8 %i35 to i64
  %i37 = shl nuw nsw i64 %i36, 8
  %i38 = or disjoint i64 %i33, %i37
  %i39 = load i8, ptr %i34, align 1, !tbaa !8
  %i40 = zext i8 %i39 to i64
  %i41 = or disjoint i64 %i38, %i40
  %i42 = icmp sgt i64 %arg2, 7
  br i1 %i6, label %bb208, label %bb43

bb43:                                             ; preds = %bb
  br i1 %i42, label %bb44, label %bb43.bb116_crit_edge

bb43.bb116_crit_edge:                             ; preds = %bb43
  br label %bb116

bb44:                                             ; preds = %bb43
  %i45 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb46

bb46:                                             ; preds = %bb46.bb46_crit_edge, %bb44
  %i47 = phi i64 [ %arg2, %bb44 ], [ %i52, %bb46.bb46_crit_edge ]
  %i48 = phi i64 [ %i41, %bb44 ], [ %i92, %bb46.bb46_crit_edge ]
  %i49 = phi i64 [ %i24, %bb44 ], [ %i91, %bb46.bb46_crit_edge ]
  %i50 = phi ptr [ %arg, %bb44 ], [ %i85, %bb46.bb46_crit_edge ]
  %i51 = phi ptr [ %arg1, %bb44 ], [ %i114, %bb46.bb46_crit_edge ]
  %i52 = add nsw i64 %i47, -8
  %i53 = getelementptr inbounds i8, ptr %i50, i64 1
  %i54 = load i8, ptr %i50, align 1, !tbaa !8
  %i55 = zext i8 %i54 to i64
  %i56 = shl nuw nsw i64 %i55, 24
  %i57 = getelementptr inbounds i8, ptr %i50, i64 2
  %i58 = load i8, ptr %i53, align 1, !tbaa !8
  %i59 = zext i8 %i58 to i64
  %i60 = shl nuw nsw i64 %i59, 16
  %i61 = or disjoint i64 %i60, %i56
  %i62 = getelementptr inbounds i8, ptr %i50, i64 3
  %i63 = load i8, ptr %i57, align 1, !tbaa !8
  %i64 = zext i8 %i63 to i64
  %i65 = shl nuw nsw i64 %i64, 8
  %i66 = or disjoint i64 %i61, %i65
  %i67 = getelementptr inbounds i8, ptr %i50, i64 4
  %i68 = load i8, ptr %i62, align 1, !tbaa !8
  %i69 = zext i8 %i68 to i64
  %i70 = or disjoint i64 %i66, %i69
  %i71 = getelementptr inbounds i8, ptr %i50, i64 5
  %i72 = load i8, ptr %i67, align 1, !tbaa !8
  %i73 = zext i8 %i72 to i64
  %i74 = shl nuw nsw i64 %i73, 24
  %i75 = getelementptr inbounds i8, ptr %i50, i64 6
  %i76 = load i8, ptr %i71, align 1, !tbaa !8
  %i77 = zext i8 %i76 to i64
  %i78 = shl nuw nsw i64 %i77, 16
  %i79 = or disjoint i64 %i78, %i74
  %i80 = getelementptr inbounds i8, ptr %i50, i64 7
  %i81 = load i8, ptr %i75, align 1, !tbaa !8
  %i82 = zext i8 %i81 to i64
  %i83 = shl nuw nsw i64 %i82, 8
  %i84 = or disjoint i64 %i79, %i83
  %i85 = getelementptr inbounds i8, ptr %i50, i64 8
  %i86 = load i8, ptr %i80, align 1, !tbaa !8
  %i87 = zext i8 %i86 to i64
  %i88 = or disjoint i64 %i84, %i87
  %i89 = xor i64 %i70, %i49
  %i90 = xor i64 %i88, %i48
  store i64 %i89, ptr %i, align 16, !tbaa !11
  store i64 %i90, ptr %i45, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg3, i32 noundef 1) #12
  %i91 = load i64, ptr %i, align 16, !tbaa !11
  %i92 = load i64, ptr %i45, align 8, !tbaa !11
  %i93 = lshr i64 %i91, 24
  %i94 = trunc i64 %i93 to i8
  %i95 = getelementptr inbounds i8, ptr %i51, i64 1
  store i8 %i94, ptr %i51, align 1, !tbaa !8
  %i96 = lshr i64 %i91, 16
  %i97 = trunc i64 %i96 to i8
  %i98 = getelementptr inbounds i8, ptr %i51, i64 2
  store i8 %i97, ptr %i95, align 1, !tbaa !8
  %i99 = lshr i64 %i91, 8
  %i100 = trunc i64 %i99 to i8
  %i101 = getelementptr inbounds i8, ptr %i51, i64 3
  store i8 %i100, ptr %i98, align 1, !tbaa !8
  %i102 = trunc i64 %i91 to i8
  %i103 = getelementptr inbounds i8, ptr %i51, i64 4
  store i8 %i102, ptr %i101, align 1, !tbaa !8
  %i104 = lshr i64 %i92, 24
  %i105 = trunc i64 %i104 to i8
  %i106 = getelementptr inbounds i8, ptr %i51, i64 5
  store i8 %i105, ptr %i103, align 1, !tbaa !8
  %i107 = lshr i64 %i92, 16
  %i108 = trunc i64 %i107 to i8
  %i109 = getelementptr inbounds i8, ptr %i51, i64 6
  store i8 %i108, ptr %i106, align 1, !tbaa !8
  %i110 = lshr i64 %i92, 8
  %i111 = trunc i64 %i110 to i8
  %i112 = getelementptr inbounds i8, ptr %i51, i64 7
  store i8 %i111, ptr %i109, align 1, !tbaa !8
  %i113 = trunc i64 %i92 to i8
  %i114 = getelementptr inbounds i8, ptr %i51, i64 8
  store i8 %i113, ptr %i112, align 1, !tbaa !8
  %i115 = icmp sgt i64 %i47, 15
  br i1 %i115, label %bb46.bb46_crit_edge, label %bb116.loopexit, !llvm.loop !13

bb46.bb46_crit_edge:                              ; preds = %bb46
  br label %bb46

bb116.loopexit:                                   ; preds = %bb46
  br label %bb116

bb116:                                            ; preds = %bb43.bb116_crit_edge, %bb116.loopexit
  %i117 = phi ptr [ %arg1, %bb43.bb116_crit_edge ], [ %i114, %bb116.loopexit ]
  %i118 = phi ptr [ %arg, %bb43.bb116_crit_edge ], [ %i85, %bb116.loopexit ]
  %i119 = phi i64 [ %i24, %bb43.bb116_crit_edge ], [ %i91, %bb116.loopexit ]
  %i120 = phi i64 [ %i41, %bb43.bb116_crit_edge ], [ %i92, %bb116.loopexit ]
  %i121 = phi i64 [ %arg2, %bb43.bb116_crit_edge ], [ %i52, %bb116.loopexit ]
  %i122 = icmp eq i64 %i121, 0
  br i1 %i122, label %bb116.bb363_crit_edge, label %bb123

bb116.bb363_crit_edge:                            ; preds = %bb116
  br label %bb363

bb123:                                            ; preds = %bb116
  %i124 = getelementptr inbounds i8, ptr %i118, i64 %i121
  switch i64 %i121, label %bb123.bb179_crit_edge [
    i64 1, label %bb123.bb170_crit_edge
    i64 7, label %bb125
    i64 6, label %bb123.bb130_crit_edge
    i64 5, label %bb123.bb138_crit_edge
    i64 4, label %bb123.bb146_crit_edge
    i64 3, label %bb123.bb152_crit_edge
    i64 2, label %bb123.bb161_crit_edge
  ]

bb123.bb161_crit_edge:                            ; preds = %bb123
  br label %bb161

bb123.bb152_crit_edge:                            ; preds = %bb123
  br label %bb152

bb123.bb146_crit_edge:                            ; preds = %bb123
  br label %bb146

bb123.bb138_crit_edge:                            ; preds = %bb123
  br label %bb138

bb123.bb130_crit_edge:                            ; preds = %bb123
  br label %bb130

bb123.bb170_crit_edge:                            ; preds = %bb123
  br label %bb170

bb123.bb179_crit_edge:                            ; preds = %bb123
  br label %bb179

bb125:                                            ; preds = %bb123
  %i126 = getelementptr inbounds i8, ptr %i124, i64 -1
  %i127 = load i8, ptr %i126, align 1, !tbaa !8
  %i128 = zext i8 %i127 to i64
  %i129 = shl nuw nsw i64 %i128, 8
  br label %bb130

bb130:                                            ; preds = %bb123.bb130_crit_edge, %bb125
  %i131 = phi ptr [ %i124, %bb123.bb130_crit_edge ], [ %i126, %bb125 ]
  %i132 = phi i64 [ 0, %bb123.bb130_crit_edge ], [ %i129, %bb125 ]
  %i133 = getelementptr inbounds i8, ptr %i131, i64 -1
  %i134 = load i8, ptr %i133, align 1, !tbaa !8
  %i135 = zext i8 %i134 to i64
  %i136 = shl nuw nsw i64 %i135, 16
  %i137 = or i64 %i136, %i132
  br label %bb138

bb138:                                            ; preds = %bb123.bb138_crit_edge, %bb130
  %i139 = phi ptr [ %i124, %bb123.bb138_crit_edge ], [ %i133, %bb130 ]
  %i140 = phi i64 [ 0, %bb123.bb138_crit_edge ], [ %i137, %bb130 ]
  %i141 = getelementptr inbounds i8, ptr %i139, i64 -1
  %i142 = load i8, ptr %i141, align 1, !tbaa !8
  %i143 = zext i8 %i142 to i64
  %i144 = shl nuw nsw i64 %i143, 24
  %i145 = or i64 %i144, %i140
  br label %bb146

bb146:                                            ; preds = %bb123.bb146_crit_edge, %bb138
  %i147 = phi ptr [ %i124, %bb123.bb146_crit_edge ], [ %i141, %bb138 ]
  %i148 = phi i64 [ 0, %bb123.bb146_crit_edge ], [ %i145, %bb138 ]
  %i149 = getelementptr inbounds i8, ptr %i147, i64 -1
  %i150 = load i8, ptr %i149, align 1, !tbaa !8
  %i151 = zext i8 %i150 to i64
  br label %bb152

bb152:                                            ; preds = %bb123.bb152_crit_edge, %bb146
  %i153 = phi ptr [ %i124, %bb123.bb152_crit_edge ], [ %i149, %bb146 ]
  %i154 = phi i64 [ 0, %bb123.bb152_crit_edge ], [ %i151, %bb146 ]
  %i155 = phi i64 [ 0, %bb123.bb152_crit_edge ], [ %i148, %bb146 ]
  %i156 = getelementptr inbounds i8, ptr %i153, i64 -1
  %i157 = load i8, ptr %i156, align 1, !tbaa !8
  %i158 = zext i8 %i157 to i64
  %i159 = shl nuw nsw i64 %i158, 8
  %i160 = or disjoint i64 %i159, %i154
  br label %bb161

bb161:                                            ; preds = %bb123.bb161_crit_edge, %bb152
  %i162 = phi ptr [ %i124, %bb123.bb161_crit_edge ], [ %i156, %bb152 ]
  %i163 = phi i64 [ 0, %bb123.bb161_crit_edge ], [ %i160, %bb152 ]
  %i164 = phi i64 [ 0, %bb123.bb161_crit_edge ], [ %i155, %bb152 ]
  %i165 = getelementptr inbounds i8, ptr %i162, i64 -1
  %i166 = load i8, ptr %i165, align 1, !tbaa !8
  %i167 = zext i8 %i166 to i64
  %i168 = shl nuw nsw i64 %i167, 16
  %i169 = or i64 %i168, %i163
  br label %bb170

bb170:                                            ; preds = %bb123.bb170_crit_edge, %bb161
  %i171 = phi ptr [ %i124, %bb123.bb170_crit_edge ], [ %i165, %bb161 ]
  %i172 = phi i64 [ 0, %bb123.bb170_crit_edge ], [ %i169, %bb161 ]
  %i173 = phi i64 [ 0, %bb123.bb170_crit_edge ], [ %i164, %bb161 ]
  %i174 = getelementptr inbounds i8, ptr %i171, i64 -1
  %i175 = load i8, ptr %i174, align 1, !tbaa !8
  %i176 = zext i8 %i175 to i64
  %i177 = shl nuw nsw i64 %i176, 24
  %i178 = or i64 %i177, %i172
  br label %bb179

bb179:                                            ; preds = %bb123.bb179_crit_edge, %bb170
  %i180 = phi i64 [ 0, %bb123.bb179_crit_edge ], [ %i178, %bb170 ]
  %i181 = phi i64 [ 0, %bb123.bb179_crit_edge ], [ %i173, %bb170 ]
  %i182 = xor i64 %i180, %i119
  %i183 = xor i64 %i181, %i120
  store i64 %i182, ptr %i, align 16, !tbaa !11
  %i184 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 %i183, ptr %i184, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg3, i32 noundef 1) #12
  %i185 = load i64, ptr %i, align 16, !tbaa !11
  %i186 = load i64, ptr %i184, align 8, !tbaa !11
  %i187 = lshr i64 %i185, 24
  %i188 = trunc i64 %i187 to i8
  %i189 = getelementptr inbounds i8, ptr %i117, i64 1
  store i8 %i188, ptr %i117, align 1, !tbaa !8
  %i190 = lshr i64 %i185, 16
  %i191 = trunc i64 %i190 to i8
  %i192 = getelementptr inbounds i8, ptr %i117, i64 2
  store i8 %i191, ptr %i189, align 1, !tbaa !8
  %i193 = lshr i64 %i185, 8
  %i194 = trunc i64 %i193 to i8
  %i195 = getelementptr inbounds i8, ptr %i117, i64 3
  store i8 %i194, ptr %i192, align 1, !tbaa !8
  %i196 = trunc i64 %i185 to i8
  %i197 = getelementptr inbounds i8, ptr %i117, i64 4
  store i8 %i196, ptr %i195, align 1, !tbaa !8
  %i198 = lshr i64 %i186, 24
  %i199 = trunc i64 %i198 to i8
  %i200 = getelementptr inbounds i8, ptr %i117, i64 5
  store i8 %i199, ptr %i197, align 1, !tbaa !8
  %i201 = lshr i64 %i186, 16
  %i202 = trunc i64 %i201 to i8
  %i203 = getelementptr inbounds i8, ptr %i117, i64 6
  store i8 %i202, ptr %i200, align 1, !tbaa !8
  %i204 = lshr i64 %i186, 8
  %i205 = trunc i64 %i204 to i8
  %i206 = getelementptr inbounds i8, ptr %i117, i64 7
  store i8 %i205, ptr %i203, align 1, !tbaa !8
  %i207 = trunc i64 %i186 to i8
  store i8 %i207, ptr %i206, align 1, !tbaa !8
  br label %bb363

bb208:                                            ; preds = %bb
  br i1 %i42, label %bb209, label %bb208.bb281_crit_edge

bb208.bb281_crit_edge:                            ; preds = %bb208
  br label %bb281

bb209:                                            ; preds = %bb208
  %i210 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb211

bb211:                                            ; preds = %bb211.bb211_crit_edge, %bb209
  %i212 = phi i64 [ %arg2, %bb209 ], [ %i217, %bb211.bb211_crit_edge ]
  %i213 = phi i64 [ %i41, %bb209 ], [ %i253, %bb211.bb211_crit_edge ]
  %i214 = phi i64 [ %i24, %bb209 ], [ %i235, %bb211.bb211_crit_edge ]
  %i215 = phi ptr [ %arg, %bb209 ], [ %i250, %bb211.bb211_crit_edge ]
  %i216 = phi ptr [ %arg1, %bb209 ], [ %i279, %bb211.bb211_crit_edge ]
  %i217 = add nsw i64 %i212, -8
  %i218 = getelementptr inbounds i8, ptr %i215, i64 1
  %i219 = load i8, ptr %i215, align 1, !tbaa !8
  %i220 = zext i8 %i219 to i64
  %i221 = shl nuw nsw i64 %i220, 24
  %i222 = getelementptr inbounds i8, ptr %i215, i64 2
  %i223 = load i8, ptr %i218, align 1, !tbaa !8
  %i224 = zext i8 %i223 to i64
  %i225 = shl nuw nsw i64 %i224, 16
  %i226 = or disjoint i64 %i225, %i221
  %i227 = getelementptr inbounds i8, ptr %i215, i64 3
  %i228 = load i8, ptr %i222, align 1, !tbaa !8
  %i229 = zext i8 %i228 to i64
  %i230 = shl nuw nsw i64 %i229, 8
  %i231 = or disjoint i64 %i226, %i230
  %i232 = getelementptr inbounds i8, ptr %i215, i64 4
  %i233 = load i8, ptr %i227, align 1, !tbaa !8
  %i234 = zext i8 %i233 to i64
  %i235 = or disjoint i64 %i231, %i234
  %i236 = getelementptr inbounds i8, ptr %i215, i64 5
  %i237 = load i8, ptr %i232, align 1, !tbaa !8
  %i238 = zext i8 %i237 to i64
  %i239 = shl nuw nsw i64 %i238, 24
  %i240 = getelementptr inbounds i8, ptr %i215, i64 6
  %i241 = load i8, ptr %i236, align 1, !tbaa !8
  %i242 = zext i8 %i241 to i64
  %i243 = shl nuw nsw i64 %i242, 16
  %i244 = or disjoint i64 %i243, %i239
  %i245 = getelementptr inbounds i8, ptr %i215, i64 7
  %i246 = load i8, ptr %i240, align 1, !tbaa !8
  %i247 = zext i8 %i246 to i64
  %i248 = shl nuw nsw i64 %i247, 8
  %i249 = or disjoint i64 %i244, %i248
  %i250 = getelementptr inbounds i8, ptr %i215, i64 8
  %i251 = load i8, ptr %i245, align 1, !tbaa !8
  %i252 = zext i8 %i251 to i64
  %i253 = or disjoint i64 %i249, %i252
  store i64 %i235, ptr %i, align 16, !tbaa !11
  store i64 %i253, ptr %i210, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg3, i32 noundef 0) #12
  %i254 = load i64, ptr %i, align 16, !tbaa !11
  %i255 = xor i64 %i254, %i214
  %i256 = load i64, ptr %i210, align 8, !tbaa !11
  %i257 = xor i64 %i256, %i213
  %i258 = lshr i64 %i255, 24
  %i259 = trunc i64 %i258 to i8
  %i260 = getelementptr inbounds i8, ptr %i216, i64 1
  store i8 %i259, ptr %i216, align 1, !tbaa !8
  %i261 = lshr i64 %i255, 16
  %i262 = trunc i64 %i261 to i8
  %i263 = getelementptr inbounds i8, ptr %i216, i64 2
  store i8 %i262, ptr %i260, align 1, !tbaa !8
  %i264 = lshr i64 %i255, 8
  %i265 = trunc i64 %i264 to i8
  %i266 = getelementptr inbounds i8, ptr %i216, i64 3
  store i8 %i265, ptr %i263, align 1, !tbaa !8
  %i267 = trunc i64 %i255 to i8
  %i268 = getelementptr inbounds i8, ptr %i216, i64 4
  store i8 %i267, ptr %i266, align 1, !tbaa !8
  %i269 = lshr i64 %i257, 24
  %i270 = trunc i64 %i269 to i8
  %i271 = getelementptr inbounds i8, ptr %i216, i64 5
  store i8 %i270, ptr %i268, align 1, !tbaa !8
  %i272 = lshr i64 %i257, 16
  %i273 = trunc i64 %i272 to i8
  %i274 = getelementptr inbounds i8, ptr %i216, i64 6
  store i8 %i273, ptr %i271, align 1, !tbaa !8
  %i275 = lshr i64 %i257, 8
  %i276 = trunc i64 %i275 to i8
  %i277 = getelementptr inbounds i8, ptr %i216, i64 7
  store i8 %i276, ptr %i274, align 1, !tbaa !8
  %i278 = trunc i64 %i257 to i8
  %i279 = getelementptr inbounds i8, ptr %i216, i64 8
  store i8 %i278, ptr %i277, align 1, !tbaa !8
  %i280 = icmp sgt i64 %i212, 15
  br i1 %i280, label %bb211.bb211_crit_edge, label %bb281.loopexit, !llvm.loop !16

bb211.bb211_crit_edge:                            ; preds = %bb211
  br label %bb211

bb281.loopexit:                                   ; preds = %bb211
  br label %bb281

bb281:                                            ; preds = %bb208.bb281_crit_edge, %bb281.loopexit
  %i282 = phi ptr [ %arg1, %bb208.bb281_crit_edge ], [ %i279, %bb281.loopexit ]
  %i283 = phi ptr [ %arg, %bb208.bb281_crit_edge ], [ %i250, %bb281.loopexit ]
  %i284 = phi i64 [ %i24, %bb208.bb281_crit_edge ], [ %i235, %bb281.loopexit ]
  %i285 = phi i64 [ %i41, %bb208.bb281_crit_edge ], [ %i253, %bb281.loopexit ]
  %i286 = phi i64 [ %arg2, %bb208.bb281_crit_edge ], [ %i217, %bb281.loopexit ]
  %i287 = icmp eq i64 %i286, 0
  br i1 %i287, label %bb281.bb363_crit_edge, label %bb288

bb281.bb363_crit_edge:                            ; preds = %bb281
  br label %bb363

bb288:                                            ; preds = %bb281
  %i289 = getelementptr inbounds i8, ptr %i283, i64 1
  %i290 = load i8, ptr %i283, align 1, !tbaa !8
  %i291 = zext i8 %i290 to i64
  %i292 = shl nuw nsw i64 %i291, 24
  %i293 = getelementptr inbounds i8, ptr %i283, i64 2
  %i294 = load i8, ptr %i289, align 1, !tbaa !8
  %i295 = zext i8 %i294 to i64
  %i296 = shl nuw nsw i64 %i295, 16
  %i297 = or disjoint i64 %i296, %i292
  %i298 = getelementptr inbounds i8, ptr %i283, i64 3
  %i299 = load i8, ptr %i293, align 1, !tbaa !8
  %i300 = zext i8 %i299 to i64
  %i301 = shl nuw nsw i64 %i300, 8
  %i302 = or disjoint i64 %i297, %i301
  %i303 = getelementptr inbounds i8, ptr %i283, i64 4
  %i304 = load i8, ptr %i298, align 1, !tbaa !8
  %i305 = zext i8 %i304 to i64
  %i306 = or disjoint i64 %i302, %i305
  %i307 = getelementptr inbounds i8, ptr %i283, i64 5
  %i308 = load i8, ptr %i303, align 1, !tbaa !8
  %i309 = zext i8 %i308 to i64
  %i310 = shl nuw nsw i64 %i309, 24
  %i311 = getelementptr inbounds i8, ptr %i283, i64 6
  %i312 = load i8, ptr %i307, align 1, !tbaa !8
  %i313 = zext i8 %i312 to i64
  %i314 = shl nuw nsw i64 %i313, 16
  %i315 = or disjoint i64 %i314, %i310
  %i316 = getelementptr inbounds i8, ptr %i283, i64 7
  %i317 = load i8, ptr %i311, align 1, !tbaa !8
  %i318 = zext i8 %i317 to i64
  %i319 = shl nuw nsw i64 %i318, 8
  %i320 = or disjoint i64 %i315, %i319
  %i321 = load i8, ptr %i316, align 1, !tbaa !8
  %i322 = zext i8 %i321 to i64
  %i323 = or disjoint i64 %i320, %i322
  store i64 %i306, ptr %i, align 16, !tbaa !11
  %i324 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 %i323, ptr %i324, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg3, i32 noundef 0) #12
  %i325 = load i64, ptr %i, align 16, !tbaa !11
  %i326 = xor i64 %i325, %i284
  %i327 = load i64, ptr %i324, align 8, !tbaa !11
  %i328 = xor i64 %i327, %i285
  %i329 = getelementptr inbounds i8, ptr %i282, i64 %i286
  switch i64 %i286, label %bb288.bb363_crit_edge [
    i64 1, label %bb288.bb358_crit_edge
    i64 7, label %bb330
    i64 6, label %bb288.bb334_crit_edge
    i64 5, label %bb288.bb339_crit_edge
    i64 4, label %bb288.bb344_crit_edge
    i64 3, label %bb288.bb348_crit_edge
    i64 2, label %bb288.bb353_crit_edge
  ]

bb288.bb353_crit_edge:                            ; preds = %bb288
  br label %bb353

bb288.bb348_crit_edge:                            ; preds = %bb288
  br label %bb348

bb288.bb344_crit_edge:                            ; preds = %bb288
  br label %bb344

bb288.bb339_crit_edge:                            ; preds = %bb288
  br label %bb339

bb288.bb334_crit_edge:                            ; preds = %bb288
  br label %bb334

bb288.bb358_crit_edge:                            ; preds = %bb288
  br label %bb358

bb288.bb363_crit_edge:                            ; preds = %bb288
  br label %bb363

bb330:                                            ; preds = %bb288
  %i331 = lshr i64 %i328, 8
  %i332 = trunc i64 %i331 to i8
  %i333 = getelementptr inbounds i8, ptr %i329, i64 -1
  store i8 %i332, ptr %i333, align 1, !tbaa !8
  br label %bb334

bb334:                                            ; preds = %bb288.bb334_crit_edge, %bb330
  %i335 = phi ptr [ %i329, %bb288.bb334_crit_edge ], [ %i333, %bb330 ]
  %i336 = lshr i64 %i328, 16
  %i337 = trunc i64 %i336 to i8
  %i338 = getelementptr inbounds i8, ptr %i335, i64 -1
  store i8 %i337, ptr %i338, align 1, !tbaa !8
  br label %bb339

bb339:                                            ; preds = %bb288.bb339_crit_edge, %bb334
  %i340 = phi ptr [ %i329, %bb288.bb339_crit_edge ], [ %i338, %bb334 ]
  %i341 = lshr i64 %i328, 24
  %i342 = trunc i64 %i341 to i8
  %i343 = getelementptr inbounds i8, ptr %i340, i64 -1
  store i8 %i342, ptr %i343, align 1, !tbaa !8
  br label %bb344

bb344:                                            ; preds = %bb288.bb344_crit_edge, %bb339
  %i345 = phi ptr [ %i329, %bb288.bb344_crit_edge ], [ %i343, %bb339 ]
  %i346 = trunc i64 %i326 to i8
  %i347 = getelementptr inbounds i8, ptr %i345, i64 -1
  store i8 %i346, ptr %i347, align 1, !tbaa !8
  br label %bb348

bb348:                                            ; preds = %bb288.bb348_crit_edge, %bb344
  %i349 = phi ptr [ %i329, %bb288.bb348_crit_edge ], [ %i347, %bb344 ]
  %i350 = lshr i64 %i326, 8
  %i351 = trunc i64 %i350 to i8
  %i352 = getelementptr inbounds i8, ptr %i349, i64 -1
  store i8 %i351, ptr %i352, align 1, !tbaa !8
  br label %bb353

bb353:                                            ; preds = %bb288.bb353_crit_edge, %bb348
  %i354 = phi ptr [ %i329, %bb288.bb353_crit_edge ], [ %i352, %bb348 ]
  %i355 = lshr i64 %i326, 16
  %i356 = trunc i64 %i355 to i8
  %i357 = getelementptr inbounds i8, ptr %i354, i64 -1
  store i8 %i356, ptr %i357, align 1, !tbaa !8
  br label %bb358

bb358:                                            ; preds = %bb288.bb358_crit_edge, %bb353
  %i359 = phi ptr [ %i329, %bb288.bb358_crit_edge ], [ %i357, %bb353 ]
  %i360 = lshr i64 %i326, 24
  %i361 = trunc i64 %i360 to i8
  %i362 = getelementptr inbounds i8, ptr %i359, i64 -1
  store i8 %i361, ptr %i362, align 1, !tbaa !8
  br label %bb363

bb363:                                            ; preds = %bb288.bb363_crit_edge, %bb281.bb363_crit_edge, %bb116.bb363_crit_edge, %bb358, %bb179
  %i364 = phi i64 [ %i185, %bb179 ], [ %i119, %bb116.bb363_crit_edge ], [ %i284, %bb281.bb363_crit_edge ], [ %i306, %bb358 ], [ %i306, %bb288.bb363_crit_edge ]
  %i365 = phi i64 [ %i186, %bb179 ], [ %i120, %bb116.bb363_crit_edge ], [ %i285, %bb281.bb363_crit_edge ], [ %i323, %bb358 ], [ %i323, %bb288.bb363_crit_edge ]
  %i366 = lshr i64 %i364, 24
  %i367 = trunc i64 %i366 to i8
  store i8 %i367, ptr %arg4, align 1, !tbaa !8
  %i368 = lshr i64 %i364, 16
  %i369 = trunc i64 %i368 to i8
  store i8 %i369, ptr %i7, align 1, !tbaa !8
  %i370 = lshr i64 %i364, 8
  %i371 = trunc i64 %i370 to i8
  store i8 %i371, ptr %i11, align 1, !tbaa !8
  %i372 = trunc i64 %i364 to i8
  store i8 %i372, ptr %i16, align 1, !tbaa !8
  %i373 = lshr i64 %i365, 24
  %i374 = trunc i64 %i373 to i8
  store i8 %i374, ptr %i21, align 1, !tbaa !8
  %i375 = lshr i64 %i365, 16
  %i376 = trunc i64 %i375 to i8
  store i8 %i376, ptr %i25, align 1, !tbaa !8
  %i377 = lshr i64 %i365, 8
  %i378 = trunc i64 %i377 to i8
  store i8 %i378, ptr %i29, align 1, !tbaa !8
  %i379 = trunc i64 %i365 to i8
  store i8 %i379, ptr %i34, align 1, !tbaa !8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %i, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %i) #12
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @BF_cfb64_encrypt(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, i64 noundef %arg2, ptr noundef %arg3, ptr nocapture noundef %arg4, ptr nocapture noundef %arg5, i32 noundef %arg6) local_unnamed_addr #0 {
bb:
  %i = alloca [2 x i64], align 16
  %i7 = load i32, ptr %arg5, align 4, !tbaa !17
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %i) #12
  %i8 = icmp eq i32 %arg6, 0
  %i9 = icmp eq i64 %arg2, 0
  br i1 %i8, label %bb20, label %bb10

bb10:                                             ; preds = %bb
  br i1 %i9, label %bb10.bb156_crit_edge, label %bb11

bb10.bb156_crit_edge:                             ; preds = %bb10
  br label %bb156

bb11:                                             ; preds = %bb10
  %i12 = getelementptr inbounds i8, ptr %arg4, i64 1
  %i13 = getelementptr inbounds i8, ptr %arg4, i64 2
  %i14 = getelementptr inbounds i8, ptr %arg4, i64 3
  %i15 = getelementptr inbounds i8, ptr %arg4, i64 4
  %i16 = getelementptr inbounds i8, ptr %arg4, i64 5
  %i17 = getelementptr inbounds i8, ptr %arg4, i64 6
  %i18 = getelementptr inbounds i8, ptr %arg4, i64 7
  %i19 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb30

bb20:                                             ; preds = %bb
  br i1 %i9, label %bb20.bb156_crit_edge, label %bb21

bb20.bb156_crit_edge:                             ; preds = %bb20
  br label %bb156

bb21:                                             ; preds = %bb20
  %i22 = getelementptr inbounds i8, ptr %arg4, i64 1
  %i23 = getelementptr inbounds i8, ptr %arg4, i64 2
  %i24 = getelementptr inbounds i8, ptr %arg4, i64 3
  %i25 = getelementptr inbounds i8, ptr %arg4, i64 4
  %i26 = getelementptr inbounds i8, ptr %arg4, i64 5
  %i27 = getelementptr inbounds i8, ptr %arg4, i64 6
  %i28 = getelementptr inbounds i8, ptr %arg4, i64 7
  %i29 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  br label %bb93

bb30:                                             ; preds = %bb82.bb30_crit_edge, %bb11
  %i31 = phi i64 [ %arg2, %bb11 ], [ %i35, %bb82.bb30_crit_edge ]
  %i32 = phi i32 [ %i7, %bb11 ], [ %i91, %bb82.bb30_crit_edge ]
  %i33 = phi ptr [ %arg, %bb11 ], [ %i83, %bb82.bb30_crit_edge ]
  %i34 = phi ptr [ %arg1, %bb11 ], [ %i89, %bb82.bb30_crit_edge ]
  %i35 = add nsw i64 %i31, -1
  %i36 = icmp eq i32 %i32, 0
  br i1 %i36, label %bb37, label %bb30.bb82_crit_edge

bb30.bb82_crit_edge:                              ; preds = %bb30
  br label %bb82

bb37:                                             ; preds = %bb30
  %i38 = load i8, ptr %arg4, align 1, !tbaa !8
  %i39 = zext i8 %i38 to i64
  %i40 = shl nuw nsw i64 %i39, 24
  %i41 = load i8, ptr %i12, align 1, !tbaa !8
  %i42 = zext i8 %i41 to i64
  %i43 = shl nuw nsw i64 %i42, 16
  %i44 = or disjoint i64 %i43, %i40
  %i45 = load i8, ptr %i13, align 1, !tbaa !8
  %i46 = zext i8 %i45 to i64
  %i47 = shl nuw nsw i64 %i46, 8
  %i48 = or disjoint i64 %i44, %i47
  %i49 = load i8, ptr %i14, align 1, !tbaa !8
  %i50 = zext i8 %i49 to i64
  %i51 = or disjoint i64 %i48, %i50
  store i64 %i51, ptr %i, align 16, !tbaa !11
  %i52 = load i8, ptr %i15, align 1, !tbaa !8
  %i53 = zext i8 %i52 to i64
  %i54 = shl nuw nsw i64 %i53, 24
  %i55 = load i8, ptr %i16, align 1, !tbaa !8
  %i56 = zext i8 %i55 to i64
  %i57 = shl nuw nsw i64 %i56, 16
  %i58 = or disjoint i64 %i57, %i54
  %i59 = load i8, ptr %i17, align 1, !tbaa !8
  %i60 = zext i8 %i59 to i64
  %i61 = shl nuw nsw i64 %i60, 8
  %i62 = or disjoint i64 %i58, %i61
  %i63 = load i8, ptr %i18, align 1, !tbaa !8
  %i64 = zext i8 %i63 to i64
  %i65 = or disjoint i64 %i62, %i64
  store i64 %i65, ptr %i19, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg3, i32 noundef 1) #12
  %i66 = load i64, ptr %i, align 16, !tbaa !11
  %i67 = lshr i64 %i66, 24
  %i68 = trunc i64 %i67 to i8
  store i8 %i68, ptr %arg4, align 1, !tbaa !8
  %i69 = lshr i64 %i66, 16
  %i70 = trunc i64 %i69 to i8
  store i8 %i70, ptr %i12, align 1, !tbaa !8
  %i71 = lshr i64 %i66, 8
  %i72 = trunc i64 %i71 to i8
  store i8 %i72, ptr %i13, align 1, !tbaa !8
  %i73 = trunc i64 %i66 to i8
  store i8 %i73, ptr %i14, align 1, !tbaa !8
  %i74 = load i64, ptr %i19, align 8, !tbaa !11
  %i75 = lshr i64 %i74, 24
  %i76 = trunc i64 %i75 to i8
  store i8 %i76, ptr %i15, align 1, !tbaa !8
  %i77 = lshr i64 %i74, 16
  %i78 = trunc i64 %i77 to i8
  store i8 %i78, ptr %i16, align 1, !tbaa !8
  %i79 = lshr i64 %i74, 8
  %i80 = trunc i64 %i79 to i8
  store i8 %i80, ptr %i17, align 1, !tbaa !8
  %i81 = trunc i64 %i74 to i8
  store i8 %i81, ptr %i18, align 1, !tbaa !8
  br label %bb82

bb82:                                             ; preds = %bb30.bb82_crit_edge, %bb37
  %i83 = getelementptr inbounds i8, ptr %i33, i64 1
  %i84 = load i8, ptr %i33, align 1, !tbaa !8
  %i85 = sext i32 %i32 to i64
  %i86 = getelementptr inbounds i8, ptr %arg4, i64 %i85
  %i87 = load i8, ptr %i86, align 1, !tbaa !8
  %i88 = xor i8 %i87, %i84
  %i89 = getelementptr inbounds i8, ptr %i34, i64 1
  store i8 %i88, ptr %i34, align 1, !tbaa !8
  store i8 %i88, ptr %i86, align 1, !tbaa !8
  %i90 = add nsw i32 %i32, 1
  %i91 = and i32 %i90, 7
  %i92 = icmp eq i64 %i35, 0
  br i1 %i92, label %bb156.loopexit1, label %bb82.bb30_crit_edge, !llvm.loop !19

bb82.bb30_crit_edge:                              ; preds = %bb82
  br label %bb30

bb93:                                             ; preds = %bb145.bb93_crit_edge, %bb21
  %i94 = phi i64 [ %arg2, %bb21 ], [ %i98, %bb145.bb93_crit_edge ]
  %i95 = phi i32 [ %i7, %bb21 ], [ %i154, %bb145.bb93_crit_edge ]
  %i96 = phi ptr [ %arg, %bb21 ], [ %i146, %bb145.bb93_crit_edge ]
  %i97 = phi ptr [ %arg1, %bb21 ], [ %i152, %bb145.bb93_crit_edge ]
  %i98 = add nsw i64 %i94, -1
  %i99 = icmp eq i32 %i95, 0
  br i1 %i99, label %bb100, label %bb93.bb145_crit_edge

bb93.bb145_crit_edge:                             ; preds = %bb93
  br label %bb145

bb100:                                            ; preds = %bb93
  %i101 = load i8, ptr %arg4, align 1, !tbaa !8
  %i102 = zext i8 %i101 to i64
  %i103 = shl nuw nsw i64 %i102, 24
  %i104 = load i8, ptr %i22, align 1, !tbaa !8
  %i105 = zext i8 %i104 to i64
  %i106 = shl nuw nsw i64 %i105, 16
  %i107 = or disjoint i64 %i106, %i103
  %i108 = load i8, ptr %i23, align 1, !tbaa !8
  %i109 = zext i8 %i108 to i64
  %i110 = shl nuw nsw i64 %i109, 8
  %i111 = or disjoint i64 %i107, %i110
  %i112 = load i8, ptr %i24, align 1, !tbaa !8
  %i113 = zext i8 %i112 to i64
  %i114 = or disjoint i64 %i111, %i113
  store i64 %i114, ptr %i, align 16, !tbaa !11
  %i115 = load i8, ptr %i25, align 1, !tbaa !8
  %i116 = zext i8 %i115 to i64
  %i117 = shl nuw nsw i64 %i116, 24
  %i118 = load i8, ptr %i26, align 1, !tbaa !8
  %i119 = zext i8 %i118 to i64
  %i120 = shl nuw nsw i64 %i119, 16
  %i121 = or disjoint i64 %i120, %i117
  %i122 = load i8, ptr %i27, align 1, !tbaa !8
  %i123 = zext i8 %i122 to i64
  %i124 = shl nuw nsw i64 %i123, 8
  %i125 = or disjoint i64 %i121, %i124
  %i126 = load i8, ptr %i28, align 1, !tbaa !8
  %i127 = zext i8 %i126 to i64
  %i128 = or disjoint i64 %i125, %i127
  store i64 %i128, ptr %i29, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg3, i32 noundef 1) #12
  %i129 = load i64, ptr %i, align 16, !tbaa !11
  %i130 = lshr i64 %i129, 24
  %i131 = trunc i64 %i130 to i8
  store i8 %i131, ptr %arg4, align 1, !tbaa !8
  %i132 = lshr i64 %i129, 16
  %i133 = trunc i64 %i132 to i8
  store i8 %i133, ptr %i22, align 1, !tbaa !8
  %i134 = lshr i64 %i129, 8
  %i135 = trunc i64 %i134 to i8
  store i8 %i135, ptr %i23, align 1, !tbaa !8
  %i136 = trunc i64 %i129 to i8
  store i8 %i136, ptr %i24, align 1, !tbaa !8
  %i137 = load i64, ptr %i29, align 8, !tbaa !11
  %i138 = lshr i64 %i137, 24
  %i139 = trunc i64 %i138 to i8
  store i8 %i139, ptr %i25, align 1, !tbaa !8
  %i140 = lshr i64 %i137, 16
  %i141 = trunc i64 %i140 to i8
  store i8 %i141, ptr %i26, align 1, !tbaa !8
  %i142 = lshr i64 %i137, 8
  %i143 = trunc i64 %i142 to i8
  store i8 %i143, ptr %i27, align 1, !tbaa !8
  %i144 = trunc i64 %i137 to i8
  store i8 %i144, ptr %i28, align 1, !tbaa !8
  br label %bb145

bb145:                                            ; preds = %bb93.bb145_crit_edge, %bb100
  %i146 = getelementptr inbounds i8, ptr %i96, i64 1
  %i147 = load i8, ptr %i96, align 1, !tbaa !8
  %i148 = sext i32 %i95 to i64
  %i149 = getelementptr inbounds i8, ptr %arg4, i64 %i148
  %i150 = load i8, ptr %i149, align 1, !tbaa !8
  store i8 %i147, ptr %i149, align 1, !tbaa !8
  %i151 = xor i8 %i150, %i147
  %i152 = getelementptr inbounds i8, ptr %i97, i64 1
  store i8 %i151, ptr %i97, align 1, !tbaa !8
  %i153 = add nsw i32 %i95, 1
  %i154 = and i32 %i153, 7
  %i155 = icmp eq i64 %i98, 0
  br i1 %i155, label %bb156.loopexit, label %bb145.bb93_crit_edge, !llvm.loop !20

bb145.bb93_crit_edge:                             ; preds = %bb145
  br label %bb93

bb156.loopexit:                                   ; preds = %bb145
  br label %bb156

bb156.loopexit1:                                  ; preds = %bb82
  br label %bb156

bb156:                                            ; preds = %bb20.bb156_crit_edge, %bb10.bb156_crit_edge, %bb156.loopexit1, %bb156.loopexit
  %i157 = phi i32 [ %i7, %bb20.bb156_crit_edge ], [ %i7, %bb10.bb156_crit_edge ], [ %i154, %bb156.loopexit ], [ %i91, %bb156.loopexit1 ]
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %i, i8 0, i64 16, i1 false)
  store i32 %i157, ptr %arg5, align 4, !tbaa !17
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %i) #12
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef nonnull ptr @BF_options() local_unnamed_addr #3 {
bb:
  ret ptr @.str.1
}

; Function Attrs: nounwind uwtable
define dso_local void @BF_ecb_encrypt(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, ptr noundef %arg2, i32 noundef %arg3) local_unnamed_addr #0 {
bb:
  %i = alloca [2 x i64], align 16
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %i) #12
  %i4 = getelementptr inbounds i8, ptr %arg, i64 1
  %i5 = load i8, ptr %arg, align 1, !tbaa !8
  %i6 = zext i8 %i5 to i64
  %i7 = shl nuw nsw i64 %i6, 24
  %i8 = getelementptr inbounds i8, ptr %arg, i64 2
  %i9 = load i8, ptr %i4, align 1, !tbaa !8
  %i10 = zext i8 %i9 to i64
  %i11 = shl nuw nsw i64 %i10, 16
  %i12 = or disjoint i64 %i11, %i7
  %i13 = getelementptr inbounds i8, ptr %arg, i64 3
  %i14 = load i8, ptr %i8, align 1, !tbaa !8
  %i15 = zext i8 %i14 to i64
  %i16 = shl nuw nsw i64 %i15, 8
  %i17 = or disjoint i64 %i12, %i16
  %i18 = getelementptr inbounds i8, ptr %arg, i64 4
  %i19 = load i8, ptr %i13, align 1, !tbaa !8
  %i20 = zext i8 %i19 to i64
  %i21 = or disjoint i64 %i17, %i20
  store i64 %i21, ptr %i, align 16, !tbaa !11
  %i22 = getelementptr inbounds i8, ptr %arg, i64 5
  %i23 = load i8, ptr %i18, align 1, !tbaa !8
  %i24 = zext i8 %i23 to i64
  %i25 = shl nuw nsw i64 %i24, 24
  %i26 = getelementptr inbounds i8, ptr %arg, i64 6
  %i27 = load i8, ptr %i22, align 1, !tbaa !8
  %i28 = zext i8 %i27 to i64
  %i29 = shl nuw nsw i64 %i28, 16
  %i30 = or disjoint i64 %i29, %i25
  %i31 = getelementptr inbounds i8, ptr %arg, i64 7
  %i32 = load i8, ptr %i26, align 1, !tbaa !8
  %i33 = zext i8 %i32 to i64
  %i34 = shl nuw nsw i64 %i33, 8
  %i35 = or disjoint i64 %i30, %i34
  %i36 = load i8, ptr %i31, align 1, !tbaa !8
  %i37 = zext i8 %i36 to i64
  %i38 = or disjoint i64 %i35, %i37
  %i39 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  store i64 %i38, ptr %i39, align 8, !tbaa !11
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg2, i32 noundef %arg3) #12
  %i40 = load i64, ptr %i, align 16, !tbaa !11
  %i41 = lshr i64 %i40, 24
  %i42 = trunc i64 %i41 to i8
  %i43 = getelementptr inbounds i8, ptr %arg1, i64 1
  store i8 %i42, ptr %arg1, align 1, !tbaa !8
  %i44 = lshr i64 %i40, 16
  %i45 = trunc i64 %i44 to i8
  %i46 = getelementptr inbounds i8, ptr %arg1, i64 2
  store i8 %i45, ptr %i43, align 1, !tbaa !8
  %i47 = lshr i64 %i40, 8
  %i48 = trunc i64 %i47 to i8
  %i49 = getelementptr inbounds i8, ptr %arg1, i64 3
  store i8 %i48, ptr %i46, align 1, !tbaa !8
  %i50 = trunc i64 %i40 to i8
  %i51 = getelementptr inbounds i8, ptr %arg1, i64 4
  store i8 %i50, ptr %i49, align 1, !tbaa !8
  %i52 = load i64, ptr %i39, align 8, !tbaa !11
  %i53 = lshr i64 %i52, 24
  %i54 = trunc i64 %i53 to i8
  %i55 = getelementptr inbounds i8, ptr %arg1, i64 5
  store i8 %i54, ptr %i51, align 1, !tbaa !8
  %i56 = lshr i64 %i52, 16
  %i57 = trunc i64 %i56 to i8
  %i58 = getelementptr inbounds i8, ptr %arg1, i64 6
  store i8 %i57, ptr %i55, align 1, !tbaa !8
  %i59 = lshr i64 %i52, 8
  %i60 = trunc i64 %i59 to i8
  %i61 = getelementptr inbounds i8, ptr %arg1, i64 7
  store i8 %i60, ptr %i58, align 1, !tbaa !8
  %i62 = trunc i64 %i52 to i8
  store i8 %i62, ptr %i61, align 1, !tbaa !8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %i, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %i) #12
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @BF_encrypt(ptr nocapture noundef %arg, ptr noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #4 {
bb:
  %i = getelementptr inbounds %struct.bf_key_st, ptr %arg1, i64 0, i32 1
  %i3 = load i64, ptr %arg, align 8, !tbaa !11
  %i4 = getelementptr inbounds i64, ptr %arg, i64 1
  %i5 = load i64, ptr %i4, align 8, !tbaa !11
  %i6 = icmp eq i32 %arg2, 0
  br i1 %i6, label %bb411, label %bb7

bb7:                                              ; preds = %bb
  %i8 = load i64, ptr %arg1, align 8, !tbaa !11
  %i9 = xor i64 %i8, %i3
  %i10 = getelementptr inbounds i64, ptr %arg1, i64 1
  %i11 = load i64, ptr %i10, align 8, !tbaa !11
  %i12 = lshr i64 %i9, 24
  %i13 = getelementptr inbounds i64, ptr %i, i64 %i12
  %i14 = load i64, ptr %i13, align 8, !tbaa !11
  %i15 = lshr i64 %i9, 16
  %i16 = and i64 %i15, 255
  %i17 = or disjoint i64 %i16, 256
  %i18 = getelementptr inbounds i64, ptr %i, i64 %i17
  %i19 = load i64, ptr %i18, align 8, !tbaa !11
  %i20 = add i64 %i19, %i14
  %i21 = lshr i64 %i9, 8
  %i22 = and i64 %i21, 255
  %i23 = or disjoint i64 %i22, 512
  %i24 = getelementptr inbounds i64, ptr %i, i64 %i23
  %i25 = load i64, ptr %i24, align 8, !tbaa !11
  %i26 = xor i64 %i20, %i25
  %i27 = and i64 %i9, 255
  %i28 = or disjoint i64 %i27, 768
  %i29 = getelementptr inbounds i64, ptr %i, i64 %i28
  %i30 = load i64, ptr %i29, align 8, !tbaa !11
  %i31 = add i64 %i26, %i30
  %i32 = and i64 %i31, 4294967295
  %i33 = xor i64 %i11, %i32
  %i34 = xor i64 %i33, %i5
  %i35 = getelementptr inbounds i64, ptr %arg1, i64 2
  %i36 = load i64, ptr %i35, align 8, !tbaa !11
  %i37 = lshr i64 %i34, 24
  %i38 = getelementptr inbounds i64, ptr %i, i64 %i37
  %i39 = load i64, ptr %i38, align 8, !tbaa !11
  %i40 = lshr i64 %i34, 16
  %i41 = and i64 %i40, 255
  %i42 = or disjoint i64 %i41, 256
  %i43 = getelementptr inbounds i64, ptr %i, i64 %i42
  %i44 = load i64, ptr %i43, align 8, !tbaa !11
  %i45 = add i64 %i44, %i39
  %i46 = lshr i64 %i34, 8
  %i47 = and i64 %i46, 255
  %i48 = or disjoint i64 %i47, 512
  %i49 = getelementptr inbounds i64, ptr %i, i64 %i48
  %i50 = load i64, ptr %i49, align 8, !tbaa !11
  %i51 = xor i64 %i45, %i50
  %i52 = and i64 %i34, 255
  %i53 = or disjoint i64 %i52, 768
  %i54 = getelementptr inbounds i64, ptr %i, i64 %i53
  %i55 = load i64, ptr %i54, align 8, !tbaa !11
  %i56 = add i64 %i51, %i55
  %i57 = and i64 %i56, 4294967295
  %i58 = xor i64 %i36, %i57
  %i59 = xor i64 %i58, %i9
  %i60 = getelementptr inbounds i64, ptr %arg1, i64 3
  %i61 = load i64, ptr %i60, align 8, !tbaa !11
  %i62 = lshr i64 %i59, 24
  %i63 = getelementptr inbounds i64, ptr %i, i64 %i62
  %i64 = load i64, ptr %i63, align 8, !tbaa !11
  %i65 = lshr i64 %i59, 16
  %i66 = and i64 %i65, 255
  %i67 = or disjoint i64 %i66, 256
  %i68 = getelementptr inbounds i64, ptr %i, i64 %i67
  %i69 = load i64, ptr %i68, align 8, !tbaa !11
  %i70 = add i64 %i69, %i64
  %i71 = lshr i64 %i59, 8
  %i72 = and i64 %i71, 255
  %i73 = or disjoint i64 %i72, 512
  %i74 = getelementptr inbounds i64, ptr %i, i64 %i73
  %i75 = load i64, ptr %i74, align 8, !tbaa !11
  %i76 = xor i64 %i70, %i75
  %i77 = and i64 %i59, 255
  %i78 = or disjoint i64 %i77, 768
  %i79 = getelementptr inbounds i64, ptr %i, i64 %i78
  %i80 = load i64, ptr %i79, align 8, !tbaa !11
  %i81 = add i64 %i76, %i80
  %i82 = and i64 %i81, 4294967295
  %i83 = xor i64 %i61, %i82
  %i84 = xor i64 %i83, %i34
  %i85 = getelementptr inbounds i64, ptr %arg1, i64 4
  %i86 = load i64, ptr %i85, align 8, !tbaa !11
  %i87 = lshr i64 %i84, 24
  %i88 = getelementptr inbounds i64, ptr %i, i64 %i87
  %i89 = load i64, ptr %i88, align 8, !tbaa !11
  %i90 = lshr i64 %i84, 16
  %i91 = and i64 %i90, 255
  %i92 = or disjoint i64 %i91, 256
  %i93 = getelementptr inbounds i64, ptr %i, i64 %i92
  %i94 = load i64, ptr %i93, align 8, !tbaa !11
  %i95 = add i64 %i94, %i89
  %i96 = lshr i64 %i84, 8
  %i97 = and i64 %i96, 255
  %i98 = or disjoint i64 %i97, 512
  %i99 = getelementptr inbounds i64, ptr %i, i64 %i98
  %i100 = load i64, ptr %i99, align 8, !tbaa !11
  %i101 = xor i64 %i95, %i100
  %i102 = and i64 %i84, 255
  %i103 = or disjoint i64 %i102, 768
  %i104 = getelementptr inbounds i64, ptr %i, i64 %i103
  %i105 = load i64, ptr %i104, align 8, !tbaa !11
  %i106 = add i64 %i101, %i105
  %i107 = and i64 %i106, 4294967295
  %i108 = xor i64 %i86, %i107
  %i109 = xor i64 %i108, %i59
  %i110 = getelementptr inbounds i64, ptr %arg1, i64 5
  %i111 = load i64, ptr %i110, align 8, !tbaa !11
  %i112 = lshr i64 %i109, 24
  %i113 = getelementptr inbounds i64, ptr %i, i64 %i112
  %i114 = load i64, ptr %i113, align 8, !tbaa !11
  %i115 = lshr i64 %i109, 16
  %i116 = and i64 %i115, 255
  %i117 = or disjoint i64 %i116, 256
  %i118 = getelementptr inbounds i64, ptr %i, i64 %i117
  %i119 = load i64, ptr %i118, align 8, !tbaa !11
  %i120 = add i64 %i119, %i114
  %i121 = lshr i64 %i109, 8
  %i122 = and i64 %i121, 255
  %i123 = or disjoint i64 %i122, 512
  %i124 = getelementptr inbounds i64, ptr %i, i64 %i123
  %i125 = load i64, ptr %i124, align 8, !tbaa !11
  %i126 = xor i64 %i120, %i125
  %i127 = and i64 %i109, 255
  %i128 = or disjoint i64 %i127, 768
  %i129 = getelementptr inbounds i64, ptr %i, i64 %i128
  %i130 = load i64, ptr %i129, align 8, !tbaa !11
  %i131 = add i64 %i126, %i130
  %i132 = and i64 %i131, 4294967295
  %i133 = xor i64 %i111, %i132
  %i134 = xor i64 %i133, %i84
  %i135 = getelementptr inbounds i64, ptr %arg1, i64 6
  %i136 = load i64, ptr %i135, align 8, !tbaa !11
  %i137 = lshr i64 %i134, 24
  %i138 = getelementptr inbounds i64, ptr %i, i64 %i137
  %i139 = load i64, ptr %i138, align 8, !tbaa !11
  %i140 = lshr i64 %i134, 16
  %i141 = and i64 %i140, 255
  %i142 = or disjoint i64 %i141, 256
  %i143 = getelementptr inbounds i64, ptr %i, i64 %i142
  %i144 = load i64, ptr %i143, align 8, !tbaa !11
  %i145 = add i64 %i144, %i139
  %i146 = lshr i64 %i134, 8
  %i147 = and i64 %i146, 255
  %i148 = or disjoint i64 %i147, 512
  %i149 = getelementptr inbounds i64, ptr %i, i64 %i148
  %i150 = load i64, ptr %i149, align 8, !tbaa !11
  %i151 = xor i64 %i145, %i150
  %i152 = and i64 %i134, 255
  %i153 = or disjoint i64 %i152, 768
  %i154 = getelementptr inbounds i64, ptr %i, i64 %i153
  %i155 = load i64, ptr %i154, align 8, !tbaa !11
  %i156 = add i64 %i151, %i155
  %i157 = and i64 %i156, 4294967295
  %i158 = xor i64 %i136, %i157
  %i159 = xor i64 %i158, %i109
  %i160 = getelementptr inbounds i64, ptr %arg1, i64 7
  %i161 = load i64, ptr %i160, align 8, !tbaa !11
  %i162 = lshr i64 %i159, 24
  %i163 = getelementptr inbounds i64, ptr %i, i64 %i162
  %i164 = load i64, ptr %i163, align 8, !tbaa !11
  %i165 = lshr i64 %i159, 16
  %i166 = and i64 %i165, 255
  %i167 = or disjoint i64 %i166, 256
  %i168 = getelementptr inbounds i64, ptr %i, i64 %i167
  %i169 = load i64, ptr %i168, align 8, !tbaa !11
  %i170 = add i64 %i169, %i164
  %i171 = lshr i64 %i159, 8
  %i172 = and i64 %i171, 255
  %i173 = or disjoint i64 %i172, 512
  %i174 = getelementptr inbounds i64, ptr %i, i64 %i173
  %i175 = load i64, ptr %i174, align 8, !tbaa !11
  %i176 = xor i64 %i170, %i175
  %i177 = and i64 %i159, 255
  %i178 = or disjoint i64 %i177, 768
  %i179 = getelementptr inbounds i64, ptr %i, i64 %i178
  %i180 = load i64, ptr %i179, align 8, !tbaa !11
  %i181 = add i64 %i176, %i180
  %i182 = and i64 %i181, 4294967295
  %i183 = xor i64 %i161, %i182
  %i184 = xor i64 %i183, %i134
  %i185 = getelementptr inbounds i64, ptr %arg1, i64 8
  %i186 = load i64, ptr %i185, align 8, !tbaa !11
  %i187 = lshr i64 %i184, 24
  %i188 = getelementptr inbounds i64, ptr %i, i64 %i187
  %i189 = load i64, ptr %i188, align 8, !tbaa !11
  %i190 = lshr i64 %i184, 16
  %i191 = and i64 %i190, 255
  %i192 = or disjoint i64 %i191, 256
  %i193 = getelementptr inbounds i64, ptr %i, i64 %i192
  %i194 = load i64, ptr %i193, align 8, !tbaa !11
  %i195 = add i64 %i194, %i189
  %i196 = lshr i64 %i184, 8
  %i197 = and i64 %i196, 255
  %i198 = or disjoint i64 %i197, 512
  %i199 = getelementptr inbounds i64, ptr %i, i64 %i198
  %i200 = load i64, ptr %i199, align 8, !tbaa !11
  %i201 = xor i64 %i195, %i200
  %i202 = and i64 %i184, 255
  %i203 = or disjoint i64 %i202, 768
  %i204 = getelementptr inbounds i64, ptr %i, i64 %i203
  %i205 = load i64, ptr %i204, align 8, !tbaa !11
  %i206 = add i64 %i201, %i205
  %i207 = and i64 %i206, 4294967295
  %i208 = xor i64 %i186, %i207
  %i209 = xor i64 %i208, %i159
  %i210 = getelementptr inbounds i64, ptr %arg1, i64 9
  %i211 = load i64, ptr %i210, align 8, !tbaa !11
  %i212 = lshr i64 %i209, 24
  %i213 = getelementptr inbounds i64, ptr %i, i64 %i212
  %i214 = load i64, ptr %i213, align 8, !tbaa !11
  %i215 = lshr i64 %i209, 16
  %i216 = and i64 %i215, 255
  %i217 = or disjoint i64 %i216, 256
  %i218 = getelementptr inbounds i64, ptr %i, i64 %i217
  %i219 = load i64, ptr %i218, align 8, !tbaa !11
  %i220 = add i64 %i219, %i214
  %i221 = lshr i64 %i209, 8
  %i222 = and i64 %i221, 255
  %i223 = or disjoint i64 %i222, 512
  %i224 = getelementptr inbounds i64, ptr %i, i64 %i223
  %i225 = load i64, ptr %i224, align 8, !tbaa !11
  %i226 = xor i64 %i220, %i225
  %i227 = and i64 %i209, 255
  %i228 = or disjoint i64 %i227, 768
  %i229 = getelementptr inbounds i64, ptr %i, i64 %i228
  %i230 = load i64, ptr %i229, align 8, !tbaa !11
  %i231 = add i64 %i226, %i230
  %i232 = and i64 %i231, 4294967295
  %i233 = xor i64 %i211, %i232
  %i234 = xor i64 %i233, %i184
  %i235 = getelementptr inbounds i64, ptr %arg1, i64 10
  %i236 = load i64, ptr %i235, align 8, !tbaa !11
  %i237 = lshr i64 %i234, 24
  %i238 = getelementptr inbounds i64, ptr %i, i64 %i237
  %i239 = load i64, ptr %i238, align 8, !tbaa !11
  %i240 = lshr i64 %i234, 16
  %i241 = and i64 %i240, 255
  %i242 = or disjoint i64 %i241, 256
  %i243 = getelementptr inbounds i64, ptr %i, i64 %i242
  %i244 = load i64, ptr %i243, align 8, !tbaa !11
  %i245 = add i64 %i244, %i239
  %i246 = lshr i64 %i234, 8
  %i247 = and i64 %i246, 255
  %i248 = or disjoint i64 %i247, 512
  %i249 = getelementptr inbounds i64, ptr %i, i64 %i248
  %i250 = load i64, ptr %i249, align 8, !tbaa !11
  %i251 = xor i64 %i245, %i250
  %i252 = and i64 %i234, 255
  %i253 = or disjoint i64 %i252, 768
  %i254 = getelementptr inbounds i64, ptr %i, i64 %i253
  %i255 = load i64, ptr %i254, align 8, !tbaa !11
  %i256 = add i64 %i251, %i255
  %i257 = and i64 %i256, 4294967295
  %i258 = xor i64 %i236, %i257
  %i259 = xor i64 %i258, %i209
  %i260 = getelementptr inbounds i64, ptr %arg1, i64 11
  %i261 = load i64, ptr %i260, align 8, !tbaa !11
  %i262 = lshr i64 %i259, 24
  %i263 = getelementptr inbounds i64, ptr %i, i64 %i262
  %i264 = load i64, ptr %i263, align 8, !tbaa !11
  %i265 = lshr i64 %i259, 16
  %i266 = and i64 %i265, 255
  %i267 = or disjoint i64 %i266, 256
  %i268 = getelementptr inbounds i64, ptr %i, i64 %i267
  %i269 = load i64, ptr %i268, align 8, !tbaa !11
  %i270 = add i64 %i269, %i264
  %i271 = lshr i64 %i259, 8
  %i272 = and i64 %i271, 255
  %i273 = or disjoint i64 %i272, 512
  %i274 = getelementptr inbounds i64, ptr %i, i64 %i273
  %i275 = load i64, ptr %i274, align 8, !tbaa !11
  %i276 = xor i64 %i270, %i275
  %i277 = and i64 %i259, 255
  %i278 = or disjoint i64 %i277, 768
  %i279 = getelementptr inbounds i64, ptr %i, i64 %i278
  %i280 = load i64, ptr %i279, align 8, !tbaa !11
  %i281 = add i64 %i276, %i280
  %i282 = and i64 %i281, 4294967295
  %i283 = xor i64 %i261, %i282
  %i284 = xor i64 %i283, %i234
  %i285 = getelementptr inbounds i64, ptr %arg1, i64 12
  %i286 = load i64, ptr %i285, align 8, !tbaa !11
  %i287 = lshr i64 %i284, 24
  %i288 = getelementptr inbounds i64, ptr %i, i64 %i287
  %i289 = load i64, ptr %i288, align 8, !tbaa !11
  %i290 = lshr i64 %i284, 16
  %i291 = and i64 %i290, 255
  %i292 = or disjoint i64 %i291, 256
  %i293 = getelementptr inbounds i64, ptr %i, i64 %i292
  %i294 = load i64, ptr %i293, align 8, !tbaa !11
  %i295 = add i64 %i294, %i289
  %i296 = lshr i64 %i284, 8
  %i297 = and i64 %i296, 255
  %i298 = or disjoint i64 %i297, 512
  %i299 = getelementptr inbounds i64, ptr %i, i64 %i298
  %i300 = load i64, ptr %i299, align 8, !tbaa !11
  %i301 = xor i64 %i295, %i300
  %i302 = and i64 %i284, 255
  %i303 = or disjoint i64 %i302, 768
  %i304 = getelementptr inbounds i64, ptr %i, i64 %i303
  %i305 = load i64, ptr %i304, align 8, !tbaa !11
  %i306 = add i64 %i301, %i305
  %i307 = and i64 %i306, 4294967295
  %i308 = xor i64 %i286, %i307
  %i309 = xor i64 %i308, %i259
  %i310 = getelementptr inbounds i64, ptr %arg1, i64 13
  %i311 = load i64, ptr %i310, align 8, !tbaa !11
  %i312 = lshr i64 %i309, 24
  %i313 = getelementptr inbounds i64, ptr %i, i64 %i312
  %i314 = load i64, ptr %i313, align 8, !tbaa !11
  %i315 = lshr i64 %i309, 16
  %i316 = and i64 %i315, 255
  %i317 = or disjoint i64 %i316, 256
  %i318 = getelementptr inbounds i64, ptr %i, i64 %i317
  %i319 = load i64, ptr %i318, align 8, !tbaa !11
  %i320 = add i64 %i319, %i314
  %i321 = lshr i64 %i309, 8
  %i322 = and i64 %i321, 255
  %i323 = or disjoint i64 %i322, 512
  %i324 = getelementptr inbounds i64, ptr %i, i64 %i323
  %i325 = load i64, ptr %i324, align 8, !tbaa !11
  %i326 = xor i64 %i320, %i325
  %i327 = and i64 %i309, 255
  %i328 = or disjoint i64 %i327, 768
  %i329 = getelementptr inbounds i64, ptr %i, i64 %i328
  %i330 = load i64, ptr %i329, align 8, !tbaa !11
  %i331 = add i64 %i326, %i330
  %i332 = and i64 %i331, 4294967295
  %i333 = xor i64 %i311, %i332
  %i334 = xor i64 %i333, %i284
  %i335 = getelementptr inbounds i64, ptr %arg1, i64 14
  %i336 = load i64, ptr %i335, align 8, !tbaa !11
  %i337 = lshr i64 %i334, 24
  %i338 = getelementptr inbounds i64, ptr %i, i64 %i337
  %i339 = load i64, ptr %i338, align 8, !tbaa !11
  %i340 = lshr i64 %i334, 16
  %i341 = and i64 %i340, 255
  %i342 = or disjoint i64 %i341, 256
  %i343 = getelementptr inbounds i64, ptr %i, i64 %i342
  %i344 = load i64, ptr %i343, align 8, !tbaa !11
  %i345 = add i64 %i344, %i339
  %i346 = lshr i64 %i334, 8
  %i347 = and i64 %i346, 255
  %i348 = or disjoint i64 %i347, 512
  %i349 = getelementptr inbounds i64, ptr %i, i64 %i348
  %i350 = load i64, ptr %i349, align 8, !tbaa !11
  %i351 = xor i64 %i345, %i350
  %i352 = and i64 %i334, 255
  %i353 = or disjoint i64 %i352, 768
  %i354 = getelementptr inbounds i64, ptr %i, i64 %i353
  %i355 = load i64, ptr %i354, align 8, !tbaa !11
  %i356 = add i64 %i351, %i355
  %i357 = and i64 %i356, 4294967295
  %i358 = xor i64 %i336, %i357
  %i359 = xor i64 %i358, %i309
  %i360 = getelementptr inbounds i64, ptr %arg1, i64 15
  %i361 = load i64, ptr %i360, align 8, !tbaa !11
  %i362 = lshr i64 %i359, 24
  %i363 = getelementptr inbounds i64, ptr %i, i64 %i362
  %i364 = load i64, ptr %i363, align 8, !tbaa !11
  %i365 = lshr i64 %i359, 16
  %i366 = and i64 %i365, 255
  %i367 = or disjoint i64 %i366, 256
  %i368 = getelementptr inbounds i64, ptr %i, i64 %i367
  %i369 = load i64, ptr %i368, align 8, !tbaa !11
  %i370 = add i64 %i369, %i364
  %i371 = lshr i64 %i359, 8
  %i372 = and i64 %i371, 255
  %i373 = or disjoint i64 %i372, 512
  %i374 = getelementptr inbounds i64, ptr %i, i64 %i373
  %i375 = load i64, ptr %i374, align 8, !tbaa !11
  %i376 = xor i64 %i370, %i375
  %i377 = and i64 %i359, 255
  %i378 = or disjoint i64 %i377, 768
  %i379 = getelementptr inbounds i64, ptr %i, i64 %i378
  %i380 = load i64, ptr %i379, align 8, !tbaa !11
  %i381 = add i64 %i376, %i380
  %i382 = and i64 %i381, 4294967295
  %i383 = xor i64 %i361, %i382
  %i384 = xor i64 %i383, %i334
  %i385 = getelementptr inbounds i64, ptr %arg1, i64 16
  %i386 = load i64, ptr %i385, align 8, !tbaa !11
  %i387 = lshr i64 %i384, 24
  %i388 = getelementptr inbounds i64, ptr %i, i64 %i387
  %i389 = load i64, ptr %i388, align 8, !tbaa !11
  %i390 = lshr i64 %i384, 16
  %i391 = and i64 %i390, 255
  %i392 = or disjoint i64 %i391, 256
  %i393 = getelementptr inbounds i64, ptr %i, i64 %i392
  %i394 = load i64, ptr %i393, align 8, !tbaa !11
  %i395 = add i64 %i394, %i389
  %i396 = lshr i64 %i384, 8
  %i397 = and i64 %i396, 255
  %i398 = or disjoint i64 %i397, 512
  %i399 = getelementptr inbounds i64, ptr %i, i64 %i398
  %i400 = load i64, ptr %i399, align 8, !tbaa !11
  %i401 = xor i64 %i395, %i400
  %i402 = and i64 %i384, 255
  %i403 = or disjoint i64 %i402, 768
  %i404 = getelementptr inbounds i64, ptr %i, i64 %i403
  %i405 = load i64, ptr %i404, align 8, !tbaa !11
  %i406 = add i64 %i401, %i405
  %i407 = and i64 %i406, 4294967295
  %i408 = xor i64 %i386, %i407
  %i409 = xor i64 %i408, %i359
  %i410 = getelementptr inbounds i64, ptr %arg1, i64 17
  br label %bb815

bb411:                                            ; preds = %bb
  %i412 = getelementptr inbounds i64, ptr %arg1, i64 17
  %i413 = load i64, ptr %i412, align 8, !tbaa !11
  %i414 = xor i64 %i413, %i3
  %i415 = getelementptr inbounds i64, ptr %arg1, i64 16
  %i416 = load i64, ptr %i415, align 8, !tbaa !11
  %i417 = lshr i64 %i414, 24
  %i418 = getelementptr inbounds i64, ptr %i, i64 %i417
  %i419 = load i64, ptr %i418, align 8, !tbaa !11
  %i420 = lshr i64 %i414, 16
  %i421 = and i64 %i420, 255
  %i422 = or disjoint i64 %i421, 256
  %i423 = getelementptr inbounds i64, ptr %i, i64 %i422
  %i424 = load i64, ptr %i423, align 8, !tbaa !11
  %i425 = add i64 %i424, %i419
  %i426 = lshr i64 %i414, 8
  %i427 = and i64 %i426, 255
  %i428 = or disjoint i64 %i427, 512
  %i429 = getelementptr inbounds i64, ptr %i, i64 %i428
  %i430 = load i64, ptr %i429, align 8, !tbaa !11
  %i431 = xor i64 %i425, %i430
  %i432 = and i64 %i414, 255
  %i433 = or disjoint i64 %i432, 768
  %i434 = getelementptr inbounds i64, ptr %i, i64 %i433
  %i435 = load i64, ptr %i434, align 8, !tbaa !11
  %i436 = add i64 %i431, %i435
  %i437 = and i64 %i436, 4294967295
  %i438 = xor i64 %i416, %i437
  %i439 = xor i64 %i438, %i5
  %i440 = getelementptr inbounds i64, ptr %arg1, i64 15
  %i441 = load i64, ptr %i440, align 8, !tbaa !11
  %i442 = lshr i64 %i439, 24
  %i443 = getelementptr inbounds i64, ptr %i, i64 %i442
  %i444 = load i64, ptr %i443, align 8, !tbaa !11
  %i445 = lshr i64 %i439, 16
  %i446 = and i64 %i445, 255
  %i447 = or disjoint i64 %i446, 256
  %i448 = getelementptr inbounds i64, ptr %i, i64 %i447
  %i449 = load i64, ptr %i448, align 8, !tbaa !11
  %i450 = add i64 %i449, %i444
  %i451 = lshr i64 %i439, 8
  %i452 = and i64 %i451, 255
  %i453 = or disjoint i64 %i452, 512
  %i454 = getelementptr inbounds i64, ptr %i, i64 %i453
  %i455 = load i64, ptr %i454, align 8, !tbaa !11
  %i456 = xor i64 %i450, %i455
  %i457 = and i64 %i439, 255
  %i458 = or disjoint i64 %i457, 768
  %i459 = getelementptr inbounds i64, ptr %i, i64 %i458
  %i460 = load i64, ptr %i459, align 8, !tbaa !11
  %i461 = add i64 %i456, %i460
  %i462 = and i64 %i461, 4294967295
  %i463 = xor i64 %i441, %i462
  %i464 = xor i64 %i463, %i414
  %i465 = getelementptr inbounds i64, ptr %arg1, i64 14
  %i466 = load i64, ptr %i465, align 8, !tbaa !11
  %i467 = lshr i64 %i464, 24
  %i468 = getelementptr inbounds i64, ptr %i, i64 %i467
  %i469 = load i64, ptr %i468, align 8, !tbaa !11
  %i470 = lshr i64 %i464, 16
  %i471 = and i64 %i470, 255
  %i472 = or disjoint i64 %i471, 256
  %i473 = getelementptr inbounds i64, ptr %i, i64 %i472
  %i474 = load i64, ptr %i473, align 8, !tbaa !11
  %i475 = add i64 %i474, %i469
  %i476 = lshr i64 %i464, 8
  %i477 = and i64 %i476, 255
  %i478 = or disjoint i64 %i477, 512
  %i479 = getelementptr inbounds i64, ptr %i, i64 %i478
  %i480 = load i64, ptr %i479, align 8, !tbaa !11
  %i481 = xor i64 %i475, %i480
  %i482 = and i64 %i464, 255
  %i483 = or disjoint i64 %i482, 768
  %i484 = getelementptr inbounds i64, ptr %i, i64 %i483
  %i485 = load i64, ptr %i484, align 8, !tbaa !11
  %i486 = add i64 %i481, %i485
  %i487 = and i64 %i486, 4294967295
  %i488 = xor i64 %i466, %i487
  %i489 = xor i64 %i488, %i439
  %i490 = getelementptr inbounds i64, ptr %arg1, i64 13
  %i491 = load i64, ptr %i490, align 8, !tbaa !11
  %i492 = lshr i64 %i489, 24
  %i493 = getelementptr inbounds i64, ptr %i, i64 %i492
  %i494 = load i64, ptr %i493, align 8, !tbaa !11
  %i495 = lshr i64 %i489, 16
  %i496 = and i64 %i495, 255
  %i497 = or disjoint i64 %i496, 256
  %i498 = getelementptr inbounds i64, ptr %i, i64 %i497
  %i499 = load i64, ptr %i498, align 8, !tbaa !11
  %i500 = add i64 %i499, %i494
  %i501 = lshr i64 %i489, 8
  %i502 = and i64 %i501, 255
  %i503 = or disjoint i64 %i502, 512
  %i504 = getelementptr inbounds i64, ptr %i, i64 %i503
  %i505 = load i64, ptr %i504, align 8, !tbaa !11
  %i506 = xor i64 %i500, %i505
  %i507 = and i64 %i489, 255
  %i508 = or disjoint i64 %i507, 768
  %i509 = getelementptr inbounds i64, ptr %i, i64 %i508
  %i510 = load i64, ptr %i509, align 8, !tbaa !11
  %i511 = add i64 %i506, %i510
  %i512 = and i64 %i511, 4294967295
  %i513 = xor i64 %i491, %i512
  %i514 = xor i64 %i513, %i464
  %i515 = getelementptr inbounds i64, ptr %arg1, i64 12
  %i516 = load i64, ptr %i515, align 8, !tbaa !11
  %i517 = lshr i64 %i514, 24
  %i518 = getelementptr inbounds i64, ptr %i, i64 %i517
  %i519 = load i64, ptr %i518, align 8, !tbaa !11
  %i520 = lshr i64 %i514, 16
  %i521 = and i64 %i520, 255
  %i522 = or disjoint i64 %i521, 256
  %i523 = getelementptr inbounds i64, ptr %i, i64 %i522
  %i524 = load i64, ptr %i523, align 8, !tbaa !11
  %i525 = add i64 %i524, %i519
  %i526 = lshr i64 %i514, 8
  %i527 = and i64 %i526, 255
  %i528 = or disjoint i64 %i527, 512
  %i529 = getelementptr inbounds i64, ptr %i, i64 %i528
  %i530 = load i64, ptr %i529, align 8, !tbaa !11
  %i531 = xor i64 %i525, %i530
  %i532 = and i64 %i514, 255
  %i533 = or disjoint i64 %i532, 768
  %i534 = getelementptr inbounds i64, ptr %i, i64 %i533
  %i535 = load i64, ptr %i534, align 8, !tbaa !11
  %i536 = add i64 %i531, %i535
  %i537 = and i64 %i536, 4294967295
  %i538 = xor i64 %i516, %i537
  %i539 = xor i64 %i538, %i489
  %i540 = getelementptr inbounds i64, ptr %arg1, i64 11
  %i541 = load i64, ptr %i540, align 8, !tbaa !11
  %i542 = lshr i64 %i539, 24
  %i543 = getelementptr inbounds i64, ptr %i, i64 %i542
  %i544 = load i64, ptr %i543, align 8, !tbaa !11
  %i545 = lshr i64 %i539, 16
  %i546 = and i64 %i545, 255
  %i547 = or disjoint i64 %i546, 256
  %i548 = getelementptr inbounds i64, ptr %i, i64 %i547
  %i549 = load i64, ptr %i548, align 8, !tbaa !11
  %i550 = add i64 %i549, %i544
  %i551 = lshr i64 %i539, 8
  %i552 = and i64 %i551, 255
  %i553 = or disjoint i64 %i552, 512
  %i554 = getelementptr inbounds i64, ptr %i, i64 %i553
  %i555 = load i64, ptr %i554, align 8, !tbaa !11
  %i556 = xor i64 %i550, %i555
  %i557 = and i64 %i539, 255
  %i558 = or disjoint i64 %i557, 768
  %i559 = getelementptr inbounds i64, ptr %i, i64 %i558
  %i560 = load i64, ptr %i559, align 8, !tbaa !11
  %i561 = add i64 %i556, %i560
  %i562 = and i64 %i561, 4294967295
  %i563 = xor i64 %i541, %i562
  %i564 = xor i64 %i563, %i514
  %i565 = getelementptr inbounds i64, ptr %arg1, i64 10
  %i566 = load i64, ptr %i565, align 8, !tbaa !11
  %i567 = lshr i64 %i564, 24
  %i568 = getelementptr inbounds i64, ptr %i, i64 %i567
  %i569 = load i64, ptr %i568, align 8, !tbaa !11
  %i570 = lshr i64 %i564, 16
  %i571 = and i64 %i570, 255
  %i572 = or disjoint i64 %i571, 256
  %i573 = getelementptr inbounds i64, ptr %i, i64 %i572
  %i574 = load i64, ptr %i573, align 8, !tbaa !11
  %i575 = add i64 %i574, %i569
  %i576 = lshr i64 %i564, 8
  %i577 = and i64 %i576, 255
  %i578 = or disjoint i64 %i577, 512
  %i579 = getelementptr inbounds i64, ptr %i, i64 %i578
  %i580 = load i64, ptr %i579, align 8, !tbaa !11
  %i581 = xor i64 %i575, %i580
  %i582 = and i64 %i564, 255
  %i583 = or disjoint i64 %i582, 768
  %i584 = getelementptr inbounds i64, ptr %i, i64 %i583
  %i585 = load i64, ptr %i584, align 8, !tbaa !11
  %i586 = add i64 %i581, %i585
  %i587 = and i64 %i586, 4294967295
  %i588 = xor i64 %i566, %i587
  %i589 = xor i64 %i588, %i539
  %i590 = getelementptr inbounds i64, ptr %arg1, i64 9
  %i591 = load i64, ptr %i590, align 8, !tbaa !11
  %i592 = lshr i64 %i589, 24
  %i593 = getelementptr inbounds i64, ptr %i, i64 %i592
  %i594 = load i64, ptr %i593, align 8, !tbaa !11
  %i595 = lshr i64 %i589, 16
  %i596 = and i64 %i595, 255
  %i597 = or disjoint i64 %i596, 256
  %i598 = getelementptr inbounds i64, ptr %i, i64 %i597
  %i599 = load i64, ptr %i598, align 8, !tbaa !11
  %i600 = add i64 %i599, %i594
  %i601 = lshr i64 %i589, 8
  %i602 = and i64 %i601, 255
  %i603 = or disjoint i64 %i602, 512
  %i604 = getelementptr inbounds i64, ptr %i, i64 %i603
  %i605 = load i64, ptr %i604, align 8, !tbaa !11
  %i606 = xor i64 %i600, %i605
  %i607 = and i64 %i589, 255
  %i608 = or disjoint i64 %i607, 768
  %i609 = getelementptr inbounds i64, ptr %i, i64 %i608
  %i610 = load i64, ptr %i609, align 8, !tbaa !11
  %i611 = add i64 %i606, %i610
  %i612 = and i64 %i611, 4294967295
  %i613 = xor i64 %i591, %i612
  %i614 = xor i64 %i613, %i564
  %i615 = getelementptr inbounds i64, ptr %arg1, i64 8
  %i616 = load i64, ptr %i615, align 8, !tbaa !11
  %i617 = lshr i64 %i614, 24
  %i618 = getelementptr inbounds i64, ptr %i, i64 %i617
  %i619 = load i64, ptr %i618, align 8, !tbaa !11
  %i620 = lshr i64 %i614, 16
  %i621 = and i64 %i620, 255
  %i622 = or disjoint i64 %i621, 256
  %i623 = getelementptr inbounds i64, ptr %i, i64 %i622
  %i624 = load i64, ptr %i623, align 8, !tbaa !11
  %i625 = add i64 %i624, %i619
  %i626 = lshr i64 %i614, 8
  %i627 = and i64 %i626, 255
  %i628 = or disjoint i64 %i627, 512
  %i629 = getelementptr inbounds i64, ptr %i, i64 %i628
  %i630 = load i64, ptr %i629, align 8, !tbaa !11
  %i631 = xor i64 %i625, %i630
  %i632 = and i64 %i614, 255
  %i633 = or disjoint i64 %i632, 768
  %i634 = getelementptr inbounds i64, ptr %i, i64 %i633
  %i635 = load i64, ptr %i634, align 8, !tbaa !11
  %i636 = add i64 %i631, %i635
  %i637 = and i64 %i636, 4294967295
  %i638 = xor i64 %i616, %i637
  %i639 = xor i64 %i638, %i589
  %i640 = getelementptr inbounds i64, ptr %arg1, i64 7
  %i641 = load i64, ptr %i640, align 8, !tbaa !11
  %i642 = lshr i64 %i639, 24
  %i643 = getelementptr inbounds i64, ptr %i, i64 %i642
  %i644 = load i64, ptr %i643, align 8, !tbaa !11
  %i645 = lshr i64 %i639, 16
  %i646 = and i64 %i645, 255
  %i647 = or disjoint i64 %i646, 256
  %i648 = getelementptr inbounds i64, ptr %i, i64 %i647
  %i649 = load i64, ptr %i648, align 8, !tbaa !11
  %i650 = add i64 %i649, %i644
  %i651 = lshr i64 %i639, 8
  %i652 = and i64 %i651, 255
  %i653 = or disjoint i64 %i652, 512
  %i654 = getelementptr inbounds i64, ptr %i, i64 %i653
  %i655 = load i64, ptr %i654, align 8, !tbaa !11
  %i656 = xor i64 %i650, %i655
  %i657 = and i64 %i639, 255
  %i658 = or disjoint i64 %i657, 768
  %i659 = getelementptr inbounds i64, ptr %i, i64 %i658
  %i660 = load i64, ptr %i659, align 8, !tbaa !11
  %i661 = add i64 %i656, %i660
  %i662 = and i64 %i661, 4294967295
  %i663 = xor i64 %i641, %i662
  %i664 = xor i64 %i663, %i614
  %i665 = getelementptr inbounds i64, ptr %arg1, i64 6
  %i666 = load i64, ptr %i665, align 8, !tbaa !11
  %i667 = lshr i64 %i664, 24
  %i668 = getelementptr inbounds i64, ptr %i, i64 %i667
  %i669 = load i64, ptr %i668, align 8, !tbaa !11
  %i670 = lshr i64 %i664, 16
  %i671 = and i64 %i670, 255
  %i672 = or disjoint i64 %i671, 256
  %i673 = getelementptr inbounds i64, ptr %i, i64 %i672
  %i674 = load i64, ptr %i673, align 8, !tbaa !11
  %i675 = add i64 %i674, %i669
  %i676 = lshr i64 %i664, 8
  %i677 = and i64 %i676, 255
  %i678 = or disjoint i64 %i677, 512
  %i679 = getelementptr inbounds i64, ptr %i, i64 %i678
  %i680 = load i64, ptr %i679, align 8, !tbaa !11
  %i681 = xor i64 %i675, %i680
  %i682 = and i64 %i664, 255
  %i683 = or disjoint i64 %i682, 768
  %i684 = getelementptr inbounds i64, ptr %i, i64 %i683
  %i685 = load i64, ptr %i684, align 8, !tbaa !11
  %i686 = add i64 %i681, %i685
  %i687 = and i64 %i686, 4294967295
  %i688 = xor i64 %i666, %i687
  %i689 = xor i64 %i688, %i639
  %i690 = getelementptr inbounds i64, ptr %arg1, i64 5
  %i691 = load i64, ptr %i690, align 8, !tbaa !11
  %i692 = lshr i64 %i689, 24
  %i693 = getelementptr inbounds i64, ptr %i, i64 %i692
  %i694 = load i64, ptr %i693, align 8, !tbaa !11
  %i695 = lshr i64 %i689, 16
  %i696 = and i64 %i695, 255
  %i697 = or disjoint i64 %i696, 256
  %i698 = getelementptr inbounds i64, ptr %i, i64 %i697
  %i699 = load i64, ptr %i698, align 8, !tbaa !11
  %i700 = add i64 %i699, %i694
  %i701 = lshr i64 %i689, 8
  %i702 = and i64 %i701, 255
  %i703 = or disjoint i64 %i702, 512
  %i704 = getelementptr inbounds i64, ptr %i, i64 %i703
  %i705 = load i64, ptr %i704, align 8, !tbaa !11
  %i706 = xor i64 %i700, %i705
  %i707 = and i64 %i689, 255
  %i708 = or disjoint i64 %i707, 768
  %i709 = getelementptr inbounds i64, ptr %i, i64 %i708
  %i710 = load i64, ptr %i709, align 8, !tbaa !11
  %i711 = add i64 %i706, %i710
  %i712 = and i64 %i711, 4294967295
  %i713 = xor i64 %i691, %i712
  %i714 = xor i64 %i713, %i664
  %i715 = getelementptr inbounds i64, ptr %arg1, i64 4
  %i716 = load i64, ptr %i715, align 8, !tbaa !11
  %i717 = lshr i64 %i714, 24
  %i718 = getelementptr inbounds i64, ptr %i, i64 %i717
  %i719 = load i64, ptr %i718, align 8, !tbaa !11
  %i720 = lshr i64 %i714, 16
  %i721 = and i64 %i720, 255
  %i722 = or disjoint i64 %i721, 256
  %i723 = getelementptr inbounds i64, ptr %i, i64 %i722
  %i724 = load i64, ptr %i723, align 8, !tbaa !11
  %i725 = add i64 %i724, %i719
  %i726 = lshr i64 %i714, 8
  %i727 = and i64 %i726, 255
  %i728 = or disjoint i64 %i727, 512
  %i729 = getelementptr inbounds i64, ptr %i, i64 %i728
  %i730 = load i64, ptr %i729, align 8, !tbaa !11
  %i731 = xor i64 %i725, %i730
  %i732 = and i64 %i714, 255
  %i733 = or disjoint i64 %i732, 768
  %i734 = getelementptr inbounds i64, ptr %i, i64 %i733
  %i735 = load i64, ptr %i734, align 8, !tbaa !11
  %i736 = add i64 %i731, %i735
  %i737 = and i64 %i736, 4294967295
  %i738 = xor i64 %i716, %i737
  %i739 = xor i64 %i738, %i689
  %i740 = getelementptr inbounds i64, ptr %arg1, i64 3
  %i741 = load i64, ptr %i740, align 8, !tbaa !11
  %i742 = lshr i64 %i739, 24
  %i743 = getelementptr inbounds i64, ptr %i, i64 %i742
  %i744 = load i64, ptr %i743, align 8, !tbaa !11
  %i745 = lshr i64 %i739, 16
  %i746 = and i64 %i745, 255
  %i747 = or disjoint i64 %i746, 256
  %i748 = getelementptr inbounds i64, ptr %i, i64 %i747
  %i749 = load i64, ptr %i748, align 8, !tbaa !11
  %i750 = add i64 %i749, %i744
  %i751 = lshr i64 %i739, 8
  %i752 = and i64 %i751, 255
  %i753 = or disjoint i64 %i752, 512
  %i754 = getelementptr inbounds i64, ptr %i, i64 %i753
  %i755 = load i64, ptr %i754, align 8, !tbaa !11
  %i756 = xor i64 %i750, %i755
  %i757 = and i64 %i739, 255
  %i758 = or disjoint i64 %i757, 768
  %i759 = getelementptr inbounds i64, ptr %i, i64 %i758
  %i760 = load i64, ptr %i759, align 8, !tbaa !11
  %i761 = add i64 %i756, %i760
  %i762 = and i64 %i761, 4294967295
  %i763 = xor i64 %i741, %i762
  %i764 = xor i64 %i763, %i714
  %i765 = getelementptr inbounds i64, ptr %arg1, i64 2
  %i766 = load i64, ptr %i765, align 8, !tbaa !11
  %i767 = lshr i64 %i764, 24
  %i768 = getelementptr inbounds i64, ptr %i, i64 %i767
  %i769 = load i64, ptr %i768, align 8, !tbaa !11
  %i770 = lshr i64 %i764, 16
  %i771 = and i64 %i770, 255
  %i772 = or disjoint i64 %i771, 256
  %i773 = getelementptr inbounds i64, ptr %i, i64 %i772
  %i774 = load i64, ptr %i773, align 8, !tbaa !11
  %i775 = add i64 %i774, %i769
  %i776 = lshr i64 %i764, 8
  %i777 = and i64 %i776, 255
  %i778 = or disjoint i64 %i777, 512
  %i779 = getelementptr inbounds i64, ptr %i, i64 %i778
  %i780 = load i64, ptr %i779, align 8, !tbaa !11
  %i781 = xor i64 %i775, %i780
  %i782 = and i64 %i764, 255
  %i783 = or disjoint i64 %i782, 768
  %i784 = getelementptr inbounds i64, ptr %i, i64 %i783
  %i785 = load i64, ptr %i784, align 8, !tbaa !11
  %i786 = add i64 %i781, %i785
  %i787 = and i64 %i786, 4294967295
  %i788 = xor i64 %i766, %i787
  %i789 = xor i64 %i788, %i739
  %i790 = getelementptr inbounds i64, ptr %arg1, i64 1
  %i791 = load i64, ptr %i790, align 8, !tbaa !11
  %i792 = lshr i64 %i789, 24
  %i793 = getelementptr inbounds i64, ptr %i, i64 %i792
  %i794 = load i64, ptr %i793, align 8, !tbaa !11
  %i795 = lshr i64 %i789, 16
  %i796 = and i64 %i795, 255
  %i797 = or disjoint i64 %i796, 256
  %i798 = getelementptr inbounds i64, ptr %i, i64 %i797
  %i799 = load i64, ptr %i798, align 8, !tbaa !11
  %i800 = add i64 %i799, %i794
  %i801 = lshr i64 %i789, 8
  %i802 = and i64 %i801, 255
  %i803 = or disjoint i64 %i802, 512
  %i804 = getelementptr inbounds i64, ptr %i, i64 %i803
  %i805 = load i64, ptr %i804, align 8, !tbaa !11
  %i806 = xor i64 %i800, %i805
  %i807 = and i64 %i789, 255
  %i808 = or disjoint i64 %i807, 768
  %i809 = getelementptr inbounds i64, ptr %i, i64 %i808
  %i810 = load i64, ptr %i809, align 8, !tbaa !11
  %i811 = add i64 %i806, %i810
  %i812 = and i64 %i811, 4294967295
  %i813 = xor i64 %i791, %i812
  %i814 = xor i64 %i813, %i764
  br label %bb815

bb815:                                            ; preds = %bb411, %bb7
  %i816 = phi ptr [ %arg1, %bb411 ], [ %i410, %bb7 ]
  %i817 = phi i64 [ %i789, %bb411 ], [ %i384, %bb7 ]
  %i818 = phi i64 [ %i814, %bb411 ], [ %i409, %bb7 ]
  %i819 = load i64, ptr %i816, align 8, !tbaa !11
  %i820 = xor i64 %i819, %i817
  %i821 = and i64 %i818, 4294967295
  store i64 %i821, ptr %i4, align 8, !tbaa !11
  %i822 = and i64 %i820, 4294967295
  store i64 %i822, ptr %arg, align 8, !tbaa !11
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca %struct.bf_key_st, align 8
  %i2 = alloca [32 x i8], align 16
  %i3 = alloca [40 x i8], align 16
  %i4 = alloca [40 x i8], align 16
  %i5 = alloca [32 x i8], align 16
  %i6 = alloca i32, align 4
  %i7 = alloca i64, align 8
  %i8 = alloca [32 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 8336, ptr nonnull %i) #12
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %i2) #12
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %i3) #12
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %i4) #12
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %i5) #12
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) %i5, i8 0, i64 32, i1 false)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i6) #12
  store i32 0, ptr %i6, align 4, !tbaa !17
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i7) #12
  %i9 = icmp slt i32 %arg, 3
  br i1 %i9, label %bb10, label %bb13

bb10:                                             ; preds = %bb
  %i11 = load ptr, ptr @stderr, align 8, !tbaa !21
  %i12 = tail call i64 @fwrite(ptr nonnull @.str.3, i64 44, i64 1, ptr %i11) #13
  tail call void @exit(i32 noundef 1) #14
  unreachable

bb13:                                             ; preds = %bb
  %i14 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i15 = load ptr, ptr %i14, align 8, !tbaa !21
  %i16 = load i8, ptr %i15, align 1, !tbaa !8
  switch i8 %i16, label %bb18 [
    i8 101, label %bb13.bb21_crit_edge
    i8 69, label %bb13.bb21_crit_edge1
    i8 100, label %bb13.bb17_crit_edge
    i8 68, label %bb13.bb17_crit_edge2
  ]

bb13.bb17_crit_edge2:                             ; preds = %bb13
  br label %bb17

bb13.bb17_crit_edge:                              ; preds = %bb13
  br label %bb17

bb13.bb21_crit_edge1:                             ; preds = %bb13
  br label %bb21

bb13.bb21_crit_edge:                              ; preds = %bb13
  br label %bb21

bb17:                                             ; preds = %bb13.bb17_crit_edge2, %bb13.bb17_crit_edge
  br label %bb21

bb18:                                             ; preds = %bb13
  %i19 = load ptr, ptr @stderr, align 8, !tbaa !21
  %i20 = tail call i64 @fwrite(ptr nonnull @.str.3, i64 44, i64 1, ptr %i19) #13
  tail call void @exit(i32 noundef 1) #14
  unreachable

bb21:                                             ; preds = %bb13.bb21_crit_edge1, %bb13.bb21_crit_edge, %bb17
  %i22 = phi i32 [ 0, %bb17 ], [ 1, %bb13.bb21_crit_edge ], [ 1, %bb13.bb21_crit_edge1 ]
  %i23 = getelementptr inbounds ptr, ptr %arg1, i64 4
  %i24 = load ptr, ptr %i23, align 8, !tbaa !21
  br label %bb25

bb25:                                             ; preds = %bb61.bb25_crit_edge, %bb21
  %i26 = phi i32 [ 0, %bb21 ], [ %i51, %bb61.bb25_crit_edge ]
  %i27 = phi i32 [ 0, %bb21 ], [ %i52, %bb61.bb25_crit_edge ]
  %i28 = phi ptr [ %i24, %bb21 ], [ %i34, %bb61.bb25_crit_edge ]
  %i29 = load i8, ptr %i28, align 1, !tbaa !8
  %i30 = icmp eq i8 %i29, 0
  br i1 %i30, label %bb25.bb63_crit_edge, label %bb31

bb25.bb63_crit_edge:                              ; preds = %bb25
  br label %bb63

bb31:                                             ; preds = %bb25
  %i32 = tail call ptr @__ctype_toupper_loc() #15
  %i33 = load ptr, ptr %i32, align 8, !tbaa !21
  %i34 = getelementptr inbounds i8, ptr %i28, i64 1
  %i35 = sext i8 %i29 to i64
  %i36 = getelementptr inbounds i32, ptr %i33, i64 %i35
  %i37 = load i32, ptr %i36, align 4, !tbaa !17
  %i38 = shl i32 %i37, 24
  %i39 = ashr exact i32 %i38, 24
  %i40 = add nsw i32 %i39, -48
  %i41 = icmp ult i32 %i40, 10
  br i1 %i41, label %bb31.bb47_crit_edge, label %bb42

bb31.bb47_crit_edge:                              ; preds = %bb31
  br label %bb47

bb42:                                             ; preds = %bb31
  %i43 = add nsw i32 %i39, -65
  %i44 = icmp ult i32 %i43, 6
  br i1 %i44, label %bb42.bb47_crit_edge, label %bb45

bb42.bb47_crit_edge:                              ; preds = %bb42
  br label %bb47

bb45:                                             ; preds = %bb42
  %i46 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  tail call void @exit(i32 noundef 1) #14
  unreachable

bb47:                                             ; preds = %bb42.bb47_crit_edge, %bb31.bb47_crit_edge
  %i48 = phi i32 [ -48, %bb31.bb47_crit_edge ], [ -55, %bb42.bb47_crit_edge ]
  %i49 = shl i32 %i26, 4
  %i50 = add i32 %i49, %i48
  %i51 = add i32 %i50, %i39
  %i52 = add nuw nsw i32 %i27, 1
  %i53 = and i32 %i27, 1
  %i54 = icmp eq i32 %i53, 0
  br i1 %i54, label %bb47.bb61_crit_edge, label %bb55

bb47.bb61_crit_edge:                              ; preds = %bb47
  br label %bb61

bb55:                                             ; preds = %bb47
  %i56 = trunc i32 %i51 to i8
  %i57 = lshr exact i32 %i52, 1
  %i58 = add nsw i32 %i57, -1
  %i59 = sext i32 %i58 to i64
  %i60 = getelementptr inbounds [32 x i8], ptr %i2, i64 0, i64 %i59
  store i8 %i56, ptr %i60, align 1, !tbaa !8
  br label %bb61

bb61:                                             ; preds = %bb47.bb61_crit_edge, %bb55
  %i62 = icmp eq i32 %i52, 64
  br i1 %i62, label %bb63split, label %bb61.bb25_crit_edge, !llvm.loop !23

bb61.bb25_crit_edge:                              ; preds = %bb61
  br label %bb25

bb63split:                                        ; preds = %bb61
  br label %bb63

bb63:                                             ; preds = %bb63split, %bb25.bb63_crit_edge
  %i64 = phi ptr [ %i28, %bb25.bb63_crit_edge ], [ %i34, %bb63split ]
  call void @BF_set_key(ptr noundef nonnull %i, i32 noundef 8, ptr noundef nonnull %i2) #12
  %i65 = load i8, ptr %i64, align 1, !tbaa !8
  %i66 = icmp eq i8 %i65, 0
  br i1 %i66, label %bb69, label %bb67

bb67:                                             ; preds = %bb63
  %i68 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @exit(i32 noundef 1) #14
  unreachable

bb69:                                             ; preds = %bb63
  %i70 = call noalias ptr @fopen(ptr noundef nonnull @.str.3.4, ptr noundef nonnull @.str.4)
  %i71 = icmp eq ptr %i70, null
  br i1 %i71, label %bb72, label %bb75

bb72:                                             ; preds = %bb69
  %i73 = load ptr, ptr @stderr, align 8, !tbaa !21
  %i74 = call i64 @fwrite(ptr nonnull @.str.5, i64 28, i64 1, ptr %i73) #13
  br label %bb138

bb75:                                             ; preds = %bb69
  %i76 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i70, ptr noundef nonnull @.str.6, ptr noundef nonnull %i7) #12
  %i77 = call i32 @fclose(ptr noundef nonnull %i70)
  %i78 = getelementptr inbounds ptr, ptr %arg1, i64 2
  %i79 = load ptr, ptr %i78, align 8, !tbaa !21
  %i80 = call noalias ptr @fopen(ptr noundef %i79, ptr noundef nonnull @.str.7)
  %i81 = icmp eq ptr %i80, null
  br i1 %i81, label %bb82, label %bb85

bb82:                                             ; preds = %bb75
  %i83 = load ptr, ptr @stderr, align 8, !tbaa !21
  %i84 = call i64 @fwrite(ptr nonnull @.str.3, i64 44, i64 1, ptr %i83) #13
  call void @exit(i32 noundef 1) #14
  unreachable

bb85:                                             ; preds = %bb75
  %i86 = getelementptr inbounds ptr, ptr %arg1, i64 3
  %i87 = load ptr, ptr %i86, align 8, !tbaa !21
  %i88 = call noalias ptr @fopen(ptr noundef %i87, ptr noundef nonnull @.str.8)
  %i89 = icmp eq ptr %i88, null
  br i1 %i89, label %bb90, label %bb93.preheader

bb93.preheader:                                   ; preds = %bb85
  br label %bb93

bb90:                                             ; preds = %bb85
  %i91 = load ptr, ptr @stderr, align 8, !tbaa !21
  %i92 = call i64 @fwrite(ptr nonnull @.str.3, i64 44, i64 1, ptr %i91) #13
  call void @exit(i32 noundef 1) #14
  unreachable

bb93:                                             ; preds = %bb93.preheader, %bb134
  %i94 = call i32 @feof(ptr noundef nonnull %i80) #12
  %i95 = icmp eq i32 %i94, 0
  br i1 %i95, label %bb96, label %bb135

bb96:                                             ; preds = %bb93
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %i8)
  br label %bb97

bb97:                                             ; preds = %bb104, %bb96
  %i98 = phi i32 [ %i109, %bb104 ], [ 0, %bb96 ]
  %i99 = phi i64 [ %i107, %bb104 ], [ 0, %bb96 ]
  %i100 = call i32 @feof(ptr noundef nonnull %i80) #12
  %i101 = icmp eq i32 %i100, 0
  %i102 = icmp ult i64 %i99, 40
  %i103 = select i1 %i101, i1 %i102, i1 false
  br i1 %i103, label %bb104, label %bb110

bb104:                                            ; preds = %bb97
  %i105 = call i32 @getc(ptr noundef nonnull %i80)
  %i106 = trunc i32 %i105 to i8
  %i107 = add nuw nsw i64 %i99, 1
  %i108 = getelementptr inbounds [40 x i8], ptr %i3, i64 0, i64 %i99
  store i8 %i106, ptr %i108, align 1, !tbaa !8
  %i109 = add nuw nsw i32 %i98, 1
  br label %bb97, !llvm.loop !24

bb110:                                            ; preds = %bb97
  %i111 = load i32, ptr %i6, align 4, !tbaa !17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) %i8, ptr noundef nonnull align 16 dereferenceable(32) %i5, i64 32, i1 false)
  %i112 = load i64, ptr %i7, align 8, !tbaa !11
  %i113 = icmp sgt i64 %i112, 0
  br i1 %i113, label %bb114, label %bb110.bb116_crit_edge

bb110.bb116_crit_edge:                            ; preds = %bb110
  br label %bb116

bb114:                                            ; preds = %bb110
  %i115 = and i64 %i99, 4294967295
  br label %bb121

bb116.loopexit:                                   ; preds = %bb121
  br label %bb116

bb116:                                            ; preds = %bb110.bb116_crit_edge, %bb116.loopexit
  %i117 = and i64 %i99, 4294967295
  %i118 = icmp eq i64 %i117, 0
  br i1 %i118, label %bb116.bb134_crit_edge, label %bb119

bb116.bb134_crit_edge:                            ; preds = %bb116
  br label %bb134

bb119:                                            ; preds = %bb116
  %i120 = zext nneg i32 %i98 to i64
  br label %bb126

bb121:                                            ; preds = %bb121.bb121_crit_edge, %bb114
  %i122 = phi i64 [ 0, %bb114 ], [ %i123, %bb121.bb121_crit_edge ]
  store i32 %i111, ptr %i6, align 4, !tbaa !17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) %i5, ptr noundef nonnull align 16 dereferenceable(32) %i8, i64 32, i1 false)
  call void @BF_cfb64_encrypt(ptr noundef nonnull %i3, ptr noundef nonnull %i4, i64 noundef %i115, ptr noundef nonnull %i, ptr noundef nonnull %i5, ptr noundef nonnull %i6, i32 noundef %i22) #12
  %i123 = add nuw nsw i64 %i122, 1
  %i124 = load i64, ptr %i7, align 8, !tbaa !11
  %i125 = icmp slt i64 %i123, %i124
  br i1 %i125, label %bb121.bb121_crit_edge, label %bb116.loopexit, !llvm.loop !25

bb121.bb121_crit_edge:                            ; preds = %bb121
  br label %bb121

bb126:                                            ; preds = %bb126.bb126_crit_edge, %bb119
  %i127 = phi i64 [ 0, %bb119 ], [ %i132, %bb126.bb126_crit_edge ]
  %i128 = getelementptr inbounds [40 x i8], ptr %i4, i64 0, i64 %i127
  %i129 = load i8, ptr %i128, align 1, !tbaa !8
  %i130 = zext i8 %i129 to i32
  %i131 = call i32 @fputc(i32 noundef %i130, ptr noundef nonnull %i88)
  %i132 = add nuw nsw i64 %i127, 1
  %i133 = icmp eq i64 %i132, %i120
  br i1 %i133, label %bb134.loopexit, label %bb126.bb126_crit_edge, !llvm.loop !26

bb126.bb126_crit_edge:                            ; preds = %bb126
  br label %bb126

bb134.loopexit:                                   ; preds = %bb126
  br label %bb134

bb134:                                            ; preds = %bb116.bb134_crit_edge, %bb134.loopexit
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %i8)
  br label %bb93, !llvm.loop !27

bb135:                                            ; preds = %bb93
  %i136 = call i32 @fclose(ptr noundef nonnull %i80)
  %i137 = call i32 @fclose(ptr noundef nonnull %i88)
  br label %bb138

bb138:                                            ; preds = %bb135, %bb72
  %i139 = phi i32 [ 1, %bb72 ], [ 0, %bb135 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i7) #12
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i6) #12
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %i5) #12
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %i4) #12
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %i3) #12
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %i2) #12
  call void @llvm.lifetime.end.p0(i64 8336, ptr nonnull %i) #12
  ret i32 %i139
}

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare ptr @__ctype_toupper_loc() local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #8

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @feof(ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @getc(ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #10

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nounwind uwtable
define dso_local void @BF_ofb64_encrypt(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, i64 noundef %arg2, ptr noundef %arg3, ptr nocapture noundef %arg4, ptr nocapture noundef %arg5) local_unnamed_addr #0 {
bb:
  %i = alloca [8 x i8], align 1
  %i6 = alloca [2 x i64], align 16
  %i7 = load i32, ptr %arg5, align 4, !tbaa !17
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #12
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %i6) #12
  %i8 = getelementptr inbounds i8, ptr %arg4, i64 1
  %i9 = load i8, ptr %arg4, align 1, !tbaa !8
  %i10 = zext i8 %i9 to i64
  %i11 = shl nuw nsw i64 %i10, 24
  %i12 = getelementptr inbounds i8, ptr %arg4, i64 2
  %i13 = load i8, ptr %i8, align 1, !tbaa !8
  %i14 = zext i8 %i13 to i64
  %i15 = shl nuw nsw i64 %i14, 16
  %i16 = or disjoint i64 %i15, %i11
  %i17 = getelementptr inbounds i8, ptr %arg4, i64 3
  %i18 = load i8, ptr %i12, align 1, !tbaa !8
  %i19 = zext i8 %i18 to i64
  %i20 = shl nuw nsw i64 %i19, 8
  %i21 = getelementptr inbounds i8, ptr %arg4, i64 4
  %i22 = load i8, ptr %i17, align 1, !tbaa !8
  %i23 = zext i8 %i22 to i64
  %i24 = or disjoint i64 %i16, %i20
  %i25 = or disjoint i64 %i24, %i23
  %i26 = getelementptr inbounds i8, ptr %arg4, i64 5
  %i27 = load i8, ptr %i21, align 1, !tbaa !8
  %i28 = zext i8 %i27 to i64
  %i29 = shl nuw nsw i64 %i28, 24
  %i30 = getelementptr inbounds i8, ptr %arg4, i64 6
  %i31 = load i8, ptr %i26, align 1, !tbaa !8
  %i32 = zext i8 %i31 to i64
  %i33 = shl nuw nsw i64 %i32, 16
  %i34 = or disjoint i64 %i33, %i29
  %i35 = getelementptr inbounds i8, ptr %arg4, i64 7
  %i36 = load i8, ptr %i30, align 1, !tbaa !8
  %i37 = zext i8 %i36 to i64
  %i38 = shl nuw nsw i64 %i37, 8
  %i39 = load i8, ptr %i35, align 1, !tbaa !8
  %i40 = zext i8 %i39 to i64
  %i41 = or disjoint i64 %i34, %i38
  %i42 = or disjoint i64 %i41, %i40
  store i64 %i25, ptr %i6, align 16, !tbaa !11
  %i43 = getelementptr inbounds [2 x i64], ptr %i6, i64 0, i64 1
  store i64 %i42, ptr %i43, align 8, !tbaa !11
  %i44 = getelementptr inbounds i8, ptr %i, i64 1
  store i8 %i9, ptr %i, align 1, !tbaa !8
  %i45 = getelementptr inbounds i8, ptr %i, i64 2
  store i8 %i13, ptr %i44, align 1, !tbaa !8
  %i46 = getelementptr inbounds i8, ptr %i, i64 3
  store i8 %i18, ptr %i45, align 1, !tbaa !8
  %i47 = getelementptr inbounds i8, ptr %i, i64 4
  store i8 %i22, ptr %i46, align 1, !tbaa !8
  %i48 = getelementptr inbounds i8, ptr %i, i64 5
  store i8 %i27, ptr %i47, align 1, !tbaa !8
  %i49 = getelementptr inbounds i8, ptr %i, i64 6
  store i8 %i31, ptr %i48, align 1, !tbaa !8
  %i50 = getelementptr inbounds i8, ptr %i, i64 7
  store i8 %i36, ptr %i49, align 1, !tbaa !8
  store i8 %i39, ptr %i50, align 1, !tbaa !8
  %i51 = icmp eq i64 %arg2, 0
  br i1 %i51, label %bb.bb92_crit_edge, label %bb52.preheader

bb.bb92_crit_edge:                                ; preds = %bb
  br label %bb92

bb52.preheader:                                   ; preds = %bb
  br label %bb52

bb52:                                             ; preds = %bb78.bb52_crit_edge, %bb52.preheader
  %i53 = phi i64 [ %i58, %bb78.bb52_crit_edge ], [ %arg2, %bb52.preheader ]
  %i54 = phi i32 [ %i79, %bb78.bb52_crit_edge ], [ 0, %bb52.preheader ]
  %i55 = phi i32 [ %i88, %bb78.bb52_crit_edge ], [ %i7, %bb52.preheader ]
  %i56 = phi ptr [ %i80, %bb78.bb52_crit_edge ], [ %arg, %bb52.preheader ]
  %i57 = phi ptr [ %i86, %bb78.bb52_crit_edge ], [ %arg1, %bb52.preheader ]
  %i58 = add nsw i64 %i53, -1
  %i59 = icmp eq i32 %i55, 0
  br i1 %i59, label %bb60, label %bb52.bb78_crit_edge

bb52.bb78_crit_edge:                              ; preds = %bb52
  br label %bb78

bb60:                                             ; preds = %bb52
  call void @BF_encrypt(ptr noundef nonnull %i6, ptr noundef %arg3, i32 noundef 1) #12
  %i61 = load i64, ptr %i6, align 16, !tbaa !11
  %i62 = lshr i64 %i61, 24
  %i63 = trunc i64 %i62 to i8
  store i8 %i63, ptr %i, align 1, !tbaa !8
  %i64 = lshr i64 %i61, 16
  %i65 = trunc i64 %i64 to i8
  store i8 %i65, ptr %i44, align 1, !tbaa !8
  %i66 = lshr i64 %i61, 8
  %i67 = trunc i64 %i66 to i8
  store i8 %i67, ptr %i45, align 1, !tbaa !8
  %i68 = trunc i64 %i61 to i8
  store i8 %i68, ptr %i46, align 1, !tbaa !8
  %i69 = load i64, ptr %i43, align 8, !tbaa !11
  %i70 = lshr i64 %i69, 24
  %i71 = trunc i64 %i70 to i8
  store i8 %i71, ptr %i47, align 1, !tbaa !8
  %i72 = lshr i64 %i69, 16
  %i73 = trunc i64 %i72 to i8
  store i8 %i73, ptr %i48, align 1, !tbaa !8
  %i74 = lshr i64 %i69, 8
  %i75 = trunc i64 %i74 to i8
  store i8 %i75, ptr %i49, align 1, !tbaa !8
  %i76 = trunc i64 %i69 to i8
  store i8 %i76, ptr %i50, align 1, !tbaa !8
  %i77 = add nsw i32 %i54, 1
  br label %bb78

bb78:                                             ; preds = %bb52.bb78_crit_edge, %bb60
  %i79 = phi i32 [ %i77, %bb60 ], [ %i54, %bb52.bb78_crit_edge ]
  %i80 = getelementptr inbounds i8, ptr %i56, i64 1
  %i81 = load i8, ptr %i56, align 1, !tbaa !8
  %i82 = sext i32 %i55 to i64
  %i83 = getelementptr inbounds [8 x i8], ptr %i, i64 0, i64 %i82
  %i84 = load i8, ptr %i83, align 1, !tbaa !8
  %i85 = xor i8 %i84, %i81
  %i86 = getelementptr inbounds i8, ptr %i57, i64 1
  store i8 %i85, ptr %i57, align 1, !tbaa !8
  %i87 = add nsw i32 %i55, 1
  %i88 = and i32 %i87, 7
  %i89 = icmp eq i64 %i58, 0
  br i1 %i89, label %bb90, label %bb78.bb52_crit_edge, !llvm.loop !28

bb78.bb52_crit_edge:                              ; preds = %bb78
  br label %bb52

bb90:                                             ; preds = %bb78
  %i91 = icmp eq i32 %i79, 0
  br label %bb92

bb92:                                             ; preds = %bb.bb92_crit_edge, %bb90
  %i93 = phi i32 [ %i7, %bb.bb92_crit_edge ], [ %i88, %bb90 ]
  %i94 = phi i1 [ true, %bb.bb92_crit_edge ], [ %i91, %bb90 ]
  br i1 %i94, label %bb92.bb112_crit_edge, label %bb95

bb92.bb112_crit_edge:                             ; preds = %bb92
  br label %bb112

bb95:                                             ; preds = %bb92
  %i96 = load i64, ptr %i6, align 16, !tbaa !11
  %i97 = load i64, ptr %i43, align 8, !tbaa !11
  %i98 = lshr i64 %i96, 24
  %i99 = trunc i64 %i98 to i8
  store i8 %i99, ptr %arg4, align 1, !tbaa !8
  %i100 = lshr i64 %i96, 16
  %i101 = trunc i64 %i100 to i8
  store i8 %i101, ptr %i8, align 1, !tbaa !8
  %i102 = lshr i64 %i96, 8
  %i103 = trunc i64 %i102 to i8
  store i8 %i103, ptr %i12, align 1, !tbaa !8
  %i104 = trunc i64 %i96 to i8
  store i8 %i104, ptr %i17, align 1, !tbaa !8
  %i105 = lshr i64 %i97, 24
  %i106 = trunc i64 %i105 to i8
  store i8 %i106, ptr %i21, align 1, !tbaa !8
  %i107 = lshr i64 %i97, 16
  %i108 = trunc i64 %i107 to i8
  store i8 %i108, ptr %i26, align 1, !tbaa !8
  %i109 = lshr i64 %i97, 8
  %i110 = trunc i64 %i109 to i8
  store i8 %i110, ptr %i30, align 1, !tbaa !8
  %i111 = trunc i64 %i97 to i8
  store i8 %i111, ptr %i35, align 1, !tbaa !8
  br label %bb112

bb112:                                            ; preds = %bb92.bb112_crit_edge, %bb95
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %i6, i8 0, i64 16, i1 false)
  store i32 %i93, ptr %arg5, align 4, !tbaa !17
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %i6) #12
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #12
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @BF_set_key(ptr noundef %arg, i32 noundef %arg1, ptr noundef readonly %arg2) local_unnamed_addr #0 {
bb:
  %i = alloca [2 x i64], align 16
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %i) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(8336) %arg, ptr noundef nonnull align 8 dereferenceable(8336) @bf_init, i64 8336, i1 false)
  %i3 = tail call i32 @llvm.smin.i32(i32 %arg1, i32 72)
  %i4 = sext i32 %i3 to i64
  %i5 = getelementptr inbounds i8, ptr %arg2, i64 %i4
  br label %bb6

bb6:                                              ; preds = %bb6.bb6_crit_edge, %bb
  %i7 = phi i64 [ 0, %bb ], [ %i38, %bb6.bb6_crit_edge ]
  %i8 = phi ptr [ %arg2, %bb ], [ %i34, %bb6.bb6_crit_edge ]
  %i9 = getelementptr inbounds i8, ptr %i8, i64 1
  %i10 = load i8, ptr %i8, align 1, !tbaa !8
  %i11 = zext i8 %i10 to i64
  %i12 = icmp ult ptr %i9, %i5
  %i13 = select i1 %i12, ptr %i9, ptr %arg2
  %i14 = getelementptr inbounds i8, ptr %i13, i64 1
  %i15 = load i8, ptr %i13, align 1, !tbaa !8
  %i16 = zext i8 %i15 to i64
  %i17 = icmp ult ptr %i14, %i5
  %i18 = select i1 %i17, ptr %i14, ptr %arg2
  %i19 = shl nuw nsw i64 %i11, 16
  %i20 = shl nuw nsw i64 %i16, 8
  %i21 = or disjoint i64 %i20, %i19
  %i22 = getelementptr inbounds i8, ptr %i18, i64 1
  %i23 = load i8, ptr %i18, align 1, !tbaa !8
  %i24 = zext i8 %i23 to i64
  %i25 = or disjoint i64 %i21, %i24
  %i26 = icmp ult ptr %i22, %i5
  %i27 = select i1 %i26, ptr %i22, ptr %arg2
  %i28 = shl nuw nsw i64 %i25, 8
  %i29 = getelementptr inbounds i8, ptr %i27, i64 1
  %i30 = load i8, ptr %i27, align 1, !tbaa !8
  %i31 = zext i8 %i30 to i64
  %i32 = or disjoint i64 %i28, %i31
  %i33 = icmp ult ptr %i29, %i5
  %i34 = select i1 %i33, ptr %i29, ptr %arg2
  %i35 = getelementptr inbounds i64, ptr %arg, i64 %i7
  %i36 = load i64, ptr %i35, align 8, !tbaa !11
  %i37 = xor i64 %i32, %i36
  store i64 %i37, ptr %i35, align 8, !tbaa !11
  %i38 = add nuw nsw i64 %i7, 1
  %i39 = icmp eq i64 %i38, 18
  br i1 %i39, label %bb40, label %bb6.bb6_crit_edge, !llvm.loop !29

bb6.bb6_crit_edge:                                ; preds = %bb6
  br label %bb6

bb40:                                             ; preds = %bb6
  %i41 = getelementptr inbounds [2 x i64], ptr %i, i64 0, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %i, i8 0, i64 16, i1 false)
  br label %bb42

bb42:                                             ; preds = %bb42.bb42_crit_edge, %bb40
  %i43 = phi i64 [ 0, %bb40 ], [ %i49, %bb42.bb42_crit_edge ]
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg, i32 noundef 1) #12
  %i44 = load i64, ptr %i, align 16, !tbaa !11
  %i45 = getelementptr inbounds i64, ptr %arg, i64 %i43
  store i64 %i44, ptr %i45, align 8, !tbaa !11
  %i46 = load i64, ptr %i41, align 8, !tbaa !11
  %i47 = or disjoint i64 %i43, 1
  %i48 = getelementptr inbounds i64, ptr %arg, i64 %i47
  store i64 %i46, ptr %i48, align 8, !tbaa !11
  %i49 = add nuw nsw i64 %i43, 2
  %i50 = icmp ult i64 %i43, 16
  br i1 %i50, label %bb42.bb42_crit_edge, label %bb51, !llvm.loop !30

bb42.bb42_crit_edge:                              ; preds = %bb42
  br label %bb42

bb51:                                             ; preds = %bb42
  %i52 = getelementptr inbounds %struct.bf_key_st, ptr %arg, i64 0, i32 1
  br label %bb53

bb53:                                             ; preds = %bb53.bb53_crit_edge, %bb51
  %i54 = phi i64 [ 0, %bb51 ], [ %i60, %bb53.bb53_crit_edge ]
  call void @BF_encrypt(ptr noundef nonnull %i, ptr noundef %arg, i32 noundef 1) #12
  %i55 = load i64, ptr %i, align 16, !tbaa !11
  %i56 = getelementptr inbounds i64, ptr %i52, i64 %i54
  store i64 %i55, ptr %i56, align 8, !tbaa !11
  %i57 = load i64, ptr %i41, align 8, !tbaa !11
  %i58 = or disjoint i64 %i54, 1
  %i59 = getelementptr inbounds i64, ptr %i52, i64 %i58
  store i64 %i57, ptr %i59, align 8, !tbaa !11
  %i60 = add nuw nsw i64 %i54, 2
  %i61 = icmp ult i64 %i54, 1022
  br i1 %i61, label %bb53.bb53_crit_edge, label %bb62, !llvm.loop !31

bb53.bb53_crit_edge:                              ; preds = %bb53
  br label %bb53

bb62:                                             ; preds = %bb53
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %i) #12
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #11

attributes #0 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nounwind }
attributes #13 = { cold }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind willreturn memory(none) }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !14, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !9, i64 0}
!19 = distinct !{!19, !14, !15}
!20 = distinct !{!20, !14, !15}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !9, i64 0}
!23 = distinct !{!23, !14, !15}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}
!26 = distinct !{!26, !14, !15}
!27 = distinct !{!27, !14, !15}
!28 = distinct !{!28, !14, !15}
!29 = distinct !{!29, !14, !15}
!30 = distinct !{!30, !14, !15}
!31 = distinct !{!31, !14, !15}
