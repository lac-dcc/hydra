; ModuleID = 'automotive_bitcount.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i64 }
%struct.bfile = type { ptr, i8, i8, i8, i8 }

@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits.1 = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@main1.pBitCntFunc = internal global [7 x ptr] [ptr @bit_count, ptr @bitcount, ptr @ntbl_bitcnt, ptr @ntbl_bitcount, ptr @BW_btbl_bitcount, ptr @AR_btbl_bitcount, ptr @bit_shifter], align 16
@main1.text = internal global [7 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6], align 16
@.str = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"%-38s> Bits: %ld\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"01\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1.12 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global ptr, align 8
@.str.2.13 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3.14 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @alloc_bit_array(i64 noundef %arg) #0 {
bb:
  %i = add i64 %arg, 8
  %i1 = sub i64 %i, 1
  %i2 = udiv i64 %i1, 8
  %i3 = call noalias ptr @calloc(i64 noundef %i2, i64 noundef 1) #8
  ret ptr %i3
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getbit(ptr noundef %arg, i32 noundef %arg1) #0 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i4 = load i8, ptr %i3, align 1
  %i5 = sext i8 %i4 to i32
  %i6 = srem i32 %arg1, 8
  %i7 = shl i32 1, %i6
  %i8 = and i32 %i5, %i7
  %i9 = icmp ne i32 %i8, 0
  %i10 = zext i1 %i9 to i32
  ret i32 %i10
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @setbit(ptr noundef %arg, i32 noundef %arg1, i32 noundef %arg2) #0 {
bb:
  %i = sdiv i32 %arg1, 8
  %i3 = sext i32 %i to i64
  %i4 = getelementptr inbounds i8, ptr %arg, i64 %i3
  %i5 = icmp ne i32 %arg2, 0
  br i1 %i5, label %bb6, label %bb13

bb6:                                              ; preds = %bb
  %i7 = srem i32 %arg1, 8
  %i8 = shl i32 1, %i7
  %i9 = load i8, ptr %i4, align 1
  %i10 = sext i8 %i9 to i32
  %i11 = or i32 %i10, %i8
  %i12 = trunc i32 %i11 to i8
  store i8 %i12, ptr %i4, align 1
  br label %bb21

bb13:                                             ; preds = %bb
  %i14 = srem i32 %arg1, 8
  %i15 = shl i32 1, %i14
  %i16 = xor i32 %i15, -1
  %i17 = load i8, ptr %i4, align 1
  %i18 = sext i8 %i17 to i32
  %i19 = and i32 %i18, %i16
  %i20 = trunc i32 %i19 to i8
  store i8 %i20, ptr %i4, align 1
  br label %bb21

bb21:                                             ; preds = %bb13, %bb6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @flipbit(ptr noundef %arg, i32 noundef %arg1) #0 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i4 = srem i32 %arg1, 8
  %i5 = shl i32 1, %i4
  %i6 = load i8, ptr %i3, align 1
  %i7 = sext i8 %i6 to i32
  %i8 = xor i32 %i7, %i5
  %i9 = trunc i32 %i8 to i8
  store i8 %i9, ptr %i3, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bit_count(i64 noundef %arg) #0 {
bb:
  %i = icmp ne i64 %arg, 0
  br i1 %i, label %bb2, label %bb.bb10_crit_edge

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb2:                                              ; preds = %bb
  br label %bb3

bb3:                                              ; preds = %bb5.bb3_crit_edge, %bb2
  %.01 = phi i32 [ 0, %bb2 ], [ %i4, %bb5.bb3_crit_edge ]
  %.0 = phi i64 [ %arg, %bb2 ], [ %i7, %bb5.bb3_crit_edge ]
  %i4 = add nuw nsw i32 %.01, 1
  br label %bb5

bb5:                                              ; preds = %bb3
  %i6 = sub nsw i64 %.0, 1
  %i7 = and i64 %.0, %i6
  %i8 = icmp ne i64 0, %i7
  br i1 %i8, label %bb5.bb3_crit_edge, label %bb9, !llvm.loop !8

bb5.bb3_crit_edge:                                ; preds = %bb5
  br label %bb3

bb9:                                              ; preds = %bb5
  %i4.lcssa = phi i32 [ %i4, %bb5 ]
  br label %bb10

bb10:                                             ; preds = %bb9, %bb.bb10_crit_edge
  %.1 = phi i32 [ %i4.lcssa, %bb9 ], [ 0, %bb.bb10_crit_edge ]
  ret i32 %.1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bitcount(i64 noundef %arg) #0 {
bb:
  %i = and i64 %arg, 2863311530
  %i1 = ashr i64 %i, 1
  %i2 = and i64 %arg, 1431655765
  %i3 = add nsw i64 %i1, %i2
  %i4 = and i64 %i3, 3435973836
  %i5 = ashr i64 %i4, 2
  %i6 = and i64 %i3, 858993459
  %i7 = add nsw i64 %i5, %i6
  %i8 = and i64 %i7, 4042322160
  %i9 = ashr i64 %i8, 4
  %i10 = and i64 %i7, 252645135
  %i11 = add nsw i64 %i9, %i10
  %i12 = and i64 %i11, 4278255360
  %i13 = ashr i64 %i12, 8
  %i14 = and i64 %i11, 16711935
  %i15 = add nsw i64 %i13, %i14
  %i16 = and i64 %i15, 4294901760
  %i17 = ashr i64 %i16, 16
  %i18 = and i64 %i15, 65535
  %i19 = add nsw i64 %i17, %i18
  %i20 = trunc i64 %i19 to i32
  ret i32 %i20
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcount(i64 noundef %arg) #0 {
bb:
  %i = and i64 %arg, 15
  %i1 = trunc i64 %i to i32
  %i2 = sext i32 %i1 to i64
  %i3 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i2
  %i4 = load i8, ptr %i3, align 1
  %i5 = sext i8 %i4 to i32
  %i6 = and i64 %arg, 240
  %i7 = lshr i64 %i6, 4
  %i8 = trunc i64 %i7 to i32
  %i9 = sext i32 %i8 to i64
  %i10 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i9
  %i11 = load i8, ptr %i10, align 1
  %i12 = sext i8 %i11 to i32
  %i13 = add nsw i32 %i5, %i12
  %i14 = and i64 %arg, 3840
  %i15 = lshr i64 %i14, 8
  %i16 = trunc i64 %i15 to i32
  %i17 = sext i32 %i16 to i64
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i13, %i20
  %i22 = and i64 %arg, 61440
  %i23 = lshr i64 %i22, 12
  %i24 = trunc i64 %i23 to i32
  %i25 = sext i32 %i24 to i64
  %i26 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i25
  %i27 = load i8, ptr %i26, align 1
  %i28 = sext i8 %i27 to i32
  %i29 = add nsw i32 %i21, %i28
  %i30 = and i64 %arg, 983040
  %i31 = lshr i64 %i30, 16
  %i32 = trunc i64 %i31 to i32
  %i33 = sext i32 %i32 to i64
  %i34 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i33
  %i35 = load i8, ptr %i34, align 1
  %i36 = sext i8 %i35 to i32
  %i37 = add nsw i32 %i29, %i36
  %i38 = and i64 %arg, 15728640
  %i39 = lshr i64 %i38, 20
  %i40 = trunc i64 %i39 to i32
  %i41 = sext i32 %i40 to i64
  %i42 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i41
  %i43 = load i8, ptr %i42, align 1
  %i44 = sext i8 %i43 to i32
  %i45 = add nsw i32 %i37, %i44
  %i46 = and i64 %arg, 251658240
  %i47 = lshr i64 %i46, 24
  %i48 = trunc i64 %i47 to i32
  %i49 = sext i32 %i48 to i64
  %i50 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i49
  %i51 = load i8, ptr %i50, align 1
  %i52 = sext i8 %i51 to i32
  %i53 = add nsw i32 %i45, %i52
  %i54 = and i64 %arg, 4026531840
  %i55 = lshr i64 %i54, 28
  %i56 = trunc i64 %i55 to i32
  %i57 = sext i32 %i56 to i64
  %i58 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i57
  %i59 = load i8, ptr %i58, align 1
  %i60 = sext i8 %i59 to i32
  %i61 = add nsw i32 %i53, %i60
  ret i32 %i61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @BW_btbl_bitcount(i64 noundef %arg) #0 {
bb:
  %i = alloca %union.anon, align 8
  store i64 %arg, ptr %i, align 8
  %i1 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 0
  %i2 = load i8, ptr %i1, align 8
  %i3 = zext i8 %i2 to i64
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1
  %i6 = sext i8 %i5 to i32
  %i7 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 1
  %i8 = load i8, ptr %i7, align 1
  %i9 = zext i8 %i8 to i64
  %i10 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i9
  %i11 = load i8, ptr %i10, align 1
  %i12 = sext i8 %i11 to i32
  %i13 = add nsw i32 %i6, %i12
  %i14 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 3
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i16
  %i18 = load i8, ptr %i17, align 1
  %i19 = sext i8 %i18 to i32
  %i20 = add nsw i32 %i13, %i19
  %i21 = getelementptr inbounds [4 x i8], ptr %i, i64 0, i64 2
  %i22 = load i8, ptr %i21, align 2
  %i23 = zext i8 %i22 to i64
  %i24 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i23
  %i25 = load i8, ptr %i24, align 1
  %i26 = sext i8 %i25 to i32
  %i27 = add nsw i32 %i20, %i26
  ret i32 %i27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @AR_btbl_bitcount(i64 noundef %arg) #0 {
bb:
  %i = alloca i64, align 8
  store i64 %arg, ptr %i, align 8
  %i1 = getelementptr inbounds i8, ptr %i, i32 1
  %i2 = load i8, ptr %i, align 1
  %i3 = zext i8 %i2 to i64
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1
  %i6 = sext i8 %i5 to i32
  %i7 = getelementptr inbounds i8, ptr %i1, i32 1
  %i8 = load i8, ptr %i1, align 1
  %i9 = zext i8 %i8 to i64
  %i10 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i9
  %i11 = load i8, ptr %i10, align 1
  %i12 = sext i8 %i11 to i32
  %i13 = add nsw i32 %i6, %i12
  %i14 = getelementptr inbounds i8, ptr %i7, i32 1
  %i15 = load i8, ptr %i7, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i16
  %i18 = load i8, ptr %i17, align 1
  %i19 = sext i8 %i18 to i32
  %i20 = add nsw i32 %i13, %i19
  %i21 = load i8, ptr %i14, align 1
  %i22 = zext i8 %i21 to i64
  %i23 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i22
  %i24 = load i8, ptr %i23, align 1
  %i25 = sext i8 %i24 to i32
  %i26 = add nsw i32 %i20, %i25
  ret i32 %i26
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcnt(i64 noundef %arg) #0 {
bb:
  %i = and i64 %arg, 15
  %i1 = trunc i64 %i to i32
  %i2 = sext i32 %i1 to i64
  %i3 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i2
  %i4 = load i8, ptr %i3, align 1
  %i5 = sext i8 %i4 to i32
  %i6 = ashr i64 %arg, 4
  %i7 = icmp ne i64 0, %i6
  br i1 %i7, label %bb8, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb8:                                              ; preds = %bb
  %i9 = call i32 @ntbl_bitcnt(i64 noundef %i6)
  %i10 = add nsw i32 %i5, %i9
  br label %bb11

bb11:                                             ; preds = %bb8, %bb.bb11_crit_edge
  %.0 = phi i32 [ %i10, %bb8 ], [ %i5, %bb.bb11_crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %arg) #0 {
bb:
  %i = alloca i64, align 8
  store i64 %arg, ptr %i, align 8
  %i1 = getelementptr inbounds i8, ptr %i, i64 0
  %i2 = load i8, ptr %i1, align 8
  %i3 = sext i8 %i2 to i32
  %i4 = and i32 %i3, 255
  %i5 = sext i32 %i4 to i64
  %i6 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i5
  %i7 = load i8, ptr %i6, align 1
  %i8 = sext i8 %i7 to i32
  %i9 = load i64, ptr %i, align 8
  %i10 = ashr i64 %i9, 8
  store i64 %i10, ptr %i, align 8
  %i11 = icmp ne i64 0, %i10
  br i1 %i11, label %bb12, label %bb.bb16_crit_edge

bb.bb16_crit_edge:                                ; preds = %bb
  br label %bb16

bb12:                                             ; preds = %bb
  %i13 = load i64, ptr %i, align 8
  %i14 = call i32 @btbl_bitcnt(i64 noundef %i13)
  %i15 = add nsw i32 %i8, %i14
  br label %bb16

bb16:                                             ; preds = %bb12, %bb.bb16_crit_edge
  %.0 = phi i32 [ %i15, %bb12 ], [ %i8, %bb.bb16_crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg4, i32 noundef %arg5) #0 {
bb:
  %i = icmp slt i32 %arg, 2
  br i1 %i, label %bb6, label %bb9

bb6:                                              ; preds = %bb
  %i7 = load ptr, ptr @stderr, align 8
  %i8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i7, ptr noundef @.str.7)
  call void @exit(i32 noundef 1) #9
  unreachable

bb9:                                              ; preds = %bb
  %i10 = getelementptr inbounds ptr, ptr %arg4, i64 1
  %i11 = load ptr, ptr %i10, align 8
  %i12 = call i32 @atoi(ptr noundef %i11) #10
  %i13 = icmp ne i32 %arg5, 0
  br i1 %i13, label %bb14, label %bb9.bb16_crit_edge

bb9.bb16_crit_edge:                               ; preds = %bb9
  br label %bb16

bb14:                                             ; preds = %bb9
  %i15 = call i32 @puts(ptr noundef @.str.8)
  br label %bb16

bb16:                                             ; preds = %bb14, %bb9.bb16_crit_edge
  %0 = sext i32 %i12 to i64
  %smax = call i64 @llvm.smax.i64(i64 %0, i64 0)
  %i34 = icmp ne i32 %arg5, 0
  br label %bb17

bb17:                                             ; preds = %bb41, %bb16
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb41 ], [ 0, %bb16 ]
  %exitcond2 = icmp ne i64 %indvars.iv, 7
  br i1 %exitcond2, label %bb19, label %bb43

bb19:                                             ; preds = %bb17
  %i25 = getelementptr inbounds [7 x ptr], ptr @main1.pBitCntFunc, i64 0, i64 %indvars.iv
  br label %bb20

bb20:                                             ; preds = %bb30, %bb19
  %.02 = phi i64 [ 0, %bb19 ], [ %i31, %bb30 ]
  %.01 = phi i64 [ 0, %bb19 ], [ %i29, %bb30 ]
  %.0 = phi i64 [ 1, %bb19 ], [ %i32, %bb30 ]
  %exitcond = icmp ne i64 %.02, %smax
  br i1 %exitcond, label %bb23, label %bb33

bb23:                                             ; preds = %bb20
  %i26 = load ptr, ptr %i25, align 8
  %i27 = call i32 %i26(i64 noundef %.0)
  %i28 = sext i32 %i27 to i64
  %i29 = add nsw i64 %.01, %i28
  br label %bb30

bb30:                                             ; preds = %bb23
  %i31 = add nuw nsw i64 %.02, 1
  %i32 = add nuw nsw i64 %.0, 13
  br label %bb20, !llvm.loop !10

bb33:                                             ; preds = %bb20
  %.01.lcssa = phi i64 [ %.01, %bb20 ]
  br i1 %i34, label %bb35, label %bb33.bb40_crit_edge

bb33.bb40_crit_edge:                              ; preds = %bb33
  br label %bb40

bb35:                                             ; preds = %bb33
  %i37 = getelementptr inbounds [7 x ptr], ptr @main1.text, i64 0, i64 %indvars.iv
  %i38 = load ptr, ptr %i37, align 8
  %i39 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %i38, i64 noundef %.01.lcssa)
  br label %bb40

bb40:                                             ; preds = %bb35, %bb33.bb40_crit_edge
  br label %bb41

bb41:                                             ; preds = %bb40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %bb17, !llvm.loop !11

bb43:                                             ; preds = %bb17
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

declare i32 @puts(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @bit_shifter(i64 noundef %arg) #0 {
bb:
  br label %bb3

bb3:                                              ; preds = %bb13, %bb
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb13 ], [ 0, %bb ]
  %.02 = phi i32 [ 0, %bb ], [ %i12, %bb13 ]
  %.0 = phi i64 [ %arg, %bb ], [ %i15, %bb13 ]
  %i = icmp ne i64 %.0, 0
  br i1 %i, label %bb4, label %bb3.bb7_crit_edge

bb3.bb7_crit_edge:                                ; preds = %bb3
  br label %bb7

bb4:                                              ; preds = %bb3
  %i6 = icmp ult i64 %indvars.iv, 64
  br label %bb7

bb7:                                              ; preds = %bb4, %bb3.bb7_crit_edge
  %i8 = phi i1 [ false, %bb3.bb7_crit_edge ], [ %i6, %bb4 ]
  br i1 %i8, label %bb9, label %bb16

bb9:                                              ; preds = %bb7
  %i10 = and i64 %.0, 1
  %i11 = trunc i64 %i10 to i32
  %i12 = add nsw i32 %.02, %i11
  br label %bb13

bb13:                                             ; preds = %bb9
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %i15 = ashr i64 %.0, 1
  br label %bb3, !llvm.loop !12

bb16:                                             ; preds = %bb7
  %.02.lcssa = phi i32 [ %.02, %bb7 ]
  ret i32 %.02.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bfopen(ptr noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = call noalias ptr @malloc(i64 noundef 16) #11
  %i2 = icmp eq ptr null, %i
  br i1 %i2, label %bb3, label %bb4

bb3:                                              ; preds = %bb
  br label %bb14

bb4:                                              ; preds = %bb
  %i5 = call noalias ptr @fopen(ptr noundef %arg, ptr noundef %arg1)
  %i6 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 0
  store ptr %i5, ptr %i6, align 8
  %i7 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 0
  %i8 = load ptr, ptr %i7, align 8
  %i9 = icmp eq ptr null, %i8
  br i1 %i9, label %bb10, label %bb11

bb10:                                             ; preds = %bb4
  call void @free(ptr noundef %i) #12
  br label %bb14

bb11:                                             ; preds = %bb4
  %i12 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 2
  store i8 0, ptr %i12, align 1
  %i13 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 4
  store i8 0, ptr %i13, align 1
  br label %bb14

bb14:                                             ; preds = %bb11, %bb10, %bb3
  %.0 = phi ptr [ null, %bb3 ], [ null, %bb10 ], [ %i, %bb11 ]
  ret ptr %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bfread(ptr noundef %arg) #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 2
  %i1 = load i8, ptr %i, align 1
  %i2 = sext i8 %i1 to i32
  %i3 = icmp eq i32 0, %i2
  br i1 %i3, label %bb4, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb4:                                              ; preds = %bb
  %i5 = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 0
  %i6 = load ptr, ptr %i5, align 8
  %i7 = call i32 @fgetc(ptr noundef %i6)
  %i8 = trunc i32 %i7 to i8
  %i9 = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 1
  store i8 %i8, ptr %i9, align 8
  %i10 = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 2
  store i8 8, ptr %i10, align 1
  br label %bb11

bb11:                                             ; preds = %bb4, %bb.bb11_crit_edge
  %i12 = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 2
  %i13 = load i8, ptr %i12, align 1
  %i14 = add i8 %i13, -1
  store i8 %i14, ptr %i12, align 1
  %i15 = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 1
  %i16 = load i8, ptr %i15, align 8
  %i17 = sext i8 %i16 to i32
  %i18 = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 2
  %i19 = load i8, ptr %i18, align 1
  %i20 = sext i8 %i19 to i32
  %i21 = shl i32 1, %i20
  %i22 = and i32 %i17, %i21
  %i23 = icmp ne i32 %i22, 0
  %i24 = zext i1 %i23 to i32
  ret i32 %i24
}

declare i32 @fgetc(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfwrite(i32 noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 4
  %i2 = load i8, ptr %i, align 1
  %i3 = sext i8 %i2 to i32
  %i4 = icmp eq i32 8, %i3
  br i1 %i4, label %bb5, label %bb.bb13_crit_edge

bb.bb13_crit_edge:                                ; preds = %bb
  br label %bb13

bb5:                                              ; preds = %bb
  %i6 = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 3
  %i7 = load i8, ptr %i6, align 2
  %i8 = sext i8 %i7 to i32
  %i9 = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 0
  %i10 = load ptr, ptr %i9, align 8
  %i11 = call i32 @fputc(i32 noundef %i8, ptr noundef %i10)
  %i12 = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 4
  store i8 0, ptr %i12, align 1
  br label %bb13

bb13:                                             ; preds = %bb5, %bb.bb13_crit_edge
  %i14 = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 4
  %i15 = load i8, ptr %i14, align 1
  %i16 = add i8 %i15, 1
  store i8 %i16, ptr %i14, align 1
  %i17 = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 3
  %i18 = load i8, ptr %i17, align 2
  %i19 = sext i8 %i18 to i32
  %i20 = shl i32 %i19, 1
  %i21 = trunc i32 %i20 to i8
  store i8 %i21, ptr %i17, align 2
  %i22 = and i32 %arg, 1
  %i23 = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 3
  %i24 = load i8, ptr %i23, align 2
  %i25 = sext i8 %i24 to i32
  %i26 = or i32 %i25, %i22
  %i27 = trunc i32 %i26 to i8
  store i8 %i27, ptr %i23, align 2
  ret void
}

declare i32 @fputc(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfclose(ptr noundef %arg) #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 0
  %i1 = load ptr, ptr %i, align 8
  %i2 = call i32 @fclose(ptr noundef %i1)
  call void @free(ptr noundef %arg) #12
  ret void
}

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bitstring(ptr noundef %arg, i64 noundef %arg3, i32 noundef %arg4, i32 noundef %arg5) #0 {
bb:
  %i = ashr i32 %arg4, 2
  %i6 = add nsw i32 %arg4, %i
  %i7 = srem i32 %arg4, 4
  %i8 = icmp ne i32 %i7, 0
  %i10 = select i1 %i8, i32 0, i32 1
  %i11 = sub nsw i32 %i6, %i10
  %i12 = sub nsw i32 %arg5, %i11
  %smax = call i32 @llvm.smax.i32(i32 %i12, i32 0)
  br label %bb13

bb13:                                             ; preds = %bb17, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i18, %bb17 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i16, %bb17 ]
  %exitcond = icmp ne i32 %.01, %smax
  br i1 %exitcond, label %bb15, label %bb19

bb15:                                             ; preds = %bb13
  %i16 = getelementptr inbounds i8, ptr %.0, i32 1
  store i8 32, ptr %.0, align 1
  br label %bb17

bb17:                                             ; preds = %bb15
  %i18 = add nuw i32 %.01, 1
  br label %bb13, !llvm.loop !13

bb19:                                             ; preds = %bb13
  %.0.lcssa = phi ptr [ %.0, %bb13 ]
  %0 = zext i32 %arg4 to i64
  br label %bb20

bb20:                                             ; preds = %bb36, %bb19
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb36 ], [ %0, %bb19 ]
  %.1 = phi ptr [ %.0.lcssa, %bb19 ], [ %.2, %bb36 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvars = trunc i64 %indvars.iv.next to i32
  %i22 = icmp sge i32 %indvars, 0
  br i1 %i22, label %bb23, label %bb37

bb23:                                             ; preds = %bb20
  %i24 = zext i32 %indvars to i64
  %i25 = ashr i64 %arg3, %i24
  %i26 = and i64 %i25, 1
  %i27 = add nsw i64 %i26, 48
  %i28 = trunc i64 %i27 to i8
  %i29 = getelementptr inbounds i8, ptr %.1, i32 1
  store i8 %i28, ptr %.1, align 1
  %i30 = srem i32 %indvars, 4
  %i31 = icmp ne i32 %i30, 0
  br i1 %i31, label %bb23.bb36_crit_edge, label %bb32

bb23.bb36_crit_edge:                              ; preds = %bb23
  br label %bb36

bb32:                                             ; preds = %bb23
  %i33 = icmp ne i32 %indvars, 0
  br i1 %i33, label %bb34, label %bb32.bb36_crit_edge

bb32.bb36_crit_edge:                              ; preds = %bb32
  br label %bb36

bb34:                                             ; preds = %bb32
  %i35 = getelementptr inbounds i8, ptr %i29, i32 1
  store i8 32, ptr %i29, align 1
  br label %bb36

bb36:                                             ; preds = %bb34, %bb32.bb36_crit_edge, %bb23.bb36_crit_edge
  %.2 = phi ptr [ %i29, %bb23.bb36_crit_edge ], [ %i35, %bb34 ], [ %i29, %bb32.bb36_crit_edge ]
  br label %bb20, !llvm.loop !14

bb37:                                             ; preds = %bb20
  %.1.lcssa = phi ptr [ %.1, %bb20 ]
  %i9 = zext i1 %i8 to i64
  store i8 0, ptr %.1.lcssa, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bstr_i(ptr noundef %arg) #0 {
bb:
  br label %bb2

bb2:                                              ; preds = %bb14, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i21, %bb14 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i15, %bb14 ]
  %i = icmp ne ptr %.0, null
  br i1 %i, label %bb3, label %bb2.bb12_crit_edge

bb2.bb12_crit_edge:                               ; preds = %bb2
  br label %bb12

bb3:                                              ; preds = %bb2
  %i4 = load i8, ptr %.0, align 1
  %i5 = sext i8 %i4 to i32
  %i6 = icmp ne i32 %i5, 0
  br i1 %i6, label %bb7, label %bb3.bb12_crit_edge

bb3.bb12_crit_edge:                               ; preds = %bb3
  br label %bb12

bb7:                                              ; preds = %bb3
  %i8 = load i8, ptr %.0, align 1
  %i9 = sext i8 %i8 to i32
  %i10 = call ptr @strchr(ptr noundef @.str.10, i32 noundef %i9) #10
  %i11 = icmp ne ptr %i10, null
  br label %bb12

bb12:                                             ; preds = %bb7, %bb3.bb12_crit_edge, %bb2.bb12_crit_edge
  %i13 = phi i1 [ false, %bb3.bb12_crit_edge ], [ false, %bb2.bb12_crit_edge ], [ %i11, %bb7 ]
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb12
  %i15 = getelementptr inbounds i8, ptr %.0, i32 1
  %i16 = load i8, ptr %.0, align 1
  %i17 = sext i8 %i16 to i32
  %i18 = sub nsw i32 %i17, 48
  %i19 = shl i32 %.01, 1
  %i20 = and i32 %i18, 1
  %i21 = or i32 %i19, %i20
  br label %bb2, !llvm.loop !15

bb22:                                             ; preds = %bb12
  %.01.lcssa = phi i32 [ %.01, %bb12 ]
  ret i32 %.01.lcssa
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) #0 {
bb:
  %i = alloca i64, align 8
  %i3 = call noalias ptr @fopen(ptr noundef @.str.11, ptr noundef @.str.1.12)
  %i4 = icmp eq ptr %i3, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef @.str.2.13)
  br label %bb23

bb8:                                              ; preds = %bb
  %i9 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i3, ptr noundef @.str.3.14, ptr noundef %i)
  %i10 = call i32 @fclose(ptr noundef %i3)
  br label %bb11

bb11:                                             ; preds = %bb20, %bb8
  %.01 = phi i64 [ 0, %bb8 ], [ %i21, %bb20 ]
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %.01, %i12
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb11
  %i15 = add nuw nsw i64 %.01, 1
  %i16 = load i64, ptr %i, align 8
  %i17 = icmp eq i64 %i15, %i16
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  br label %bb20

bb20:                                             ; preds = %bb14
  %i21 = add nuw nsw i64 %.01, 1
  br label %bb11, !llvm.loop !16

bb22:                                             ; preds = %bb11
  br label %bb23

bb23:                                             ; preds = %bb22, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb22 ]
  ret i32 %.0
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #7

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind allocsize(0,1) }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { nounwind allocsize(0) }
attributes #12 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
