; ModuleID = 'telecom_adpcm_c.ll'
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
@sbuf = dso_local global [1000 x i16] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [11 x i8] c"input file\00", align 1
@abuf = dso_local global [500 x i8] zeroinitializer, align 16

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
  %i331 = icmp sgt i32 %arg22, 0
  br i1 %i331, label %bb34.lr.ph, label %bb.bb107_crit_edge

bb.bb107_crit_edge:                               ; preds = %bb
  br label %bb107

bb34.lr.ph:                                       ; preds = %bb
  br label %bb34

bb34:                                             ; preds = %bb101.bb34_crit_edge, %bb34.lr.ph
  %.09 = phi i32 [ 1, %bb34.lr.ph ], [ %i104, %bb101.bb34_crit_edge ]
  %.018 = phi i32 [ 0, %bb34.lr.ph ], [ %.1, %bb101.bb34_crit_edge ]
  %.027 = phi i32 [ %arg22, %bb34.lr.ph ], [ %i106, %bb101.bb34_crit_edge ]
  %.036 = phi i32 [ %i28, %bb34.lr.ph ], [ %.2, %bb101.bb34_crit_edge ]
  %.055 = phi ptr [ %arg, %bb34.lr.ph ], [ %i35, %bb101.bb34_crit_edge ]
  %.064 = phi ptr [ %arg21, %bb34.lr.ph ], [ %.17, %bb101.bb34_crit_edge ]
  %.0113 = phi i32 [ %i25, %bb34.lr.ph ], [ %.3, %bb101.bb34_crit_edge ]
  %.0202 = phi i32 [ %i31, %bb34.lr.ph ], [ %i91, %bb101.bb34_crit_edge ]
  %i35 = getelementptr inbounds i16, ptr %.055, i32 1
  %i36 = load i16, ptr %.055, align 2
  %i37 = sext i16 %i36 to i32
  %i38 = sub nsw i32 %i37, %.0113
  %i39 = icmp slt i32 %i38, 0
  %i40 = zext i1 %i39 to i64
  %i41 = select i1 %i39, i32 8, i32 0
  %i42 = icmp ne i32 %i41, 0
  %i44 = sub nsw i32 0, %i38
  %spec.select = select i1 %i42, i32 %i44, i32 %i38
  %i46 = ashr i32 %.0202, 3
  %i47 = icmp sge i32 %spec.select, %.0202
  %i49 = sub nsw i32 %spec.select, %.0202
  %i50 = add nsw i32 %i46, %.0202
  %.118 = select i1 %i47, i32 %i49, i32 %spec.select
  %.014 = select i1 %i47, i32 4, i32 0
  %.08 = select i1 %i47, i32 %i50, i32 %i46
  %i52 = ashr i32 %.0202, 1
  %i53 = icmp sge i32 %.118, %i52
  %i55 = or i32 %.014, 2
  %i56 = sub nsw i32 %.118, %i52
  %i57 = add nsw i32 %.08, %i52
  %.219 = select i1 %i53, i32 %i56, i32 %.118
  %.115 = select i1 %i53, i32 %i55, i32 %.014
  %.19 = select i1 %i53, i32 %i57, i32 %.08
  %i59 = ashr i32 %i52, 1
  %i60 = icmp sge i32 %.219, %i59
  %i62 = or i32 %.115, 1
  %i63 = add nsw i32 %.19, %i59
  %.216 = select i1 %i60, i32 %i62, i32 %.115
  %.210 = select i1 %i60, i32 %i63, i32 %.19
  %i65 = icmp ne i32 %i41, 0
  %i67 = sub nsw i32 %.0113, %.210
  %i69 = add nsw i32 %.0113, %.210
  %.112 = select i1 %i65, i32 %i67, i32 %i69
  %i71 = icmp sgt i32 %.112, 32767
  %i74 = icmp slt i32 %.112, -32768
  %spec.select1 = select i1 %i74, i32 -32768, i32 %.112
  %.3 = select i1 %i71, i32 32767, i32 %spec.select1
  %i78 = or i32 %.216, %i41
  %i79 = sext i32 %i78 to i64
  %i80 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %i79
  %i81 = load i32, ptr %i80, align 4
  %i82 = add nsw i32 %.036, %i81
  %i83 = icmp slt i32 %i82, 0
  %.14 = select i1 %i83, i32 0, i32 %i82
  %i86 = icmp sgt i32 %.14, 88
  %.2 = select i1 %i86, i32 88, i32 %.14
  %i89 = sext i32 %.2 to i64
  %i90 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i89
  %i91 = load i32, ptr %i90, align 4
  %i92 = icmp ne i32 %.09, 0
  br i1 %i92, label %bb93, label %bb96

bb93:                                             ; preds = %bb34
  %i94 = shl i32 %i78, 4
  %i95 = and i32 %i94, 240
  br label %bb101

bb96:                                             ; preds = %bb34
  %i97 = and i32 %i78, 15
  %i98 = or i32 %i97, %.018
  %i99 = trunc i32 %i98 to i8
  %i100 = getelementptr inbounds i8, ptr %.064, i32 1
  store i8 %i99, ptr %.064, align 1
  br label %bb101

bb101:                                            ; preds = %bb96, %bb93
  %.17 = phi ptr [ %.064, %bb93 ], [ %i100, %bb96 ]
  %.1 = phi i32 [ %i95, %bb93 ], [ %.018, %bb96 ]
  %i102 = icmp ne i32 %.09, 0
  %i103 = xor i1 %i102, true
  %i104 = zext i1 %i103 to i32
  %i106 = add nsw i32 %.027, -1
  %i33 = icmp sgt i32 %i106, 0
  br i1 %i33, label %bb101.bb34_crit_edge, label %bb32.bb107_crit_edge, !llvm.loop !8

bb101.bb34_crit_edge:                             ; preds = %bb101
  br label %bb34

bb32.bb107_crit_edge:                             ; preds = %bb101
  %split = phi i32 [ %.3, %bb101 ]
  %split10 = phi ptr [ %.17, %bb101 ]
  %split11 = phi i32 [ %.2, %bb101 ]
  %split12 = phi i32 [ %.1, %bb101 ]
  %split13 = phi i32 [ %i104, %bb101 ]
  br label %bb107

bb107:                                            ; preds = %bb.bb107_crit_edge, %bb32.bb107_crit_edge
  %.011.lcssa = phi i32 [ %split, %bb32.bb107_crit_edge ], [ %i25, %bb.bb107_crit_edge ]
  %.06.lcssa = phi ptr [ %split10, %bb32.bb107_crit_edge ], [ %arg21, %bb.bb107_crit_edge ]
  %.03.lcssa = phi i32 [ %split11, %bb32.bb107_crit_edge ], [ %i28, %bb.bb107_crit_edge ]
  %.01.lcssa = phi i32 [ %split12, %bb32.bb107_crit_edge ], [ 0, %bb.bb107_crit_edge ]
  %.0.lcssa = phi i32 [ %split13, %bb32.bb107_crit_edge ], [ 1, %bb.bb107_crit_edge ]
  %i108 = icmp ne i32 %.0.lcssa, 0
  br i1 %i108, label %bb107.bb112_crit_edge, label %bb109

bb107.bb112_crit_edge:                            ; preds = %bb107
  br label %bb112

bb109:                                            ; preds = %bb107
  %i110 = trunc i32 %.01.lcssa to i8
  %i111 = getelementptr inbounds i8, ptr %.06.lcssa, i32 1
  store i8 %i110, ptr %.06.lcssa, align 1
  br label %bb112

bb112:                                            ; preds = %bb107.bb112_crit_edge, %bb109
  %i113 = trunc i32 %.011.lcssa to i16
  %i114 = getelementptr inbounds %struct.adpcm_state, ptr %arg23, i32 0, i32 0
  store i16 %i113, ptr %i114, align 2
  %i115 = trunc i32 %.03.lcssa to i8
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
  %i281 = icmp sgt i32 %arg17, 0
  br i1 %i281, label %bb29.lr.ph, label %bb.bb93_crit_edge

bb.bb93_crit_edge:                                ; preds = %bb
  br label %bb93

bb29.lr.ph:                                       ; preds = %bb
  br label %bb29

bb29:                                             ; preds = %bb39.bb29_crit_edge, %bb29.lr.ph
  %.09 = phi i32 [ 0, %bb29.lr.ph ], [ %i42, %bb39.bb29_crit_edge ]
  %.018 = phi i32 [ 0, %bb29.lr.ph ], [ %.1, %bb39.bb29_crit_edge ]
  %.027 = phi i32 [ %arg17, %bb29.lr.ph ], [ %i92, %bb39.bb29_crit_edge ]
  %.036 = phi i32 [ %i23, %bb29.lr.ph ], [ %.2, %bb39.bb29_crit_edge ]
  %.055 = phi ptr [ %arg, %bb29.lr.ph ], [ %.16, %bb39.bb29_crit_edge ]
  %.074 = phi ptr [ %arg16, %bb29.lr.ph ], [ %i90, %bb39.bb29_crit_edge ]
  %.0123 = phi i32 [ %i26, %bb29.lr.ph ], [ %i88, %bb39.bb29_crit_edge ]
  %.0132 = phi i32 [ %i20, %bb29.lr.ph ], [ %.3, %bb39.bb29_crit_edge ]
  %i30 = icmp ne i32 %.09, 0
  br i1 %i30, label %bb31, label %bb33

bb31:                                             ; preds = %bb29
  %i32 = and i32 %.018, 15
  br label %bb39

bb33:                                             ; preds = %bb29
  %i34 = getelementptr inbounds i8, ptr %.055, i32 1
  %i35 = load i8, ptr %.055, align 1
  %i36 = sext i8 %i35 to i32
  %i37 = ashr i32 %i36, 4
  %i38 = and i32 %i37, 15
  br label %bb39

bb39:                                             ; preds = %bb33, %bb31
  %.011 = phi i32 [ %i32, %bb31 ], [ %i38, %bb33 ]
  %.16 = phi ptr [ %.055, %bb31 ], [ %i34, %bb33 ]
  %.1 = phi i32 [ %.018, %bb31 ], [ %i36, %bb33 ]
  %i40 = icmp ne i32 %.09, 0
  %i41 = xor i1 %i40, true
  %i42 = zext i1 %i41 to i32
  %i43 = sext i32 %.011 to i64
  %i44 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %i43
  %i45 = load i32, ptr %i44, align 4
  %i46 = add nsw i32 %.036, %i45
  %i47 = icmp slt i32 %i46, 0
  %spec.select = select i1 %i47, i32 0, i32 %i46
  %i50 = icmp sgt i32 %spec.select, 88
  %.2 = select i1 %i50, i32 88, i32 %spec.select
  %i53 = and i32 %.011, 8
  %i54 = and i32 %.011, 7
  %i55 = ashr i32 %.0123, 3
  %i56 = and i32 %i54, 4
  %i57 = icmp ne i32 %i56, 0
  %i59 = add nsw i32 %i55, %.0123
  %.08 = select i1 %i57, i32 %i59, i32 %i55
  %i61 = and i32 %i54, 2
  %i62 = icmp ne i32 %i61, 0
  %i64 = ashr i32 %.0123, 1
  %i65 = add nsw i32 %.08, %i64
  %.19 = select i1 %i62, i32 %i65, i32 %.08
  %i67 = and i32 %i54, 1
  %i68 = icmp ne i32 %i67, 0
  %i70 = ashr i32 %.0123, 2
  %i71 = add nsw i32 %.19, %i70
  %.210 = select i1 %i68, i32 %i71, i32 %.19
  %i73 = icmp ne i32 %i53, 0
  %i75 = sub nsw i32 %.0132, %.210
  %i77 = add nsw i32 %.0132, %.210
  %.114 = select i1 %i73, i32 %i75, i32 %i77
  %i79 = icmp sgt i32 %.114, 32767
  %i82 = icmp slt i32 %.114, -32768
  %spec.select1 = select i1 %i82, i32 -32768, i32 %.114
  %.3 = select i1 %i79, i32 32767, i32 %spec.select1
  %i86 = sext i32 %.2 to i64
  %i87 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i86
  %i88 = load i32, ptr %i87, align 4
  %i89 = trunc i32 %.3 to i16
  %i90 = getelementptr inbounds i16, ptr %.074, i32 1
  store i16 %i89, ptr %.074, align 2
  %i92 = add nsw i32 %.027, -1
  %i28 = icmp sgt i32 %i92, 0
  br i1 %i28, label %bb39.bb29_crit_edge, label %bb27.bb93_crit_edge, !llvm.loop !10

bb39.bb29_crit_edge:                              ; preds = %bb39
  br label %bb29

bb27.bb93_crit_edge:                              ; preds = %bb39
  %split = phi i32 [ %.3, %bb39 ]
  %split10 = phi i32 [ %.2, %bb39 ]
  br label %bb93

bb93:                                             ; preds = %bb.bb93_crit_edge, %bb27.bb93_crit_edge
  %.013.lcssa = phi i32 [ %split, %bb27.bb93_crit_edge ], [ %i20, %bb.bb93_crit_edge ]
  %.03.lcssa = phi i32 [ %split10, %bb27.bb93_crit_edge ], [ %i23, %bb.bb93_crit_edge ]
  %i94 = trunc i32 %.013.lcssa to i16
  %i95 = getelementptr inbounds %struct.adpcm_state, ptr %arg18, i32 0, i32 0
  store i16 %i94, ptr %i95, align 2
  %i96 = trunc i32 %.03.lcssa to i8
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
  call void @exit(i32 noundef 1) #4
  unreachable

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i2, ptr noundef @.str.3, ptr noundef %i)
  %i9 = call i32 @fclose(ptr noundef %i2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %i1, ptr align 2 @state, i64 4, i1 false)
  %i114 = call i64 @read(i32 noundef 0, ptr noundef @sbuf, i64 noundef 2000)
  %i125 = trunc i64 %i114 to i32
  %i136 = icmp slt i32 %i125, 0
  br i1 %i136, label %bb7.bb14_crit_edge, label %bb15.lr.ph

bb7.bb14_crit_edge:                               ; preds = %bb7
  br label %bb14

bb15.lr.ph:                                       ; preds = %bb7
  br label %bb15

bb10.bb14_crit_edge:                              ; preds = %bb26
  br label %bb14

bb14:                                             ; preds = %bb7.bb14_crit_edge, %bb10.bb14_crit_edge
  call void @perror(ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #4
  unreachable

bb15:                                             ; preds = %bb26.bb15_crit_edge, %bb15.lr.ph
  %i127 = phi i32 [ %i125, %bb15.lr.ph ], [ %i12, %bb26.bb15_crit_edge ]
  %i16 = icmp eq i32 %i127, 0
  br i1 %i16, label %bb30, label %bb19.preheader

bb19.preheader:                                   ; preds = %bb15
  %i201 = load i64, ptr %i, align 8
  %i212 = icmp slt i64 0, %i201
  br i1 %i212, label %bb22.lr.ph, label %bb19.preheader.bb26_crit_edge

bb19.preheader.bb26_crit_edge:                    ; preds = %bb19.preheader
  br label %bb26

bb22.lr.ph:                                       ; preds = %bb19.preheader
  br label %bb22

bb22:                                             ; preds = %bb22.bb22_crit_edge, %bb22.lr.ph
  %.03 = phi i64 [ 0, %bb22.lr.ph ], [ %i25, %bb22.bb22_crit_edge ]
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 @state, ptr align 2 %i1, i64 4, i1 false)
  %i23 = sdiv i32 %i127, 2
  call void @adpcm_coder(ptr noundef @sbuf, ptr noundef @abuf, i32 noundef %i23, ptr noundef @state)
  %i25 = add nuw nsw i64 %.03, 1
  %i20 = load i64, ptr %i, align 8
  %i21 = icmp slt i64 %i25, %i20
  br i1 %i21, label %bb22.bb22_crit_edge, label %bb19.bb26_crit_edge, !llvm.loop !11

bb22.bb22_crit_edge:                              ; preds = %bb22
  br label %bb22

bb19.bb26_crit_edge:                              ; preds = %bb22
  br label %bb26

bb26:                                             ; preds = %bb19.preheader.bb26_crit_edge, %bb19.bb26_crit_edge
  %i27 = sdiv i32 %i127, 4
  %i28 = sext i32 %i27 to i64
  %i29 = call i64 @write(i32 noundef 1, ptr noundef @abuf, i64 noundef %i28)
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %i1, ptr align 2 @state, i64 4, i1 false)
  %i11 = call i64 @read(i32 noundef 0, ptr noundef @sbuf, i64 noundef 2000)
  %i12 = trunc i64 %i11 to i32
  %i13 = icmp slt i32 %i12, 0
  br i1 %i13, label %bb10.bb14_crit_edge, label %bb26.bb15_crit_edge

bb26.bb15_crit_edge:                              ; preds = %bb26
  br label %bb15

bb30:                                             ; preds = %bb15
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #1

declare void @perror(ptr noundef) #1

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noreturn nounwind }

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
