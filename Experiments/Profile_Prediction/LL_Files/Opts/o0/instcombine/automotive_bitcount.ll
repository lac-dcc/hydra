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
  %i1 = add i64 %arg, 7
  %i21 = lshr i64 %i1, 3
  %i3 = call noalias ptr @calloc(i64 noundef %i21, i64 noundef 1) #9
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
  %i61 = and i32 %arg1, 7
  %0 = lshr i32 %i5, %i61
  %i10 = and i32 %0, 1
  ret i32 %i10
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @setbit(ptr noundef %arg, i32 noundef %arg1, i32 noundef %arg2) #0 {
bb:
  %i = sdiv i32 %arg1, 8
  %i3 = sext i32 %i to i64
  %i4 = getelementptr inbounds i8, ptr %arg, i64 %i3
  %i5.not = icmp eq i32 %arg2, 0
  br i1 %i5.not, label %bb13, label %bb6

bb6:                                              ; preds = %bb
  %i72 = and i32 %arg1, 7
  %i8 = shl nuw nsw i32 1, %i72
  %i9 = load i8, ptr %i4, align 1
  %0 = trunc i32 %i8 to i8
  %i12 = or i8 %i9, %0
  br label %bb21

bb13:                                             ; preds = %bb
  %i141 = and i32 %arg1, 7
  %i15 = shl nuw nsw i32 1, %i141
  %i17 = load i8, ptr %i4, align 1
  %1 = trunc i32 %i15 to i8
  %2 = xor i8 %1, -1
  %i20 = and i8 %i17, %2
  br label %bb21

bb21:                                             ; preds = %bb13, %bb6
  %storemerge = phi i8 [ %i20, %bb13 ], [ %i12, %bb6 ]
  store i8 %storemerge, ptr %i4, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @flipbit(ptr noundef %arg, i32 noundef %arg1) #0 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i41 = and i32 %arg1, 7
  %i5 = shl nuw nsw i32 1, %i41
  %i6 = load i8, ptr %i3, align 1
  %0 = trunc i32 %i5 to i8
  %i9 = xor i8 %i6, %0
  store i8 %i9, ptr %i3, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bit_count(i64 noundef %arg) #0 {
bb:
  %i.not = icmp eq i64 %arg, 0
  br i1 %i.not, label %bb.bb10_crit_edge, label %bb2

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
  %i6 = add nsw i64 %.0, -1
  %i7 = and i64 %.0, %i6
  %i8.not = icmp eq i64 %i7, 0
  br i1 %i8.not, label %bb9, label %bb5.bb3_crit_edge, !llvm.loop !8

bb5.bb3_crit_edge:                                ; preds = %bb5
  br label %bb3

bb9:                                              ; preds = %bb5
  br label %bb10

bb10:                                             ; preds = %bb.bb10_crit_edge, %bb9
  %.1 = phi i32 [ %i4, %bb9 ], [ 0, %bb.bb10_crit_edge ]
  ret i32 %.1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bitcount(i64 noundef %arg) #0 {
bb:
  %i = lshr i64 %arg, 1
  %i1 = and i64 %i, 1431655765
  %i2 = and i64 %arg, 1431655765
  %i3 = add nuw nsw i64 %i1, %i2
  %i4 = lshr i64 %i3, 2
  %i5 = and i64 %i4, 858993459
  %i6 = and i64 %i3, 858993459
  %i7 = add nuw nsw i64 %i5, %i6
  %i8 = lshr i64 %i7, 4
  %i9 = and i64 %i8, 117901063
  %i10 = and i64 %i7, 117901063
  %i11 = add nuw nsw i64 %i9, %i10
  %i12 = lshr i64 %i11, 8
  %i13 = and i64 %i12, 983055
  %i14 = and i64 %i11, 983055
  %i15 = add nuw nsw i64 %i13, %i14
  %i17 = lshr i64 %i15, 16
  %i18 = and i64 %i15, 31
  %i19 = add nuw nsw i64 %i17, %i18
  %i20 = trunc i64 %i19 to i32
  ret i32 %i20
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcount(i64 noundef %arg) #0 {
bb:
  %i1 = and i64 %arg, 15
  %i3 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i1
  %i4 = load i8, ptr %i3, align 1
  %i5 = sext i8 %i4 to i32
  %0 = lshr i64 %arg, 4
  %i8 = and i64 %0, 15
  %i10 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i8
  %i11 = load i8, ptr %i10, align 1
  %i12 = sext i8 %i11 to i32
  %i13 = add nsw i32 %i5, %i12
  %1 = lshr i64 %arg, 8
  %i16 = and i64 %1, 15
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i16
  %i19 = load i8, ptr %i18, align 1
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i13, %i20
  %2 = lshr i64 %arg, 12
  %i24 = and i64 %2, 15
  %i26 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i24
  %i27 = load i8, ptr %i26, align 1
  %i28 = sext i8 %i27 to i32
  %i29 = add nsw i32 %i21, %i28
  %3 = lshr i64 %arg, 16
  %i32 = and i64 %3, 15
  %i34 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i32
  %i35 = load i8, ptr %i34, align 1
  %i36 = sext i8 %i35 to i32
  %i37 = add nsw i32 %i29, %i36
  %4 = lshr i64 %arg, 20
  %i40 = and i64 %4, 15
  %i42 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i40
  %i43 = load i8, ptr %i42, align 1
  %i44 = sext i8 %i43 to i32
  %i45 = add nsw i32 %i37, %i44
  %5 = lshr i64 %arg, 24
  %i48 = and i64 %5, 15
  %i50 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i48
  %i51 = load i8, ptr %i50, align 1
  %i52 = sext i8 %i51 to i32
  %i53 = add nsw i32 %i45, %i52
  %6 = lshr i64 %arg, 28
  %i57 = and i64 %6, 15
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
  %i2 = load i8, ptr %i, align 8
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
  %i1 = getelementptr inbounds i8, ptr %i, i64 1
  %i2 = load i8, ptr %i, align 1
  %i3 = zext i8 %i2 to i64
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1
  %i6 = sext i8 %i5 to i32
  %i7 = getelementptr inbounds i8, ptr %i, i64 2
  %i8 = load i8, ptr %i1, align 1
  %i9 = zext i8 %i8 to i64
  %i10 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i9
  %i11 = load i8, ptr %i10, align 1
  %i12 = sext i8 %i11 to i32
  %i13 = add nsw i32 %i6, %i12
  %i14 = getelementptr inbounds i8, ptr %i, i64 3
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
  %i1 = and i64 %arg, 15
  %i3 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i1
  %i4 = load i8, ptr %i3, align 1
  %i5 = sext i8 %i4 to i32
  %i7.not = icmp ult i64 %arg, 16
  br i1 %i7.not, label %bb.bb11_crit_edge, label %bb8

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb8:                                              ; preds = %bb
  %i6 = ashr i64 %arg, 4
  %i9 = call i32 @ntbl_bitcnt(i64 noundef %i6)
  %i10 = add nsw i32 %i9, %i5
  br label %bb11

bb11:                                             ; preds = %bb.bb11_crit_edge, %bb8
  %.0 = phi i32 [ %i10, %bb8 ], [ %i5, %bb.bb11_crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %arg) #0 {
bb:
  %i = alloca i64, align 8
  store i64 %arg, ptr %i, align 8
  %i2 = load i8, ptr %i, align 8
  %i5 = zext i8 %i2 to i64
  %i6 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i5
  %i7 = load i8, ptr %i6, align 1
  %i8 = sext i8 %i7 to i32
  %i10 = ashr i64 %arg, 8
  store i64 %i10, ptr %i, align 8
  %i11.not = icmp ult i64 %arg, 256
  br i1 %i11.not, label %bb.bb16_crit_edge, label %bb12

bb.bb16_crit_edge:                                ; preds = %bb
  br label %bb16

bb12:                                             ; preds = %bb
  %i13 = load i64, ptr %i, align 8
  %i14 = call i32 @btbl_bitcnt(i64 noundef %i13)
  %i15 = add nsw i32 %i14, %i8
  br label %bb16

bb16:                                             ; preds = %bb.bb16_crit_edge, %bb12
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
  %0 = call i64 @fwrite(ptr nonnull @.str.7, i64 28, i64 1, ptr %i7) #10
  call void @exit(i32 noundef 1) #11
  unreachable

bb9:                                              ; preds = %bb
  %i10 = getelementptr inbounds ptr, ptr %arg4, i64 1
  %i11 = load ptr, ptr %i10, align 8
  %i12 = call i32 @atoi(ptr nocapture noundef %i11) #12
  %i13.not = icmp eq i32 %arg5, 0
  br i1 %i13.not, label %bb9.bb16_crit_edge, label %bb14

bb9.bb16_crit_edge:                               ; preds = %bb9
  br label %bb16

bb14:                                             ; preds = %bb9
  %i15 = call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.8) #13
  br label %bb16

bb16:                                             ; preds = %bb9.bb16_crit_edge, %bb14
  br label %bb17

bb17:                                             ; preds = %bb41, %bb16
  %.03 = phi i32 [ 0, %bb16 ], [ %i42, %bb41 ]
  %i18 = icmp ult i32 %.03, 7
  br i1 %i18, label %bb19, label %bb43

bb19:                                             ; preds = %bb17
  br label %bb20

bb20:                                             ; preds = %bb30, %bb19
  %.02 = phi i64 [ 0, %bb19 ], [ %i31, %bb30 ]
  %.01 = phi i64 [ 0, %bb19 ], [ %i29, %bb30 ]
  %.0 = phi i64 [ 1, %bb19 ], [ %i32, %bb30 ]
  %i21 = sext i32 %i12 to i64
  %i22 = icmp slt i64 %.02, %i21
  br i1 %i22, label %bb23, label %bb33

bb23:                                             ; preds = %bb20
  %i24 = zext nneg i32 %.03 to i64
  %i25 = getelementptr inbounds [7 x ptr], ptr @main1.pBitCntFunc, i64 0, i64 %i24
  %i26 = load ptr, ptr %i25, align 8
  %i27 = call i32 %i26(i64 noundef %.0) #13
  br label %bb30

bb30:                                             ; preds = %bb23
  %i28 = sext i32 %i27 to i64
  %i29 = add nsw i64 %.01, %i28
  %i31 = add nuw nsw i64 %.02, 1
  %i32 = add nuw nsw i64 %.0, 13
  br label %bb20, !llvm.loop !10

bb33:                                             ; preds = %bb20
  %i34.not = icmp eq i32 %arg5, 0
  br i1 %i34.not, label %bb33.bb40_crit_edge, label %bb35

bb33.bb40_crit_edge:                              ; preds = %bb33
  br label %bb40

bb35:                                             ; preds = %bb33
  %i36 = zext nneg i32 %.03 to i64
  %i37 = getelementptr inbounds [7 x ptr], ptr @main1.text, i64 0, i64 %i36
  %i38 = load ptr, ptr %i37, align 8
  %i39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef %i38, i64 noundef %.01) #13
  br label %bb40

bb40:                                             ; preds = %bb33.bb40_crit_edge, %bb35
  br label %bb41

bb41:                                             ; preds = %bb40
  %i42 = add nuw nsw i32 %.03, 1
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
  %.02 = phi i32 [ 0, %bb ], [ %i12, %bb13 ]
  %.01 = phi i32 [ 0, %bb ], [ %i14, %bb13 ]
  %.0 = phi i64 [ %arg, %bb ], [ %i15, %bb13 ]
  %i.not = icmp eq i64 %.0, 0
  br i1 %i.not, label %bb3.bb7_crit_edge, label %bb4

bb3.bb7_crit_edge:                                ; preds = %bb3
  br label %bb7

bb4:                                              ; preds = %bb3
  %i6 = icmp ult i32 %.01, 64
  br label %bb7

bb7:                                              ; preds = %bb3.bb7_crit_edge, %bb4
  %i8 = phi i1 [ false, %bb3.bb7_crit_edge ], [ %i6, %bb4 ]
  br i1 %i8, label %bb9, label %bb16

bb9:                                              ; preds = %bb7
  br label %bb13

bb13:                                             ; preds = %bb9
  %0 = trunc i64 %.0 to i32
  %i11 = and i32 %0, 1
  %i12 = add nuw nsw i32 %.02, %i11
  %i14 = add nuw nsw i32 %.01, 1
  %i15 = ashr i64 %.0, 1
  br label %bb3, !llvm.loop !12

bb16:                                             ; preds = %bb7
  ret i32 %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bfopen(ptr noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %i2 = icmp eq ptr %i, null
  br i1 %i2, label %bb3, label %bb4

bb3:                                              ; preds = %bb
  br label %bb14

bb4:                                              ; preds = %bb
  %i5 = call noalias ptr @fopen(ptr noundef %arg, ptr noundef %arg1) #13
  store ptr %i5, ptr %i, align 8
  %i9 = icmp eq ptr %i5, null
  br i1 %i9, label %bb10, label %bb11

bb10:                                             ; preds = %bb4
  call void @free(ptr noundef nonnull %i) #13
  br label %bb14

bb11:                                             ; preds = %bb4
  %i12 = getelementptr inbounds %struct.bfile, ptr %i, i64 0, i32 2
  store i8 0, ptr %i12, align 1
  %i13 = getelementptr inbounds %struct.bfile, ptr %i, i64 0, i32 4
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
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 2
  %i1 = load i8, ptr %i, align 1
  %i3 = icmp eq i8 %i1, 0
  br i1 %i3, label %bb4, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb4:                                              ; preds = %bb
  %i6 = load ptr, ptr %arg, align 8
  %i7 = call i32 @fgetc(ptr noundef %i6) #13
  %i8 = trunc i32 %i7 to i8
  %i9 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 1
  store i8 %i8, ptr %i9, align 8
  %i10 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 2
  store i8 8, ptr %i10, align 1
  br label %bb11

bb11:                                             ; preds = %bb.bb11_crit_edge, %bb4
  %i12 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 2
  %i13 = load i8, ptr %i12, align 1
  %i14 = add i8 %i13, -1
  store i8 %i14, ptr %i12, align 1
  %i15 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 1
  %i16 = load i8, ptr %i15, align 8
  %i17 = sext i8 %i16 to i32
  %i201 = zext nneg i8 %i14 to i32
  %0 = lshr i32 %i17, %i201
  %i24 = and i32 %0, 1
  ret i32 %i24
}

declare i32 @fgetc(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfwrite(i32 noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 4
  %i2 = load i8, ptr %i, align 1
  %i4 = icmp eq i8 %i2, 8
  br i1 %i4, label %bb5, label %bb.bb13_crit_edge

bb.bb13_crit_edge:                                ; preds = %bb
  br label %bb13

bb5:                                              ; preds = %bb
  %i6 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %i7 = load i8, ptr %i6, align 2
  %i8 = sext i8 %i7 to i32
  %i10 = load ptr, ptr %arg1, align 8
  %i11 = call i32 @fputc(i32 noundef %i8, ptr noundef %i10) #13
  %i12 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 4
  store i8 0, ptr %i12, align 1
  br label %bb13

bb13:                                             ; preds = %bb.bb13_crit_edge, %bb5
  %i14 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 4
  %i15 = load i8, ptr %i14, align 1
  %i16 = add i8 %i15, 1
  store i8 %i16, ptr %i14, align 1
  %i17 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %i18 = load i8, ptr %i17, align 2
  %i20 = shl i8 %i18, 1
  %i23 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %0 = trunc i32 %arg to i8
  %1 = and i8 %0, 1
  %i27 = or disjoint i8 %1, %i20
  store i8 %i27, ptr %i23, align 2
  ret void
}

declare i32 @fputc(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfclose(ptr noundef %arg) #0 {
bb:
  %i1 = load ptr, ptr %arg, align 8
  %i2 = call i32 @fclose(ptr noundef %i1) #13
  call void @free(ptr noundef nonnull %arg) #13
  ret void
}

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bitstring(ptr noundef %arg, i64 noundef %arg3, i32 noundef %arg4, i32 noundef %arg5) #0 {
bb:
  %i = ashr i32 %arg4, 2
  %i6 = add nsw i32 %i, %arg4
  %0 = and i32 %arg4, 3
  %i8.not = icmp eq i32 %0, 0
  %i10.neg = sext i1 %i8.not to i32
  %i11 = add i32 %i6, %i10.neg
  %i12 = sub nsw i32 %arg5, %i11
  br label %bb13

bb13:                                             ; preds = %bb17, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i18, %bb17 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i16, %bb17 ]
  %i14 = icmp slt i32 %.01, %i12
  br i1 %i14, label %bb15, label %bb19

bb15:                                             ; preds = %bb13
  store i8 32, ptr %.0, align 1
  br label %bb17

bb17:                                             ; preds = %bb15
  %i16 = getelementptr inbounds i8, ptr %.0, i64 1
  %i18 = add nuw nsw i32 %.01, 1
  br label %bb13, !llvm.loop !13

bb19:                                             ; preds = %bb13
  br label %bb20

bb20:                                             ; preds = %bb36, %bb19
  %.02 = phi i32 [ %arg4, %bb19 ], [ %i21, %bb36 ]
  %.1 = phi ptr [ %.0, %bb19 ], [ %.2, %bb36 ]
  %i21 = add nsw i32 %.02, -1
  %i22 = icmp sgt i32 %.02, 0
  br i1 %i22, label %bb23, label %bb37

bb23:                                             ; preds = %bb20
  %i24 = zext nneg i32 %i21 to i64
  %i251 = lshr i64 %arg3, %i24
  %1 = trunc i64 %i251 to i8
  %2 = and i8 %1, 1
  %i28 = or disjoint i8 %2, 48
  %i29 = getelementptr inbounds i8, ptr %.1, i64 1
  store i8 %i28, ptr %.1, align 1
  %3 = and i32 %i21, 3
  %i31.not = icmp eq i32 %3, 0
  br i1 %i31.not, label %bb32, label %bb23.bb36_crit_edge

bb23.bb36_crit_edge:                              ; preds = %bb23
  br label %bb36

bb32:                                             ; preds = %bb23
  %i33.not = icmp eq i32 %i21, 0
  br i1 %i33.not, label %bb32.bb36_crit_edge, label %bb34

bb32.bb36_crit_edge:                              ; preds = %bb32
  br label %bb36

bb34:                                             ; preds = %bb32
  %i35 = getelementptr inbounds i8, ptr %.1, i64 2
  store i8 32, ptr %i29, align 1
  br label %bb36

bb36:                                             ; preds = %bb32.bb36_crit_edge, %bb23.bb36_crit_edge, %bb34
  %.2 = phi ptr [ %i29, %bb23.bb36_crit_edge ], [ %i35, %bb34 ], [ %i29, %bb32.bb36_crit_edge ]
  br label %bb20, !llvm.loop !14

bb37:                                             ; preds = %bb20
  store i8 0, ptr %.1, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bstr_i(ptr noundef %arg) #0 {
bb:
  br label %bb2

bb2:                                              ; preds = %bb14, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i21, %bb14 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i15, %bb14 ]
  %i.not = icmp eq ptr %.0, null
  br i1 %i.not, label %bb2.bb12_crit_edge, label %bb3

bb2.bb12_crit_edge:                               ; preds = %bb2
  br label %bb12

bb3:                                              ; preds = %bb2
  %i4 = load i8, ptr %.0, align 1
  %i6.not = icmp eq i8 %i4, 0
  br i1 %i6.not, label %bb3.bb12_crit_edge, label %bb7

bb3.bb12_crit_edge:                               ; preds = %bb3
  br label %bb12

bb7:                                              ; preds = %bb3
  %i8 = load i8, ptr %.0, align 1
  %i9 = zext nneg i8 %i8 to i64
  %memchr.bounds = icmp ult i8 %i8, 64
  %0 = shl nuw i64 1, %i9
  %1 = and i64 %0, 844424930131969
  %memchr.bits = icmp ne i64 %1, 0
  %memchr1 = select i1 %memchr.bounds, i1 %memchr.bits, i1 false
  br label %bb12

bb12:                                             ; preds = %bb3.bb12_crit_edge, %bb2.bb12_crit_edge, %bb7
  %i13 = phi i1 [ false, %bb3.bb12_crit_edge ], [ false, %bb2.bb12_crit_edge ], [ %memchr1, %bb7 ]
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb12
  %i15 = getelementptr inbounds i8, ptr %.0, i64 1
  %i16 = load i8, ptr %.0, align 1
  %i19 = shl i32 %.01, 1
  %2 = and i8 %i16, 1
  %i20 = zext nneg i8 %2 to i32
  %i21 = or disjoint i32 %i19, %i20
  br label %bb2, !llvm.loop !15

bb22:                                             ; preds = %bb12
  ret i32 %.01
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) #0 {
bb:
  %i = alloca i64, align 8
  %i3 = call noalias ptr @fopen(ptr noundef nonnull @.str.11, ptr noundef nonnull @.str.1.12) #13
  %i4 = icmp eq ptr %i3, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %0 = call i64 @fwrite(ptr nonnull @.str.2.13, i64 28, i64 1, ptr %i6) #10
  br label %bb23

bb8:                                              ; preds = %bb
  %i9 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i3, ptr noundef nonnull @.str.3.14, ptr noundef nonnull %i) #13
  %i10 = call i32 @fclose(ptr noundef nonnull %i3) #13
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

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) #7

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare ptr @memchr(ptr, i32, i64) #8

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind }
attributes #8 = { nofree nounwind willreturn memory(argmem: read) }
attributes #9 = { nounwind allocsize(0,1) }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind willreturn memory(read) }
attributes #13 = { nounwind }
attributes #14 = { nounwind allocsize(0) }

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
