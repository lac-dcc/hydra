; ModuleID = 'security_sha.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.SHA_INFO = type { [5 x i64], i64, i64, [16 x i64] }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@stdin = external global ptr, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@stderr = external global ptr, align 8
@.str.1.5 = private unnamed_addr constant [30 x i8] c"error opening %s for reading\0A\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"%08lx %08lx %08lx %08lx %08lx\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) #0 {
bb:
  %i = alloca i64, align 8
  %i3 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %i4 = icmp eq ptr %i3, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef @.str.2)
  br label %bb23

bb8:                                              ; preds = %bb
  %i9 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i3, ptr noundef @.str.3, ptr noundef %i)
  %i10 = call i32 @fclose(ptr noundef %i3)
  br label %bb11

bb11:                                             ; preds = %bb14, %bb8
  %.01 = phi i64 [ 0, %bb8 ], [ %i15, %bb14 ]
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %.01, %i12
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb11
  %i15 = add nsw i64 %.01, 1
  %i17 = icmp eq i64 %i15, %i12
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  br label %bb11, !llvm.loop !8

bb22:                                             ; preds = %bb11
  br label %bb23

bb23:                                             ; preds = %bb22, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb22 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %arg3) #0 {
bb:
  %i = alloca %struct.SHA_INFO, align 8
  %i4 = icmp slt i32 %arg, 2
  br i1 %i4, label %bb5, label %bb10

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stdin, align 8
  call void @sha_stream(ptr noundef %i, ptr noundef %i6)
  %i7 = icmp ne i32 %arg3, 0
  br i1 %i7, label %bb8, label %bb5.bb9_crit_edge

bb5.bb9_crit_edge:                                ; preds = %bb5
  br label %bb9

bb8:                                              ; preds = %bb5
  call void @sha_print(ptr noundef %i)
  br label %bb9

bb9:                                              ; preds = %bb5.bb9_crit_edge, %bb8
  br label %bb30

bb10:                                             ; preds = %bb
  br label %bb11

bb11:                                             ; preds = %bb26, %bb10
  %.01 = phi ptr [ %arg2, %bb10 ], [ %i15, %bb26 ]
  %.0 = phi i32 [ %arg, %bb10 ], [ %i12, %bb26 ]
  %i12 = add nsw i32 %.0, -1
  %i13 = icmp ne i32 %i12, 0
  br i1 %i13, label %bb14, label %bb29

bb14:                                             ; preds = %bb11
  %i15 = getelementptr inbounds ptr, ptr %.01, i32 1
  %i16 = load ptr, ptr %i15, align 8
  %i17 = call noalias ptr @fopen(ptr noundef %i16, ptr noundef @.str.4)
  %i18 = icmp eq ptr %i17, null
  br i1 %i18, label %bb19, label %bb23

bb19:                                             ; preds = %bb14
  %i20 = load ptr, ptr @stderr, align 8
  %i21 = load ptr, ptr %i15, align 8
  %i22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i20, ptr noundef @.str.1.5, ptr noundef %i21)
  call void @exit(i32 noundef 1) #5
  unreachable

bb23:                                             ; preds = %bb14
  call void @sha_stream(ptr noundef %i, ptr noundef %i17)
  %i24 = icmp ne i32 %arg3, 0
  br i1 %i24, label %bb25, label %bb23.bb26_crit_edge

bb23.bb26_crit_edge:                              ; preds = %bb23
  br label %bb26

bb25:                                             ; preds = %bb23
  call void @sha_print(ptr noundef %i)
  br label %bb26

bb26:                                             ; preds = %bb23.bb26_crit_edge, %bb25
  %i27 = call i32 @fclose(ptr noundef %i17)
  br label %bb11, !llvm.loop !10

bb29:                                             ; preds = %bb11
  br label %bb30

bb30:                                             ; preds = %bb29, %bb9
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_init(ptr noundef %arg) #0 {
bb:
  store i64 1732584193, ptr %arg, align 8
  %i3 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  store i64 4023233417, ptr %i3, align 8
  %i5 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  store i64 2562383102, ptr %i5, align 8
  %i7 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  store i64 271733878, ptr %i7, align 8
  %i9 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  store i64 3285377520, ptr %i9, align 8
  %i10 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 1
  store i64 0, ptr %i10, align 8
  %i11 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 2
  store i64 0, ptr %i11, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_update(ptr noundef %arg, ptr noundef %arg2, i32 noundef %arg3) #0 {
bb:
  %i = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 1
  %i4 = load i64, ptr %i, align 8
  %i5 = sext i32 %arg3 to i64
  %i6 = shl i64 %i5, 3
  %i7 = add i64 %i4, %i6
  %i10 = icmp ult i64 %i7, %i4
  br i1 %i10, label %bb11, label %bb.bb15_crit_edge

bb.bb15_crit_edge:                                ; preds = %bb
  %i23.phi.trans.insert = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 2
  %i24.pre = load i64, ptr %i23.phi.trans.insert, align 8
  br label %bb15

bb11:                                             ; preds = %bb
  %i12 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 2
  %i13 = load i64, ptr %i12, align 8
  %i14 = add i64 %i13, 1
  store i64 %i14, ptr %i12, align 8
  br label %bb15

bb15:                                             ; preds = %bb11, %bb.bb15_crit_edge
  %i24 = phi i64 [ %i24.pre, %bb.bb15_crit_edge ], [ %i14, %bb11 ]
  store i64 %i7, ptr %i, align 8
  %i22 = lshr i64 %i5, 29
  %i23 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 2
  %i25 = add i64 %i24, %i22
  store i64 %i25, ptr %i23, align 8
  br label %bb26

bb26:                                             ; preds = %bb28, %bb15
  %.01 = phi ptr [ %arg2, %bb15 ], [ %i33, %bb28 ]
  %.0 = phi i32 [ %arg3, %bb15 ], [ %i34, %bb28 ]
  %i27 = icmp sge i32 %.0, 64
  br i1 %i27, label %bb28, label %bb35

bb28:                                             ; preds = %bb26
  %i29 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 3
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %i29, ptr align 1 %.01, i64 64, i1 false)
  call void @byte_reverse(ptr noundef %i29, i32 noundef 64)
  call void @sha_transform(ptr noundef %arg)
  %i33 = getelementptr inbounds i8, ptr %.01, i64 64
  %i34 = sub nsw i32 %.0, 64
  br label %bb26, !llvm.loop !11

bb35:                                             ; preds = %bb26
  %i36 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 3
  %i38 = sext i32 %.0 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %i36, ptr align 1 %.01, i64 %i38, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define internal void @byte_reverse(ptr noundef %arg, i32 noundef %arg2) #0 {
bb:
  %i = alloca [4 x i8], align 1
  %i3 = sext i32 %arg2 to i64
  %i4 = udiv i64 %i3, 8
  %i5 = trunc i64 %i4 to i32
  br label %bb6

bb6:                                              ; preds = %bb8, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i35, %bb8 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i33, %bb8 ]
  %i7 = icmp slt i32 %.01, %i5
  br i1 %i7, label %bb8, label %bb36

bb8:                                              ; preds = %bb6
  %i10 = load i8, ptr %.0, align 1
  store i8 %i10, ptr %i, align 1
  %i12 = getelementptr inbounds i8, ptr %.0, i64 1
  %i13 = load i8, ptr %i12, align 1
  %i14 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 1
  store i8 %i13, ptr %i14, align 1
  %i15 = getelementptr inbounds i8, ptr %.0, i64 2
  %i16 = load i8, ptr %i15, align 1
  %i17 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 2
  store i8 %i16, ptr %i17, align 1
  %i18 = getelementptr inbounds i8, ptr %.0, i64 3
  %i19 = load i8, ptr %i18, align 1
  %i20 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 3
  store i8 %i19, ptr %i20, align 1
  store i8 %i19, ptr %.0, align 1
  store i8 %i16, ptr %i12, align 1
  store i8 %i13, ptr %i15, align 1
  store i8 %i10, ptr %i18, align 1
  %i33 = getelementptr inbounds i8, ptr %.0, i64 8
  %i35 = add nsw i32 %.01, 1
  br label %bb6, !llvm.loop !12

bb36:                                             ; preds = %bb6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sha_transform(ptr noundef %arg) #0 {
bb:
  %i = alloca [80 x i64], align 16
  br label %bb21

bb21:                                             ; preds = %bb23, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i31, %bb23 ]
  %i22 = icmp slt i32 %.01, 16
  br i1 %i22, label %bb23, label %bb32

bb23:                                             ; preds = %bb21
  %i24 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 3
  %i25 = sext i32 %.01 to i64
  %i26 = getelementptr inbounds [16 x i64], ptr %i24, i64 0, i64 %i25
  %i27 = load i64, ptr %i26, align 8
  %i29 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i25
  store i64 %i27, ptr %i29, align 8
  %i31 = add nsw i32 %.01, 1
  br label %bb21, !llvm.loop !13

bb32:                                             ; preds = %bb21
  br label %bb33

bb33:                                             ; preds = %bb35, %bb32
  %.12 = phi i32 [ 16, %bb32 ], [ %i58, %bb35 ]
  %i34 = icmp slt i32 %.12, 80
  br i1 %i34, label %bb35, label %bb59

bb35:                                             ; preds = %bb33
  %i36 = sub nsw i32 %.12, 3
  %i37 = sext i32 %i36 to i64
  %i38 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i37
  %i39 = load i64, ptr %i38, align 8
  %i40 = sub nsw i32 %.12, 8
  %i41 = sext i32 %i40 to i64
  %i42 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i41
  %i43 = load i64, ptr %i42, align 8
  %i44 = xor i64 %i39, %i43
  %i45 = sub nsw i32 %.12, 14
  %i46 = sext i32 %i45 to i64
  %i47 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i46
  %i48 = load i64, ptr %i47, align 8
  %i49 = xor i64 %i44, %i48
  %i50 = sub nsw i32 %.12, 16
  %i51 = sext i32 %i50 to i64
  %i52 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i51
  %i53 = load i64, ptr %i52, align 8
  %i54 = xor i64 %i49, %i53
  %i55 = sext i32 %.12 to i64
  %i56 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i55
  store i64 %i54, ptr %i56, align 8
  %i58 = add nsw i32 %.12, 1
  br label %bb33, !llvm.loop !14

bb59:                                             ; preds = %bb33
  %i62 = load i64, ptr %arg, align 8
  %i64 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  %i65 = load i64, ptr %i64, align 8
  %i67 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  %i68 = load i64, ptr %i67, align 8
  %i70 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  %i71 = load i64, ptr %i70, align 8
  %i73 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  %i74 = load i64, ptr %i73, align 8
  br label %bb75

bb75:                                             ; preds = %bb77, %bb59
  %.017 = phi i64 [ %i71, %bb59 ], [ %.013, %bb77 ]
  %.013 = phi i64 [ %i68, %bb59 ], [ %i94, %bb77 ]
  %.09 = phi i64 [ %i65, %bb59 ], [ %.05, %bb77 ]
  %.05 = phi i64 [ %i62, %bb59 ], [ %i91, %bb77 ]
  %.23 = phi i32 [ 0, %bb59 ], [ %i96, %bb77 ]
  %.0 = phi i64 [ %i74, %bb59 ], [ %.017, %bb77 ]
  %i76 = icmp slt i32 %.23, 20
  br i1 %i76, label %bb77, label %bb97

bb77:                                             ; preds = %bb75
  %i78 = shl i64 %.05, 5
  %i79 = lshr i64 %.05, 27
  %i80 = or i64 %i78, %i79
  %i81 = and i64 %.09, %.013
  %i82 = xor i64 %.09, -1
  %i83 = and i64 %i82, %.017
  %i84 = or i64 %i81, %i83
  %i85 = add i64 %i80, %i84
  %i86 = add i64 %i85, %.0
  %i87 = sext i32 %.23 to i64
  %i88 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i87
  %i89 = load i64, ptr %i88, align 8
  %i90 = add i64 %i86, %i89
  %i91 = add i64 %i90, 1518500249
  %i92 = shl i64 %.09, 30
  %i93 = lshr i64 %.09, 2
  %i94 = or i64 %i92, %i93
  %i96 = add nsw i32 %.23, 1
  br label %bb75, !llvm.loop !15

bb97:                                             ; preds = %bb75
  br label %bb98

bb98:                                             ; preds = %bb100, %bb97
  %.118 = phi i64 [ %.017, %bb97 ], [ %.114, %bb100 ]
  %.114 = phi i64 [ %.013, %bb97 ], [ %i115, %bb100 ]
  %.110 = phi i64 [ %.09, %bb97 ], [ %.16, %bb100 ]
  %.16 = phi i64 [ %.05, %bb97 ], [ %i112, %bb100 ]
  %.34 = phi i32 [ 20, %bb97 ], [ %i117, %bb100 ]
  %.1 = phi i64 [ %.0, %bb97 ], [ %.118, %bb100 ]
  %i99 = icmp slt i32 %.34, 40
  br i1 %i99, label %bb100, label %bb118

bb100:                                            ; preds = %bb98
  %i101 = shl i64 %.16, 5
  %i102 = lshr i64 %.16, 27
  %i103 = or i64 %i101, %i102
  %i104 = xor i64 %.110, %.114
  %i105 = xor i64 %i104, %.118
  %i106 = add i64 %i103, %i105
  %i107 = add i64 %i106, %.1
  %i108 = sext i32 %.34 to i64
  %i109 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i108
  %i110 = load i64, ptr %i109, align 8
  %i111 = add i64 %i107, %i110
  %i112 = add i64 %i111, 1859775393
  %i113 = shl i64 %.110, 30
  %i114 = lshr i64 %.110, 2
  %i115 = or i64 %i113, %i114
  %i117 = add nsw i32 %.34, 1
  br label %bb98, !llvm.loop !16

bb118:                                            ; preds = %bb98
  br label %bb119

bb119:                                            ; preds = %bb121, %bb118
  %.219 = phi i64 [ %.118, %bb118 ], [ %.215, %bb121 ]
  %.215 = phi i64 [ %.114, %bb118 ], [ %i139, %bb121 ]
  %.211 = phi i64 [ %.110, %bb118 ], [ %.27, %bb121 ]
  %.27 = phi i64 [ %.16, %bb118 ], [ %i136, %bb121 ]
  %.4 = phi i32 [ 40, %bb118 ], [ %i141, %bb121 ]
  %.2 = phi i64 [ %.1, %bb118 ], [ %.219, %bb121 ]
  %i120 = icmp slt i32 %.4, 60
  br i1 %i120, label %bb121, label %bb142

bb121:                                            ; preds = %bb119
  %i122 = shl i64 %.27, 5
  %i123 = lshr i64 %.27, 27
  %i124 = or i64 %i122, %i123
  %i125 = and i64 %.211, %.215
  %i126 = and i64 %.211, %.219
  %i127 = or i64 %i125, %i126
  %i128 = and i64 %.215, %.219
  %i129 = or i64 %i127, %i128
  %i130 = add i64 %i124, %i129
  %i131 = add i64 %i130, %.2
  %i132 = sext i32 %.4 to i64
  %i133 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i132
  %i134 = load i64, ptr %i133, align 8
  %i135 = add i64 %i131, %i134
  %i136 = add i64 %i135, 2400959708
  %i137 = shl i64 %.211, 30
  %i138 = lshr i64 %.211, 2
  %i139 = or i64 %i137, %i138
  %i141 = add nsw i32 %.4, 1
  br label %bb119, !llvm.loop !17

bb142:                                            ; preds = %bb119
  br label %bb143

bb143:                                            ; preds = %bb145, %bb142
  %.320 = phi i64 [ %.219, %bb142 ], [ %.316, %bb145 ]
  %.316 = phi i64 [ %.215, %bb142 ], [ %i160, %bb145 ]
  %.312 = phi i64 [ %.211, %bb142 ], [ %.38, %bb145 ]
  %.38 = phi i64 [ %.27, %bb142 ], [ %i157, %bb145 ]
  %.5 = phi i32 [ 60, %bb142 ], [ %i162, %bb145 ]
  %.3 = phi i64 [ %.2, %bb142 ], [ %.320, %bb145 ]
  %i144 = icmp slt i32 %.5, 80
  br i1 %i144, label %bb145, label %bb163

bb145:                                            ; preds = %bb143
  %i146 = shl i64 %.38, 5
  %i147 = lshr i64 %.38, 27
  %i148 = or i64 %i146, %i147
  %i149 = xor i64 %.312, %.316
  %i150 = xor i64 %i149, %.320
  %i151 = add i64 %i148, %i150
  %i152 = add i64 %i151, %.3
  %i153 = sext i32 %.5 to i64
  %i154 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i153
  %i155 = load i64, ptr %i154, align 8
  %i156 = add i64 %i152, %i155
  %i157 = add i64 %i156, 3395469782
  %i158 = shl i64 %.312, 30
  %i159 = lshr i64 %.312, 2
  %i160 = or i64 %i158, %i159
  %i162 = add nsw i32 %.5, 1
  br label %bb143, !llvm.loop !18

bb163:                                            ; preds = %bb143
  %i167 = add i64 %i62, %.38
  store i64 %i167, ptr %arg, align 8
  %i171 = add i64 %i65, %.312
  store i64 %i171, ptr %i64, align 8
  %i175 = add i64 %i68, %.316
  store i64 %i175, ptr %i67, align 8
  %i179 = add i64 %i71, %.320
  store i64 %i179, ptr %i70, align 8
  %i183 = add i64 %i74, %.3
  store i64 %i183, ptr %i73, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_final(ptr noundef %arg) #0 {
bb:
  %i = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 1
  %i1 = load i64, ptr %i, align 8
  %i2 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 2
  %i3 = load i64, ptr %i2, align 8
  %i4 = lshr i64 %i1, 3
  %i5 = and i64 %i4, 63
  %i6 = trunc i64 %i5 to i32
  %i7 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i32 0, i32 3
  %i9 = add nsw i32 %i6, 1
  %i10 = sext i32 %i6 to i64
  %i11 = getelementptr inbounds i8, ptr %i7, i64 %i10
  store i8 -128, ptr %i11, align 1
  %i12 = icmp sgt i32 %i9, 56
  br i1 %i12, label %bb13, label %bb22

bb13:                                             ; preds = %bb
  %i15 = sext i32 %i9 to i64
  %i16 = getelementptr inbounds i8, ptr %i7, i64 %i15
  %i17 = sub nsw i32 64, %i9
  %i18 = sext i32 %i17 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %i16, i8 0, i64 %i18, i1 false)
  call void @byte_reverse(ptr noundef %i7, i32 noundef 64)
  call void @sha_transform(ptr noundef %arg)
  call void @llvm.memset.p0.i64(ptr align 8 %i7, i8 0, i64 56, i1 false)
  br label %bb28

bb22:                                             ; preds = %bb
  %i24 = sext i32 %i9 to i64
  %i25 = getelementptr inbounds i8, ptr %i7, i64 %i24
  %i26 = sub nsw i32 56, %i9
  %i27 = sext i32 %i26 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %i25, i8 0, i64 %i27, i1 false)
  br label %bb28

bb28:                                             ; preds = %bb22, %bb13
  call void @byte_reverse(ptr noundef %i7, i32 noundef 64)
  %i32 = getelementptr inbounds [16 x i64], ptr %i7, i64 0, i64 14
  store i64 %i3, ptr %i32, align 8
  %i34 = getelementptr inbounds [16 x i64], ptr %i7, i64 0, i64 15
  store i64 %i1, ptr %i34, align 8
  call void @sha_transform(ptr noundef %arg)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_stream(ptr noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = alloca [8192 x i8], align 16
  call void @sha_init(ptr noundef %arg)
  br label %bb2

bb2:                                              ; preds = %bb7, %bb
  %i4 = call i64 @fread(ptr noundef %i, i64 noundef 1, i64 noundef 8192, ptr noundef %arg1)
  %i5 = trunc i64 %i4 to i32
  %i6 = icmp sgt i32 %i5, 0
  br i1 %i6, label %bb7, label %bb9

bb7:                                              ; preds = %bb2
  call void @sha_update(ptr noundef %arg, ptr noundef %i, i32 noundef %i5)
  br label %bb2, !llvm.loop !19

bb9:                                              ; preds = %bb2
  call void @sha_final(ptr noundef %arg)
  ret void
}

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_print(ptr noundef %arg) #0 {
bb:
  %i2 = load i64, ptr %arg, align 8
  %i4 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  %i5 = load i64, ptr %i4, align 8
  %i7 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  %i8 = load i64, ptr %i7, align 8
  %i10 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  %i11 = load i64, ptr %i10, align 8
  %i13 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  %i14 = load i64, ptr %i13, align 8
  %i15 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i64 noundef %i2, i64 noundef %i5, i64 noundef %i8, i64 noundef %i11, i64 noundef %i14)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0}
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
