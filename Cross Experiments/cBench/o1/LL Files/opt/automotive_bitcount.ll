; ModuleID = 'automotive_bitcount.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
@.str.10 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1.11 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2.12 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3.13 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) uwtable
define dso_local noalias noundef ptr @alloc_bit_array(i64 noundef %arg) local_unnamed_addr #0 {
bb:
  %i = add i64 %arg, 7
  %i1 = lshr i64 %i, 3
  %i2 = tail call noalias ptr @calloc(i64 noundef %i1, i64 noundef 1) #20
  ret ptr %i2
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @getbit(ptr nocapture noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i4 = load i8, ptr %i3, align 1, !tbaa !8
  %i5 = sext i8 %i4 to i32
  %i6 = and i32 %arg1, 7
  %i7 = lshr i32 %i5, %i6
  %i8 = and i32 %i7, 1
  ret i32 %i8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @setbit(ptr nocapture noundef %arg, i32 noundef %arg1, i32 noundef %arg2) local_unnamed_addr #3 {
bb:
  %i = sdiv i32 %arg1, 8
  %i3 = sext i32 %i to i64
  %i4 = getelementptr inbounds i8, ptr %arg, i64 %i3
  %i5 = icmp eq i32 %arg2, 0
  %i6 = and i32 %arg1, 7
  %i7 = shl nuw nsw i32 1, %i6
  %i8 = load i8, ptr %i4, align 1, !tbaa !8
  %i9 = trunc i32 %i7 to i8
  %i10 = xor i8 %i9, -1
  %i11 = and i8 %i8, %i10
  %i12 = or i8 %i8, %i9
  %i13 = select i1 %i5, i8 %i11, i8 %i12
  store i8 %i13, ptr %i4, align 1, !tbaa !8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @flipbit(ptr nocapture noundef %arg, i32 noundef %arg1) local_unnamed_addr #3 {
bb:
  %i = sdiv i32 %arg1, 8
  %i2 = sext i32 %i to i64
  %i3 = getelementptr inbounds i8, ptr %arg, i64 %i2
  %i4 = and i32 %arg1, 7
  %i5 = shl nuw nsw i32 1, %i4
  %i6 = load i8, ptr %i3, align 1, !tbaa !8
  %i7 = trunc i32 %i5 to i8
  %i8 = xor i8 %i6, %i7
  store i8 %i8, ptr %i3, align 1, !tbaa !8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @bit_count(i64 noundef %arg) #4 {
bb:
  %i = icmp eq i64 %arg, 0
  br i1 %i, label %bb.bb8_crit_edge, label %bb1.preheader

bb.bb8_crit_edge:                                 ; preds = %bb
  br label %bb8

bb1.preheader:                                    ; preds = %bb
  br label %bb1

bb1:                                              ; preds = %bb1.bb1_crit_edge, %bb1.preheader
  %i2 = phi i64 [ %i6, %bb1.bb1_crit_edge ], [ %arg, %bb1.preheader ]
  %i3 = phi i32 [ %i4, %bb1.bb1_crit_edge ], [ 0, %bb1.preheader ]
  %i4 = add nuw nsw i32 %i3, 1
  %i5 = add nsw i64 %i2, -1
  %i6 = and i64 %i5, %i2
  %i7 = icmp eq i64 %i6, 0
  br i1 %i7, label %bb8.loopexit, label %bb1.bb1_crit_edge, !llvm.loop !11

bb1.bb1_crit_edge:                                ; preds = %bb1
  br label %bb1

bb8.loopexit:                                     ; preds = %bb1
  br label %bb8

bb8:                                              ; preds = %bb.bb8_crit_edge, %bb8.loopexit
  %i9 = phi i32 [ 0, %bb.bb8_crit_edge ], [ %i4, %bb8.loopexit ]
  ret i32 %i9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @bitcount(i64 noundef %arg) #5 {
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
  %i16 = lshr i64 %i15, 16
  %i17 = and i64 %i15, 31
  %i18 = add nuw nsw i64 %i16, %i17
  %i19 = trunc i64 %i18 to i32
  ret i32 %i19
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @ntbl_bitcount(i64 noundef %arg) #5 {
bb:
  %i = and i64 %arg, 15
  %i1 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i
  %i2 = load i8, ptr %i1, align 1, !tbaa !8
  %i3 = sext i8 %i2 to i32
  %i4 = lshr i64 %arg, 4
  %i5 = and i64 %i4, 15
  %i6 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i5
  %i7 = load i8, ptr %i6, align 1, !tbaa !8
  %i8 = sext i8 %i7 to i32
  %i9 = add nsw i32 %i8, %i3
  %i10 = lshr i64 %arg, 8
  %i11 = and i64 %i10, 15
  %i12 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i11
  %i13 = load i8, ptr %i12, align 1, !tbaa !8
  %i14 = sext i8 %i13 to i32
  %i15 = add nsw i32 %i9, %i14
  %i16 = lshr i64 %arg, 12
  %i17 = and i64 %i16, 15
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !8
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i15, %i20
  %i22 = lshr i64 %arg, 16
  %i23 = and i64 %i22, 15
  %i24 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i23
  %i25 = load i8, ptr %i24, align 1, !tbaa !8
  %i26 = sext i8 %i25 to i32
  %i27 = add nsw i32 %i21, %i26
  %i28 = lshr i64 %arg, 20
  %i29 = and i64 %i28, 15
  %i30 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i29
  %i31 = load i8, ptr %i30, align 1, !tbaa !8
  %i32 = sext i8 %i31 to i32
  %i33 = add nsw i32 %i27, %i32
  %i34 = lshr i64 %arg, 24
  %i35 = and i64 %i34, 15
  %i36 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i35
  %i37 = load i8, ptr %i36, align 1, !tbaa !8
  %i38 = sext i8 %i37 to i32
  %i39 = add nsw i32 %i33, %i38
  %i40 = lshr i64 %arg, 28
  %i41 = and i64 %i40, 15
  %i42 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i41
  %i43 = load i8, ptr %i42, align 1, !tbaa !8
  %i44 = sext i8 %i43 to i32
  %i45 = add nsw i32 %i39, %i44
  ret i32 %i45
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @BW_btbl_bitcount(i64 noundef %arg) #5 {
bb:
  %i = lshr i64 %arg, 8
  %i1 = lshr i64 %arg, 16
  %i2 = lshr i64 %arg, 24
  %i3 = and i64 %arg, 255
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1, !tbaa !8
  %i6 = sext i8 %i5 to i32
  %i7 = and i64 %i, 255
  %i8 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i7
  %i9 = load i8, ptr %i8, align 1, !tbaa !8
  %i10 = sext i8 %i9 to i32
  %i11 = add nsw i32 %i10, %i6
  %i12 = and i64 %i2, 255
  %i13 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i12
  %i14 = load i8, ptr %i13, align 1, !tbaa !8
  %i15 = sext i8 %i14 to i32
  %i16 = add nsw i32 %i11, %i15
  %i17 = and i64 %i1, 255
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !8
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i16, %i20
  ret i32 %i21
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @AR_btbl_bitcount(i64 noundef %arg) #5 {
bb:
  %i = lshr i64 %arg, 8
  %i1 = lshr i64 %arg, 16
  %i2 = lshr i64 %arg, 24
  %i3 = and i64 %arg, 255
  %i4 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1, !tbaa !8
  %i6 = sext i8 %i5 to i32
  %i7 = and i64 %i, 255
  %i8 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i7
  %i9 = load i8, ptr %i8, align 1, !tbaa !8
  %i10 = sext i8 %i9 to i32
  %i11 = add nsw i32 %i10, %i6
  %i12 = and i64 %i1, 255
  %i13 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i12
  %i14 = load i8, ptr %i13, align 1, !tbaa !8
  %i15 = sext i8 %i14 to i32
  %i16 = add nsw i32 %i11, %i15
  %i17 = and i64 %i2, 255
  %i18 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !8
  %i20 = sext i8 %i19 to i32
  %i21 = add nsw i32 %i16, %i20
  ret i32 %i21
}

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i32 @ntbl_bitcnt(i64 noundef %arg) #6 {
bb:
  br label %bb1

bb1:                                              ; preds = %bb8, %bb
  %i = phi i32 [ 0, %bb ], [ %i10, %bb8 ]
  %i2 = phi i64 [ %arg, %bb ], [ %i9, %bb8 ]
  %i3 = and i64 %i2, 15
  %i4 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1, !tbaa !8
  %i6 = sext i8 %i5 to i32
  %i7 = icmp ult i64 %i2, 16
  br i1 %i7, label %bb11, label %bb8

bb8:                                              ; preds = %bb1
  %i9 = ashr i64 %i2, 4
  %i10 = add nsw i32 %i, %i6
  br label %bb1

bb11:                                             ; preds = %bb1
  %i12 = add nsw i32 %i, %i6
  ret i32 %i12
}

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %arg) local_unnamed_addr #6 {
bb:
  br label %bb1

bb1:                                              ; preds = %bb8, %bb
  %i = phi i32 [ 0, %bb ], [ %i10, %bb8 ]
  %i2 = phi i64 [ %arg, %bb ], [ %i9, %bb8 ]
  %i3 = and i64 %i2, 255
  %i4 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %i3
  %i5 = load i8, ptr %i4, align 1, !tbaa !8
  %i6 = sext i8 %i5 to i32
  %i7 = icmp ult i64 %i2, 256
  br i1 %i7, label %bb11, label %bb8

bb8:                                              ; preds = %bb1
  %i9 = ashr i64 %i2, 8
  %i10 = add nsw i32 %i, %i6
  br label %bb1

bb11:                                             ; preds = %bb1
  %i12 = add nsw i32 %i, %i6
  ret i32 %i12
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #7 {
bb:
  %i = icmp slt i32 %arg, 2
  br i1 %i, label %bb3, label %bb6

bb3:                                              ; preds = %bb
  %i4 = load ptr, ptr @stderr, align 8, !tbaa !14
  %i5 = tail call i64 @fwrite(ptr nonnull @.str.7, i64 28, i64 1, ptr %i4) #21
  tail call void @exit(i32 noundef 1) #22
  unreachable

bb6:                                              ; preds = %bb
  %i7 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i8 = load ptr, ptr %i7, align 8, !tbaa !14
  %i9 = tail call i64 @strtol(ptr nocapture noundef nonnull %i8, ptr noundef null, i32 noundef 10) #23
  %i10 = icmp eq i32 %arg2, 0
  br i1 %i10, label %bb6.bb13_crit_edge, label %bb11

bb6.bb13_crit_edge:                               ; preds = %bb6
  br label %bb13

bb11:                                             ; preds = %bb6
  %i12 = tail call i32 @puts(ptr noundef nonnull dereferenceable(1) @.str.8)
  br label %bb13

bb13:                                             ; preds = %bb6.bb13_crit_edge, %bb11
  %i14 = shl i64 %i9, 32
  %i15 = ashr exact i64 %i14, 32
  %i16 = icmp sgt i64 %i15, 0
  br label %bb17

bb17:                                             ; preds = %bb38.bb17_crit_edge, %bb13
  %i18 = phi i64 [ 0, %bb13 ], [ %i39, %bb38.bb17_crit_edge ]
  br i1 %i16, label %bb19, label %bb17.bb32_crit_edge

bb17.bb32_crit_edge:                              ; preds = %bb17
  br label %bb32

bb19:                                             ; preds = %bb17
  %i20 = getelementptr inbounds [7 x ptr], ptr @main1.pBitCntFunc, i64 0, i64 %i18
  %i21 = load ptr, ptr %i20, align 8, !tbaa !14
  br label %bb22

bb22:                                             ; preds = %bb22.bb22_crit_edge, %bb19
  %i23 = phi i64 [ 1, %bb19 ], [ %i30, %bb22.bb22_crit_edge ]
  %i24 = phi i64 [ 0, %bb19 ], [ %i28, %bb22.bb22_crit_edge ]
  %i25 = phi i64 [ 0, %bb19 ], [ %i29, %bb22.bb22_crit_edge ]
  %i26 = tail call i32 %i21(i64 noundef %i23) #23
  %i27 = sext i32 %i26 to i64
  %i28 = add nsw i64 %i24, %i27
  %i29 = add nuw nsw i64 %i25, 1
  %i30 = add nuw nsw i64 %i23, 13
  %i31 = icmp eq i64 %i29, %i15
  br i1 %i31, label %bb32.loopexit, label %bb22.bb22_crit_edge, !llvm.loop !16

bb22.bb22_crit_edge:                              ; preds = %bb22
  br label %bb22

bb32.loopexit:                                    ; preds = %bb22
  br label %bb32

bb32:                                             ; preds = %bb17.bb32_crit_edge, %bb32.loopexit
  %i33 = phi i64 [ 0, %bb17.bb32_crit_edge ], [ %i28, %bb32.loopexit ]
  br i1 %i10, label %bb32.bb38_crit_edge, label %bb34

bb32.bb38_crit_edge:                              ; preds = %bb32
  br label %bb38

bb34:                                             ; preds = %bb32
  %i35 = getelementptr inbounds [7 x ptr], ptr @main1.text, i64 0, i64 %i18
  %i36 = load ptr, ptr %i35, align 8, !tbaa !14
  %i37 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, ptr noundef %i36, i64 noundef %i33)
  br label %bb38

bb38:                                             ; preds = %bb32.bb38_crit_edge, %bb34
  %i39 = add nuw nsw i64 %i18, 1
  %i40 = icmp eq i64 %i39, 7
  br i1 %i40, label %bb41, label %bb38.bb17_crit_edge, !llvm.loop !17

bb38.bb17_crit_edge:                              ; preds = %bb38
  br label %bb17

bb41:                                             ; preds = %bb38
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #11

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define internal i32 @bit_shifter(i64 noundef %arg) #4 {
bb:
  %i = icmp eq i64 %arg, 0
  br i1 %i, label %bb.bb13_crit_edge, label %bb1.preheader

bb.bb13_crit_edge:                                ; preds = %bb
  br label %bb13

bb1.preheader:                                    ; preds = %bb
  br label %bb1

bb1:                                              ; preds = %bb1.bb1_crit_edge, %bb1.preheader
  %i2 = phi i32 [ %i7, %bb1.bb1_crit_edge ], [ 0, %bb1.preheader ]
  %i3 = phi i32 [ %i8, %bb1.bb1_crit_edge ], [ 0, %bb1.preheader ]
  %i4 = phi i64 [ %i9, %bb1.bb1_crit_edge ], [ %arg, %bb1.preheader ]
  %i5 = trunc i64 %i4 to i32
  %i6 = and i32 %i5, 1
  %i7 = add nuw nsw i32 %i2, %i6
  %i8 = add nuw nsw i32 %i3, 1
  %i9 = ashr i64 %i4, 1
  %i10 = icmp ugt i64 %i4, 1
  %i11 = icmp ult i32 %i3, 63
  %i12 = select i1 %i10, i1 %i11, i1 false
  br i1 %i12, label %bb1.bb1_crit_edge, label %bb13.loopexit, !llvm.loop !18

bb1.bb1_crit_edge:                                ; preds = %bb1
  br label %bb1

bb13.loopexit:                                    ; preds = %bb1
  br label %bb13

bb13:                                             ; preds = %bb.bb13_crit_edge, %bb13.loopexit
  %i14 = phi i32 [ 0, %bb.bb13_crit_edge ], [ %i7, %bb13.loopexit ]
  ret i32 %i14
}

; Function Attrs: nounwind uwtable
define dso_local noalias noundef ptr @bfopen(ptr nocapture noundef readonly %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #7 {
bb:
  %i = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #24
  %i2 = icmp eq ptr %i, null
  br i1 %i2, label %bb.bb10_crit_edge, label %bb3

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb3:                                              ; preds = %bb
  %i4 = tail call noalias ptr @fopen(ptr noundef %arg, ptr noundef %arg1)
  store ptr %i4, ptr %i, align 8, !tbaa !19
  %i5 = icmp eq ptr %i4, null
  br i1 %i5, label %bb6, label %bb7

bb6:                                              ; preds = %bb3
  tail call void @free(ptr noundef %i) #23
  br label %bb10

bb7:                                              ; preds = %bb3
  %i8 = getelementptr inbounds %struct.bfile, ptr %i, i64 0, i32 2
  store i8 0, ptr %i8, align 1, !tbaa !21
  %i9 = getelementptr inbounds %struct.bfile, ptr %i, i64 0, i32 4
  store i8 0, ptr %i9, align 1, !tbaa !22
  br label %bb10

bb10:                                             ; preds = %bb.bb10_crit_edge, %bb7, %bb6
  %i11 = phi ptr [ null, %bb6 ], [ %i, %bb7 ], [ null, %bb.bb10_crit_edge ]
  ret ptr %i11
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #13

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @bfread(ptr nocapture noundef %arg) local_unnamed_addr #14 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 2
  %i1 = load i8, ptr %i, align 1, !tbaa !21
  %i2 = icmp eq i8 %i1, 0
  br i1 %i2, label %bb3, label %bb.bb8_crit_edge

bb.bb8_crit_edge:                                 ; preds = %bb
  br label %bb8

bb3:                                              ; preds = %bb
  %i4 = load ptr, ptr %arg, align 8, !tbaa !19
  %i5 = tail call i32 @fgetc(ptr noundef %i4)
  %i6 = trunc i32 %i5 to i8
  %i7 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 1
  store i8 %i6, ptr %i7, align 8, !tbaa !23
  store i8 8, ptr %i, align 1, !tbaa !21
  br label %bb8

bb8:                                              ; preds = %bb.bb8_crit_edge, %bb3
  %i9 = load i8, ptr %i, align 1, !tbaa !21
  %i10 = add i8 %i9, -1
  store i8 %i10, ptr %i, align 1, !tbaa !21
  %i11 = getelementptr inbounds %struct.bfile, ptr %arg, i64 0, i32 1
  %i12 = load i8, ptr %i11, align 8, !tbaa !23
  %i13 = sext i8 %i12 to i32
  %i14 = zext nneg i8 %i10 to i32
  %i15 = lshr i32 %i13, %i14
  %i16 = and i32 %i15, 1
  ret i32 %i16
}

; Function Attrs: nofree nounwind
declare noundef i32 @fgetc(ptr nocapture noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind uwtable
define dso_local void @bfwrite(i32 noundef %arg, ptr nocapture noundef %arg1) local_unnamed_addr #14 {
bb:
  %i = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 4
  %i2 = load i8, ptr %i, align 1, !tbaa !22
  %i3 = icmp eq i8 %i2, 8
  br i1 %i3, label %bb4, label %bb.bb10_crit_edge

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb4:                                              ; preds = %bb
  %i5 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %i6 = load i8, ptr %i5, align 2, !tbaa !24
  %i7 = sext i8 %i6 to i32
  %i8 = load ptr, ptr %arg1, align 8, !tbaa !19
  %i9 = tail call i32 @fputc(i32 noundef %i7, ptr noundef %i8)
  store i8 0, ptr %i, align 1, !tbaa !22
  br label %bb10

bb10:                                             ; preds = %bb.bb10_crit_edge, %bb4
  %i11 = load i8, ptr %i, align 1, !tbaa !22
  %i12 = add i8 %i11, 1
  store i8 %i12, ptr %i, align 1, !tbaa !22
  %i13 = getelementptr inbounds %struct.bfile, ptr %arg1, i64 0, i32 3
  %i14 = load i8, ptr %i13, align 2, !tbaa !24
  %i15 = shl i8 %i14, 1
  %i16 = trunc i32 %arg to i8
  %i17 = and i8 %i16, 1
  %i18 = or disjoint i8 %i15, %i17
  store i8 %i18, ptr %i13, align 2, !tbaa !24
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define dso_local void @bfclose(ptr nocapture noundef %arg) local_unnamed_addr #7 {
bb:
  %i = load ptr, ptr %arg, align 8, !tbaa !19
  %i1 = tail call i32 @fclose(ptr noundef %i)
  tail call void @free(ptr noundef %arg) #23
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #11

; Function Attrs: nofree norecurse nosync nounwind memory(write, inaccessiblemem: none) uwtable
define dso_local void @bitstring(ptr nocapture noundef writeonly %arg, i64 noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #15 {
bb:
  %i = ashr i32 %arg2, 2
  %i4 = and i32 %arg2, 3
  %i5 = icmp eq i32 %i4, 0
  %i6 = zext i1 %i5 to i32
  %i7 = add i32 %i, %arg2
  %i8 = sub i32 %arg3, %i7
  %i9 = add i32 %i8, %i6
  %i10 = icmp sgt i32 %i9, 0
  br i1 %i10, label %bb11, label %bb.bb20_crit_edge

bb.bb20_crit_edge:                                ; preds = %bb
  br label %bb20

bb11:                                             ; preds = %bb
  %i12 = add i32 %i6, %arg3
  %i13 = xor i32 %i7, -1
  %i14 = add i32 %i12, %i13
  %i15 = zext i32 %i14 to i64
  %i16 = add nuw nsw i64 %i15, 1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(1) %arg, i8 32, i64 %i16, i1 false), !tbaa !8
  %i17 = zext i32 %i14 to i64
  %i18 = getelementptr i8, ptr %arg, i64 %i17
  %i19 = getelementptr i8, ptr %i18, i64 1
  br label %bb20

bb20:                                             ; preds = %bb.bb20_crit_edge, %bb11
  %i21 = phi ptr [ %arg, %bb.bb20_crit_edge ], [ %i19, %bb11 ]
  %i22 = icmp sgt i32 %arg2, 0
  br i1 %i22, label %bb23, label %bb20.bb43_crit_edge

bb20.bb43_crit_edge:                              ; preds = %bb20
  br label %bb43

bb23:                                             ; preds = %bb20
  %i24 = zext nneg i32 %arg2 to i64
  br label %bb25

bb25:                                             ; preds = %bb40.bb25_crit_edge, %bb23
  %i26 = phi i64 [ %i24, %bb23 ], [ %i28, %bb40.bb25_crit_edge ]
  %i27 = phi ptr [ %i21, %bb23 ], [ %i41, %bb40.bb25_crit_edge ]
  %i28 = add nsw i64 %i26, -1
  %i29 = lshr i64 %arg1, %i28
  %i30 = trunc i64 %i29 to i8
  %i31 = and i8 %i30, 1
  %i32 = or disjoint i8 %i31, 48
  %i33 = getelementptr inbounds i8, ptr %i27, i64 1
  store i8 %i32, ptr %i27, align 1, !tbaa !8
  %i34 = and i64 %i28, 3
  %i35 = icmp eq i64 %i34, 0
  %i36 = icmp ne i64 %i28, 0
  %i37 = and i1 %i36, %i35
  br i1 %i37, label %bb38, label %bb25.bb40_crit_edge

bb25.bb40_crit_edge:                              ; preds = %bb25
  br label %bb40

bb38:                                             ; preds = %bb25
  %i39 = getelementptr inbounds i8, ptr %i27, i64 2
  store i8 32, ptr %i33, align 1, !tbaa !8
  br label %bb40

bb40:                                             ; preds = %bb25.bb40_crit_edge, %bb38
  %i41 = phi ptr [ %i39, %bb38 ], [ %i33, %bb25.bb40_crit_edge ]
  %i42 = icmp sgt i64 %i26, 1
  br i1 %i42, label %bb40.bb25_crit_edge, label %bb43.loopexit, !llvm.loop !25

bb40.bb25_crit_edge:                              ; preds = %bb40
  br label %bb25

bb43.loopexit:                                    ; preds = %bb40
  br label %bb43

bb43:                                             ; preds = %bb20.bb43_crit_edge, %bb43.loopexit
  %i44 = phi ptr [ %i21, %bb20.bb43_crit_edge ], [ %i41, %bb43.loopexit ]
  store i8 0, ptr %i44, align 1, !tbaa !8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #16

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local i32 @bstr_i(ptr noundef readonly %arg) local_unnamed_addr #17 {
bb:
  %i = icmp eq ptr %arg, null
  br i1 %i, label %bb.bb22_crit_edge, label %bb1

bb.bb22_crit_edge:                                ; preds = %bb
  br label %bb22

bb1:                                              ; preds = %bb
  %i2 = load i8, ptr %arg, align 1, !tbaa !8
  %i3 = icmp eq i8 %i2, 0
  br i1 %i3, label %bb1.bb22_crit_edge, label %bb4.preheader

bb1.bb22_crit_edge:                               ; preds = %bb1
  br label %bb22

bb4.preheader:                                    ; preds = %bb1
  br label %bb4

bb4:                                              ; preds = %bb14.bb4_crit_edge, %bb4.preheader
  %i5 = phi i8 [ %i20, %bb14.bb4_crit_edge ], [ %i2, %bb4.preheader ]
  %i6 = phi ptr [ %i15, %bb14.bb4_crit_edge ], [ %arg, %bb4.preheader ]
  %i7 = phi i32 [ %i19, %bb14.bb4_crit_edge ], [ 0, %bb4.preheader ]
  %i8 = zext nneg i8 %i5 to i64
  %i9 = icmp ugt i8 %i5, 63
  %i10 = shl nuw i64 1, %i8
  %i11 = and i64 %i10, 844424930131969
  %i12 = icmp eq i64 %i11, 0
  %i13 = select i1 %i9, i1 true, i1 %i12
  br i1 %i13, label %bb4.bb22.loopexit_crit_edge, label %bb14

bb4.bb22.loopexit_crit_edge:                      ; preds = %bb4
  br label %bb22.loopexit

bb14:                                             ; preds = %bb4
  %i15 = getelementptr inbounds i8, ptr %i6, i64 1
  %i16 = shl i32 %i7, 1
  %i17 = and i8 %i5, 1
  %i18 = zext nneg i8 %i17 to i32
  %i19 = or disjoint i32 %i16, %i18
  %i20 = load i8, ptr %i15, align 1, !tbaa !8
  %i21 = icmp eq i8 %i20, 0
  br i1 %i21, label %bb22.loopexitsplit, label %bb14.bb4_crit_edge

bb14.bb4_crit_edge:                               ; preds = %bb14
  br label %bb4

bb22.loopexitsplit:                               ; preds = %bb14
  br label %bb22.loopexit

bb22.loopexit:                                    ; preds = %bb22.loopexitsplit, %bb4.bb22.loopexit_crit_edge
  %i23.ph = phi i32 [ %i7, %bb4.bb22.loopexit_crit_edge ], [ %i19, %bb22.loopexitsplit ]
  br label %bb22

bb22:                                             ; preds = %bb1.bb22_crit_edge, %bb.bb22_crit_edge, %bb22.loopexit
  %i23 = phi i32 [ 0, %bb.bb22_crit_edge ], [ 0, %bb1.bb22_crit_edge ], [ %i23.ph, %bb22.loopexit ]
  ret i32 %i23
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #7 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #23
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str.10, ptr noundef nonnull @.str.1.11)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !14
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2.12, i64 28, i64 1, ptr %i5) #21
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3.13, ptr noundef nonnull %i) #23
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !26
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb21_crit_edge

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i19, %bb12.bb12_crit_edge ], [ %i10, %bb12.preheader ]
  %i14 = phi i64 [ %i15, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  %i15 = add nuw nsw i64 %i14, 1
  %i16 = icmp eq i64 %i15, %i13
  %i17 = zext i1 %i16 to i32
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #23
  %i19 = load i64, ptr %i, align 8, !tbaa !26
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !28

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb7.bb21_crit_edge, %bb21.loopexit, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #23
  ret i32 %i22
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #18

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #19

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #18

attributes #0 = { mustprogress nofree nounwind willreturn memory(inaccessiblemem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind }
attributes #9 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nofree norecurse nosync nounwind memory(write, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #17 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #19 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #20 = { nounwind allocsize(0,1) }
attributes #21 = { cold }
attributes #22 = { noreturn nounwind }
attributes #23 = { nounwind }
attributes #24 = { nounwind allocsize(0) }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !9, i64 0}
!16 = distinct !{!16, !12, !13}
!17 = distinct !{!17, !12, !13}
!18 = distinct !{!18, !12, !13}
!19 = !{!20, !15, i64 0}
!20 = !{!"", !15, i64 0, !9, i64 8, !9, i64 9, !9, i64 10, !9, i64 11}
!21 = !{!20, !9, i64 9}
!22 = !{!20, !9, i64 11}
!23 = !{!20, !9, i64 8}
!24 = !{!20, !9, i64 10}
!25 = distinct !{!25, !12, !13}
!26 = !{!27, !27, i64 0}
!27 = !{!"long", !9, i64 0}
!28 = distinct !{!28, !12, !13}
