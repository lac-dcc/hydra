; ModuleID = 'automotive_bitcount.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i64 }
%struct.bfile = type { ptr, i8, i8, i8, i8 }

@bits = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits.1 = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@main1.pBitCntFunc = internal unnamed_addr constant [7 x ptr] [ptr @bit_count, ptr @bitcount, ptr @ntbl_bitcnt, ptr @ntbl_bitcount, ptr @BW_btbl_bitcount, ptr @AR_btbl_bitcount, ptr @bit_shifter], align 16
@main1.text = internal unnamed_addr constant [7 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6], align 16
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
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2.13 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3.14 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @alloc_bit_array(i64 noundef %arg) local_unnamed_addr #0 {
bb:
  %i = add i64 %arg, 8
  %i1 = sub i64 %i, 1
  %i2 = udiv i64 %i1, 8
  %i3 = call noalias ptr @calloc(i64 noundef %i2, i64 noundef 1) #7
  ret ptr %i3
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getbit(ptr noundef %arg, i32 noundef %arg1) local_unnamed_addr #0 {
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
define dso_local void @setbit(ptr noundef %arg, i32 noundef %arg1, i32 noundef %arg2) local_unnamed_addr #0 {
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
define dso_local void @flipbit(ptr noundef %arg, i32 noundef %arg1) local_unnamed_addr #0 {
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
  br i1 %i, label %bb3.preheader, label %bb10

bb3.preheader:                                    ; preds = %bb
  br label %bb3

bb3:                                              ; preds = %bb3, %bb3.preheader
  %.01 = phi i32 [ %i4, %bb3 ], [ 0, %bb3.preheader ]
  %.0 = phi i64 [ %i7, %bb3 ], [ %arg, %bb3.preheader ]
  %i4 = add nsw i32 %.01, 1
  %i6 = sub nsw i64 %.0, 1
  %i7 = and i64 %.0, %i6
  %i8 = icmp ne i64 0, %i7
  br i1 %i8, label %bb3, label %bb10.loopexit, !llvm.loop !8

bb10.loopexit:                                    ; preds = %bb3
  %i4.lcssa = phi i32 [ %i4, %bb3 ]
  br label %bb10

bb10:                                             ; preds = %bb10.loopexit, %bb
  %.1 = phi i32 [ 0, %bb ], [ %i4.lcssa, %bb10.loopexit ]
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
  br i1 %i7, label %bb8, label %bb11

bb8:                                              ; preds = %bb
  %i9 = call i32 @ntbl_bitcnt(i64 noundef %i6)
  %i10 = add nsw i32 %i5, %i9
  br label %bb11

bb11:                                             ; preds = %bb8, %bb
  %.0 = phi i32 [ %i10, %bb8 ], [ %i5, %bb ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %arg) local_unnamed_addr #0 {
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
  br i1 %i11, label %bb12, label %bb16

bb12:                                             ; preds = %bb
  %i13 = load i64, ptr %i, align 8
  %i14 = call i32 @btbl_bitcnt(i64 noundef %i13)
  %i15 = add nsw i32 %i8, %i14
  br label %bb16

bb16:                                             ; preds = %bb12, %bb
  %.0 = phi i32 [ %i15, %bb12 ], [ %i8, %bb ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg4, i32 noundef %arg5) local_unnamed_addr #0 {
bb:
  %i = icmp slt i32 %arg, 2
  br i1 %i, label %bb6, label %bb9

bb6:                                              ; preds = %bb
  %i7 = load ptr, ptr @stderr, align 8
  %i8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i7, ptr noundef @.str.7)
  call void @exit(i32 noundef 1) #8
  unreachable

bb9:                                              ; preds = %bb
  %i10 = getelementptr inbounds ptr, ptr %arg4, i64 1
  %i11 = load ptr, ptr %i10, align 8
  %i12 = call i32 @atoi(ptr noundef %i11) #9
  %i13 = icmp ne i32 %arg5, 0
  br i1 %i13, label %bb14, label %bb16

bb14:                                             ; preds = %bb9
  %i15 = call i32 @puts(ptr noundef @.str.8)
  br label %bb16

bb16:                                             ; preds = %bb14, %bb9
  br label %bb20.preheader

bb20.preheader:                                   ; preds = %bb41, %bb16
  %.035 = phi i32 [ 0, %bb16 ], [ %i42, %bb41 ]
  %i21 = sext i32 %i12 to i64
  %i221 = icmp slt i64 0, %i21
  br i1 %i221, label %bb23.lr.ph, label %bb33

bb23.lr.ph:                                       ; preds = %bb20.preheader
  br label %bb23

bb23:                                             ; preds = %bb23, %bb23.lr.ph
  %.04 = phi i64 [ 1, %bb23.lr.ph ], [ %i32, %bb23 ]
  %.013 = phi i64 [ 0, %bb23.lr.ph ], [ %i29, %bb23 ]
  %.022 = phi i64 [ 0, %bb23.lr.ph ], [ %i31, %bb23 ]
  %i24 = sext i32 %.035 to i64
  %i25 = getelementptr inbounds [7 x ptr], ptr @main1.pBitCntFunc, i64 0, i64 %i24
  %i26 = load ptr, ptr %i25, align 8
  %i27 = call i32 %i26(i64 noundef %.04)
  %i28 = sext i32 %i27 to i64
  %i29 = add nsw i64 %.013, %i28
  %i31 = add nsw i64 %.022, 1
  %i32 = add nsw i64 %.04, 13
  %i22 = icmp slt i64 %i31, %i21
  br i1 %i22, label %bb23, label %bb20.bb33_crit_edge, !llvm.loop !10

bb20.bb33_crit_edge:                              ; preds = %bb23
  %split = phi i64 [ %i29, %bb23 ]
  br label %bb33

bb33:                                             ; preds = %bb20.bb33_crit_edge, %bb20.preheader
  %.01.lcssa = phi i64 [ %split, %bb20.bb33_crit_edge ], [ 0, %bb20.preheader ]
  %i34 = icmp ne i32 %arg5, 0
  br i1 %i34, label %bb35, label %bb41

bb35:                                             ; preds = %bb33
  %i36 = sext i32 %.035 to i64
  %i37 = getelementptr inbounds [7 x ptr], ptr @main1.text, i64 0, i64 %i36
  %i38 = load ptr, ptr %i37, align 8
  %i39 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %i38, i64 noundef %.01.lcssa)
  br label %bb41

bb41:                                             ; preds = %bb35, %bb33
  %i42 = add nsw i32 %.035, 1
  %i18 = icmp slt i32 %i42, 7
  br i1 %i18, label %bb20.preheader, label %bb43, !llvm.loop !11

bb43:                                             ; preds = %bb41
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) local_unnamed_addr #4

declare i32 @puts(ptr noundef) local_unnamed_addr #2

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @bit_shifter(i64 noundef %arg) #0 {
bb:
  %i1 = icmp ne i64 %arg, 0
  br i1 %i1, label %bb9.lr.ph, label %bb16

bb9.lr.ph:                                        ; preds = %bb
  br label %bb9

bb9:                                              ; preds = %bb9, %bb9.lr.ph
  %.04 = phi i64 [ %arg, %bb9.lr.ph ], [ %i15, %bb9 ]
  %.013 = phi i32 [ 0, %bb9.lr.ph ], [ %i14, %bb9 ]
  %.022 = phi i32 [ 0, %bb9.lr.ph ], [ %i12, %bb9 ]
  %i10 = and i64 %.04, 1
  %i11 = trunc i64 %i10 to i32
  %i12 = add nsw i32 %.022, %i11
  %i14 = add nsw i32 %.013, 1
  %i15 = ashr i64 %.04, 1
  %i = icmp ne i64 %i15, 0
  %i5 = sext i32 %i14 to i64
  %i6 = icmp ult i64 %i5, 64
  %i8 = select i1 %i, i1 %i6, i1 false
  br i1 %i8, label %bb9, label %bb3.bb16_crit_edge, !llvm.loop !12

bb3.bb16_crit_edge:                               ; preds = %bb9
  %split = phi i32 [ %i12, %bb9 ]
  br label %bb16

bb16:                                             ; preds = %bb3.bb16_crit_edge, %bb
  %.02.lcssa = phi i32 [ %split, %bb3.bb16_crit_edge ], [ 0, %bb ]
  ret i32 %.02.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bfopen(ptr noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = call noalias ptr @malloc(i64 noundef 16) #10
  %i2 = icmp eq ptr null, %i
  br i1 %i2, label %bb14, label %bb4

bb4:                                              ; preds = %bb
  %i5 = call noalias ptr @fopen(ptr noundef %arg, ptr noundef %arg1)
  %i6 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 0
  store ptr %i5, ptr %i6, align 8
  %i7 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 0
  %i8 = load ptr, ptr %i7, align 8
  %i9 = icmp eq ptr null, %i8
  br i1 %i9, label %bb10, label %bb11

bb10:                                             ; preds = %bb4
  call void @free(ptr noundef %i) #11
  br label %bb14

bb11:                                             ; preds = %bb4
  %i12 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 2
  store i8 0, ptr %i12, align 1
  %i13 = getelementptr inbounds %struct.bfile, ptr %i, i32 0, i32 4
  store i8 0, ptr %i13, align 1
  br label %bb14

bb14:                                             ; preds = %bb11, %bb10, %bb
  %.0 = phi ptr [ null, %bb10 ], [ %i, %bb11 ], [ null, %bb ]
  ret ptr %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) local_unnamed_addr #5

declare noalias ptr @fopen(ptr noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @free(ptr noundef) local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bfread(ptr noundef %arg) local_unnamed_addr #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 2
  %i1 = load i8, ptr %i, align 1
  %i2 = sext i8 %i1 to i32
  %i3 = icmp eq i32 0, %i2
  br i1 %i3, label %bb4, label %bb11

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

bb11:                                             ; preds = %bb4, %bb
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

declare i32 @fgetc(ptr noundef) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfwrite(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg1, i32 0, i32 4
  %i2 = load i8, ptr %i, align 1
  %i3 = sext i8 %i2 to i32
  %i4 = icmp eq i32 8, %i3
  br i1 %i4, label %bb5, label %bb13

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

bb13:                                             ; preds = %bb5, %bb
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

declare i32 @fputc(i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfclose(ptr noundef %arg) local_unnamed_addr #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i32 0, i32 0
  %i1 = load ptr, ptr %i, align 8
  %i2 = call i32 @fclose(ptr noundef %i1)
  call void @free(ptr noundef %arg) #11
  ret void
}

declare i32 @fclose(ptr noundef) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bitstring(ptr noundef %arg, i64 noundef %arg3, i32 noundef %arg4, i32 noundef %arg5) local_unnamed_addr #0 {
bb:
  %i = ashr i32 %arg4, 2
  %i6 = add nsw i32 %arg4, %i
  %i7 = srem i32 %arg4, 4
  %i8 = icmp ne i32 %i7, 0
  %i10 = select i1 %i8, i32 0, i32 1
  %i11 = sub nsw i32 %i6, %i10
  %i12 = sub nsw i32 %arg5, %i11
  %i141 = icmp slt i32 0, %i12
  br i1 %i141, label %bb15.lr.ph, label %bb20.preheader

bb15.lr.ph:                                       ; preds = %bb
  br label %bb15

bb13.bb20.preheader_crit_edge:                    ; preds = %bb15
  %split = phi ptr [ %i16, %bb15 ]
  br label %bb20.preheader

bb20.preheader:                                   ; preds = %bb13.bb20.preheader_crit_edge, %bb
  %.0.lcssa = phi ptr [ %split, %bb13.bb20.preheader_crit_edge ], [ %arg, %bb ]
  %i214 = add nsw i32 %arg4, -1
  %i225 = icmp sge i32 %i214, 0
  br i1 %i225, label %bb23.lr.ph, label %bb37

bb23.lr.ph:                                       ; preds = %bb20.preheader
  br label %bb23

bb15:                                             ; preds = %bb15, %bb15.lr.ph
  %.03 = phi ptr [ %arg, %bb15.lr.ph ], [ %i16, %bb15 ]
  %.012 = phi i32 [ 0, %bb15.lr.ph ], [ %i18, %bb15 ]
  %i16 = getelementptr inbounds i8, ptr %.03, i32 1
  store i8 32, ptr %.03, align 1
  %i18 = add nsw i32 %.012, 1
  %i14 = icmp slt i32 %i18, %i12
  br i1 %i14, label %bb15, label %bb13.bb20.preheader_crit_edge, !llvm.loop !13

bb23:                                             ; preds = %bb36, %bb23.lr.ph
  %i217 = phi i32 [ %i214, %bb23.lr.ph ], [ %i21, %bb36 ]
  %.16 = phi ptr [ %.0.lcssa, %bb23.lr.ph ], [ %.2, %bb36 ]
  %i24 = zext i32 %i217 to i64
  %i25 = ashr i64 %arg3, %i24
  %i26 = and i64 %i25, 1
  %i27 = add nsw i64 %i26, 48
  %i28 = trunc i64 %i27 to i8
  %i29 = getelementptr inbounds i8, ptr %.16, i32 1
  store i8 %i28, ptr %.16, align 1
  %i30 = srem i32 %i217, 4
  %i31 = icmp eq i32 %i30, 0
  %i33 = icmp ne i32 %i217, 0
  %or.cond = and i1 %i31, %i33
  br i1 %or.cond, label %bb34, label %bb36

bb34:                                             ; preds = %bb23
  %i35 = getelementptr inbounds i8, ptr %i29, i32 1
  store i8 32, ptr %i29, align 1
  br label %bb36

bb36:                                             ; preds = %bb34, %bb23
  %.2 = phi ptr [ %i35, %bb34 ], [ %i29, %bb23 ]
  %i21 = add nsw i32 %i217, -1
  %i22 = icmp sge i32 %i21, 0
  br i1 %i22, label %bb23, label %bb20.bb37_crit_edge, !llvm.loop !14

bb20.bb37_crit_edge:                              ; preds = %bb36
  %split8 = phi ptr [ %.2, %bb36 ]
  br label %bb37

bb37:                                             ; preds = %bb20.bb37_crit_edge, %bb20.preheader
  %.1.lcssa = phi ptr [ %split8, %bb20.bb37_crit_edge ], [ %.0.lcssa, %bb20.preheader ]
  store i8 0, ptr %.1.lcssa, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bstr_i(ptr noundef %arg) local_unnamed_addr #0 {
bb:
  %i1 = icmp ne ptr %arg, null
  br i1 %i1, label %bb3.lr.ph, label %bb22

bb3.lr.ph:                                        ; preds = %bb
  br label %bb3

bb3:                                              ; preds = %bb14, %bb3.lr.ph
  %.03 = phi ptr [ %arg, %bb3.lr.ph ], [ %i15, %bb14 ]
  %.012 = phi i32 [ 0, %bb3.lr.ph ], [ %i21, %bb14 ]
  %i4 = load i8, ptr %.03, align 1
  %i5 = sext i8 %i4 to i32
  %i6 = icmp ne i32 %i5, 0
  br i1 %i6, label %bb7, label %bb3.bb22_crit_edge

bb7:                                              ; preds = %bb3
  %i8 = load i8, ptr %.03, align 1
  %i9 = sext i8 %i8 to i32
  %i10 = call ptr @strchr(ptr noundef @.str.10, i32 noundef %i9) #9
  %i11 = icmp ne ptr %i10, null
  br i1 %i11, label %bb14, label %bb7.bb22_crit_edge

bb14:                                             ; preds = %bb7
  %i15 = getelementptr inbounds i8, ptr %.03, i32 1
  %i16 = load i8, ptr %.03, align 1
  %i17 = sext i8 %i16 to i32
  %i18 = sub nsw i32 %i17, 48
  %i19 = shl i32 %.012, 1
  %i20 = and i32 %i18, 1
  %i21 = or i32 %i19, %i20
  %i = icmp ne ptr %i15, null
  br i1 %i, label %bb3, label %bb2.bb22_crit_edge, !llvm.loop !15

bb7.bb22_crit_edge:                               ; preds = %bb7
  %split = phi i32 [ %.012, %bb7 ]
  br label %bb22

bb3.bb22_crit_edge:                               ; preds = %bb3
  %split4 = phi i32 [ %.012, %bb3 ]
  br label %bb22

bb2.bb22_crit_edge:                               ; preds = %bb14
  %split5 = phi i32 [ %i21, %bb14 ]
  br label %bb22

bb22:                                             ; preds = %bb2.bb22_crit_edge, %bb3.bb22_crit_edge, %bb7.bb22_crit_edge, %bb
  %.01.lcssa = phi i32 [ %split, %bb7.bb22_crit_edge ], [ %split4, %bb3.bb22_crit_edge ], [ %split5, %bb2.bb22_crit_edge ], [ 0, %bb ]
  ret i32 %.01.lcssa
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) local_unnamed_addr #0 {
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
  %i121 = load i64, ptr %i, align 8
  %i132 = icmp slt i64 0, %i121
  br i1 %i132, label %bb14.lr.ph, label %bb23.loopexit

bb14.lr.ph:                                       ; preds = %bb8
  br label %bb14

bb14:                                             ; preds = %bb14, %bb14.lr.ph
  %.013 = phi i64 [ 0, %bb14.lr.ph ], [ %i21, %bb14 ]
  %i15 = add nsw i64 %.013, 1
  %i16 = load i64, ptr %i, align 8
  %i17 = icmp eq i64 %i15, %i16
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  %i21 = add nsw i64 %.013, 1
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %i21, %i12
  br i1 %i13, label %bb14, label %bb11.bb23.loopexit_crit_edge, !llvm.loop !16

bb11.bb23.loopexit_crit_edge:                     ; preds = %bb14
  br label %bb23.loopexit

bb23.loopexit:                                    ; preds = %bb11.bb23.loopexit_crit_edge, %bb8
  br label %bb23

bb23:                                             ; preds = %bb23.loopexit, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb23.loopexit ]
  ret i32 %.0
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0,1) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind willreturn memory(read) }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { nounwind }

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
