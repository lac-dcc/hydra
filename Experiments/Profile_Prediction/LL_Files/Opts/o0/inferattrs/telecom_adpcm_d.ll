; ModuleID = 'telecom_adpcm_d.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16
@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@state = dso_local global %struct.adpcm_state zeroinitializer, align 2
@abuf = dso_local global [500 x i8] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [11 x i8] c"input file\00", align 1
@sbuf = dso_local global [1000 x i16] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @adpcm_coder(ptr noundef %arg, ptr noundef %arg21, i32 noundef %arg22, ptr noundef %arg23) #0 {
bb:
  %i = getelementptr inbounds %struct.adpcm_state, ptr %arg23, i32 0, i32 0
  %i24 = load i16, ptr %i, align 2
  %i25 = sext i16 %i24 to i32
  %i26 = getelementptr inbounds %struct.adpcm_state, ptr %arg23, i32 0, i32 1
  %i27 = load i8, ptr %i26, align 2
  %i28 = sext i8 %i27 to i32
  %i29 = sext i32 %i28 to i64
  %i30 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i29
  %i31 = load i32, ptr %i30, align 4
  br label %bb32

bb32:                                             ; preds = %bb105, %bb
  %.020 = phi i32 [ %i31, %bb ], [ %i91, %bb105 ]
  %.011 = phi i32 [ %i25, %bb ], [ %.3, %bb105 ]
  %.06 = phi ptr [ %arg21, %bb ], [ %.17, %bb105 ]
  %.05 = phi ptr [ %arg, %bb ], [ %i35, %bb105 ]
  %.03 = phi i32 [ %i28, %bb ], [ %.2, %bb105 ]
  %.02 = phi i32 [ %arg22, %bb ], [ %i106, %bb105 ]
  %.01 = phi i32 [ 0, %bb ], [ %.1, %bb105 ]
  %.0 = phi i32 [ 1, %bb ], [ %i104, %bb105 ]
  %i33 = icmp sgt i32 %.02, 0
  br i1 %i33, label %bb34, label %bb107

bb34:                                             ; preds = %bb32
  %i35 = getelementptr inbounds i16, ptr %.05, i32 1
  %i36 = load i16, ptr %.05, align 2
  %i37 = sext i16 %i36 to i32
  %i38 = sub nsw i32 %i37, %.011
  %i39 = icmp slt i32 %i38, 0
  %i40 = zext i1 %i39 to i64
  %i41 = select i1 %i39, i32 8, i32 0
  %i42 = icmp ne i32 %i41, 0
  br i1 %i42, label %bb43, label %bb34.bb45_crit_edge

bb34.bb45_crit_edge:                              ; preds = %bb34
  br label %bb45

bb43:                                             ; preds = %bb34
  %i44 = sub nsw i32 0, %i38
  br label %bb45

bb45:                                             ; preds = %bb34.bb45_crit_edge, %bb43
  %.017 = phi i32 [ %i44, %bb43 ], [ %i38, %bb34.bb45_crit_edge ]
  %i46 = ashr i32 %.020, 3
  %i47 = icmp sge i32 %.017, %.020
  br i1 %i47, label %bb48, label %bb45.bb51_crit_edge

bb45.bb51_crit_edge:                              ; preds = %bb45
  br label %bb51

bb48:                                             ; preds = %bb45
  %i49 = sub nsw i32 %.017, %.020
  %i50 = add nsw i32 %i46, %.020
  br label %bb51

bb51:                                             ; preds = %bb45.bb51_crit_edge, %bb48
  %.118 = phi i32 [ %i49, %bb48 ], [ %.017, %bb45.bb51_crit_edge ]
  %.014 = phi i32 [ 4, %bb48 ], [ 0, %bb45.bb51_crit_edge ]
  %.08 = phi i32 [ %i50, %bb48 ], [ %i46, %bb45.bb51_crit_edge ]
  %i52 = ashr i32 %.020, 1
  %i53 = icmp sge i32 %.118, %i52
  br i1 %i53, label %bb54, label %bb51.bb58_crit_edge

bb51.bb58_crit_edge:                              ; preds = %bb51
  br label %bb58

bb54:                                             ; preds = %bb51
  %i55 = or i32 %.014, 2
  %i56 = sub nsw i32 %.118, %i52
  %i57 = add nsw i32 %.08, %i52
  br label %bb58

bb58:                                             ; preds = %bb51.bb58_crit_edge, %bb54
  %.219 = phi i32 [ %i56, %bb54 ], [ %.118, %bb51.bb58_crit_edge ]
  %.115 = phi i32 [ %i55, %bb54 ], [ %.014, %bb51.bb58_crit_edge ]
  %.19 = phi i32 [ %i57, %bb54 ], [ %.08, %bb51.bb58_crit_edge ]
  %i59 = ashr i32 %i52, 1
  %i60 = icmp sge i32 %.219, %i59
  br i1 %i60, label %bb61, label %bb58.bb64_crit_edge

bb58.bb64_crit_edge:                              ; preds = %bb58
  br label %bb64

bb61:                                             ; preds = %bb58
  %i62 = or i32 %.115, 1
  %i63 = add nsw i32 %.19, %i59
  br label %bb64

bb64:                                             ; preds = %bb58.bb64_crit_edge, %bb61
  %.216 = phi i32 [ %i62, %bb61 ], [ %.115, %bb58.bb64_crit_edge ]
  %.210 = phi i32 [ %i63, %bb61 ], [ %.19, %bb58.bb64_crit_edge ]
  %i65 = icmp ne i32 %i41, 0
  br i1 %i65, label %bb66, label %bb68

bb66:                                             ; preds = %bb64
  %i67 = sub nsw i32 %.011, %.210
  br label %bb70

bb68:                                             ; preds = %bb64
  %i69 = add nsw i32 %.011, %.210
  br label %bb70

bb70:                                             ; preds = %bb68, %bb66
  %.112 = phi i32 [ %i67, %bb66 ], [ %i69, %bb68 ]
  %i71 = icmp sgt i32 %.112, 32767
  br i1 %i71, label %bb72, label %bb73

bb72:                                             ; preds = %bb70
  br label %bb77

bb73:                                             ; preds = %bb70
  %i74 = icmp slt i32 %.112, -32768
  br i1 %i74, label %bb75, label %bb73.bb76_crit_edge

bb73.bb76_crit_edge:                              ; preds = %bb73
  br label %bb76

bb75:                                             ; preds = %bb73
  br label %bb76

bb76:                                             ; preds = %bb73.bb76_crit_edge, %bb75
  %.213 = phi i32 [ -32768, %bb75 ], [ %.112, %bb73.bb76_crit_edge ]
  br label %bb77

bb77:                                             ; preds = %bb76, %bb72
  %.3 = phi i32 [ 32767, %bb72 ], [ %.213, %bb76 ]
  %i78 = or i32 %.216, %i41
  %i79 = sext i32 %i78 to i64
  %i80 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %i79
  %i81 = load i32, ptr %i80, align 4
  %i82 = add nsw i32 %.03, %i81
  %i83 = icmp slt i32 %i82, 0
  br i1 %i83, label %bb84, label %bb77.bb85_crit_edge

bb77.bb85_crit_edge:                              ; preds = %bb77
  br label %bb85

bb84:                                             ; preds = %bb77
  br label %bb85

bb85:                                             ; preds = %bb77.bb85_crit_edge, %bb84
  %.14 = phi i32 [ 0, %bb84 ], [ %i82, %bb77.bb85_crit_edge ]
  %i86 = icmp sgt i32 %.14, 88
  br i1 %i86, label %bb87, label %bb85.bb88_crit_edge

bb85.bb88_crit_edge:                              ; preds = %bb85
  br label %bb88

bb87:                                             ; preds = %bb85
  br label %bb88

bb88:                                             ; preds = %bb85.bb88_crit_edge, %bb87
  %.2 = phi i32 [ 88, %bb87 ], [ %.14, %bb85.bb88_crit_edge ]
  %i89 = sext i32 %.2 to i64
  %i90 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i89
  %i91 = load i32, ptr %i90, align 4
  %i92 = icmp ne i32 %.0, 0
  br i1 %i92, label %bb93, label %bb96

bb93:                                             ; preds = %bb88
  %i94 = shl i32 %i78, 4
  %i95 = and i32 %i94, 240
  br label %bb101

bb96:                                             ; preds = %bb88
  %i97 = and i32 %i78, 15
  %i98 = or i32 %i97, %.01
  %i99 = trunc i32 %i98 to i8
  %i100 = getelementptr inbounds i8, ptr %.06, i32 1
  store i8 %i99, ptr %.06, align 1
  br label %bb101

bb101:                                            ; preds = %bb96, %bb93
  %.17 = phi ptr [ %.06, %bb93 ], [ %i100, %bb96 ]
  %.1 = phi i32 [ %i95, %bb93 ], [ %.01, %bb96 ]
  %i102 = icmp ne i32 %.0, 0
  %i103 = xor i1 %i102, true
  %i104 = zext i1 %i103 to i32
  br label %bb105

bb105:                                            ; preds = %bb101
  %i106 = add nsw i32 %.02, -1
  br label %bb32, !llvm.loop !8

bb107:                                            ; preds = %bb32
  %i108 = icmp ne i32 %.0, 0
  br i1 %i108, label %bb107.bb112_crit_edge, label %bb109

bb107.bb112_crit_edge:                            ; preds = %bb107
  br label %bb112

bb109:                                            ; preds = %bb107
  %i110 = trunc i32 %.01 to i8
  %i111 = getelementptr inbounds i8, ptr %.06, i32 1
  store i8 %i110, ptr %.06, align 1
  br label %bb112

bb112:                                            ; preds = %bb107.bb112_crit_edge, %bb109
  %i113 = trunc i32 %.011 to i16
  %i114 = getelementptr inbounds %struct.adpcm_state, ptr %arg23, i32 0, i32 0
  store i16 %i113, ptr %i114, align 2
  %i115 = trunc i32 %.03 to i8
  %i116 = getelementptr inbounds %struct.adpcm_state, ptr %arg23, i32 0, i32 1
  store i8 %i115, ptr %i116, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @adpcm_decoder(ptr noundef %arg, ptr noundef %arg16, i32 noundef %arg17, ptr noundef %arg18) #0 {
bb:
  %i = getelementptr inbounds %struct.adpcm_state, ptr %arg18, i32 0, i32 0
  %i19 = load i16, ptr %i, align 2
  %i20 = sext i16 %i19 to i32
  %i21 = getelementptr inbounds %struct.adpcm_state, ptr %arg18, i32 0, i32 1
  %i22 = load i8, ptr %i21, align 2
  %i23 = sext i8 %i22 to i32
  %i24 = sext i32 %i23 to i64
  %i25 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i24
  %i26 = load i32, ptr %i25, align 4
  br label %bb27

bb27:                                             ; preds = %bb91, %bb
  %.013 = phi i32 [ %i20, %bb ], [ %.3, %bb91 ]
  %.012 = phi i32 [ %i26, %bb ], [ %i88, %bb91 ]
  %.07 = phi ptr [ %arg16, %bb ], [ %i90, %bb91 ]
  %.05 = phi ptr [ %arg, %bb ], [ %.16, %bb91 ]
  %.03 = phi i32 [ %i23, %bb ], [ %.2, %bb91 ]
  %.02 = phi i32 [ %arg17, %bb ], [ %i92, %bb91 ]
  %.01 = phi i32 [ 0, %bb ], [ %.1, %bb91 ]
  %.0 = phi i32 [ 0, %bb ], [ %i42, %bb91 ]
  %i28 = icmp sgt i32 %.02, 0
  br i1 %i28, label %bb29, label %bb93

bb29:                                             ; preds = %bb27
  %i30 = icmp ne i32 %.0, 0
  br i1 %i30, label %bb31, label %bb33

bb31:                                             ; preds = %bb29
  %i32 = and i32 %.01, 15
  br label %bb39

bb33:                                             ; preds = %bb29
  %i34 = getelementptr inbounds i8, ptr %.05, i32 1
  %i35 = load i8, ptr %.05, align 1
  %i36 = sext i8 %i35 to i32
  %i37 = ashr i32 %i36, 4
  %i38 = and i32 %i37, 15
  br label %bb39

bb39:                                             ; preds = %bb33, %bb31
  %.011 = phi i32 [ %i32, %bb31 ], [ %i38, %bb33 ]
  %.16 = phi ptr [ %.05, %bb31 ], [ %i34, %bb33 ]
  %.1 = phi i32 [ %.01, %bb31 ], [ %i36, %bb33 ]
  %i40 = icmp ne i32 %.0, 0
  %i41 = xor i1 %i40, true
  %i42 = zext i1 %i41 to i32
  %i43 = sext i32 %.011 to i64
  %i44 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %i43
  %i45 = load i32, ptr %i44, align 4
  %i46 = add nsw i32 %.03, %i45
  %i47 = icmp slt i32 %i46, 0
  br i1 %i47, label %bb48, label %bb39.bb49_crit_edge

bb39.bb49_crit_edge:                              ; preds = %bb39
  br label %bb49

bb48:                                             ; preds = %bb39
  br label %bb49

bb49:                                             ; preds = %bb39.bb49_crit_edge, %bb48
  %.14 = phi i32 [ 0, %bb48 ], [ %i46, %bb39.bb49_crit_edge ]
  %i50 = icmp sgt i32 %.14, 88
  br i1 %i50, label %bb51, label %bb49.bb52_crit_edge

bb49.bb52_crit_edge:                              ; preds = %bb49
  br label %bb52

bb51:                                             ; preds = %bb49
  br label %bb52

bb52:                                             ; preds = %bb49.bb52_crit_edge, %bb51
  %.2 = phi i32 [ 88, %bb51 ], [ %.14, %bb49.bb52_crit_edge ]
  %i53 = and i32 %.011, 8
  %i54 = and i32 %.011, 7
  %i55 = ashr i32 %.012, 3
  %i56 = and i32 %i54, 4
  %i57 = icmp ne i32 %i56, 0
  br i1 %i57, label %bb58, label %bb52.bb60_crit_edge

bb52.bb60_crit_edge:                              ; preds = %bb52
  br label %bb60

bb58:                                             ; preds = %bb52
  %i59 = add nsw i32 %i55, %.012
  br label %bb60

bb60:                                             ; preds = %bb52.bb60_crit_edge, %bb58
  %.08 = phi i32 [ %i59, %bb58 ], [ %i55, %bb52.bb60_crit_edge ]
  %i61 = and i32 %i54, 2
  %i62 = icmp ne i32 %i61, 0
  br i1 %i62, label %bb63, label %bb60.bb66_crit_edge

bb60.bb66_crit_edge:                              ; preds = %bb60
  br label %bb66

bb63:                                             ; preds = %bb60
  %i64 = ashr i32 %.012, 1
  %i65 = add nsw i32 %.08, %i64
  br label %bb66

bb66:                                             ; preds = %bb60.bb66_crit_edge, %bb63
  %.19 = phi i32 [ %i65, %bb63 ], [ %.08, %bb60.bb66_crit_edge ]
  %i67 = and i32 %i54, 1
  %i68 = icmp ne i32 %i67, 0
  br i1 %i68, label %bb69, label %bb66.bb72_crit_edge

bb66.bb72_crit_edge:                              ; preds = %bb66
  br label %bb72

bb69:                                             ; preds = %bb66
  %i70 = ashr i32 %.012, 2
  %i71 = add nsw i32 %.19, %i70
  br label %bb72

bb72:                                             ; preds = %bb66.bb72_crit_edge, %bb69
  %.210 = phi i32 [ %i71, %bb69 ], [ %.19, %bb66.bb72_crit_edge ]
  %i73 = icmp ne i32 %i53, 0
  br i1 %i73, label %bb74, label %bb76

bb74:                                             ; preds = %bb72
  %i75 = sub nsw i32 %.013, %.210
  br label %bb78

bb76:                                             ; preds = %bb72
  %i77 = add nsw i32 %.013, %.210
  br label %bb78

bb78:                                             ; preds = %bb76, %bb74
  %.114 = phi i32 [ %i75, %bb74 ], [ %i77, %bb76 ]
  %i79 = icmp sgt i32 %.114, 32767
  br i1 %i79, label %bb80, label %bb81

bb80:                                             ; preds = %bb78
  br label %bb85

bb81:                                             ; preds = %bb78
  %i82 = icmp slt i32 %.114, -32768
  br i1 %i82, label %bb83, label %bb81.bb84_crit_edge

bb81.bb84_crit_edge:                              ; preds = %bb81
  br label %bb84

bb83:                                             ; preds = %bb81
  br label %bb84

bb84:                                             ; preds = %bb81.bb84_crit_edge, %bb83
  %.215 = phi i32 [ -32768, %bb83 ], [ %.114, %bb81.bb84_crit_edge ]
  br label %bb85

bb85:                                             ; preds = %bb84, %bb80
  %.3 = phi i32 [ 32767, %bb80 ], [ %.215, %bb84 ]
  %i86 = sext i32 %.2 to i64
  %i87 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i86
  %i88 = load i32, ptr %i87, align 4
  %i89 = trunc i32 %.3 to i16
  %i90 = getelementptr inbounds i16, ptr %.07, i32 1
  store i16 %i89, ptr %.07, align 2
  br label %bb91

bb91:                                             ; preds = %bb85
  %i92 = add nsw i32 %.02, -1
  br label %bb27, !llvm.loop !10

bb93:                                             ; preds = %bb27
  %i94 = trunc i32 %.013 to i16
  %i95 = getelementptr inbounds %struct.adpcm_state, ptr %arg18, i32 0, i32 0
  store i16 %i94, ptr %i95, align 2
  %i96 = trunc i32 %.03 to i8
  %i97 = getelementptr inbounds %struct.adpcm_state, ptr %arg18, i32 0, i32 1
  store i8 %i96, ptr %i97, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
bb:
  %i = alloca i64, align 8
  %i1 = alloca %struct.adpcm_state, align 2
  %i2 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8
  %i6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i5, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #6
  unreachable

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i2, ptr noundef @.str.3, ptr noundef %i)
  %i9 = call i32 @fclose(ptr noundef %i2)
  br label %bb10

bb10:                                             ; preds = %bb26, %bb7
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %i1, ptr align 2 @state, i64 4, i1 false)
  %i11 = call i64 @read(i32 noundef 0, ptr noundef @abuf, i64 noundef 500)
  %i12 = trunc i64 %i11 to i32
  %i13 = icmp slt i32 %i12, 0
  br i1 %i13, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  call void @perror(ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #6
  unreachable

bb15:                                             ; preds = %bb10
  %i16 = icmp eq i32 %i12, 0
  br i1 %i16, label %bb17, label %bb18

bb17:                                             ; preds = %bb15
  br label %bb30

bb18:                                             ; preds = %bb15
  br label %bb19

bb19:                                             ; preds = %bb24, %bb18
  %.0 = phi i64 [ 0, %bb18 ], [ %i25, %bb24 ]
  %i20 = load i64, ptr %i, align 8
  %i21 = icmp slt i64 %.0, %i20
  br i1 %i21, label %bb22, label %bb26

bb22:                                             ; preds = %bb19
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 @state, ptr align 2 %i1, i64 4, i1 false)
  %i23 = mul nsw i32 %i12, 2
  call void @adpcm_decoder(ptr noundef @abuf, ptr noundef @sbuf, i32 noundef %i23, ptr noundef @state)
  br label %bb24

bb24:                                             ; preds = %bb22
  %i25 = add nsw i64 %.0, 1
  br label %bb19, !llvm.loop !11

bb26:                                             ; preds = %bb19
  %i27 = mul nsw i32 %i12, 4
  %i28 = sext i32 %i27 to i64
  %i29 = call i64 @write(i32 noundef 1, ptr noundef @sbuf, i64 noundef %i28)
  br label %bb10

bb30:                                             ; preds = %bb17
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) #1

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, ptr nocapture noundef, i64 noundef) #5

; Function Attrs: nofree nounwind
declare void @perror(ptr nocapture noundef readonly) #1

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, ptr nocapture noundef readonly, i64 noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
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
